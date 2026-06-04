unit ufrmOtorisasi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, AdvEdit, cxButtons,
  ExtCtrls, AdvPanel;

type
  TfrmOtorisasi = class(TForm)
    AdvPanel1: TAdvPanel;
    AdvPanel2: TAdvPanel;
    cxButton1: TcxButton;
    cxtable: TcxButton;
    edtOtorisasi: TAdvEdit;
    procedure cxtableClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure edtOtorisasiKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOtorisasi: TfrmOtorisasi;

implementation
    uses MAIN;
{$R *.dfm}

procedure TfrmOtorisasi.cxtableClick(Sender: TObject);
begin
Close;
end;

procedure TfrmOtorisasi.cxButton1Click(Sender: TObject);
begin
if edtOtorisasi.Text = zotorisasi then
begin
   IDOTORISASI := True;
   Close;
end
else
begin
  ShowMessage('Kode Otorisasi Salah');
  edtOtorisasi.SetFocus;
end;


end;

procedure TfrmOtorisasi.edtOtorisasiKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key = #13 then
     begin
       SelectNext(ActiveControl,True,True);
     end;

end;

end.
