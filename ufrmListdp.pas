unit ufrmListDP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxContainer, cxLabel, ExtCtrls, AdvPanel,
  MemDS, DBAccess, MyAccess, Menus, cxLookAndFeelPainters, StdCtrls,
  cxButtons,sqlexpr;

type
  TfrmListDP = class(TForm)
    AdvPanel1: TAdvPanel;
    cxLabel1: TcxLabel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxStyleRepository3: TcxStyleRepository;
    cxStyle3: TcxStyle;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle2: TcxStyle;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    MyQuery1: TMyQuery;
    DataSource1: TDataSource;
    cxGrid1DBTableView1Column4: TcxGridDBColumn;
    cxStyleRepository4: TcxStyleRepository;
    cxStyle4: TcxStyle;
    MyQuery1nomor: TStringField;
    MyQuery1nama: TStringField;
    MyQuery1Nilai: TFloatField;
    MyQuery1jenisbayar: TStringField;
    procedure FormShow(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListDP: TfrmListDP;

implementation
    uses MAIN,uModuleConnection, ufrmotorisasi,ulib,ureport;
{$R *.dfm}

procedure TfrmListDP.FormShow(Sender: TObject);
var
  s:String;
begin

    s:='select UM_nomor nomor,um_customer nama, um_nilai Nilai,um_jenisbayar Jenisbayar'
+ ' from tuangmuka '
+  ' where um_isrealisasi=0';
MyQuery1.Close;
MyQuery1.SQL.Text :=s;
MyQuery1.Open;

end;

procedure TfrmListDP.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
   IDNOMORDP := MyQuery1.Fields[0].AsString;
   
   close;
end;

end.
