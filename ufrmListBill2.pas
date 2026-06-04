unit ufrmListBill2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxContainer, cxLabel, ExtCtrls, AdvPanel,
  MemDS, DBAccess, MyAccess, Menus, cxLookAndFeelPainters, StdCtrls,
  cxButtons,sqlexpr, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TfrmListBill2 = class(TForm)
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
    dtTanggal: TcxDateEdit;
    cxrefresh: TcxButton;
    MyQuery1nomor: TStringField;
    MyQuery1nama: TStringField;
    MyQuery1tim: TDateTimeField;
    MyQuery1Meja: TStringField;
    procedure FormShow(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure cxrefreshClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListBill2: TfrmListBill2;

implementation
    uses MAIN,uModuleConnection, ufrmotorisasi,ulib,ureport;
{$R *.dfm}

procedure TfrmListBill2.FormShow(Sender: TObject);
begin
dttanggal.Date := date;
MyQuery1.Close;
MyQuery1.SQL.Text :='select jl_nomor nomor,jl_atasnama nama, jl_tanggal tim ,'
+ ' jl_table Meja,jl_nohp from tjual'
+  ' where jl_status=2'
+ ' and jl_tanggal between '+ QuotD(dttanggal.date) +' and ' + quotd(dttanggal.date+1);
MyQuery1.Open;

end;

procedure TfrmListBill2.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
   IDNOMOR := MyQuery1.Fields[0].AsString;
   xCancel := false;
   close;
end;

procedure TfrmListBill2.cxrefreshClick(Sender: TObject);
begin
  MyQuery1.Close;
MyQuery1.SQL.Text :='select jl_nomor nomor,jl_atasnama nama, jl_tanggal tim ,'
+ ' jl_table Meja,jl_nohp from tjual'
+  ' where jl_status=2'
+ ' and jl_tanggal between '+ QuotD(dttanggal.date) +' and ' + quotd(dttanggal.date+1);
MyQuery1.Open;

end;



end.
