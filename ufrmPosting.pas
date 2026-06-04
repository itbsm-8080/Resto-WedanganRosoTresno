unit ufrmPosting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, ComCtrls, StdCtrls, AdvEdit,SqlExpr, Menus,
  cxLookAndFeelPainters, cxButtons,StrUtils, cxGraphics, cxLookAndFeels,
  dxSkinsCore, dxSkinsDefaultPainters, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, DBClient, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxSpinEdit, cxCurrencyEdit, AdvEdBtn,DateUtils,
  cxCalendar, cxCheckBox, Buttons;

type
  TfrmPosting = class(TForm)
    PANEL: TAdvPanel;
    Label2: TLabel;
    edtNomor: TAdvEdit;
    Label3: TLabel;
    AdvPanel3: TAdvPanel;
    cxButton8: TcxButton;
    AdvPanel2: TAdvPanel;
    cxButton1: TcxButton;
    AdvPanel4: TAdvPanel;
    te: TcxGrid;
    cxGrdMain: TcxGridDBTableView;
    clNo: TcxGridDBColumn;
    clInvoice: TcxGridDBColumn;
    clTglInvoice: TcxGridDBColumn;
    cxGrdDetail: TcxGridDBTableView;
    lvMaster: TcxGridLevel;
    lbljudul: TLabel;
    dtTanggal: TDateTimePicker;
    clPosting: TcxGridDBColumn;
    PopupMenu1: TPopupMenu;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle2: TcxStyle;
    clStatus: TcxGridDBColumn;
    LihatFakturPenjualan1: TMenuItem;
    clnilai: TcxGridDBColumn;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    edtNilai: TAdvEdit;
    procedure refreshdata;
   procedure initgrid;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function getmaxkode:string;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton8Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function GetCDS: TClientDataSet;
    procedure FormShow(Sender: TObject);
    procedure clNoGetDisplayText(Sender: TcxCustomGridTableItem; ARecord:
        TcxCustomGridRecord; var AText: string);
    procedure HapusRecord1Click(Sender: TObject);
    procedure dtTanggalChange(Sender: TObject);
    procedure simpandata;
    function cekdata:Boolean;
    procedure loaddataInvoice(atanggal : tdatetime);
    procedure clStatusPropertiesEditValueChanged(Sender: TObject);
    procedure clBayarPropertiesEditValueChanged(Sender: TObject);
    procedure hitung;
    procedure cxGrdMainDataControllerSummaryAfterSummary(
      ASender: TcxDataSummary);
    procedure cxGrdMainCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure chkPajakClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure bacafile;
     function getmaxkode2:string;
  private
    FCDScustomer: TClientDataset;
    ahost2,auser2,adatabase2,apassword2 :string;
    FFLAGEDIT: Boolean;
    FID: string;
    conn2:TSQLConnection;
    function GetCDScustomer: TClientDataset;



    { Private declarations }
  protected
    FCDS: TClientDataSet;
  public
    property CDS: TClientDataSet read GetCDS write FCDS;
    property CDScustomer: TClientDataset read GetCDScustomer write FCDScustomer;

    property FLAGEDIT: Boolean read FFLAGEDIT write FFLAGEDIT;
    property ID: string read FID write FID;

    { Public declarations }
  end;

var
  frmPosting: TfrmPosting;
const
   NOMERATOR = 'PS';
   NOMERATOR2 = '#SL';
implementation
uses MAIN,uModuleConnection,uFrmbantuan,Ulib,uReport;

{$R *.dfm}

procedure TfrmPosting.refreshdata;
begin
  FID:='';

  FLAGEDIT := False;
  dtTanggal.DateTime := Date;
  edtnomor.Text := getmaxkode;
  edtNilai.Text := '0';

  initgrid;

end;
procedure TfrmPosting.initgrid;
begin
  CDS.EmptyDataSet;
  CDS.Append;
  CDS.FieldByName('bayar').AsCurrency    := 0;
  CDS.Post;

