unit ufrmBrowseSalesbyInv;

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
  cxButtons, ExtCtrls, AdvPanel, DBClient, cxLookAndFeels;

type
  TfrmBrowseSalesByInv = class(TfrmCxBrowse)
  procedure btnRefreshClick(Sender: TObject);
  procedure FormShow(Sender: TObject);
  procedure cxButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBrowseSalesByInv: TfrmBrowseSalesByInv;

implementation
   uses Ulib, MAIN, uModuleConnection;
{$R *.dfm}

procedure TfrmBrowseSalesByInv.btnRefreshClick(Sender: TObject);
begin
  Self.SQLMaster := 'SELECT jl_nomor Nomor,jl_tanggal Tanggal,jl_table Meja,jl_atasnama Customer,jl_promo Promo,TIMEDIFF(jl_tglbayar,jl_tanggal) Duration'
                  + ' ,jl_amount+jl_sc+jl_tax  Amount,'
                  + ' jl_sc SeviceCharge,jl_tax Tax,jl_discount Discount,jl_cash Cash,jl_card Card,jl_bank EDC,'
                  + ' jl_OtherValue Other_Value,jl_other Other,jl_dp DP,jl_nomordp NomorDP,jl_jenisCustomer JenisCustomer FROM tjual WHERE jl_status=2'
                  + ' and jl_tanggal between ' + QuotD(startdate.DateTime) + ' and ' + QuotD(enddate.DateTime) ;


  Self.SQLDetail := 'SELECT jld_jl_nomor Nomor,item_nama Nama,jld_varian Varian,jld_salestype Salestype,'
                  + ' jld_qty Qty,jld_price Price,jld_Disc Disc,(100-jld_disc)/100*jld_price NetPrice,jld_user Served'
                  + ' FROM tjual_dtl INNER JOIN titem ON item_id=jld_item AND jld_isdelete=0 AND jld_status=2'
                  + ' INNER JOIN tjual ON jl_nomor=jld_jl_nomor'
                  + ' where jl_tanggal between ' + QuotD(startdate.DateTime) + ' and ' + QuotD(enddate.DateTime)
                  + ' ORDER BY jld_jl_nomor';
 Self.MasterKeyField := 'Nomor';
   inherited;
    cxGrdMaster.ApplyBestFit();
    cxGrdMaster.Columns[0].Width :=100;
    cxGrdMaster.Columns[1].Width :=120;
    cxGrdMaster.Columns[2].Width :=60;
    cxGrdMaster.Columns[3].Width :=150;
    cxGrdMaster.Columns[4].Width :=80;
    cxGrdMaster.Columns[5].Width :=80;
    cxGrdMaster.Columns[6].Width :=80;
    cxGrdMaster.Columns[7].Width :=80;
    cxGrdMaster.Columns[8].Width :=80;
    cxGrdMaster.Columns[9].Width :=80;
    cxGrdMaster.Columns[10].Width :=80;
    cxGrdMaster.Columns[11].Width :=80;
    cxGrdMaster.Columns[12].Width :=80;
    cxGrdMaster.Columns[13].Width :=80;


     cxGrdMaster.Columns[13].Summary.FooterKind:=skSum;
    cxGrdMaster.Columns[13].Summary.FooterFormat:='###,###,###,###';
     cxGrdMaster.Columns[6].Summary.FooterKind:=skSum;
    cxGrdMaster.Columns[6].Summary.FooterFormat:='###,###,###,###';
     cxGrdMaster.Columns[7].Summary.FooterKind:=skSum;
    cxGrdMaster.Columns[7].Summary.FooterFormat:='###,###,###,###';
     cxGrdMaster.Columns[8].Summary.FooterKind:=skSum;
    cxGrdMaster.Columns[8].Summary.FooterFormat:='###,###,###,###';
     cxGrdMaster.Columns[9].Summary.FooterKind:=skSum;
    cxGrdMaster.Columns[9].Summary.FooterFormat:='###,###,###,###';
     cxGrdMaster.Columns[10].Summary.FooterKind:=skSum;
    cxGrdMaster.Columns[10].Summary.FooterFormat:='###,###,###,###';
     cxGrdMaster.Columns[11].Summary.FooterKind:=skSum;
    cxGrdMaster.Columns[11].Summary.FooterFormat:='###,###,###,###';
     cxGrdMaster.Columns[13].Summary.FooterKind:=skSum;
    cxGrdMaster.Columns[13].Summary.FooterFormat:='###,###,###,###';
    cxGrdMaster.Columns[5].Width :=80;
    cxGrdMaster.Columns[6].Width :=80;

    cxGrdDetail.Columns[2].Width :=200;
    cxGrdDetail.Columns[3].Width :=80;

end;

procedure TfrmBrowseSalesByInv.FormShow(Sender: TObject);
begin
    ShowWindowAsync(Handle, SW_MAXIMIZE);
  inherited;
  btnRefreshClick(Self);
end;

procedure TfrmBrowseSalesByInv.cxButton6Click(Sender: TObject);
begin
  inherited;
  refreshdata;
end;

end.

