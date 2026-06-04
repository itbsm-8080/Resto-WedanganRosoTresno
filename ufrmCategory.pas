unit ufrmCategory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, ComCtrls, StdCtrls, AdvEdit,SqlExpr, Menus,
  cxLookAndFeelPainters, cxButtons,StrUtils, cxGraphics, cxLookAndFeels,
  dxSkinsCore, dxSkinsDefaultPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, MemDS, DBAccess, MyAccess, FMTBcd, DBClient,
  Provider, cxRadioGroup;

type
  TfrmCategory = class(TForm)
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
    MyQuery1id: TIntegerField;
    MyQuery1nama: TStringField;
    DataSource1: TDataSource;
    cxButton2: TcxButton;
    Label1: TLabel;
    MyQuery1Printername: TStringField;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    chk_isprint: TCheckBox;
    MyQuery1Isprint: TIntegerField;
    rbdrink: TcxRadioButton;
    rbfood: TcxRadioButton;
    Label2: TLabel;
    edtDisc: TAdvEdit;
    Label4: TLabel;
    cxGrid1DBTableView1Column4: TcxGridDBColumn;
    MyQuery1Disc: TFloatField;
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
  frmCategory: TfrmCategory;

implementation
uses MAIN,uModuleConnection,uFrmbantuan,Ulib;

{$R *.dfm}

procedure TfrmCategory.refreshdata;
begin
  FID:='';
  FLAGEDIT := FALSE;
  edtNama.Clear;
  edtdisc.text := '0';
  edtNama.SetFocus;
  chk_isprint.Checked := false;
  cxButton2.Visible:= False;
  listdata;
end;
procedure TfrmCategory.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmCategory.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      SelectNext(ActiveControl,True,True);
end;

procedure TfrmCategory.loaddata(akode:string) ;
var
  s: string;
  tsql : TSQLQuery;
  aisprinter:integer;
begin
  s:= 'select ct_id,ct_nama,ct_printername,ct_isprint from tcategory where ct_id = ' + Quot(akode) ;
tsql := xOpenQuery(s,frmMenu.conn);
with tsql do
begin
  try
    if not Eof then
    begin
      FLAGEDIT := True;
      if fieldbyname('ct_isprint').AsInteger = 1 then
         chk_isprint.Checked :=true
      else
         chk_isprint.Checked :=false;

      edtNama.Text := fieldbyname('ct_nama').AsString;
      IF fieldbyname('ct_printername').AsString ='DRINK' then
         rbdrink.Checked := true
      else IF fieldbyname('ct_printername').AsString ='FOOD' then
         rbfood.Checked := true;

      FID :=fieldbyname('ct_id').Asstring;
    end
    else
     FLAGEDIT := False;

  finally
    Free;
  end;
end;

end;


procedure TfrmCategory.simpandata;
var
  aprintname,s:string;
  aisprinter:integer;
begin
  if chk_isprint.Checked then
     aisprinter := 1
  else
    aisprinter := 0;
  if rbdrink.Checked then
     aprintname := 'DRINK'
  else if rbfood.Checked  then
     aprintname := 'FOOD';

if FLAGEDIT then
  s:='update tcategory set '
    + ' ct_nama = ' + Quot(edtNama.Text) +','
    + ' ct_printername = ' + Quot(aprintname)+','
    + ' ct_isprint = '+ inttostr(aisprinter) + ','
    + ' ct_disc ='+ edtDisc.Text
    + ' where ct_id= ' + quot(FID) + ';'
else
begin
  s :=  ' insert into tcategory '
             + ' (ct_id,ct_nama,ct_Printername,ct_isprint,ct_disc) '
             + ' values ( '
             + getmaxkode + ','
             + Quot(edtNama.Text) +','
             + Quot(aprintname)+','
             + inttostr(aisprinter)+','
             + edtdisc.Text
             + ');';
end;
  xExecQuery(s,frmmenu.conn);

end;

procedure TfrmCategory.deletedata;
var
  s:string;
begin

  s:='Delete from tcategory  '
    + ' where ct_id= ' + quot(FID) + ';' ;

  xExecQuery(s,frmmenu.conn);

end;

procedure TfrmCategory.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   Release;
end;

function TfrmCategory.getmaxkode:string;
var
  s:string;
begin
  s:='select max(ct_id) from tcategory';
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

procedure TfrmCategory.cxButton1Click(Sender: TObject);
begin
    try
      if edtnama.text ='' then
      begin
        showmessage('Category belum di isi') ;
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

procedure TfrmCategory.cxButton8Click(Sender: TObject);
begin
Release;
end;

procedure TfrmCategory.cxButton2Click(Sender: TObject);
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


procedure TfrmCategory.listdata ;
begin
MyQuery1.Close;
MyQuery1.SQL.Text :='select ct_id id ,ct_nama Nama,ct_printername PrinterName,ct_isprint IsPrint,ct_Disc Disc'
+ '  from tcategory order by ct_id';
MyQuery1.Open;


end;
procedure TfrmCategory.FormShow(Sender: TObject);
begin
refreshdata;
end;

procedure TfrmCategory.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
        if MyQuery1.Fields[3].Asinteger = 1 then
         chk_isprint.Checked :=true
      else
         chk_isprint.Checked :=false;

edtNama.Text:=MyQuery1.Fields[1].AsString;
if MyQuery1.Fields[2].AsString ='DRINK' then
   rbdrink.Checked := true
else if MyQuery1.Fields[2].AsString ='FOOD' then
   rbfood.Checked := true;
edtdisc.text :=MyQuery1.Fields[4].AsString;
FID := MyQuery1.Fields[0].AsString;
FLAGEDIT:=True;
cxButton2.Visible:= True;
end;

end.