end;
procedure TfrmPosting.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      SelectNext(ActiveControl,True,True);
end;



procedure TfrmPosting.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   Release;
end;

function TfrmPosting.getmaxkode:string;
var
  s:string;
begin
 s:='select max(right(pos_nomor,4)) from tposting where pos_nomor like ' + quot(frmMenu.kdcabang + '-' +NOMERATOR+'.'+FormatDateTime('yymm',dtTanggal.Date)+'.%');
  with xOpenQuery(s,frmMenu.conn) do
  begin
    try
      if Fields[0].AsString = '' then
         result:= frmMenu.kdcabang + '-' +NOMERATOR+'.'+FormatDateTime('yymm',dtTanggal.Date)+'.'+RightStr(IntToStr(10000+1),4)
      else
         result:= frmMenu.kdcabang + '-' +NOMERATOR+'.'+FormatDateTime('yymm',dtTanggal.Date)+'.'+RightStr(IntToStr(10000+fields[0].AsInteger+1),4);

    finally
      free;
    end;
  end;
end;

procedure TfrmPosting.cxButton1Click(Sender: TObject);
begin
    try
      if edtnilai.text ='0' then
      begin
        ShowMessage('Nilai masih kosong tidak dapat di simpan ');
        exit;
      end;
      If not cekdata then
      begin
        ShowMessage('Tanggal ini sudah pernah di posting ');
        exit;
      end;

      if (FLAGEDIT) and ( not cekedit(frmMenu.KDUSER,self.name)) then
        begin
           MessageDlg('Anda tidak berhak Edit di Modul ini',mtWarning, [mbOK],0);
           Exit;
        End;
         if (not FLAGEDIT) and ( not cekinsert(frmMenu.KDUSER,self.name)) then
        begin
           MessageDlg('Anda tidak berhak Insert di Modul ini',mtWarning, [mbOK],0);;
           Exit;
        End;

      if MessageDlg('Yakin ingin simpan ?',mtCustom,
                                  [mbYes,mbNo], 0)= mrNo
      then Exit ;

      simpandata;
      refreshdata;
   except
     ShowMessage('Gagal Simpan');
     xRollback(frmMenu.conn);
     Exit;
   end;
    xCommit(frmMenu.conn);
end;

procedure TfrmPosting.cxButton8Click(Sender: TObject);
begin
Release;
end;

procedure TfrmPosting.cxButton2Click(Sender: TObject);
begin
   try
      if cekTutupPeriode(dtTanggal.Date) then
      Exit;
   
     If not cekdata then exit;

      if (FLAGEDIT) and ( not cekedit(frmMenu.KDUSER,self.name)) then
        begin
           MessageDlg('Anda tidak berhak Edit di Modul ini',mtWarning, [mbOK],0);
           Exit;
        End;
         if (not FLAGEDIT) and ( not cekinsert(frmMenu.KDUSER,self.name)) then
        begin
           MessageDlg('Anda tidak berhak Insert di Modul ini',mtWarning, [mbOK],0);;
           Exit;
        End;

      if MessageDlg('Yakin ingin simpan ?',mtCustom,
                                  [mbYes,mbNo], 0)= mrNo
      then Exit ;

      simpandata;
      refreshdata;
   except
     ShowMessage('Gagal Simpan');
     xRollback(frmMenu.conn);
     Exit;
   end;
    xCommit(frmMenu.conn);
    Release;
end;

procedure TfrmPosting.FormCreate(Sender: TObject);
begin

     TcxDBGridHelper(cxGrdMain).LoadFromCDS(CDS, False, False);

end;

function TfrmPosting.GetCDS: TClientDataSet;
begin
  If not Assigned(FCDS) then
  begin
    FCDS := TClientDataSet.Create(Self);
    zAddField(FCDS, 'No', ftInteger, False);
    zAddField(FCDS, 'nomor', ftString, False,20);
    zAddField(FCDS, 'Tanggal', ftDatetime, False);
    zAddField(FCDS, 'nilai', ftFloat, False);
    zAddField(FCDS, 'Bayar', ftFloat, False);
    zAddField(FCDS, 'posting', ftInteger, False);

    FCDS.CreateDataSet;
  end;
  Result := FCDS;
