unit ufrmLapStok;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmCxBrowse, Menus, cxLookAndFeelPainters, cxStyles,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, FMTBcd, Provider, SqlExpr, ImgList,
  ComCtrls, StdCtrls, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxButtons, ExtCtrls, AdvPanel, DBClient, cxLookAndFeels, AdvCombo;

type
  TfrmLapStok = class(TfrmCxBrowse)
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    DataSource1: TDataSource;
  procedure btnRefreshClick(Sender: TObject);
  procedure FormShow(Sender: TObject);
  procedure cxButton6Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
  private
    { Private declarations }
    conn2 : TSQLConnection;
    aserveraktif,adatabaseaktif,acabangaktif :string;
  public
    { Public declarations }
  end;

var
  frmLapStok: TfrmLapStok;

implementation
   uses Ulib, MAIN, uModuleConnection,uReport ;
{$R *.dfm}

procedure TfrmLapStok.btnRefreshClick(Sender: TObject);
var
  sql:string;
begin

  Self.SQLMaster :=  'SELECT ID,NAMA,CATEGORY,CAST(awal AS SIGNED) Awal,CAST(Stok_in AS SIGNED) Stok_in,CAST(Retur AS SIGNED) Retur,CAST(Sales AS SIGNED) Sales,'
+ ' CAST(Akhir AS SIGNED) Akhir FROM (SELECT item_id ID,item_nama Nama, item_category Category,'
+ ' (SELECT ifnull(SUM(mst_stok_in-mst_stok_out),0) FROM tmasterstok WHERE mst_item_id=item_id AND mst_tanggal < '+QuotD(startdate.date)+') Awal,'
+ ' (SELECT ifnull(SUM(mst_stok_in),0) FROM tmasterstok WHERE mst_item_id=item_id AND mst_tanggal BETWEEN '+QuotD(startdate.date)+' AND '+QuotD(enddate.date)+' AND mst_noreferensi LIKE '+quot('%STI%')+') STOK_IN,'
+ ' (SELECT ifnull(SUM(mst_stok_out),0) FROM tmasterstok WHERE mst_item_id=item_id AND mst_tanggal BETWEEN '+QuotD(startdate.date)+' AND '+QuotD(enddate.date)+'  AND mst_noreferensi LIKE '+quot('%RET%')+') RETUR,'
+ ' (SELECT ifnull(SUM(mst_stok_OUT),0) FROM tmasterstok WHERE mst_item_id=item_id AND mst_tanggal BETWEEN '+QuotD(startdate.date)+' AND '+QuotD(enddate.date)+'  AND mst_noreferensi LIKE '+quot('%ORD%')+')  SALES,'
+ ' (SELECT ifnull(SUM(mst_stok_in-mst_stok_out),0) FROM tmasterstok WHERE mst_item_id=item_id AND mst_tanggal <= '+QuotD(enddate.date)+') Akhir'
+ '  FROM titem where item_isstock=1) FINAL ';

   inherited;
    cxGrdMaster.ApplyBestFit();
    cxGrdMaster.Columns[0].Width :=100;
    cxGrdMaster.Columns[1].Width :=170;
    cxGrdMaster.Columns[2].Width :=100;
    cxGrdMaster.Columns[3].Width :=100;
    cxGrdMaster.Columns[4].Width :=100;
    cxGrdMaster.Columns[5].Width :=100;
    cxGrdMaster.Columns[6].Width :=100;
    cxGrdMaster.Columns[7].Width :=100;
//   frmmenu.conn := xCreateConnection(ctMySQL,aserveraktif,adatabaseaktif,'root','password');
end;

procedure TfrmLapStok.FormShow(Sender: TObject);
var
  s:String;
  tsql:tsqlquery;
begin
    ShowWindowAsync(Handle, SW_MAXIMIZE);
  inherited;
  StartDate.DateTime := date;
  EndDate.DateTime := Date+1;
  s:='select pab_nama,pab_server,pab_database from tpabrik inner join tcabang on cbg_kode=pab_kode where cbg_aktif=1';
  tsql:= xopenquery(s,frmmenu.conn);
  with tsql do
  begin
    try
    acabangaktif :=fields[0].asstring;
    aserveraktif :=fields[1].asstring;
    adatabaseaktif :=fields[2].asstring;



    finally
      free;
    end;
  end;

  btnRefreshClick(Self);
end;

procedure TfrmLapStok.cxButton6Click(Sender: TObject);
begin
  inherited;
  refreshdata;
end;

procedure TfrmLapStok.cxButton3Click(Sender: TObject);
var
  s: string ;
  ftsreport : TTSReport;
begin

  ftsreport := TTSReport.Create(nil);
  try
    ftsreport.Nama := 'lapstok';
       zprinter := frmMenu.aPRINTER;

          s:= 'SELECT ID,NAMA,CATEGORY,CAST(awal AS SIGNED) Awal,CAST(Stok_in AS SIGNED) Stok_in,CAST(Sales AS SIGNED) Sales,'
+ ' CAST(Akhir AS SIGNED) Akhir FROM (SELECT item_id ID,item_nama Nama, item_category Category,'
+ ' (SELECT ifnull(SUM(mst_stok_in-mst_stok_out),0) FROM tmasterstok WHERE mst_item_id=item_id AND mst_tanggal < '+QuotD(startdate.date)+') Awal,'
+ ' (SELECT ifnull(SUM(mst_stok_in),0) FROM tmasterstok WHERE mst_item_id=item_id AND mst_tanggal BETWEEN '+QuotD(startdate.date)+' AND '+QuotD(enddate.date)+' AND mst_noreferensi LIKE '+quot('%STI%')+') STOK_IN,'
+ ' (SELECT ifnull(SUM(mst_stok_OUT),0) FROM tmasterstok WHERE mst_item_id=item_id AND mst_tanggal BETWEEN '+QuotD(startdate.date)+' AND '+QuotD(enddate.date)+'  AND mst_noreferensi LIKE '+quot('%ORD%')+')  SALES,'
+ ' (SELECT ifnull(SUM(mst_stok_in-mst_stok_out),0) FROM tmasterstok WHERE mst_item_id=item_id AND mst_tanggal <= '+QuotD(enddate.date)+') Akhir'
+ '  FROM titem where item_isstock=1) FINAL ';
    ftsreport.AddSQL(s);

    ftsreport.ShowReport;
  finally
     ftsreport.Free;
  end;
end;

end.
