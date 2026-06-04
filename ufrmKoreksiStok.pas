unit ufrmKoreksiStok;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, ComCtrls, StdCtrls, AdvEdit,SqlExpr, Menus,
  cxLookAndFeelPainters, cxButtons,StrUtils, cxGraphics, cxLookAndFeels,
  dxSkinsCore, dxSkinsDefaultPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, MemDS, DBAccess, MyAccess, FMTBcd, DBClient,
  Provider, cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox, cxCurrencyEdit,
  cxImage,jpeg, cxDBEdit, cxListBox, cxButtonEdit;

type
  TfrmKoreksiStok = class(TForm)
    AdvPanel1: TAdvPanel;
    Label3: TLabel;
    AdvPanel3: TAdvPanel;
    cxButton8: TcxButton;
    AdvPanel2: TAdvPanel;
    lbljudul: TLabel;
    AdvPanel4: TAdvPanel;
    cxButton1: TcxButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle2: TcxStyle;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxStyleRepository3: TcxStyleRepository;
    cxStyle3: TcxStyle;
    MyQuery1: TMyQuery;
    DataSource1: TDataSource;
    cxButton2: TcxButton;
    Label1: TLabel;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    Label2: TLabel;
    edtNomor: TAdvEdit;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2DBTableView1Column1: TcxGridDBColumn;
    cxGrid2DBTableView1Column2: TcxGridDBColumn;
    cxGrid2Level1: TcxGridLevel;
    MyQuery2: TMyQuery;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    DataSource2: TDataSource;
    OpenDialog1: TOpenDialog;
    MyQuery3: TMyQuery;
    MyQuery3item_id: TIntegerField;
    MyQuery3foto: TBlobField;
    DataSource3: TDataSource;
    dtTanggal: TDateTimePicker;
    edtketerangan: TAdvEdit;
    cxGrid2DBTableView1Column3: TcxGridDBColumn;
    MyQuery1Nomor: TStringField;
    MyQuery1Tanggal: TDateField;
    MyQuery1Keterangan: TStringField;
    MyQuery2Kode: TIntegerField;
    MyQuery2Nama: TStringField;
    cxButton5: TcxButton;
    dttanggalshow: TDateTimePicker;
    cxButton3: TcxButton;
    cxGrid2DBTableView1Column4: TcxGridDBColumn;
    cxGrid2DBTableView1Column5: TcxGridDBColumn;
    MyQuery2stok: TLargeintField;
    MyQuery2Fisik: TLargeintField;
    MyQuery2Selisih: TLargeintField;
    procedure refreshdata;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure simpandata;
    procedure deletedata;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function getmaxkode:string;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton8Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure listdata ;
    procedure FormShow(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure loaddata(akode:string) ;
    procedure cxGrid2DBTableView1Column3PropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    function getstok(akode:String):Double;
    procedure cxButton5Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);

  private
   
    FFLAGEDIT: Boolean;
    FID: string;

      function getidcategory(anam:string):integer;

    { Private declarations }
  public
    property FLAGEDIT: Boolean read FFLAGEDIT write FFLAGEDIT;
    property ID: string read FID write FID;

    { Public declarations }
  end;

var
  frmKoreksiStok: TfrmKoreksiStok;

implementation
uses MAIN,uModuleConnection,uFrmbantuan,Ulib,ufrmlistproduct;

{$R *.dfm}

procedure TfrmKoreksiStok.refreshdata;
begin
  FID:='';
  FLAGEDIT := FALSE;
  dttanggal.date:= date;
  edtnomor.text := getmaxkode;
  edtketerangan.Clear;
  edtketerangan.SetFocus;
  CLIENTDATASET1.OPEN;
  If ClientDataSet1.State <> dsEdit then ClientDataSet1.Edit;
  ClientDataSet1.EmptyDataSet;
  ClientDataSet1.Append;
  listdata;
  dttanggal.Enabled := true;