end;

function TfrmPosting.GetCDScustomer: TClientDataset;
var s:String;
begin
  If not Assigned(FCDScustomer) then
  begin
    S := 'select cus_nama as customer, cus_kode Kode, cus_alamat Alamat,cus_telp'
        +' from tcustomer order by cus_nama ';


    FCDScustomer := TConextMain.cOpenCDS(S,nil);
  end;
  Result := FCDScustomer;
end;

procedure TfrmPosting.FormShow(Sender: TObject);
begin
refreshdata;
// ----------------------
bacafile;
conn2 :=xCreateConnection(ctMySQL,aHost2,aDatabase2,auser2,apassword2);
//----------------------------
end;

procedure TfrmPosting.clNoGetDisplayText(Sender: TcxCustomGridTableItem;
    ARecord: TcxCustomGridRecord; var AText: string);
begin
  inherited;
  If Assigned(ARecord) then
  begin
    AText := Inttostr(ARecord.Index+1);
  end;
end;

procedure TfrmPosting.HapusRecord1Click(Sender: TObject);
begin
 If CDS.Eof then exit;
  CDS.Delete;
  If CDS.Eof then initgrid;
end;


procedure TfrmPosting.dtTanggalChange(Sender: TObject);
var
  anomorold:string;
begin
   anomorold := edtNomor.Text;
  edtNomor.Text := getmaxkode;
  if FLAGEDIT then
  begin
    if edtNomor.Text <> anomorold then
    begin
      showmessage('Perubahan tanggal tidak bisa beda bulan dan tahun');
      edtNomor.Text := anomorold;
      dtTanggal.date := Date;

    end;
  end;
end;


procedure TfrmPosting.simpandata;
var
  ss,s:string;
  atax,i:integer;
  tt2,tt:TStrings;
  tsql:TSQLQuery;

