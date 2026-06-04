unit ufrmPos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, ComCtrls, StdCtrls, AdvEdit,SqlExpr, Menus,
  cxLookAndFeelPainters, cxButtons,StrUtils, cxGraphics, cxLookAndFeels,
  dxSkinsCore, dxSkinsDefaultPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, MemDS, DBAccess, MyAccess, FMTBcd, DBClient,
  Provider, cxCurrencyEdit, ImgList, cxContainer, cxLabel,shellapi, cxImage,
  cxBlobEdit, AdvCombo, cxTextEdit;

type
  TfrmPos = class(TForm)
    AdvPanel1: TAdvPanel;
    AdvPanel3: TAdvPanel;
    cxButton8: TcxButton;
    AdvPanel2: TAdvPanel;
    lbljudul: TLabel;
    AdvPanel4: TAdvPanel;
    cxButton1: TcxButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle2: TcxStyle;
    cxStyleRepository3: TcxStyleRepository;
    cxStyle3: TcxStyle;
    MyQuery1: TMyQuery;
    DataSource1: TDataSource;
    AdvPanel5: TAdvPanel;
    MyQuery1id: TIntegerField;
    MyQuery1Nama: TStringField;
    MyQuery1Category: TStringField;
    MyQuery1Price: TFloatField;
    MyQuery1Varian: TStringField;
    cxStyleRepository4: TcxStyleRepository;
    cxStyle4: TcxStyle;
    AdvPanel6: TAdvPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGrid1DBTableView1Column4: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Label1: TLabel;
    AdvPanel8: TAdvPanel;
    cxButton3: TcxButton;
    cxImageList1: TcxImageList;
    cxtable: TcxButton;
    cxgrdjual: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    edtfilter: TAdvEdit;
    cxgrdjualColumn1: TcxGridDBColumn;
    cxgrdjualColumn2: TcxGridDBColumn;
    cxgrdjualColumn3: TcxGridDBColumn;
    cxStyle5: TcxStyle;
    cxgrdjualColumn4: TcxGridDBColumn;
    AdvPanel9: TAdvPanel;
    cxprint: TcxButton;
    cxButton6: TcxButton;
    cxgrdjualColumn5: TcxGridDBColumn;
    cxgrdjualColumn6: TcxGridDBColumn;
    cxgrdjualColumn7: TcxGridDBColumn;
    cxgrdjualColumn8: TcxGridDBColumn;
    edtservice: TAdvEdit;
    Label3: TLabel;
    edttax: TAdvEdit;
    Label2: TLabel;
    edtNomor: TAdvEdit;
    edtmeja: TAdvEdit;
    lblcustomer: TAdvEdit;
    lblnohp: TAdvEdit;
    cxplit: TcxButton;
    cxrefund: TcxButton;
    cxButton2: TcxButton;
    cxnew: TcxButton;
    cxButton4: TcxButton;
    MyQuery1foto: TBlobField;
    cxGrid1DBTableView1Column5: TcxGridDBColumn;
    cxgrdjualColumn9: TcxGridDBColumn;
    AdvPanel7: TAdvPanel;
    edtTotal: TAdvEdit;
    Label5: TLabel;
    cbcategory: TAdvComboBox;
    Label6: TLabel;
    Label4: TLabel;
    cbDisc: TAdvComboBox;
    procedure refreshdata;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure simpandata;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function getmaxkode:string;
    function cekdinein(anomor:string):boolean;
    procedure cxButton8Click(Sender: TObject);
    procedure listdata ;
    procedure FormShow(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure edtfilterChange(Sender: TObject);
    function GetCDS: TClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure loaditemorder(anomor:string);
    procedure cxgrdjualDblClick(Sender: TObject);
    procedure cxtableClick(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxprintClick(Sender: TObject);
    procedure doprintdapur;
    procedure doprintall;
    procedure doprintBAR;
    procedure cxplitClick(Sender: TObject);
    procedure cxButton6Click(Sender: TObject);
    procedure cxrefundClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxnewClick(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
   procedure bukacashdrawer;
   procedure doprinslip;
    procedure cbDiscChange(Sender: TObject);
    procedure cbcategoryChange(Sender: TObject);

  private
    FFLAGEDIT: Boolean;
    FID: string;
//       protected
    FCDS: TClientDataSet;
     xtot,xtax,xsc : Double;
    { Private declarations }
  public
    property FLAGEDIT: Boolean read FFLAGEDIT write FFLAGEDIT;
    property ID: string read FID write FID;
    property CDS: TClientDataSet read GetCDS write FCDS;
    { Public declarations }
  end;

var
  frmPos: TfrmPos;
const
   NOMERATOR = 'ORD';

implementation
uses MAIN,uModuleConnection,uFrmbantuan,Ulib,uFrmDetailItem,uFrmMeja,ufrmInputCustomer,
ufrmListBill,ufrmcharge,ureport,ufrmsplit,ufrmlistbill2,ufrmrefund,
  ufrmOtorisasi,ufrmclerek,ufrmchange;

{$R *.dfm}

procedure TfrmPos.refreshdata;
var
  s:string;
  tsql:tsqlquery;

begin
  FID:='';
  FLAGEDIT := FALSE;
  xkembali :=0;
  edtnomor.Clear;
  edtmeja.clear;
  ISSUKSES := false;
  IDNOMOR := '';
  idHP:='';
  IDCustomer := '';
  idmeja:='';
  lblCustomer.text := '';
  lblnohp.text := '';
  edtservice.clear;
  edttax.clear;
  cbDisc.ItemIndex := 0;
  listdata;
  loaditemorder(edtNomor.Text);

end;
procedure TfrmPos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if Key = VK_F8 then
  begin
      Release;
  end;


  if Key= VK_F10 then
  begin
    try
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

//      if MessageDlg('Save data ?',mtCustom,
//                                  [mbYes,mbNo], 0)= mrNo
//      then Exit ;

      simpandata;
      refreshdata;
   except
     ShowMessage('failed');
     xRollback(frmMenu.conn);
     Exit;
   end;
    xCommit(frmMenu.conn);
  end;
end;

procedure TfrmPos.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      SelectNext(ActiveControl,True,True);
end;

procedure TfrmPos.simpandata;
var
  s:string;
  xamount : double;
begin
  if edtservice.Text = '' then
    edtservice.Text :='0';
  if edttax.Text = '' then
   edttax.Text := '0';
   xamount :=cVarToFloat(TcxDBGridHelper(cxgrdjual).GetFooterSummary('value'));

  if edtNomor.text = '' then
  begin
    edtNomor.Text :=getmaxkode;
    FLAGEDIT:=False;
    S:='insert into tjual (jl_nomor,jl_tanggal,jl_status,jl_amount,jl_sc,jl_tax,jl_table,jl_atasnama,jl_nohp,jl_promo) values ('
    + quot(edtNomor.Text) + ','
    + quotd(cGetServerTime,True)+',1,'
    + FloatToStr(xamount) + ','
    + StringReplace(edtservice.Text,',','',[rfReplaceAll]) +','
    + StringReplace(edttax.Text,',','',[rfReplaceAll])+','
    + Quot(edtmeja.Text) + ','
    + Quot(lblCustomer.text)+','
    + Quot(lblnohp.text)+','
    + Quot(cbDisc.Text)
    + ');';
  end
  else
  begin
    FLAGEDIT:= True;
    s:='update tjual set '
       + ' jl_table = ' + Quot(edtmeja.Text) + ','
       + ' jl_atasnama = ' + Quot(lblCustomer.text)+','
       + ' jl_nohp = ' + Quot(lblnohp.text) + ','
       + ' jl_amount =' +FloatToStr(xamount) +','
       + ' jl_sc = ' +StringReplace(edtservice.Text,',','',[rfReplaceAll]) +','
       + ' jl_tax = '+StringReplace(edttax.Text,',','',[rfReplaceAll])+','
       + ' jl_promo='+ Quot(cbdisc.Text)
       + ' where jl_nomor = '+ Quot(edtNomor.Text)+';';
  end;
xExecQuery(s,frmMenu.conn);

 // do prin ke dapur where jld_status=0
if not FLAGEDIT then
begin
  s:='update tjual_dtl set jld_jl_nomor ='+ Quot(edtNomor.Text)
+ ' where jld_jl_nomor = '+Quot('')
+ ' and jld_user = '+Quot(frmmenu.KDUSER);
xExecQuery(s,frmMenu.conn);
end;
   doprintdapur();
   doprintbar();
//   doprintall();
 // --------------------

s:='update tjual_dtl set '
+ ' jld_status=1'
+ ' where jld_jl_nomor = '+Quot(edtNomor.Text)
+ ' and jld_user = '+ Quot(frmmenu.KDUSER);

xExecQuery(s,frmMenu.conn);



end;


procedure TfrmPos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   Release;
end;


procedure TfrmPos.cxButton8Click(Sender: TObject);
begin
Release;
end;

procedure TfrmPos.listdata ;
begin
MyQuery1.Close;
MyQuery1.SQL.Text :='SELECT id ,Nama,Category ,Harga Price, if(varian > 1,CONCAT(varian," Price"),"") Varian,foto FROM ('
+ ' select item_id id ,ucase(item_nama) Nama,item_category Category ,foto,'
+ ' (SELECT COUNT(*) from titemvarian where iv_item_id=item_id) varian ,item_harga harga'
+ ' from titem ORDER BY   item_id) final';
MyQuery1.Open;


end;
procedure TfrmPos.FormShow(Sender: TObject);
var
  s:String;
  tsql:tsqlquery;
begin
  s:='select disc_nama from tdiscount';
  tsql := xOpenQuery(s,frmmenu.conn);
  cbdisc.items.Clear;
  cbdisc.items.Add('NONE');
  with tsql do
  begin
    try
      while not eof do
      begin
        cbdisc.items.Add(fields[0].AsString);
        next;
      end;
    finally
      free;
    end;
  end;
  cbDisc.ItemIndex := 0;

    s:='select ct_nama from tcategory';
  tsql := xOpenQuery(s,frmmenu.conn);
  cbcategory.items.Clear;
  cbcategory.items.Add('ALL');
  with tsql do
  begin
    try
      while not eof do
      begin
        cbcategory.items.Add(fields[0].AsString);
        next;
      end;
    finally
      free;
    end;
  end;
  cbcategory.ItemIndex := 0;

refreshdata;

end;

procedure TfrmPos.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
  FID := MyQuery1.Fields[0].AsString;
  IDBARANG := FID;
  IDNOURUT := 0;

  Application.CreateForm(TfrmDetailItem,frmDetailItem);

  frmDetailItem.ShowModal;

  loaditemorder(edtNomor.Text);

    
end;

procedure TfrmPos.edtfilterChange(Sender: TObject);
begin
      MyQuery1.Filter := ' nama like '+Quot('%'+UpperCase(edtfilter.Text)+'%');
      MyQuery1.Filtered := True;

end;

function TfrmPos.GetCDS: TClientDataSet;
begin
   If not Assigned(FCDS) then
  begin
    FCDS := TClientDataSet.Create(Self);
    zAddField(FCDS, 'Nomor', ftString, False,30);
    zAddField(FCDS, 'Nama', ftString, False,100);
    zAddField(FCDS, 'Qty', ftFloat, False);
    zAddField(FCDS, 'Disc', ftFloat, False);    
    zAddField(FCDS, 'Value', ftfloat, False);
    zAddField(FCDS, 'Salestype', ftString, False,30);
    zAddField(FCDS, 'id', ftinteger, False);
    zAddField(FCDS, 'nourut', ftinteger, False);
    zAddField(FCDS, 'notes', ftString, False,30);


    FCDS.CreateDataSet;
  end;
  Result := FCDS;
end;



procedure TfrmPos.FormCreate(Sender: TObject);
begin
     TcxDBGridHelper(cxgrdjual).LoadFromCDS(CDS, False, False);
     loaditemorder(edtNomor.Text);
  
end;

procedure tfrmpos.loaditemorder(anomor:string);
var
  S:string;
  tsql2,tsql:TSQLQuery;

begin
  if anomor = '' then
        s:='SELECT * from tjual_dtl inner join titem on item_id=jld_item'
    + ' WHERE jld_jl_nomor='+Quot(anomor)
    + ' and jld_isdelete = 0 '
    + ' and jld_user = '+Quot(frmmenu.KDUSER)
    + ' order by jld_salestype,jld_nourut'
  else
        s:='SELECT * from tjual_dtl inner join titem on item_id=jld_item'
    + ' WHERE jld_jl_nomor='+Quot(anomor)
    + ' and jld_isdelete = 0 '
    + ' order by jld_salestype,jld_nourut';

  tsql:=xOpenQuery(s,frmMenu.conn);
  If CDS.State <> dsEdit then CDS.Edit;
  cds.EmptyDataSet;
  with tsql do
  begin
    try
      First;
      while not eof do
      begin
        CDS.Append;

        CDS.FieldByName('nama').AsString        := fieldbyname('item_nama').AsString+chr(13)
        +fieldbyname('jld_salestype').AsString+chr(13)
        +fieldbyname('jld_varian').AsString+chr(13)+fieldbyname('jld_modifier').AsString;
        CDS.FieldByName('disc').AsFloat          := fieldbyname('jld_disc').Asfloat;
        CDS.FieldByName('qty').AsFloat          := fieldbyname('jld_qty').Asfloat;
        CDS.FieldByName('value').AsFloat        := (100-fieldbyname('jld_disc').Asfloat)/100*fieldbyname('jld_qty').Asfloat*fieldbyname('jld_price').Asfloat;
        CDS.FieldByName('salestype').AsString   := fieldbyname('jld_salestype').AsString;
        CDS.FieldByName('ID').AsInteger    :=fieldbyname('jld_item').AsInteger;
        CDS.FieldByName('nourut').AsInteger    :=fieldbyname('jld_nourut').AsInteger;
        CDS.FieldByName('NOMOR').AsString      :=fieldbyname('jld_jl_nomor').AsString;
        cds.FieldByName('notes').asstring      := fieldbyname('jld_notes').AsString;
        CDS.Post;
        Next;
      end;
    finally
      Free;
    end;
  end;
  if edtNomor.Text <> '' then
    s:='select sum(if(st_tax=0,0,jld_price)*jld_qty*(100-jld_disc)/100) tax,sum(if(st_sc=0,0,jld_price)*jld_qty*(100-jld_disc)/100) sc,'
      + ' sum((100-jld_disc)/100*jld_price*jld_qty) total '
      + '  from tjual_dtl inner join tsalestype on st_nama=jld_salestype '
      + ' where jld_isdelete=0 and jld_jl_nomor='+ Quot(edtNomor.Text)

  else
  s:='select sum(if(st_tax=0,0,jld_price)*jld_qty*(100-jld_disc)/100) tax,sum(if(st_sc=0,0,jld_price)*jld_qty*(100-jld_disc)/100) sc,'
  + ' sum((100-jld_disc)/100*jld_price*jld_qty) total '
  + '  from tjual_dtl inner join tsalestype on st_nama=jld_salestype '
  + ' where jld_isdelete=0 and jld_jl_nomor='+ Quot(edtNomor.Text)
  + ' and jld_user ='+Quot(frmMenu.KDUSER);
  tsql2 := xOpenQuery(s,frmMenu.conn);
  xtax:=0;
  xsc:=0;
  xtot:=0;
  with tsql2 do
  begin
    try
      if not eof then
      begin
        xtax := zTax*fields[0].AsFloat/100;
        xsc := zSc * (Fields[1].AsFloat+xtax)/100;
        xtot := Fields[2].AsFloat;
      end;
//
    finally
      free;
    end;
  end;

      edtservice.Text :=formatfloat('###,###,###',xsc);
      edttax.Text := formatfloat('###,###,###',xtax);
      edtTotal.Text :=formatfloat('###,###,###',xtax+xsc+xtot);

end;


procedure TfrmPos.cxgrdjualDblClick(Sender: TObject);
begin
   IDBARANG := IntToStr(CDS.fieldbyname('ID').Asinteger);
   IDNOURUT := CDS.fieldbyname('nourut').Asinteger;
   IDNOMOR :=edtnomor.text;

   Application.CreateForm(TfrmDetailItem,frmDetailItem);
   frmDetailItem.ShowModal;

   loaditemorder(IDNOMOR);

end;

function TfrmPos.getmaxkode:string;
var
  s:string;
begin
  s:='select max(right(jl_nomor,3)) from tjual where jl_nomor like ' + quot(frmMenu.USERID+ NOMERATOR+'.'+FormatDateTime('yymmdd',cGetServerTime)+'.%');
  with xOpenQuery(s,frmMenu.conn) do
  begin
    try
      if Fields[0].AsString = '' then
         result:= frmMenu.USERID+NOMERATOR+'.'+FormatDateTime('yymmdd',cGetServerTime)+'.'+RightStr(IntToStr(1000+1),3)
      else
         result:= frmMenu.USERID+ NOMERATOR+'.'+FormatDateTime('yymmdd',cGetServerTime)+'.'+RightStr(IntToStr(1000+fields[0].AsInteger+1),3);

    finally
      free;
    end;
  end;

end;

function TfrmPos.cekdinein(anomor:string):boolean;
var
  s:string;
begin
  result := false;
  s:='select count(*) from tjual_dtl where jld_jl_nomor like ' + quot(anomor)
  + ' and jld_salestype = '+Quot('DINE IN');
  with xOpenQuery(s,frmMenu.conn) do
  begin
    try
      if Fields[0].AsInteger > 0  then
         result:= true;

    finally
      free;
    end;
  end;

end;


procedure TfrmPos.cxtableClick(Sender: TObject);
begin
    Application.CreateForm(Tfrmmeja,frmmeja);
  frmmeja.ShowModal;
  edtmeja.Text := IDMEJA;
end;



procedure TfrmPos.cxButton3Click(Sender: TObject);
  VAR
    S:String;
    tsql:TSQLQuery;
begin
  Application.CreateForm(TfrmListBill,frmListBill);
  frmListBill.ShowModal;

  edtNomor.Text := IDNOMOR;
  s:='select jl_table,jl_atasnama,jl_nohp,jl_promo from tjual where jl_nomor ='+ Quot(edtNomor.Text);
  tsql := xOpenQuery(s,frmMenu.conn);
  with tsql do
  begin
    try
      if not eof then
      begin
        IDMEJA :=fields[0].AsString;
        IDCustomer := fields[1].AsString;
        idHP := fields[2].AsString;
//        lblCustomer.Caption:= Fields[1].AsString;
//        lblnohp.Caption := Fields[2].AsString;
//        edtmeja.Text := fields[0].AsString;
        cbDisc.Text :=fields[3].AsString;
      end;
    finally
      Free;
    end;
  end;
        lblCustomer.text:= IDCustomer;
        lblnohp.text := idHP;
        edtmeja.Text := IDMEJA;

  loaditemorder(edtNomor.Text);

end;

procedure TfrmPos.cxButton1Click(Sender: TObject);
begin
    if ( not ceKVIEW(frmMenu.KDUSER,'ufrmcharge')) then
        begin
           MessageDlg('Anda tidak berhak Membuka di Modul ini',mtWarning, [mbOK],0);
           Exit;
        End ;

  simpandata;
  IDNOMOR := edtNomor.Text;
  Application.CreateForm(TfrmCharge,frmCharge);
  frmCharge.ShowModal;
  if ISSUKSES THEN
  begin
     bukacashdrawer;
     Application.CreateForm(TfrmChange,frmChange);
     frmChange.ShowModal;

     refreshdata;
  end;
end;

procedure TfrmPos.cxprintClick(Sender: TObject);
var
  s: string ;
  ftsreport : TTSReport;
begin
simpandata;
  ftsreport := TTSReport.Create(nil);
  try
    ftsreport.Nama := 'notreceipt';
    zprinter := frmMenu.aPRINTER;

          s:= ' select '
       + ' *,'+Quot(zNamaProfile)+ ' as znama ,'
       +Quot(zAddress)+ ' as zalamat ,'
       +Quot(zNotelp)+ ' as znotelp ,'
       +Quot(zFooter)+ ' as zfooter '
       + ' from tjual '
       + ' inner join tjual_dtl on jl_nomor=jld_jl_nomor'
       + ' inner join titem on item_id=jld_item'
       + ' where '
       + ' jl_nomor=' + quot(edtnomor.Text)
       + ' and jld_isdelete =0'
       + ' order by jld_salestype,jld_nourut';
    ftsreport.AddSQL(s);

    ftsreport.ShowReport;
  finally
     ftsreport.Free;
  end;
end;

procedure TfrmPos.doprintdapur;
var
  s: string ;
  ftsreport : TTSReport;
  tsql :TSQLQuery;
begin
s:= ' SELECT * '
       + ' ,'+Quot(zNamaProfile)+ ' as znama ,'
       + Quot(zAddress)+ ' as zalamat ,'
       + Quot(zNotelp)+ ' as znotelp ,'
       + Quot(zFooter)+ ' as zfooter '
       + ' FROM tjual inner join tjual_dtl on jl_nomor=jld_jl_nomor'
       + ' INNER JOIN titem ON item_id=jld_item'
       + ' INNER JOIN tcategory ON ct_nama=item_category'
       + ' WHERE jld_status=0 '
       + ' AND jld_jl_nomor='+Quot(edtnomor.Text)
       + ' AND ct_printername="FOOD" '
       + ' order by jld_salestype,jld_nourut';
  tsql:=xOpenQuery(s,frmmenu.conn) ;
  with tsql do
  begin
    try
      if not Eof then
      begin
         s:='update tsound set isbunyi=1';
         xExecQuery(s,frmmenu.conn);
       end;
    finally
      free;
    end;
  end;


          s:= ' SELECT * '
       + ' ,'+Quot(zNamaProfile)+ ' as znama ,'
       + Quot(zAddress)+ ' as zalamat ,'
       + Quot(zNotelp)+ ' as znotelp ,'
       + Quot(zFooter)+ ' as zfooter '
       + ' FROM tjual inner join tjual_dtl on jl_nomor=jld_jl_nomor'
       + ' INNER JOIN titem ON item_id=jld_item'
       + ' INNER JOIN tcategory ON ct_nama=item_category'
       + ' WHERE jld_status=0 '
       + ' AND jld_jl_nomor='+Quot(edtnomor.Text)
       + ' AND ct_printername="FOOD" AND ct_isprint=1'
       + ' order by jld_salestype,jld_nourut';
  tsql:=xOpenQuery(s,frmmenu.conn) ;
  with tsql do
  begin
    try
      if Eof then
      exit;
    finally
      free;
    end;
  end;

  ftsreport := TTSReport.Create(nil);
  try
    ftsreport.Nama := 'food';
    zprinter := 'FOOD';

    ftsreport.AddSQL(s);

    ftsreport.ShowReport;
  finally
     ftsreport.Free;
  end;
end;


procedure TfrmPos.doprintall;
var
  s: string ;
  ftsreport : TTSReport;
  tsql :TSQLQuery;
begin

          s:= ' SELECT * '
       + ' ,'+Quot(zNamaProfile)+ ' as znama ,'
       + Quot(zAddress)+ ' as zalamat ,'
       + Quot(zNotelp)+ ' as znotelp ,'
       + Quot(zFooter)+ ' as zfooter '
       + ' FROM tjual inner join tjual_dtl on jl_nomor=jld_jl_nomor'
       + ' INNER JOIN titem ON item_id=jld_item'
       + ' INNER JOIN tcategory ON ct_nama=item_category'
       + ' WHERE jld_status=0 '
       + ' AND jld_jl_nomor='+Quot(edtnomor.Text)
       + ' order by jld_salestype,jld_nourut';
  tsql:=xOpenQuery(s,frmmenu.conn) ;
  with tsql do
  begin
    try
      if Eof then
      exit;
    finally
      free;
    end;
  end;

  ftsreport := TTSReport.Create(nil);
  try
    ftsreport.Nama := 'food';
    zprinter := frmmenu.aPRINTER;

    ftsreport.AddSQL(s);

    ftsreport.ShowReport;
  finally
     ftsreport.Free;
  end;
end;

procedure TfrmPos.doprintBAR;
var
  s: string ;
  ftsreport : TTSReport;
  tsql:TSQLQuery;
begin
     s:= ' SELECT * '
       + ' ,'+Quot(zNamaProfile)+ ' as znama ,'
       + Quot(zAddress)+ ' as zalamat ,'
       + Quot(zNotelp)+ ' as znotelp ,'
       + Quot(zFooter)+ ' as zfooter '
       + ' FROM tjual inner join tjual_dtl on jl_nomor=jld_jl_nomor'
       + ' INNER JOIN titem ON item_id=jld_item'
       + ' INNER JOIN tcategory ON ct_nama=item_category'
       + ' WHERE jld_status=0 '
       + ' AND jld_jl_nomor='+Quot(edtnomor.Text)
       + ' AND ct_printername="DRINK" AND ct_isprint=1'
       + ' order by jld_salestype,jld_nourut';
  tsql:=xOpenQuery(s,frmmenu.conn) ;
  with tsql do
  begin
    try
      if Eof then
      exit;
    finally
      free;
    end;
  end;

  ftsreport := TTSReport.Create(nil);
  try
    ftsreport.Nama := 'DRINK';
    zprinter := 'DRINK';


    ftsreport.AddSQL(s);

    ftsreport.ShowReport;
  finally
     ftsreport.Free;
  end;
end;

procedure TfrmPos.cxplitClick(Sender: TObject);
begin
   Application.CreateForm(TfrmSplit,frmSplit);
   frmSplit.ShowModal;
   refreshdata;


end;

procedure TfrmPos.cxButton6Click(Sender: TObject);
begin
   if cds.RecordCount =0  then
   begin
     showmessage('Data Masih kosong');
     exit;
   end;


   if (edtmeja.Text = '') and (cekdinein(edtnomor.Text)) then
   begin
     showmessage('Order ada Dine in , Harus Pilih Meja');
     exit;
   end;

   Application.CreateForm(TfrmInputCustomer,frmInputCustomer);
   frmInputCustomer.ShowModal;
   if xcancel then
   begin
      xcancel:=false;
      exit;
   end;
   lblCustomer.text := IDCustomer;
   lblnohp.text := idHP;
    try

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

//      if MessageDlg('Save data ?',mtCustom,
//                                  [mbYes,mbNo], 0)= mrNo
//      then Exit ;

      simpandata;
      refreshdata;
   except
     ShowMessage('failed');
     xRollback(frmMenu.conn);
     Exit;
   end;
    xCommit(frmMenu.conn);
end;


procedure TfrmPos.cxrefundClick(Sender: TObject);
begin
   Application.CreateForm(Tfrmotorisasi,frmotorisasi);
   frmotorisasi.ShowModal;
   if  IDOTORISASI then
   begin
      Application.CreateForm(Tfrmlistbill2,frmlistbill2);
      frmlistbill2.ShowModal;
      Application.CreateForm(Tfrmrefund,frmrefund);
      frmrefund.ShowModal;

    end;
    IDNOMOR:='';
end;

procedure TfrmPos.cxButton2Click(Sender: TObject);
begin
      Application.CreateForm(Tfrmclerek,frmclerek);
      frmclerek.ShowModal;

end;

procedure TfrmPos.cxnewClick(Sender: TObject);
var
  s:string;

begin
  s:= 'delete from tjual_dtl where jld_status=0 and jld_user ='+Quot(frmMenu.KDUSER);
  xExecQuery(s,frmMenu.conn);
refreshdata;
end;

procedure TfrmPos.cxButton4Click(Sender: TObject);
begin
     xcancel:= true;
      Application.CreateForm(Tfrmlistbill2,frmlistbill2);
      frmlistbill2.ShowModal;
     if not xCancel then
     begin

       doprinslip;
       xcancel:= true;
     end;
     IDNOMOR:='';
end;

procedure TfrmPos.cxGrid1DBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  FID := MyQuery1.Fields[0].AsString;
  IDBARANG := FID;
  IDNOURUT := 0;

  Application.CreateForm(TfrmDetailItem,frmDetailItem);

  frmDetailItem.ShowModal;


  loaditemorder(edtNomor.Text);


end;

procedure TfrmPos.bukacashdrawer;
var  varTFz,varTFz1 : TextFile ;
      varfilezzz,varFilezz : String ;
begin
  if not FileExists('opendrawer') then
     varfilezzz := ExtractFilePath(Application.ExeName)+'opendrawer';

  assignfile(varTFz,'opendrawer');
  rewrite(varTFz);
  Writeln(varTFz,#27,#112,#0,#50,#250); // OpenCashdrawer
//  Writeln(varTFz,#7,#27,'p',#0,#20,#20); // OpenCashdrawer
  closefile(varTFz);

  varFilezz := ExtractFilePath(Application.ExeName)+'cetak2.bat';
  rewrite(varTFz1,varFilezz) ;
  writeln(varTFz1,'copy  opendrawer prn');
  closefile(varTFz1) ;

  ShellExecute(0, PChar('open'),PChar('cetak2.bat'),nil, nil, SW_HIDE);
//  DeleteFile(varFile1);

end;


procedure TfrmPos.doprinslip;
var
  s: string ;
  ftsreport : TTSReport;
begin

  ftsreport := TTSReport.Create(nil);
  try
    ftsreport.Nama := 'charge';

       zprinter := frmMenu.aPRINTER;

          s:= ' select '
       + ' *,'+Quot(zNamaProfile)+ ' as znama ,'
       +Quot(zAddress)+ ' as zalamat ,'
       +Quot(zNotelp)+ ' as znotelp ,'
       +Quot(zFooter)+ ' as zfooter '
       + ' from tjual '
       + ' inner join tjual_dtl on jl_nomor=jld_jl_nomor'
       + ' inner join titem on item_id=jld_item'
       + ' where '
       + ' jl_nomor=' + quot(IDNOMOR)
       + ' and jld_isdelete =0'
       + ' order by jld_salestype,jld_nourut';
    ftsreport.AddSQL(s);

    ftsreport.ShowReport;
  finally
     ftsreport.Free;
  end;
end;

procedure TfrmPos.cbDiscChange(Sender: TObject);
var
  S:string;
  tsql:TSQLQuery;
begin
   s:='SELECT * FROM tdiscountitem INNER JOIN tdiscount ON disc_id=discd_disc_id'
+ ' INNER JOIN titem ON discd_category=item_category'
+ ' INNER JOIN tjual_dtl ON jld_item=item_id'
+ ' WHERE jld_jl_nomor LIKE'+Quot(edtnomor.Text)
+ ' and disc_nama='+quot(cbDisc.Text)
+';';
  tsql := xOpenQuery(s,frmmenu.conn);
  if tsql.eof then
  begin
    s:='update tjual_dtl set jld_disc=0 where jld_jl_nomor='+Quot(edtnomor.Text)+';';
    xExecQuery(s,frmmenu.conn);
  end
  else
  begin
    s:='update tjual_dtl set jld_disc=0 where jld_jl_nomor='+Quot(edtnomor.Text)+';';
    xExecQuery(s,frmmenu.conn);

  s:='update tdiscountitem INNER JOIN tdiscount ON disc_id=discd_disc_id'
+ ' INNER JOIN titem ON discd_category=item_category'
+ ' INNER JOIN tjual_dtl ON jld_item=item_id'
+ ' set jld_disc=disc_persen '
+ ' WHERE jld_jl_nomor LIKE'+Quot(edtnomor.Text)
+ ' and disc_nama='+quot(cbDisc.Text)
+';';
xExecQuery(s,frmmenu.conn);
end;
loaditemorder(edtnomor.Text);


end;

procedure TfrmPos.cbcategoryChange(Sender: TObject);
begin
  if cbcategory.ItemIndex =  0 then
  MyQuery1.Filtered := False
  else
  begin
  MyQuery1.Filter :='category='+ Quot(cbcategory.Items[cbcategory.itemindex]);
  MyQuery1.Filtered := True;
  end;

end;

end.
