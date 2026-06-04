unit uFrmMeja;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AdvEdit, Grids, BaseGrid, AdvGrid, DBAdvGrd, ExtCtrls,
  AdvPanel, FMTBcd, DB, DBClient, Provider, SqlExpr, AdvCombo, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Menus, cxButtons,cxCurrencyEdit, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue, cxPC, cxContainer, cxLabel;

type
  TfrmMeja = class(TForm)
    AdvPanel4: TAdvPanel;
    SQLQuery1: TSQLQuery;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    ds2: TDataSource;
    cxStyleRepository3: TcxStyleRepository;
    cxStyle3: TcxStyle;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle2: TcxStyle;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    B1: TcxButton;
    B2: TcxButton;
    B3: TcxButton;
    B4: TcxButton;
    B5: TcxButton;
    B6: TcxButton;
    AdvPanel1: TAdvPanel;
    cxLabel1: TcxLabel;
    AdvPanel2: TAdvPanel;
    A1: TcxButton;
    A2: TcxButton;
    A3: TcxButton;
    A4: TcxButton;
    AdvPanel5: TAdvPanel;
    B9: TcxButton;
    B8: TcxButton;
    B7: TcxButton;
    A5: TcxButton;
    A9: TcxButton;
    A10: TcxButton;
    A8: TcxButton;
    A7: TcxButton;
    A6: TcxButton;
    A11: TcxButton;
    A12: TcxButton;
    B10: TcxButton;
    AdvPanel6: TAdvPanel;
    cxLabel2: TcxLabel;
    P1: TcxButton;
    P2: TcxButton;
    P5: TcxButton;
    AdvPanel7: TAdvPanel;
    cxLabel3: TcxLabel;
    AdvPanel3: TAdvPanel;
    cxButton8: TcxButton;
    P3: TcxButton;
    P4: TcxButton;
    AdvPanel8: TAdvPanel;
    AdvPanel9: TAdvPanel;
    M1: TcxButton;
    M2: TcxButton;
    AdvPanel10: TAdvPanel;
    AdvPanel11: TAdvPanel;
    AdvPanel12: TAdvPanel;
    AdvPanel13: TAdvPanel;
    AdvPanel14: TAdvPanel;
    C6: TcxButton;
    C7: TcxButton;
    C8: TcxButton;
    C9: TcxButton;
    C10: TcxButton;
    C5: TcxButton;
    AdvPanel15: TAdvPanel;
    cxLabel4: TcxLabel;
    AdvPanel16: TAdvPanel;
    cxLabel5: TcxLabel;
    AdvPanel17: TAdvPanel;
    cxLabel6: TcxLabel;
    AdvPanel18: TAdvPanel;
    AdvPanel19: TAdvPanel;
    S1: TcxButton;
    S3: TcxButton;
    S2: TcxButton;
    S4: TcxButton;
    S5: TcxButton;
    AdvPanel20: TAdvPanel;
    C3: TcxButton;
    C4: TcxButton;
    C1: TcxButton;
    C2: TcxButton;
    cxLabel7: TcxLabel;
    C11: TcxButton;
    C12: TcxButton;
    C13: TcxButton;
    C14: TcxButton;
    C15: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure B1Click(Sender: TObject);
    procedure cxButton8Click(Sender: TObject);
    procedure nonaktifkan(akode:string);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure AdvPanel1Click(Sender: TObject);
  private
    { Private declarations }
     Fanamaform: string;
    FCDSMaster: TClientDataset;
  public
    SQLMaster : string;
    a:string;
     property anamaform: string read Fanamaform write Fanamaform;
    property CDSMaster: TClientDataset read FCDSMaster write FCDSMaster;
    { Public declarations }
  end;

var
  frmMeja: TfrmMeja;

implementation
  uses MAIN,ulib,ufrmPos,uModuleConnection;
{$R *.dfm}

procedure TfrmMeja.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=caFree;
end;



procedure TfrmMeja.B1Click(Sender: TObject);
begin
  IDMEJA  := TcxButton(sender).Caption;

  Close;
end;
//
procedure TfrmMeja.cxButton8Click(Sender: TObject);
begin
Close;
end;

procedure TfrmMeja.nonaktifkan(akode:string);
begin
    TcxButton(FindComponent(akode)).Enabled :=False;
end;

procedure TfrmMeja.FormShow(Sender: TObject);
var
  s:string;
  tsql:TSQLQuery;

begin


  s:='select distinct jl_table from tjual where jl_status=1 and jl_table <> ""';
  tsql:=xOpenQuery(s,frmMenu.conn);
  with tsql do
  begin
    try
      First;
      while not Eof do
      begin
          a:=fields[0].AsString;
          nonaktifkan(a);
        Next;
      end;
    finally
      free;
    end;
  end;

end;

procedure TfrmMeja.Button1Click(Sender: TObject);


begin
//for i := 0 to ComponentCount-1 do
//   if (Components[i] is TComponent) and not (Components[i] is TControl) then
//    showmessage(Components[i].Name);

end;


procedure TfrmMeja.AdvPanel1Click(Sender: TObject);
var
  i:integer;
  s:string;
begin
for i := 0 to self.ComponentCount-1 do
begin
   if (self.Components[i] is TControl) then
   begin
     s:='insert into tmeja (nama,kiri,atas,height,width) values ('
      + QuotedStr(self.Components[i].Name) + ','
      + IntToStr(TcxButton(FindComponent(self.Components[i].Name)).Left) +','
      + IntToStr(TcxButton(FindComponent(self.Components[i].Name)).top)+','
      + inttostr(TcxButton(FindComponent(self.Components[i].Name)).height) +','
      + inttostr(TcxButton(FindComponent(self.Components[i].Name)).width) +');';
    xExecQuery(s,frmmenu.conn);
   end;
end;
end;

end.
