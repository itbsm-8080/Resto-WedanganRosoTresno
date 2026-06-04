unit ufrmUangMuka;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, ComCtrls, StdCtrls, AdvEdit,SqlExpr, Menus,
  cxLookAndFeelPainters, cxButtons,StrUtils, cxGraphics, cxLookAndFeels,
  dxSkinsCore, dxSkinsDefaultPainters, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, DBClient;

type
  TfrmUangMuka = class(TForm)
    AdvPanel1: TAdvPanel;
    Label2: TLabel;
    edtNomor: TAdvEdit;
    Label3: TLabel;
    edtCustomer: TAdvEdit;
    AdvPanel3: TAdvPanel;
    cxButton8: TcxButton;
    AdvPanel2: TAdvPanel;
    lbljudul: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    cxButton2: TcxButton;
    cxButton1: TcxButton;
    dtTanggal: TDateTimePicker;
    edtNilai: TAdvEdit;
    Label5: TLabel;
    Label6: TLabel;
    cbjenisbayar: TComboBox;
    procedure refreshdata;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure loaddata(akode:string) ;
    procedure simpandata;
    function getmaxkode:string;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton8Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private

    FFLAGEDIT: Boolean;
    FID: string;

    function cekKode(akode:string):boolean;


    { Private declarations }
  public

    property FLAGEDIT: Boolean read FFLAGEDIT write FFLAGEDIT;
    property ID: string read FID write FID;
    { Public declarations }
  end;

var
  frmUangMuka: TfrmUangMuka;

implementation
uses MAIN,uModuleConnection,uFrmbantuan,Ulib, DB;

{$R *.dfm}

procedure TfrmUangMuka.refreshdata;
begin
  FID:='';
  edtNomor.clear;
  edtcustomer.Clear;
  edtnomor.SetFocus;
  dttanggal.datetime := date;
end;
procedure TfrmUangMuka.FormKeyDown(Sender: TObject; var Key: Word;
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
end;

procedure TfrmUangMuka.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      SelectNext(ActiveControl,True,True);
end;

procedure TfrmUangMuka.loaddata(akode:string) ;
var
  s: string;
  tsql : TSQLQuery;
begin
  s:='select * from tuangmuka where um_nomor='+Quot(edtNomor.Text)  ;
  tsql := xOpenQuery(s,frmMenu.conn) ;
  with tsql do
  begin
    try
      if not eof then
      begin
        dtTanggal.Date := fieldbyname('um_tanggal').AsDateTime;
        edtCustomer.Text := fieldbyname('um_customer').AsString;
        edtNilai.Text := fieldbyname('um_nilai').AsString;
        cbjenisbayar.ItemIndex := cbjenisbayar.Items.IndexOf(fieldbyname('um_jenisbayar').AsString);
        FLAGEDIT:=True;
      end;
    finally
      free;
    end;
  end;

end;


procedure TfrmUangMuka.simpandata;
var
  s:string;
  isaktif :integer;
begin
  if edtNilai.Text ='' then
     edtNilai.Text := '0';
  if FLAGEDIT then
  begin
    s:='update tuangmuka set '
    + ' um_tanggal ='+ quotd(dtTanggal.Date)+','
    + ' um_customer = '+ quot(edtCustomer.Text) +','
    + ' um_nilai = '+ StringReplace(edtNilai.Text,',','',[rfReplaceAll])+','
    + ' um_jenisbayar = '+ Quot(cbjenisbayar.Text)
    + ' where um_nomor='+Quot(edtNomor.Text)+';';

  end
  else
  begin
      edtNomor.Text := getmaxkode;
      s:='insert into tuangmuka (um_nomor,um_tanggal,um_customer,um_nilai,um_jenisbayar,date_create,user_create)'
      + ' values ('+Quot(edtNomor.Text) +','
      + QuotD(dtTanggal.Date)+','
      + Quot(edtCustomer.Text) +','
      + StringReplace(edtNilai.Text,',','',[rfReplaceAll])+','
      + Quot(cbjenisbayar.Text) +','
      + QuotD(cGetServerTime,True) + ','
      + Quot(frmMenu.KDUSER)
      +');';
  end;
  xExecQuery(s,frmMenu.conn);

end;


function TfrmUangMuka.getmaxkode:string;
var
  s:string;
begin
    s:='select max(right(um_nomor,4)) from tuangmuka where um_nomor like ' + quot('UM.'+FormatDateTime('yymm',cGetServerTime)+'.%');

  with xOpenQuery(s,frmMenu.conn) do
  begin
    try
      if Fields[0].AsString = '' then
         result:= 'UM.'+FormatDateTime('yymm',cGetServerTime)+'.'+RightStr(IntToStr(10000+1),4)
      else
         result:= 'UM.'+FormatDateTime('yymm',cGetServerTime)+'.'+RightStr(IntToStr(10000+fields[0].AsInteger+1),4);

    finally
      free;
    end;
  end;
end;

procedure TfrmUangMuka.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   Release;
end;

procedure TfrmUangMuka.cxButton1Click(Sender: TObject);
begin
    try
      if edtCustomer.Text = '' then
      begin
         MessageDlg('customer belum di isi',mtWarning, [mbOK],0);
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

procedure TfrmUangMuka.cxButton8Click(Sender: TObject);
begin
Release;
end;

procedure TfrmUangMuka.cxButton2Click(Sender: TObject);
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

function TfrmUangMuka.cekKode(akode:string):boolean;
var
  s:string;
  tsql:tsqlquery;
begin
  Result := False;
  s:='select * from trekening where rek_kode='+ quot(akode);
  tsql := xopenquery(s,frmMenu.conn);
  with tsql do
  begin
    try
      if not eof then
         Result := True;
    finally
      free;
    end;
  end;
end;


procedure TfrmUangMuka.FormShow(Sender: TObject);
begin
refreshdata;
end;

end.