begin
      tt := TStringList.Create;
        tt2 := TStringList.Create;
    s:='select  item_id,item_nama,item_category,item_harga from titem ';
    tsql := xOpenQuery(s,frmmenu.conn);
    with tsql do
    begin
      try
        while not eof do
        begin
          s:='insert ignore into titem (item_id,item_nama,item_category,item_harga) values ('
          + Quot(fieldbyname('item_id').AsString) + ','
          + Quot(fieldbyname('item_nama').AsString) + ','
          + Quot(fieldbyname('item_category').AsString) + ','
          + floattostr(fieldbyname('item_harga').AsFloat) + ');';
          tt.append(s);
          next;

        end;
      finally
        free;
      end;
    end;
   s:= ' delete from tjual '
      + ' where  jl_tanggal =' + quotd(dttanggal.Date);

   tt.Append(s);
   tsql := xOpenQuery('select * from tjual where jl_tanggal between '+QuotD(dttanggal.date) + ' and ' +QuotD(dttanggal.date+1)
   ,frmmenu.conn);

    i:=1;
 with tsql do
 begin
  try
  while not tsql.Eof do
  begin
    S:='insert ignore into tjual (    '
  + ' jl_nomor ,'
	+ ' jl_tanggal,'
	+ ' jl_status,'
	+ ' jl_cash ,'
	+ ' jl_card ,'
	+ ' jl_nocard ,'
	+ ' jl_bank ,'
	+ ' jl_discount ,'
	+ ' jl_other ,'
	+ ' jl_othervalue,'
	+ ' jl_amount ,'
	+ ' jl_sc ,'
	+ ' jl_tax,'
	+ ' jl_table ,'
	+ ' jl_atasnama ,'
	+ ' jl_nohp ,'
	+ ' jl_receipt ,'
	+ ' jl_kembali ,'
	+ ' jl_tglbayar, '
  + ' jl_promo,'
	+ ' jl_userkasir ) values ('
  + quot(fieldbyname('jl_nomor').asstring) +','
	+ quotd(fieldbyname('jl_tanggal').asdatetime,true) +','
	+ quot(fieldbyname('jl_status').asstring)+','
	+ floattostr(fieldbyname('jl_cash').asfloat) +','
	+ floattostr(fieldbyname('jl_card').asfloat)+' ,'
	+ quot(fieldbyname('jl_nocard').asstring)+','
	+ quot(fieldbyname('jl_bank').asstring)+','
	+ floattostr(fieldbyname('jl_discount').asfloat) +','
	+ quot(fieldbyname('jl_other').asstring)+','
	+ floattostr(fieldbyname('jl_othervalue').asfloat) +','
	+ floattostr(fieldbyname('jl_amount').asfloat) +','
	+ floattostr(fieldbyname('jl_sc').asfloat) +','
	+ floattostr(fieldbyname('jl_tax').asfloat) +','
	+ quot(fieldbyname('jl_table').asstring)+','
	+ quot(fieldbyname('jl_atasnama').asstring)+','
	+ quot(fieldbyname('jl_nohp').asstring)+','
	+ floattostr(fieldbyname('jl_receipt').asfloat) +','
	+ floattostr(fieldbyname('jl_kembali').asfloat) +','
	+ quotd(fieldbyname('jl_tglbayar').asdatetime,true) +','
  + quot(fieldbyname('jl_promo').asstring)+','
	+ quot(fieldbyname('jl_userkasir').asstring)
      + ');';
    tt.Append(s);

    tsql.Next;
    Inc(i);
  end;
  finally
    free;
  end;
 end;

 tsql := xOpenQuery('select tjual_dtl.* from tjual inner join tjual_dtl on jl_nomor=jld_jl_nomor '
 + ' where jl_tanggal between '+QuotD(dttanggal.date) + ' and ' +QuotD(dttanggal.date+1)
   ,frmmenu.conn);

    i:=1;
 with tsql do
 begin
  try
  while not tsql.Eof do
  begin
    S:='insert ignore into tjual_dtl (    '
  + ' jld_jl_nomor ,'
	+ ' jld_item,'
	+ ' jld_qty,'
	+ ' jld_price ,'
	+ ' jld_varian ,'
	+ ' jld_modifier ,'
	+ ' jld_salestype ,'
	+ ' jld_nourut ,'
	+ ' jld_status ,'
	+ ' jld_user,'
	+ ' jld_isdelete ,'
	+ ' jld_notes ,'
  + ' jld_disc ,'
	+ ' jld_iseksekusi,'
	+ ' jld_tgleksekusi ,'
	+ ' jld_tglorder'
  + ' ) values ('
  + quot(fieldbyname('jld_jl_nomor').asstring) +','
	+ quot(fieldbyname('jld_item').asstring) +','
	+ floattostr(fieldbyname('jld_qty').asfloat) +','
	+ floattostr(fieldbyname('jld_price').asfloat)+' ,'
	+ quot(fieldbyname('jld_varian').asstring)+','
	+ quot(fieldbyname('jld_modifier').asstring)+','
  + quot(fieldbyname('jld_salestype').asstring)+','
	+ floattostr(fieldbyname('jld_nourut').asfloat) +','
	+ quot(fieldbyname('jld_status').asstring)+','
  + quot(fieldbyname('jld_user').asstring)+','
	+ floattostr(fieldbyname('jld_isdelete').asfloat) +','
  + quot(fieldbyname('jld_notes').asstring)+','
  + floattostr(fieldbyname('jld_disc').asfloat) +','
	+ floattostr(fieldbyname('jld_iseksekusi').asfloat) +','
	+ quotd(fieldbyname('jld_tgleksekusi').asdatetime,true) +','
  + quotd(fieldbyname('jld_tglorder').asdatetime,true)
      + ');';
    tt.Append(s);

    tsql.Next;
    Inc(i);
  end;
  finally
    free;
  end;
 end;
      tt.SaveToFile('aa.txt');
     try
        for i:=0 to tt.Count -1 do
        begin
            xExecQuery(tt[i],conn2);
        end;
      finally
        tt.Free;
      end;
      xCommit(conn2);
  edtNomor.Text := getmaxkode;
  s :=  ' insert into tposting '
             + ' (pos_nomor,pos_tanggal,'
             + ' pos_nilai'
             + ' ) '
             + ' values ( '
             + Quot(edtNomor.Text) + ','
             + Quotd(dtTanggal.Date) + ','
             + FloatToStr(cStrToFloat(edtNilai.Text))
             +')';

  xExecQuery(s,frmmenu.conn);
     xCommit(frmmenu.conn);

     CDS.First;
  While not CDS.Eof do
  begin

    If (CDS.FieldByName('posting').AsInteger = 1)then
    begin
      s:='update tjual set jl_nomor ='+quot(getmaxkode2)+ ' where jl_nomor='+ Quot(cds.fieldbyname('nomor').asstring);
      xExecQuery(s,frmmenu.conn);
      s:='update tjual_dtl set jld_jl_nomor ='+quot(getmaxkode2)+ ' where jld_jl_nomor='+ Quot(cds.fieldbyname('nomor').asstring);
      xExecQuery(s,frmmenu.conn);
      xCommit(frmmenu.conn);
    end;

    inc(i);
    CDS.Next;
  end;

  /// delete transaksi
  s:='delete a.* from tjual b inner join tjual_dtl a on jl_nomor=jld_jl_nomor  where jl_nomor like '+Quot('%ORD%')
  + ' and jl_tanggal between '+QuotD(dttanggal.date) + ' and ' +QuotD(dttanggal.date+1)+';';
      xExecQuery(s,frmmenu.conn);


  s:='delete from tjual where jl_nomor like '+Quot('%ORD%')
  + ' and jl_tanggal between '+QuotD(dttanggal.date) + ' and ' +QuotD(dttanggal.date+1)+';';
      xExecQuery(s,frmmenu.conn);
      xCommit(frmmenu.conn);

