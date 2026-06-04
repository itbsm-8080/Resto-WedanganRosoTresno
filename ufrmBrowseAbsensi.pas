unit ufrmBrowseAbsensi;

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
  cxButtons, ExtCtrls, AdvPanel, DBClient, cxLookAndFeels, dxSkinDarkRoom,
  dxSkinFoggy, dxSkinSeven, dxSkinSharp, AdvMemo;

type
  TfrmBrowseAbsensi = class(TfrmCxBrowse)
    cxButton10: TcxButton;
  procedure btnRefreshClick(Sender: TObject);
  procedure FormShow(Sender: TObject);
  procedure cxButton6Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBrowseAbsensi: TfrmBrowseAbsensi;

implementation
   uses ufrmsetoran,Ulib, MAIN, uModuleConnection,ureport;
{$R *.dfm}

procedure TfrmBrowseAbsensi.btnRefreshClick(Sender: TObject);
begin

  Self.SQLMaster := 'SELECT distinct a.kar_nik Nik,kar_nama Nama,DATE_FORMAT(tanggal,"%Y-%m-%d") Tanggal,'
+ ' (SELECT DATE_FORMAT(tanggal,"%H:%i:%s") FROM zabsensitampung WHERE kar_nik=a.kar_nik AND DATE_FORMAT(tanggal,"%Y-%m-%d")=DATE_FORMAT(a.tanggal,"%Y-%m-%d") AND status_absen=1 ORDER BY tanggal LIMIT 1) Masuk,'
+ ' (SELECT DATE_FORMAT(tanggal,"%H:%i:%s") FROM zabsensitampung WHERE kar_nik=a.kar_nik AND DATE_FORMAT(tanggal,"%Y-%m-%d")=DATE_FORMAT(a.tanggal,"%Y-%m-%d") AND status_absen=2 ORDER BY tanggal desc LIMIT 1) Keluar'
+ ' FROM zabsensitampung a INNER JOIN zkaryawan b ON a.kar_nik=b.kar_nik'
+ ' WHERE kar_kd_unit=16'
+ ' and tanggal between ' + QuotD(startdate.DateTime) + ' and ' + QuotD(enddate.DateTime)
+ ' order by tanggal ';
   inherited;
    cxGrdMaster.ApplyBestFit();
    cxGrdMaster.Columns[0].Width :=100;
    cxGrdMaster.Columns[1].Width :=200;
    cxGrdMaster.Columns[2].Width :=100;
    cxGrdMaster.Columns[3].Width :=100;
    cxGrdMaster.Columns[4].Width :=100;


end;

procedure TfrmBrowseAbsensi.FormShow(Sender: TObject);
begin
    ShowWindowAsync(Handle, SW_MAXIMIZE);
  inherited;
  btnRefreshClick(Self);
end;

procedure TfrmBrowseAbsensi.cxButton6Click(Sender: TObject);
begin
  inherited;
  refreshdata;
end;

procedure TfrmBrowseAbsensi.ComboBox1Change(Sender: TObject);
begin
  inherited;
  btnRefreshClick(Self);
end;

end.
