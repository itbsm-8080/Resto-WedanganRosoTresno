unit ufrmListProduct;

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
  TfrmListProduct = class(TForm)
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
    AdvPanel2: TAdvPanel;
    cxStyleRepository4: TcxStyleRepository;
    cxStyle4: TcxStyle;
    MyQuery1Kode: TIntegerField;
    MyQuery1nama: TStringField;
    MyQuery1Harga: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListProduct: TfrmListProduct;

implementation
    uses MAIN,uModuleConnection, ufrmotorisasi,ulib,ureport;
{$R *.dfm}

procedure TfrmListProduct.FormShow(Sender: TObject);
var
  s:String;
begin

            s:='select item_id Kode,item_nama nama,  '
        + ' item_harga Harga from titem';
MyQuery1.Close;
MyQuery1.SQL.Text :=s;
MyQuery1.Open;

end;

procedure TfrmListProduct.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
   IDSKU := MyQuery1.Fields[0].AsInteger;
   xcancel := false;
   close;
end;

end.
