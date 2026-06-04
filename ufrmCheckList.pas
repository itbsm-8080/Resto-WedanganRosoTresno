unit ufrmChecklist;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, ComCtrls, StdCtrls, AdvEdit,SqlExpr, Menus,
  cxLookAndFeelPainters, cxButtons,StrUtils, cxGraphics, cxLookAndFeels,
  dxSkinsCore, dxSkinsDefaultPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, MemDS, DBAccess, MyAccess, FMTBcd, DBClient,
  Provider, cxPC, cxCheckBox, cxTextEdit, cxCurrencyEdit, MPlayer, Grids,
  DBGrids;

type
  TfrmCheckList = class(TForm)
    AdvPanel2: TAdvPanel;
    lbljudul: TLabel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle2: TcxStyle;
    cxStyleRepository3: TcxStyleRepository;
    cxStyle3: TcxStyle;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    AdvPanel1: TAdvPanel;
    cxButton1: TcxButton;
    AdvPanel4: TAdvPanel;
    cxButton2: TcxButton;
    cxStyleRepository4: TcxStyleRepository;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    Label4: TLabel;
    edtdetik: TAdvEdit;
    Label1: TLabel;
    Timer1: TTimer;
    cbFilter: TComboBox;
    cxStyleRepository5: TcxStyleRepository;
    cxStyle6: TcxStyle;
    chkrefresh: TCheckBox;
    Label5: TLabel;
    cxStyleRepository6: TcxStyleRepository;
    cxStyle7: TcxStyle;
    Label3: TLabel;
    Label2: TLabel;
    AdvPanel5: TAdvPanel;
    AdvPanel6: TAdvPanel;
    MediaPlayer1: TMediaPlayer;
    MyQuery1: TMyQuery;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    MyQuery1Meja: TStringField;
    MyQuery1Customer: TStringField;
    MyQuery1jam: TStringField;
    MyQuery1jam2: TStringField;
    MyQuery1Nama: TStringField;
    MyQuery1qty: TFloatField;
    MyQuery1Varian: TStringField;
    MyQuery1Modifier: TStringField;
    MyQuery1SalesType: TStringField;
    MyQuery1nourut: TIntegerField;
    MyQuery1Nomor: TStringField;
    MyQuery1ID: TIntegerField;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBTableView1Column3: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridDBColumn10: TcxGridDBColumn;
    cxGridDBTableView1Column2: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    ClientDataSet1Meja: TStringField;
    ClientDataSet1Customer: TStringField;
    ClientDataSet1jam: TStringField;
    ClientDataSet1jam2: TStringField;
    ClientDataSet1Nama: TStringField;
    ClientDataSet1qty: TFloatField;
    ClientDataSet1Varian: TStringField;
    ClientDataSet1Modifier: TStringField;
    ClientDataSet1SalesType: TStringField;
    ClientDataSet1nourut: TIntegerField;
    ClientDataSet1Nomor: TStringField;
    ClientDataSet1ID: TIntegerField;
    ClientDataSet1chek: TLargeintField;
    MyQuery1chek: TLargeintField;
    MyQuery2: TMyQuery;
    DataSetProvider2: TDataSetProvider;
    ClientDataSet2: TClientDataSet;
    DataSource2: TDataSource;
    cxGrid1: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn11: TcxGridDBColumn;
    cxGridDBColumn13: TcxGridDBColumn;
    cxGridDBColumn14: TcxGridDBColumn;
    cxGridDBColumn15: TcxGridDBColumn;
    cxGridDBColumn16: TcxGridDBColumn;
    cxGridDBColumn17: TcxGridDBColumn;
    cxGridDBColumn18: TcxGridDBColumn;
    cxGridDBColumn19: TcxGridDBColumn;
    cxGridDBColumn20: TcxGridDBColumn;
    cxGridDBColumn21: TcxGridDBColumn;
    cxGridDBColumn22: TcxGridDBColumn;
    cxGridDBColumn23: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    MyQuery2Meja: TStringField;
    MyQuery2Customer: TStringField;
    MyQuery2jam: TStringField;
    MyQuery2Nama: TStringField;
    MyQuery2Qty: TFloatField;
    MyQuery2Varian: TStringField;
    MyQuery2Modifier: TStringField;
    MyQuery2chek: TLargeintField;
    MyQuery2SalesType: TStringField;
    MyQuery2nourut: TIntegerField;
    MyQuery2Nomor: TStringField;
    MyQuery2isdelete: TIntegerField;
    MyQuery2ID: TIntegerField;
    ClientDataSet2Meja: TStringField;
    ClientDataSet2Customer: TStringField;
    ClientDataSet2jam: TStringField;
    ClientDataSet2Nama: TStringField;
    ClientDataSet2Qty: TFloatField;
    ClientDataSet2Varian: TStringField;
    ClientDataSet2Modifier: TStringField;
    ClientDataSet2chek: TLargeintField;
    ClientDataSet2SalesType: TStringField;
    ClientDataSet2nourut: TIntegerField;
    ClientDataSet2Nomor: TStringField;
    ClientDataSet2isdelete: TIntegerField;
    ClientDataSet2ID: TIntegerField;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton8Click(Sender: TObject);
    function GetCDS: TClientDataSet;
    function GetCDS2: TClientDataSet;

    procedure FormCreate(Sender: TObject);
    procedure loaddata;
    procedure loaddata2;
    procedure cxGrid1DBTableView1Column3StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure cxGrid1DBTableView1Column3PropertiesEditValueChanged(
      Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxGridDBColumn6PropertiesEditValueChanged(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure edtdetikKeyPress(Sender: TObject; var Key: Char);
    procedure edtdetikExit(Sender: TObject);
    function getmaxnomor :string;
    procedure cxGridDBColumn18PropertiesEditValueChanged(Sender: TObject);
  private
    FFLAGEDIT: Boolean;
    FID: string;

    protected
    FCDS: TClientDataSet;
    FCDS2: TClientDataSet;

    { Private declarations }
  public
    property FLAGEDIT: Boolean read FFLAGEDIT write FFLAGEDIT;
    property ID: string read FID write FID;
    property CDS: TClientDataSet read GetCDS write FCDS;
    property CDS2: TClientDataSet read GetCDS2 write FCDS2;
    { Public declarations }
  end;

var
  frmCheckList: TfrmCheckList;

implementation
uses MAIN,uModuleConnection,uFrmbantuan,Ulib;

{$R *.dfm}

procedure TfrmCheckList.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      SelectNext(ActiveControl,True,True);
end;

procedure TfrmCheckList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   Release;
end;

procedure TfrmCheckList.cxButton8Click(Sender: TObject);
begin
Release;
end;

function TfrmCheckList.GetCDS: TClientDataSet;
begin
  If not Assigned(FCDS) then
  begin
    FCDS := TClientDataSet.Create(Self);
    zAddField(FCDS, 'ID', ftInteger, False);
    zAddField(FCDS, 'Meja', ftString, False,10);
    zAddField(FCDS, 'Customer', ftString, False,30);
    zAddField(FCDS, 'Jam', ftString, False,10);
    zAddField(FCDS, 'Nama', ftString, False,30);
    zAddField(FCDS, 'Qty', ftfloat, False);
    zAddField(FCDS, 'Varian', ftString, False,30);
    zAddField(FCDS, 'Modifier', ftString, False,100);
    zAddField(FCDS, 'SalesType', ftString, False,20);
    zAddField(FCDS, 'nourut', ftInteger, False,2);
    zAddField(FCDS, 'Nomor', ftString, False,30);
    zAddField(FCDS, 'chek', ftInteger, False,1);
    zAddField(FCDS, 'isdelete', ftInteger, False,1);




    FCDS.CreateDataSet;
  end;
  Result := FCDS;
end;

function TfrmCheckList.GetCDS2: TClientDataSet;
begin
  If not Assigned(FCDS2) then
  begin
    FCDS2 := TClientDataSet.Create(Self);
    zAddField(FCDS2, 'ID', ftInteger, False);
    zAddField(FCDS2, 'Meja', ftString, False,10);
    zAddField(FCDS2, 'Customer', ftString, False,30);
    zAddField(FCDS2, 'Jam', ftString, False,10);
    zAddField(FCDS2, 'Nama', ftString, False,30);
    zAddField(FCDS2, 'Qty', ftfloat, False);
    zAddField(FCDS2, 'Varian', ftString, False,30);
    zAddField(FCDS2, 'Modifier', ftString, False,100);
    zAddField(FCDS2, 'SalesType', ftString, False,20);
    zAddField(FCDS2, 'nourut', ftInteger, False,2);
    zAddField(FCDS2, 'Nomor', ftString, False,30);
    zAddField(FCDS2, 'chek', ftInteger, False,1);
    zAddField(FCDS2, 'Jam2', ftString, False,10);




    FCDS2.CreateDataSet;
  end;
  Result := FCDS2;
end;

procedure TfrmCheckList.FormCreate(Sender: TObject);
begin
//     TcxDBGridHelper(cxGrid1DBTableView1).LoadFromCDS(CDS, False, False);
//     TcxDBGridHelper(cxGridDBTableView1).LoadFromCDS(CDS2, False, False);
loaddata;
loaddata2;

end;
procedure TfrmCheckList.loaddata;
var
  s:string;
  tsql:TSQLQuery;
  ceksound :boolean;

begin
  S:='select isbunyi from tsound';
  tsql := xOpenQuery(s,frmmenu.conn);
  with tsql do
  begin
    try
      if fields[0].AsInteger =1 then
         ceksound := true
      else
         ceksound := false;
    finally
      free;
    end;
  end;
  if ceksound then
  begin
    MediaPlayer1.FileName := 'order.wav';
    MediaPlayer1.Open;
    MediaPlayer1.Play;
    ynomor:= getmaxnomor;
    s:='update tsound set isbunyi=0';
         xExecQuery(s,frmmenu.conn);

  end;
  s:='SELECT  jl_table Meja,jl_atasnama Customer, date_FORMAT(jld_tglorder,"%H:%i:%s") jam,item_nama Nama,jld_qty Qty,'
+ ' jld_varian Varian,concat(jld_modifier," ",jld_notes) Modifier,'
+ ' jld_salestype SalesType,cast(0 as unsigned) chek,'
+ ' jld_nourut nourut,jld_jl_nomor Nomor,jld_isdelete isdelete,item_id ID'
+ ' FROM tjual_dtl inner join titem on jld_item=item_id'
+ ' INNER JOIN tjual ON jl_nomor=jld_jl_nomor'
+ ' INNER JOIN tcategory ON ct_nama=item_category '
+ ' WHERE jld_status in (1,2) AND jld_iseksekusi=0'
+ ' AND ct_printername = '+ Quot(cbFilter.Text)
+ ' and jl_tanggal >= '+QuotD(cGetServerTime)
+ ' ORDER BY jl_tanggal , jld_nourut';
clientdataset2.Close;
MyQuery2.Close;
MyQuery2.SQL.Text :=s;
MyQuery2.Open;
clientdataset2.open;

clientdataset2.refresh;



//  tsql:=xOpenQuery(s,frmMenu.conn);
//  cds.EmptyDataSet;
//  with tsql do
//  begin
//    try
//      First;
//      while not eof do
//      begin
//        CDS.Append;
//        CDS.FieldByName('MEJA').AsString    := fieldbyname('meja').AsString;
//        CDS.FieldByName('customer').AsString    := fieldbyname('customer').AsString;
//        CDS.FieldByName('nama').AsString    := fieldbyname('nama').AsString;
//        CDS.FieldByName('QTY').AsFloat  :=fieldbyname('qty').ASfloat;
//        CDS.FieldByName('varian').AsString    := fieldbyname('varian').AsString;
//        CDS.FieldByName('modifier').AsString    := fieldbyname('modifier').AsString;
//        CDS.FieldByName('salestype').AsString    := fieldbyname('salestype').AsString;
//        CDS.FieldByName('jam').AsString    := fieldbyname('jam').AsString;
//        CDS.FieldByName('nomor').AsString    := fieldbyname('nomor').AsString;
//        CDS.FieldByName('chek').asinteger        := 0;
//        CDS.FieldByName('nourut').asinteger        := fieldbyname('nourut').Asinteger;
//        CDS.FieldByName('isdelete').asinteger        := fieldbyname('isdelete').Asinteger;
//        CDS.FieldByName('ID').asinteger        := fieldbyname('ID').Asinteger;
//        CDS.Post;
//        Next;
//      end;
//    finally
//      Free;
//    end;
//  end;
//
//cxGrid1DBTableView1.ViewData.Collapse(false);
//cds.first;
end;

procedure TfrmCheckList.loaddata2;
var
  s:string;
  tsql:TSQLQuery;
begin
  s:='SELECT  jl_table Meja,jl_atasnama Customer, date_FORMAT(jld_tgleksekusi,"%H:%i:%s") jam,date_FORMAT(jld_tglorder,"%H:%i:%s") jam2,'
  + ' item_nama Nama,jld_qty qty,'
+ ' jld_varian Varian,jld_modifier Modifier,'
+ ' jld_salestype SalesType,'
+ ' jld_nourut nourut,jld_jl_nomor Nomor,ITEM_ID ID,cast(0 as unsigned) chek'
+ ' FROM tjual_dtl inner join titem on jld_item=item_id'
+ ' INNER JOIN tjual ON jl_nomor=jld_jl_nomor'
+ ' WHERE jld_status in (1,2) AND jld_iseksekusi=1'
+ ' and jl_tanggal >= '+ QuotD(cGetServerTime)
+ ' ORDER BY jam desc';
clientdataset1.Close;
MyQuery1.Close;
MyQuery1.SQL.Text :=s;
MyQuery1.Open;

clientdataset1.open;
clientdataset1.refresh;
//clientdataset1.first;
//  tsql:=xOpenQuery(s,frmMenu.conn);
//  cds2.EmptyDataSet;
//  with tsql do
//  begin
//    try
//      First;
//      while not eof do
//      begin
//        CDS2.Append;
//        CDS2.FieldByName('MEJA').AsString    := fieldbyname('meja').AsString;
//        CDS2.FieldByName('customer').AsString    := fieldbyname('customer').AsString;
//        CDS2.FieldByName('nama').AsString    := fieldbyname('nama').AsString;
//        CDS2.FieldByName('qty').Asfloat    := fieldbyname('qty').Asfloat;
//        CDS2.FieldByName('varian').AsString    := fieldbyname('varian').AsString;
//        CDS2.FieldByName('modifier').AsString    := fieldbyname('modifier').AsString;
//        CDS2.FieldByName('salestype').AsString    := fieldbyname('salestype').AsString;
//        CDS2.FieldByName('jam').AsString    := fieldbyname('jam').AsString;
//        CDS2.FieldByName('jam2').AsString    := fieldbyname('jam2').AsString;
//
//        CDS2.FieldByName('nomor').AsString    := fieldbyname('nomor').AsString;
//        CDS2.FieldByName('chek').asinteger        := 0;
//        CDS2.FieldByName('nourut').asinteger        := fieldbyname('nourut').Asinteger;
//        CDS2.FieldByName('ID').asinteger        := fieldbyname('ID').Asinteger;
//        CDS2.Post;
//        Next;
//      end;
//    finally
//      Free;
//    end;
//  end;
//cds2.first;

end;

procedure TfrmCheckList.cxGrid1DBTableView1Column3StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
var
  AColumn : TcxCustomGridTableItem;
begin
  AColumn := (Sender as TcxGridDBTableView).GetColumnByFieldName('CHEK');

  if (AColumn <> nil)  and (ARecord <> nil) and (AItem <> nil) and
     (cVarToFloat(ARecord.Values[AColumn.Index]) > 0) then
    AStyle := cxStyle1;
  AColumn := (Sender as TcxGridDBTableView).GetColumnByFieldName('isdelete');

  if (AColumn <> nil)  and (ARecord <> nil) and (AItem <> nil) and
     (cVarToFloat(ARecord.Values[AColumn.Index]) > 0) then
    AStyle := cxStyle3;

   AColumn := (Sender as TcxGridDBTableView).GetColumnByFieldName('salestype');

  if (AColumn <> nil)  and (ARecord <> nil) and (AItem <> nil) and
     ((ARecord.Values[AColumn.Index]) <> 'DINE IN') then
    AStyle := cxStyle4;
end;

procedure TfrmCheckList.cxGrid1DBTableView1Column3PropertiesEditValueChanged(
  Sender: TObject);
begin
    If CDS.State <> dsEdit then CDS.Edit;
    if CDS.FieldByName('chek').AsString = '0' then
      CDS.FieldByName('chek').AsString := '1'
    else
      CDS.FieldByName('chek').AsString := '0';
      CDS.post;

end;

procedure TfrmCheckList.cxButton1Click(Sender: TObject);
var
  s:String;
begin
    ClientDataSet2.First;

  while not ClientDataSet2.Eof do
  begin
    if ClientDataSet2.FieldByName('chek').AsInteger = 1 then
    begin
      s:='update tjual_dtl set jld_iseksekusi=1 where jld_jl_nomor='+ Quot(ClientDataSet2.fieldbyname('nomor').AsString)
      + ' and jld_nourut='+ IntToStr(ClientDataSet2.fieldbyname('nourut').AsInteger)+';';
      xExecQuery(s,frmMenu.conn);

    end;

       ClientDataSet2.next;
  end;
loaddata;
loaddata2;
//  cds.First;
//
//  while not cds.Eof do
//  begin
//    if cds.FieldByName('chek').AsInteger = 1 then
//    begin
//      s:='update tjual_dtl set jld_iseksekusi=1,'
//      + ' jld_tgleksekusi = '+QuotD(cGetServerTime,true)
//      + ' where jld_jl_nomor='+ Quot(CDS.fieldbyname('nomor').AsString)
//      + ' and jld_nourut='+ IntToStr(CDS.fieldbyname('nourut').AsInteger)+';';
//      xExecQuery(s,frmMenu.conn);
//      xCommit(frmmenu.conn);
////      If CDS.State <> dsEdit then CDS.Edit;
////      cds.Delete;
//    end;
//
//       cds.next;
//  end;
//
//loaddata;
//loaddata2;
end;

procedure TfrmCheckList.cxButton2Click(Sender: TObject);
var
  s:String;
begin
  ClientDataSet1.First;

  while not ClientDataSet1.Eof do
  begin
    if ClientDataSet1.FieldByName('chek').AsInteger = 1 then
    begin
      s:='update tjual_dtl set jld_iseksekusi=0 where jld_jl_nomor='+ Quot(ClientDataSet1.fieldbyname('nomor').AsString)
      + ' and jld_nourut='+ IntToStr(ClientDataSet1.fieldbyname('nourut').AsInteger)+';';
      xExecQuery(s,frmMenu.conn);

    end;

       ClientDataSet1.next;
  end;
loaddata;
loaddata2;
end;

procedure TfrmCheckList.cxGridDBColumn6PropertiesEditValueChanged(
  Sender: TObject);
begin

      If ClientDataSet1.State <> dsEdit then ClientDataSet1.Edit;
    if ClientDataSet1.FieldByName('chek').AsString = '0' then
      ClientDataSet1.FieldByName('chek').AsString := '1'
    else
      ClientDataSet1.FieldByName('chek').AsString := '0';
    ClientDataSet1.post;
//      ClientDataSet1.applyupdates(0);


end;

procedure TfrmCheckList.Timer1Timer(Sender: TObject);
var
  akoneksi: boolean;
begin
  if not chkrefresh.Checked then
  begin




      try
          loaddata;
          loaddata2;
      except
        try

           frmmenu.conn := xCreateConnection(ctMySQL,frmmenu.aHost,frmmenu.aDatabase,frmmenu.auser,frmmenu.apassword);
          except
         end;
      end;

  end;
end;

procedure TfrmCheckList.edtdetikKeyPress(Sender: TObject; var Key: Char);
var
  a:Integer;
begin
if Key=#13 then
begin
   a:=StrToInt(edtdetik.Text)*1000;
   Timer1.Interval := a;
end;


end;

procedure TfrmCheckList.edtdetikExit(Sender: TObject);
var
  a:Integer;
begin
   a:=StrToInt(edtdetik.Text)*1000;
   Timer1.Interval := a;
end;

function TfrmChecklist.getmaxnomor :string;
var
  s:string;
  tsql:TSQLQuery;
begin
result:='';
s:='select max(jl_nomor) from tjual ' ;
tsql:=xOpenQuery(s,frmmenu.conn);
with tsql do
begin
  try
    result:=fields[0].AsString;
  finally
    free;
  end;
end;

end;




procedure TfrmCheckList.cxGridDBColumn18PropertiesEditValueChanged(
  Sender: TObject);
begin
      If ClientDataSet2.State <> dsEdit then ClientDataSet2.Edit;
    if ClientDataSet2.FieldByName('chek').AsString = '0' then
      ClientDataSet2.FieldByName('chek').AsString := '1'
    else
      ClientDataSet2.FieldByName('chek').AsString := '0';
    ClientDataSet2.post;

end;

end.
