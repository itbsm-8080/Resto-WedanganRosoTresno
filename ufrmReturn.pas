unit ufrmReturn;

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
  TfrmReturn = class(TForm)
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
    MyQuery2qty: TLargeintField;
    cxButton3: TcxButton;
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
  frmReturn: TfrmReturn;

implementation
uses MAIN,uModuleConnection,uFrmbantuan,Ulib,ufrmlistproduct;

{$R *.dfm}

procedure TfrmReturn.refreshdata;
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
end;
procedure TfrmReturn.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmReturn.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      SelectNext(ActiveControl,True,True);
end;

procedure TfrmReturn.simpandata;
var
  s:string;
begin

if FLAGEDIT then
  s:='update treturn set '
    + ' ret_keterangan = ' + Quot(edtketerangan.Text)+ ','
    + ' ret_tanggal = ' + quotd(dttanggal.datetime)
    + ' where ret_nomor= ' + quot(FID) + ';'
else
begin
  s :=  ' insert into treturn '
             + ' (ret_nomor,ret_tanggal,ret_keterangan) '
             + ' values ( '
             + Quot(getmaxkode) + ','
             + Quotd(dttanggal.datetime) +','
             + Quot(edtketerangan.Text)
             + ');';
             fid:=getmaxkode;
end;
  xExecQuery(s,frmmenu.conn);

    s:='delete from treturn_dtl where retd_ret_nomor='+Quot(FID)+';';
  xExecQuery(s,frmMenu.conn);
  ClientDataSet1.First;
  while not ClientDataSet1.Eof do
  begin
    s:='insert into treturn_dtl (retd_ret_nomor,retd_item_id,retd_qty,retd_hpp) values ('
    + Quot(fid) + ','
    + Quot(ClientDataSet1.Fields[0].AsString)+ ','
    + FloatToStr(ClientDataSet1.Fields[2].AsFloat) + ','
    + getnama('titem','item_id',ClientDataSet1.Fields[0].AsString,'item_hpp')
    +');';
    xExecQuery(s,frmMenu.conn);

    ClientDataSet1.Next;
  end;


end;

procedure TfrmReturn.deletedata;
var
  s:string;
begin

  s:='Delete from treturn  '
    + ' where ret_nomor= ' + quot(FID) + ';' ;

  xExecQuery(s,frmmenu.conn);

  s:='Delete from treturn_dtl  '
    + ' where retd_ret_nomor= ' + quot(FID) + ';' ;

  xExecQuery(s,frmmenu.conn);



end;

procedure TfrmReturn.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   Release;
end;

function TfrmReturn.getmaxkode:string;
var
  s:string;
begin
    s:='select max(right(ret_nomor,4)) from treturn where ret_nomor like ' + quot('RET.'+FormatDateTime('yymm',cGetServerTime)+'.%');

  with xOpenQuery(s,frmMenu.conn) do
  begin
    try
      if Fields[0].AsString = '' then
         result:= 'RET.'+FormatDateTime('yymm',cGetServerTime)+'.'+RightStr(IntToStr(10000+1),4)
      else
         result:= 'RET.'+FormatDateTime('yymm',cGetServerTime)+'.'+RightStr(IntToStr(10000+fields[0].AsInteger+1),4);

    finally
      free;
    end;
  end;
end;

procedure TfrmReturn.cxButton1Click(Sender: TObject);
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

procedure TfrmReturn.cxButton8Click(Sender: TObject);
begin
Release;
end;

procedure TfrmReturn.cxButton2Click(Sender: TObject);
begin
   try
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


procedure TfrmReturn.listdata ;
begin
MyQuery1.Close;
MyQuery1.SQL.Text :='SELECT ret_nomor Nomor ,ret_tanggal Tanggal,ret_keterangan Keterangan  '
+ ' from treturn order by ret_nomor ';
MyQuery1.Open;


end;
procedure TfrmReturn.FormShow(Sender: TObject);
begin
refreshdata;
end;

procedure TfrmReturn.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
edtketerangan.Text:=MyQuery1.Fields[2].AsString;
dttanggal.datetime := MyQuery1.Fields[1].Asdatetime;
FID := MyQuery1.Fields[0].AsString;
edtnomor.Text := fid;
FLAGEDIT:=True;
cxButton2.Visible:= True;
ClientDataSet1.EmptyDataSet;
loaddata(FID);
end;

function TfrmReturn.getidcategory(anam:string):integer;
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


procedure TfrmReturn.cxButton4Click(Sender: TObject);
begin
      ClientDataSet1.Open;
 If ClientDataSet1.State <> dsEdit then ClientDataSet1.Edit;

    ClientDataSet1.Append;

end;

procedure TfrmReturn.loaddata(akode:string) ;
var
  s: string;
  tsql : TSQLQuery;
  bmp: TBitmap;
  stream : tmemorystream;
  Jpg: TJpegImage;
  Buffer      : Word;
begin
  s:= 'select retd_item_id,item_nama,retd_qty from treturn_dtl INNER JOIN titem on item_id =retd_item_id '
  + ' where retd_ret_nomor = ' + Quot(akode) ;

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
procedure TfrmReturn.cxGrid2DBTableView1Column3PropertiesButtonClick(
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

       
       xcancel:= true;
     end;
     IDSKU:=0;
end;

procedure TfrmReturn.cxButton3Click(Sender: TObject);
VAR
  S:STRING;
  tsql:TSQLQuery;
begin
  s:='select item_id,item_nama , '
  + ' (SELECT ifnull(SUM(mst_stok_in-mst_stok_out),0) FROM tmasterstok WHERE mst_item_id=item_id  and mst_tanggal <='+quotd(dttanggal.DateTime)+') QTY '
  + ' From titem where item_isstock=1';
  ClientDataSet1.EmptyDataSet;
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

