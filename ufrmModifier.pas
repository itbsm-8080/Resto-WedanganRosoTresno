unit ufrmModifier;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, ComCtrls, StdCtrls, AdvEdit,SqlExpr, Menus,
  cxLookAndFeelPainters, cxButtons,StrUtils, cxGraphics, cxLookAndFeels,
  dxSkinsCore, dxSkinsDefaultPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, MemDS, DBAccess, MyAccess, FMTBcd, DBClient,
  Provider;

type
  TfrmModifier = class(TForm)
    AdvPanel1: TAdvPanel;
    Label3: TLabel;
    edtNama: TAdvEdit;
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
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1Column1: TcxGridDBColumn;
    cxGrid2DBTableView1Column2: TcxGridDBColumn;
    Label1: TLabel;
    MyQuery2: TMyQuery;
    DataSource2: TDataSource;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    MyQuery2nama: TStringField;
    MyQuery2price: TFloatField;
    cxButton3: TcxButton;
    MyQuery1id: TIntegerField;
    MyQuery1nama: TStringField;
    MyQuery1Opsi: TStringField;
    cxButton4: TcxButton;
    cxGrid3: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    Label2: TLabel;
    MyQuery3: TMyQuery;
    DataSetProvider2: TDataSetProvider;
    ClientDataSet2: TClientDataSet;
    DataSource3: TDataSource;
    MyQuery3mdi_item: TStringField;
    MyQuery3nama: TStringField;
    procedure refreshdata;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure loaddata(akode:string) ;
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
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);

  private
    FFLAGEDIT: Boolean;
    FID: string;


    { Private declarations }
  public
    property FLAGEDIT: Boolean read FFLAGEDIT write FFLAGEDIT;
    property ID: string read FID write FID;
    { Public declarations }
  end;

var
  frmModifier: TfrmModifier;

implementation
uses MAIN,uModuleConnection,uFrmbantuan,Ulib;

{$R *.dfm}

procedure TfrmModifier.refreshdata;
begin
  FID:='';
  FLAGEDIT := FALSE;
  edtNama.Clear;
  edtNama.SetFocus;
  cxButton2.Visible:= False;
  listdata;
  ClientDataSet1.EmptyDataSet;
  ClientDataSet2.EmptyDataSet;

end;
procedure TfrmModifier.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmModifier.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      SelectNext(ActiveControl,True,True);
end;

procedure TfrmModifier.loaddata(akode:string) ;
var
  s: string;
  tsql : TSQLQuery;
begin

  s:= 'select mdo_md_id,mdo_nama,mdo_price from tmodifieroption where mdo_md_id = ' + Quot(akode) ;

tsql := xOpenQuery(s,frmMenu.conn);
with tsql do
begin
  try
    while not Eof do
    begin
      ClientDataSet1.Append;
      ClientDataSet1.Fields[0].AsString := Fields[1].AsString;
      ClientDataSet1.Fields[1].Asfloat :=Fields[2].Asfloat;
      Next;
    end

  finally
    Free;
  end;
end;

  s:= 'select mdi_md_id,mdi_item,item_nama from tmodifieritem inner join titem on item_id=mdi_item'
  + '  where mdi_md_id = ' + Quot(akode) ;

tsql := xOpenQuery(s,frmMenu.conn);
with tsql do
begin
  try
    while not Eof do
    begin
      ClientDataSet2.Append;
      ClientDataSet2.Fields[0].AsString := Fields[1].AsString;
      ClientDataSet2.Fields[1].Asstring :=Fields[2].Asstring;
      Next;
    end

  finally
    Free;
  end;
end;

end;


procedure TfrmModifier.simpandata;
var
  s:string;
  topsi :string;
begin
if FLAGEDIT then
  s:='update tmodifier set '
    + ' md_nama = ' + Quot(edtNama.Text)
    + ' where md_id= ' + quot(FID) + ';'
else
begin
  FID := getmaxkode;
  s :=  ' insert into tmodifier '
             + ' (md_id,md_nama) '
             + ' values ( '
             + Quot(FID) + ','
             + Quot(edtNama.Text)
             + ');';