//setoran

  s:= 'SELECT * FROM tbukakasir WHERE tanggal ='+QuotD(dttanggal.Date);
  tsql := xOpenQuery(s,frmmenu.conn) ;
  with tsql do
  begin
    try
      if not eof then
      begin
        ss :='insert ignore into tbukakasir (user_kode,tanggal,setoran,selisih,cash,card,other,refund,void) values ('
        + quot(fieldbyname('user_kode').AsString)+ ','
        + quotd(fieldbyname('tanggal').AsDateTime)+','
        + floattostr(fieldbyname('setoran').AsFloat)+','
        + floattostr(fieldbyname('selisih').AsFloat)+','
        + floattostr(fieldbyname('cash').AsFloat)+','
        + floattostr(fieldbyname('card').AsFloat)+','
        + floattostr(fieldbyname('other').AsFloat)+','
        + floattostr(fieldbyname('refund').AsFloat)+','
        + floattostr(fieldbyname('void').AsFloat)+');';
        xExecQuery(s,conn2);
        xCommit(conn2);
      end;
    finally
      free;
    end;
  end;

  s:='delete from tbukakasir where tanggal='+ QuotD(dtTanggal.Date)+';';
  xExecQuery(s,frmmenu.conn);
xCommit(frmmenu.conn);






end;


function TfrmPosting.cekdata:Boolean;
var
  s:string;
  tsql:TSQLQuery;
begin
  result:=true;
  s:='select * from tposting where pos_tanggal='+ QuotD(dtTanggal.Date);
  tsql := xOpenQuery(s,frmmenu.conn);
  with tsql do
  begin
    try
      if not eof then
       result:= false;
    finally
      free;
    end;
  end;

end;

procedure TfrmPosting.loaddataInvoice(atanggal : tdatetime);
var
  s: string ;
  tsql : TSQLQuery;
  i:Integer;
