unit ufrmsalestype;

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
  Tfrmsalestype = class(TForm)
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
    chksc: TCheckBox;
    chkTax: TCheckBox;
    MyQuery1Sc: TIntegerField;
    MyQuery1Tax: TIntegerField;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGrid1DBTableView1Column4: TcxGridDBColumn;
    procedure refreshdata;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure loaddata(akode:string) ;
    procedure simpandata;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function getmaxkode:string;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton8Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure listdata ;
    procedure FormShow(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure deletedata;

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
  frmsalestype: Tfrmsalestype;

implementation
uses MAIN,uModuleConnection,uFrmbantuan,Ulib;

{$R *.dfm}

procedure Tfrmsalestype.refreshdata;
begin
  FID:='';
  FLAGEDIT := False;
  edtNama.Clear;
  edtNama.SetFocus;
  chksc.Checked := false;
  chkTax.Checked := False;
  cxButton2.Visible:= False;
  listdata;
end;
procedure Tfrmsalestype.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure Tfrmsalestype.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      SelectNext(ActiveControl,True,True);
end;

procedure Tfrmsalestype.loaddata(akode:string) ;
var
  s: string;
  tsql : TSQLQuery;
begin
  s:= 'select st_id,st_nama,st_sc,st_tax from tsalestype where st_id = ' + Quot(akode) ;
tsql := xOpenQuery(s,frmMenu.conn);
with tsql do
begin
  try
    if not Eof then
    begin
      FLAGEDIT := True;
      edtNama.Text := fieldbyname('st_nama').AsString;
      if Fields[2].AsInteger =1 then
         chksc.Checked := true
      else
         chksc.Checked := false;

      if Fields[3].AsInteger =1 then
         chktax.Checked := true
      else
         chkTax.Checked := false;

      FID :=fieldbyname('st_id').Asstring;
    end
    else
     FLAGEDIT := False;

  finally
    Free;
  end;
end;

end;


procedure Tfrmsalestype.simpandata;
var
  s:string;
  issc,istax : integer;
begin
  IF chksc.Checked THen
     issc := 1
  else
     issc := 0;

  IF chkTax.Checked THen
     istax := 1
  else
     istax := 0;


if FLAGEDIT then
  s:='update tsalestype set '
    + ' st_nama = ' + Quot(edtNama.Text)+','
    + ' st_tax = ' + inttostr(istax) + ','
    + ' st_sc =  '+ inttostr(issc)
    + ' where st_id= ' + quot(FID) + ';'
else
begin
  s :=  ' insert into tsalestype '
             + ' (st_id,st_nama,st_tax,st_sc) '
             + ' values ( '
             + getmaxkode + ','
             + Quot(edtNama.Text)+','
             + IntToStr(istax) +','
             + IntToStr(issc)
             + ');';
end;
  xExecQuery(s,frmmenu.conn);

end;


procedure Tfrmsalestype.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   Release;
end;

function Tfrmsalestype.getmaxkode:string;
var
  s:string;
begin
  s:='select max(st_id) from tsalestype';
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

procedure Tfrmsalestype.cxButton1Click(Sender: TObject);
begin
    try
      if edtnama.text ='' then
      begin
        showmessage('Sales Type belum di isi') ;
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

procedure Tfrmsalestype.cxButton8Click(Sender: TObject);
begin
Release;
end;

procedure Tfrmsalestype.cxButton2Click(Sender: TObject);
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


procedure Tfrmsalestype.listdata ;
begin
MyQuery1.Close;
MyQuery1.SQL.Text :='select st_id id ,st_nama Nama,st_sc Sc,st_tax Tax from tsalestype order by st_id';
MyQuery1.Open;


end;
procedure Tfrmsalestype.FormShow(Sender: TObject);
begin
refreshdata;
end;



procedure Tfrmsalestype.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
  edtNama.Text:=MyQuery1.Fields[1].AsString;
  if MyQuery1.Fields[2].AsInteger =1 then
     chksc.Checked := true
  else
     chksc.Checked := false;

  if MyQuery1.Fields[3].AsInteger =1 then
     chktax.Checked := true
  else
     chkTax.Checked := false;

FID := MyQuery1.Fields[0].AsString;
FLAGEDIT:=True;
cxButton2.Visible:= True;
end;

procedure Tfrmsalestype.deletedata;
var
  s:string;
begin

  s:='Delete from tsalestype  '
    + ' where st_id= ' + quot(FID) + ';' ;

  xExecQuery(s,frmmenu.conn);

end;
end.

