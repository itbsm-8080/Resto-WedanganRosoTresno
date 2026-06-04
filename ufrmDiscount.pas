unit ufrmDiscount;

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
  TfrmDiscount = class(TForm)
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
    cxButton2: TcxButton;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    Label1: TLabel;
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
    edtDisc: TAdvEdit;
    MyQuery1: TMyQuery;
    DataSource1: TDataSource;
    MyQuery1id: TIntegerField;
    MyQuery1nama: TStringField;
    MyQuery1Discount: TFloatField;
    MyQuery3id: TIntegerField;
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
  frmDiscount: TfrmDiscount;

implementation
uses MAIN,uModuleConnection,uFrmbantuan,Ulib;

{$R *.dfm}

procedure TfrmDiscount.refreshdata;
begin
  FID:='';
  FLAGEDIT := FALSE;
  edtNama.Clear;
  edtNama.SetFocus;
  edtdisc.text :='0';
  cxButton2.Visible:= False;
  listdata;

  ClientDataSet2.EmptyDataSet;

end;
procedure TfrmDiscount.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmDiscount.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      SelectNext(ActiveControl,True,True);
end;

procedure TfrmDiscount.loaddata(akode:string) ;
var
  s: string;
  tsql : TSQLQuery;
begin

  s:= 'select disc_id,disc_nama,disc_persen from tdiscount where disc_id = ' + Quot(akode) ;

tsql := xOpenQuery(s,frmMenu.conn);
with tsql do
begin
  try
    if not Eof then
    begin
      edtnama.Text :=  fields[1].AsString;
      edtDisc.Text :=  fields[2].AsString;
    end;

  finally
    Free;
  end;
end;

  s:= 'select discd_disc_id id,discd_category nama from tdiscountitem '
  + '  where discd_disc_id = ' + Quot(akode) ;

tsql := xOpenQuery(s,frmMenu.conn);
with tsql do
begin
  try
    while not Eof do
    begin
      ClientDataSet2.Append;
      ClientDataSet2.Fields[0].AsString := Fields[0].AsString;
      ClientDataSet2.Fields[1].Asstring :=Fields[1].Asstring;
      Next;
    end

  finally
    Free;
  end;
end;

end;


procedure TfrmDiscount.simpandata;
var
  s:string;
  topsi :string;
begin
if FLAGEDIT then
  s:='update tdiscount set '
    + ' disc_nama = ' + Quot(edtNama.Text)+','
    + ' disc_persen= '+ edtDisc.Text
    + ' where disc_id= ' + quot(FID) + ';'
else
begin
  FID := getmaxkode;
  s :=  ' insert into tdiscount '
             + ' (disc_id,disc_nama,disc_persen) '
             + ' values ( '
             + Quot(FID) + ','
             + Quot(edtNama.Text)+','
             + edtDisc.Text
             + ');';

end;
  xExecQuery(s,frmmenu.conn);
  s:='delete from tdiscountitem where discd_disc_id='+Quot(FID)+';';
  xExecQuery(s,frmMenu.conn);
  ClientDataSet2.First;
  topsi:='';
  while not ClientDataSet2.Eof do
  begin
    s:='insert into tdiscountitem (discd_disc_id,discd_category) values ('
    + Quot(fid) + ','
    + quot(ClientDataSet2.Fields[1].Asstring)+');';
    xExecQuery(s,frmMenu.conn);
    ClientDataSet2.Next;
  end;
end;

procedure TfrmDiscount.deletedata;
var
  s:string;
begin
  
  s:='Delete from tdiscount '
    + ' where disc_id= ' + quot(FID) + ';' ;

  xExecQuery(s,frmmenu.conn);
  s:='Delete from tdiscountitem '
    + ' where discd_disc_id= ' + quot(FID) + ';' ;

  xExecQuery(s,frmmenu.conn);

end;

procedure TfrmDiscount.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   Release;
end;

function TfrmDiscount.getmaxkode:string;
var
  s:string;
begin
  s:='select max(disc_id) from tdiscount';
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

procedure TfrmDiscount.cxButton1Click(Sender: TObject);
begin
    try
      if edtnama.text ='' then
      begin
        showmessage('nama belum di isi') ;
        exit;
      end;
      if edtdisc.text ='' then
      begin
        showmessage('Disc belum di isi') ;
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

procedure TfrmDiscount.cxButton8Click(Sender: TObject);
begin
Release;
end;

procedure TfrmDiscount.cxButton2Click(Sender: TObject);
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


procedure TfrmDiscount.listdata ;
var
  s:String;
  toptioon :string;
begin


MyQuery1.Close;
MyQuery1.SQL.Text :='select disc_id id ,disc_nama Nama,disc_persen Discount from tdiscount order by disc_id';
MyQuery1.Open;


end;
procedure TfrmDiscount.FormShow(Sender: TObject);
begin
refreshdata;
end;

procedure TfrmDiscount.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
edtNama.Text:=MyQuery1.Fields[1].AsString;
FID := MyQuery1.Fields[0].AsString;
FLAGEDIT:=True;
cxButton2.Visible:= True;
ClientDataSet2.EmptyDataSet;
loaddata(fid);
end;

procedure TfrmDiscount.cxButton4Click(Sender: TObject);
var
  s:string;
begin
   sqlbantuan := 'select ct_id,ct_nama,ct_printername from tcategory ' ;
   Application.CreateForm(Tfrmbantuan,frmbantuan);
  frmBantuan.SQLMaster := SQLbantuan;
  frmBantuan.ShowModal;
   if varglobal <> '' then
   begin
     ClientDataSet2.Append;
      ClientDataSet2.Fields[0].AsString := varglobal;
      ClientDataSet2.Fields[1].Asstring :=varglobal1;
      clientdataset2.post;
      Next;
   end;
end;

end.