begin


  s := ' select jl_nomor,jl_tanggal,jl_amount '
      + ' from tjual where jl_status=2 and '
      + ' jl_tanggal between '+ Quotd(dtTanggal.DateTime)
      + ' and '+ Quotd(dtTanggal.DateTime+1);

  s:= s + ' order by jl_tanggal ';

    tsql := xOpenQuery(s,frmMenu.conn) ;
   try

       with  tsql do
       begin
             CDS.EmptyDataSet;
         if not eof then
         begin

            i:=1;

            while  not Eof do
             begin

                      CDS.Append;
                      CDS.FieldByName('nomor').AsString        := fieldbyname('jl_nomor').AsString;
                      CDS.FieldByName('tanggal').AsDateTime  := fieldbyname('jl_tanggal').AsDateTime;
                      CDS.FieldByName('nilai').AsFloat      := fieldbyname('jl_amount').AsFloat;
                      CDS.FieldByName('bayar').AsFloat       := 0;
                      CDS.Post;
                   i:=i+1;
                   next;
            end ;
        end

      end;
   finally
     tsql.Free;
   end;

end;



procedure TfrmPosting.clStatusPropertiesEditValueChanged(
  Sender: TObject);
begin
   CDS.Post;
   If CDS.State <> dsEdit then CDS.Edit;
  if CDS.FieldByName('posting').AsInteger = 1 then
     CDS.FieldByName('bayar').AsFloat :=CDS.FieldByName('nilai').AsFloat
  else
     CDS.FieldByName('bayar').AsFloat := 0;
  cds.post;
  edtNilai.Text := floattostr(cVarToFloat(TcxDBGridHelper(cxGrdMain).GetFooterSummary('bayar')));
end;

procedure TfrmPosting.clBayarPropertiesEditValueChanged(
  Sender: TObject);
begin
 CDS.Post;

end;

procedure TfrmPosting.hitung;
var
  asubtotal : Double;
begin
  asubtotal :=cVarToFloat(TcxDBGridHelper(cxGrdMain).GetFooterSummary('bayar'));
end;

procedure TfrmPosting.cxGrdMainDataControllerSummaryAfterSummary(
  ASender: TcxDataSummary);
begin
hitung;
end;



procedure TfrmPosting.cxGrdMainCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
ShowMessage('s');
end;

procedure TfrmPosting.chkPajakClick(Sender: TObject);
begin
loaddataInvoice(dttanggal.datetime);
end;

procedure TfrmPosting.BitBtn1Click(Sender: TObject);
begin
  if not cekdata then
    showmessage('Tanggal ini sudah pernah di posting')
  else
    loaddataInvoice(dttanggal.DateTime) ;
end;


procedure TfrmPosting.bacafile;
 var
 ltemp : TStringList;

 begin
 ltemp := TStringList.Create;
 ltemp.loadfromfile(ExtractFileDir(application.ExeName) + '\' + 'default1.cfg');
   aHost2     := ltemp[0];
   aDatabase2 := ltemp[1];
   auser2     := ltemp[2];
   apassword2 := ltemp [3];

   ltemp.free;
 end;


 function TfrmPosting.getmaxkode2:string;
var
  s:string;
begin
  s:='select max(right(jl_nomor,4)) from tjual where jl_nomor like ' + quot(frmMenu.USERID+ NOMERATOR2+'.'+FormatDateTime('yymm',dtTanggal.DateTime)+'.%');
  with xOpenQuery(s,frmMenu.conn) do
  begin
    try
      if Fields[0].AsString = '' then
         result:= frmMenu.USERID+NOMERATOR2+'.'+FormatDateTime('yymm',dtTanggal.DateTime)+'.'+RightStr(IntToStr(10000+1),4)
      else
         result:= frmMenu.USERID+ NOMERATOR2+'.'+FormatDateTime('yymm',dtTanggal.DateTime)+'.'+RightStr(IntToStr(10000+fields[0].AsInteger+1),4);

    finally
      free;
    end;
  end;

end;
end.