end;
procedure TfrmKoreksiStok.FormKeyDown(Sender: TObject; var Key: Word;
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
      
      if MessageDlg('Save data ?',mtCustom,
                                  [mbYes,mbNo], 0)= mrNo
      then Exit ;

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

procedure TfrmKoreksiStok.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      SelectNext(ActiveControl,True,True);
end;

procedure TfrmKoreksiStok.simpandata;
var
  s:string;
begin

if FLAGEDIT then
  s:='update tkoreksi set '
    + ' kor_keterangan = ' + Quot(edtketerangan.Text)+ ','
    + ' kor_tanggal = ' + quotd(dttanggal.datetime)
    + ' where kor_nomor= ' + quot(FID) + ';'
else
begin
  s :=  ' insert into tkoreksi '
             + ' (kor_nomor,kor_tanggal,kor_keterangan) '
             + ' values ( '
             + Quot(getmaxkode) + ','
             + Quotd(dttanggal.datetime) +','
             + Quot(edtketerangan.Text)
             + ');';
             fid:=getmaxkode;
end;
  xExecQuery(s,frmmenu.conn);

    s:='delete from tkoreksi_dtl where kord_kor_nomor='+Quot(FID)+';';
  xExecQuery(s,frmMenu.conn);
  ClientDataSet1.First;
  while not ClientDataSet1.Eof do
  begin
    s:='insert into tkoreksi_dtl (kord_kor_nomor,kord_item_id,kord_qty,kord_hpp) values ('
    + Quot(fid) + ','
    + Quot(ClientDataSet1.Fields[0].AsString)+ ','
    + FloatToStr(ClientDataSet1.Fields[2].AsFloat) + ','
    + getnama('titem','item_id',ClientDataSet1.Fields[0].AsString,'item_hpp')
    +');';
    xExecQuery(s,frmMenu.conn);

    ClientDataSet1.Next;
  end;


end;

procedure TfrmKoreksiStok.deletedata;
var
  s:string;
begin

  s:='Delete from tkoreksi  '
    + ' where kor_nomor= ' + quot(FID) + ';' ;

  xExecQuery(s,frmmenu.conn);

  s:='Delete from tkoreksi_dtl  '
    + ' where kord_kor_nomor= ' + quot(FID) + ';' ;

  xExecQuery(s,frmmenu.conn);



end;

procedure TfrmKoreksiStok.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   Release;
end;

function TfrmKoreksiStok.getmaxkode:string;
var
  s:string;
begin
    s:='select max(right(kor_nomor,4)) from tkoreksi where kor_nomor like ' + quot('KOR.'+FormatDateTime('yymm',cGetServerTime)+'.%');

  with xOpenQuery(s,frmMenu.conn) do
  begin
    try
      if Fields[0].AsString = '' then
         result:= 'KOR.'+FormatDateTime('yymm',cGetServerTime)+'.'+RightStr(IntToStr(10000+1),4)
      else
         result:= 'KOR.'+FormatDateTime('yymm',cGetServerTime)+'.'+RightStr(IntToStr(10000+fields[0].AsInteger+1),4);

    finally
      free;
    end;
  end;
end;

procedure TfrmKoreksiStok.cxButton1Click(Sender: TObject);
begin
    try
       if FormatDateTime('yyyy-mm-dd',dtTanggal.DateTime) < FormatDateTime('yyyy-mm-dd',cGetServerTime) then
        begin
           MessageDlg('Tidak bisa edit tanggal Kemarin',mtWarning, [mbOK],0);
           Exit;
        End;
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

      if MessageDlg('Save data ?',mtCustom,
                                  [mbYes,mbNo], 0)= mrNo
      then Exit ;

      simpandata;
      refreshdata;
   except
     ShowMessage('failed');
     xRollback(frmMenu.conn);
     Exit;
   end;
    xCommit(frmMenu.conn);
end;

procedure TfrmKoreksiStok.cxButton8Click(Sender: TObject);
begin
Release;
end;

procedure TfrmKoreksiStok.cxButton2Click(Sender: TObject);
begin
   try
         if FormatDateTime('yyyy-mm-dd',dtTanggal.DateTime) < FormatDateTime('yyyy-mm-dd',cGetServerTime) then
        begin
           MessageDlg('Tidak bisa edit tanggal Kemarin',mtWarning, [mbOK],0);
           Exit;
        End;
      if (FLAGEDIT) and ( not cekdelete(frmMenu.KDUSER,self.name)) then
        begin
           MessageDlg('Anda tidak berhak Delete di Modul ini',mtWarning, [mbOK],0);
           Exit;
        End;


      if MessageDlg('Delete data ?',mtCustom,
                                  [mbYes,mbNo], 0)= mrNo
      then Exit ;

      deletedata;
      refreshdata;
   except
     ShowMessage('Failed');
     xRollback(frmMenu.conn);
     Exit;
   end;
    xCommit(frmMenu.conn);

end;


procedure TfrmKoreksiStok.listdata ;
begin
MyQuery1.Close;
MyQuery1.SQL.Text :='SELECT kor_nomor Nomor ,kor_tanggal Tanggal,kor_keterangan Keterangan  '
+ ' from tkoreksi where kor_tanggal = '+ quotd(dttanggalshow.date)
+ ' order by kor_nomor ';
MyQuery1.Open;


end;
procedure TfrmKoreksiStok.FormShow(Sender: TObject);
begin
  dttanggalshow.date := Date;
refreshdata;
end;

procedure TfrmKoreksiStok.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
edtketerangan.Text:=MyQuery1.Fields[2].AsString;
dttanggal.datetime := MyQuery1.Fields[1].Asdatetime;
FID := MyQuery1.Fields[0].AsString;
edtnomor.Text := fid;
FLAGEDIT:=True;
cxButton2.Visible:= True;
ClientDataSet1.EmptyDataSet;
loaddata(FID);
dttanggal.Enabled := false;
end;

function TfrmKoreksiStok.getidcategory(anam:string):integer;
var
  s:string;
  tsql:tsqlquery;
begin
  S:='select ct_id from tcategory where ct_nama like '+Quot(anam);
  tsql:= xOpenQuery(s,frmMenu.conn);
  with tsql do
  begin
    if not Eof then
       result:= fields[0].AsInteger
    else
       result := 0;
  end;

end;


procedure TfrmKoreksiStok.cxButton4Click(Sender: TObject);
begin
      ClientDataSet1.Open;
 If ClientDataSet1.State <> dsEdit then ClientDataSet1.Edit;

    ClientDataSet1.Append;

end;

procedure TfrmKoreksiStok.loaddata(akode:string) ;
var
  s: string;
  tsql : TSQLQuery;
  bmp: TBitmap;
  stream : tmemorystream;
  Jpg: TJpegImage;
  Buffer      : Word;
begin
  s:= 'select kord_item_id,item_nama,kord_qty from tkoreksi_dtl INNER JOIN titem on item_id =kord_item_id '
  + ' where kord_kor_nomor = ' + Quot(akode) ;

tsql := xOpenQuery(s,frmMenu.conn);
with tsql do
begin
  try
    while not Eof do
    begin
      ClientDataSet1.Append;
      ClientDataSet1.Fields[0].AsString := Fields[0].AsString;
      ClientDataSet1.Fields[1].AsString := Fields[1].AsString;
      ClientDataSet1.Fields[2].Asfloat :=Fields[2].Asfloat;
      Next;
    end

  finally
    Free;
  end;


end;


end;
procedure TfrmKoreksiStok.cxGrid2DBTableView1Column3PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
       xcancel:= true;
      Application.CreateForm(Tfrmlistproduct,frmlistproduct);
      frmlistproduct.ShowModal;
     if not xCancel then
     begin
      ClientDataSet1.Append;
      ClientDataSet1.Fields[0].Asinteger := IDSKU;
      ClientDataSet1.Fields[1].AsString := getnama('titem','item_id',inttostr(idsku),'item_nama');
      ClientDataSet1.Fields[2].Asfloat := getstok(inttostr(idsku));



       xcancel:= true;
     end;
     IDSKU:=0;
end;
function TfrmKoreksiStok.getstok(akode:String):Double;
begin
  result:=0;
end;

procedure TfrmKoreksiStok.cxButton5Click(Sender: TObject);
begin
listdata ;
end;

procedure TfrmKoreksiStok.cxButton3Click(Sender: TObject);
VAR
  S:STRING;
  tsql:TSQLQuery;
begin
  s:='select item_id,item_nama ,0 QTY From titem where item_isstock=1';
tsql := xOpenQuery(s,frmMenu.conn);
with tsql do
begin
  try
    while not Eof do
    begin
      ClientDataSet1.Append;
      ClientDataSet1.Fields[0].AsString := Fields[0].AsString;
      ClientDataSet1.Fields[1].AsString := Fields[1].AsString;
      ClientDataSet1.Fields[2].Asfloat :=Fields[2].Asfloat;
      Next;
    end

  finally
    Free;
  end;

end;
end;

end.

