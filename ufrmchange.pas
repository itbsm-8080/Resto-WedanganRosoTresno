unit ufrmchange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  AdvPanel, cxControls, cxContainer, cxEdit, cxLabel;

type
  TfrmChange = class(TForm)
    AdvPanel1: TAdvPanel;
    cxnew: TcxButton;
    AdvPanel2: TAdvPanel;
    Label4: TLabel;
    AdvPanel3: TAdvPanel;
    Label1: TcxLabel;
    procedure cxnewClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmChange: TfrmChange;

implementation
uses Main;
{$R *.dfm}

procedure TfrmChange.cxnewClick(Sender: TObject);
begin
close;
end;

procedure TfrmChange.FormShow(Sender: TObject);
begin
label1.Caption:=formatfloat('###,###',xkembali);
end;

end.
