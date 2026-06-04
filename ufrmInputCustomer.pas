unit ufrmInputCustomer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, AdvEdit, cxButtons,
  ExtCtrls, AdvPanel;

type
  TfrmInputCustomer = class(TForm)
    AdvPanel1: TAdvPanel;
    AdvPanel2: TAdvPanel;
    cxButton6: TcxButton;
    Label4: TLabel;
    Label1: TLabel;
    edtcustomer: TAdvEdit;
    edtnohp: TAdvEdit;
    cxtable: TcxButton;
    procedure cxButton6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxtableClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInputCustomer: TfrmInputCustomer;

implementation
      uses MAIN;
{$R *.dfm}

procedure TfrmInputCustomer.cxButton6Click(Sender: TObject);
begin
  if edtcustomer.text = '' then
  begin
    Showmessage('Nama harus di isi');
    edtcustomer.SetFocus;
  end
  else
  begin
  IDCustomer := edtcustomer.Text ;
  idHP := edtnohp.Text;
  Close;
  end;
end;

procedure TfrmInputCustomer.FormShow(Sender: TObject);
begin
   edtcustomer.Text := IDCustomer;
   edtnohp.Text := idHP;
   edtcustomer.setfocus;
end;


procedure TfrmInputCustomer.cxtableClick(Sender: TObject);
begin
  xcancel := true;
  close;
end;

end.