end;
  xExecQuery(s,frmmenu.conn);
  s:='delete from tmodifieroption where mdo_md_id='+Quot(FID)+';';
  xExecQuery(s,frmMenu.conn);
  ClientDataSet1.First;
  topsi:='';
  while not ClientDataSet1.Eof do
  begin
    s:='insert into tmodifieroption (mdo_md_id,mdo_nama,mdo_price) values ('
    + Quot(fid) + ','
    + Quot(ClientDataSet1.Fields[0].AsString)+ ','
    + FloatToStr(ClientDataSet1.Fields[1].AsFloat)+');';
    xExecQuery(s,frmMenu.conn);
    topsi := topsi + ClientDataSet1.Fields[0].AsString +',';
    ClientDataSet1.Next;
  end;
  s:='delete from tmodifieritem where mdi_md_id='+Quot(FID)+';';
  xExecQuery(s,frmMenu.conn);
  ClientDataSet2.first;
    while not ClientDataSet2.Eof do
  begin
    s:='insert into tmodifieritem (mdi_md_id,mdi_item) values ('
    + Quot(fid) + ','
    + Quot(ClientDataSet2.Fields[0].AsString)
    +');';
    xExecQuery(s,frmMenu.conn);

    ClientDataSet2.Next;
  end;


  s:='update tmodifier set md_option ='+ quot(LeftStr(topsi,Length(topsi)-1) )
  + ' where md_id='+Quot(fid)+';';
    xExecQuery(s,frmMenu.conn);
end;

procedure TfrmModifier.deletedata;
var
  s:string;
begin
  
  s:='Delete from tmodifieroption  '
    + ' where mdo_md_id= ' + quot(FID) + ';' ;

  xExecQuery(s,frmmenu.conn);
  s:='Delete from tmodifieritem  '
    + ' where mdi_md_id= ' + quot(FID) + ';' ;

  xExecQuery(s,frmmenu.conn);

  s:='Delete from tmodifier  '
    + ' where md_id= ' + quot(FID) + ';' ;

  xExecQuery(s,frmmenu.conn);

end;

procedure TfrmModifier.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   Release;
end;

function TfrmModifier.getmaxkode:string;
var
  s:string;
begin
  s:='select max(md_id) from tmodifier';
  with xOpenQuery(s,frmMenu.conn) do
  begin
    try
      if Fields[0].AsString = '' then
         result:= '1'
      else
         result:= IntToStr(fields[0].AsInteger+1);

    finally
      free;
    end;
  end;
end;

procedure TfrmModifier.cxButton1Click(Sender: TObject);
begin
    try
      if edtnama.text ='' then
      begin
        showmessage('Modifier belum di isi') ;
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

procedure TfrmModifier.cxButton8Click(Sender: TObject);
begin
Release;
end;

procedure TfrmModifier.cxButton2Click(Sender: TObject);
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


procedure TfrmModifier.listdata ;
var
  s:String;
  toptioon :string;
begin


MyQuery1.Close;
MyQuery1.SQL.Text :='select md_id id ,md_nama Nama,md_option opsi from tmodifier order by md_id';
MyQuery1.Open;


end;
procedure TfrmModifier.FormShow(Sender: TObject);
begin
refreshdata;
end;

procedure TfrmModifier.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
edtNama.Text:=MyQuery1.Fields[1].AsString;
FID := MyQuery1.Fields[0].AsString;
FLAGEDIT:=True;
cxButton2.Visible:= True;
ClientDataSet1.EmptyDataSet;
ClientDataSet2.EmptyDataSet;
loaddata(fid);
end;

procedure TfrmModifier.cxButton3Click(Sender: TObject);
begin
      ClientDataSet1.Open;
 If ClientDataSet1.State <> dsEdit then ClientDataSet1.Edit;

    ClientDataSet1.Append;
end;

procedure TfrmModifier.cxButton4Click(Sender: TObject);
var
  s:string;
begin
   sqlbantuan := 'select item_id,item_nama from titem ' ;
   Application.CreateForm(Tfrmbantuan,frmbantuan);
  frmBantuan.SQLMaster := SQLbantuan;
  frmBantuan.ShowModal;
   if varglobal <> '' then
   begin
     ClientDataSet2.Append;
      ClientDataSet2.Fields[0].AsString := varglobal;
      ClientDataSet2.Fields[1].Asstring :=varglobal1;
      Next;
   end;
end;

end.
