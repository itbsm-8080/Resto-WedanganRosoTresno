unit ufrmPerusahaan;

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
  TfrmPerusahaan = class(TForm)
    AdvPanel1: TAdvPanel;
    Label3: TLabel;
    edtNama: TAdvEdit;
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
    MyQuery1id: TIntegerField;
    MyQuery1nama: TStringField;
    DataSource1: TDataSource;
    edtAddress: TAdvEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtTelp: TAdvEdit;
    Label4: TLabel;
    edtfooter: TAdvEdit;
    Label5: TLabel;
    edtsc: TAdvEdit;
    Label6: TLabel;
    Label7: TLabel;
    edtTax: TAdvEdit;
    Label8: TLabel;
    Label9: TLabel;
    edtOtorisasi: TAdvEdit;
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
    procedure FormShow(Sender: TObject);

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
  frmPerusahaan: TfrmPerusahaan;

implementation
uses MAIN,uModuleConnection,uFrmbantuan,Ulib;

{$R *.dfm}

procedure TfrmPerusahaan.refreshdata;
var
  s:string;
  tsql:TSQLQuery;
begin
  FID:='';
  FLAGEDIT := FALSE;
  edtNama.SetFocus;
s:='select * from tprofile';
tsql :=xOpenQuery(s,frmMenu.conn);
with tsql do
begin
  try
    edtNama.Text := Fields[0].AsString;
    edtAddress.Text := Fields[1].AsString;
    edtTelp.Text  := Fields[2].AsString;
    edtfooter.Text := Fields[3].AsString;
    edtsc.Text := Fields[4].AsString;
    edtTax.Text :=Fields[5].AsString;
    edtOtorisasi.Text  :=Fields[6].AsString;

  finally
    free;
  end;
end;
end;
procedure TfrmPerusahaan.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmPerusahaan.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      SelectNext(ActiveControl,True,True);
end;

procedure TfrmPerusahaan.loaddata(akode:string) ;
var
  s: string;
  tsql : TSQLQuery;
begin
  s:= 'select ct_id,ct_nama from tcategory where ct_id = ' + Quot(akode) ;
tsql := xOpenQuery(s,frmMenu.conn);
with tsql do
begin
  try
    if not Eof then
    begin
      FLAGEDIT := True;
      edtNama.Text := fieldbyname('ct_nama').AsString;
      FID :=fieldbyname('ct_id').Asstring;
    end
    else
     FLAGEDIT := False;

  finally
    Free;
  end;
end;

end;


procedure TfrmPerusahaan.simpandata;
var
  s:string;
begin
if edtTax.Text = '' then
   edtTax.Text := '0';
if edtsc.Text = '' then
   edtsc.Text := '0';


  s:='update tprofile set '
    + ' pf_nama = ' + Quot(edtNama.Text) + ','
    + 'pf_alamat = '+ Quot(edtAddress.Text) + ','
    + 'pf_telp='+Quot(edtTelp.Text) + ','
    + 'pf_footer='+Quot(edtfooter.Text) + ','
    + 'pf_tax='+ edtTax.Text + ','
    + 'pf_otorisasi='+ Quot(edtOtorisasi.Text) + ','
    + 'pf_sc='+edtsc.Text + ';';


  xExecQuery(s,frmmenu.conn);

end;

procedure TfrmPerusahaan.deletedata;
var
  s:string;
begin

  s:='Delete from tcategory  '
    + ' where ct_id= ' + quot(FID) + ';' ;

  xExecQuery(s,frmmenu.conn);

end;

procedure TfrmPerusahaan.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   Release;
end;

function TfrmPerusahaan.getmaxkode:string;
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

procedure TfrmPerusahaan.cxButton1Click(Sender: TObject);
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
    close;
end;

procedure TfrmPerusahaan.cxButton8Click(Sender: TObject);
begin
Release;
end;

procedure TfrmPerusahaan.cxButton2Click(Sender: TObject);
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


procedure TfrmPerusahaan.FormShow(Sender: TObject);
begin
refreshdata;
end;

end.
