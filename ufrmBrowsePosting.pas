unit ufrmBrowsePosting;

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
  dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, FMTBcd, Provider, SqlExpr, ImgList,
  ComCtrls, StdCtrls, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxButtons, ExtCtrls, AdvPanel, DBClient, cxLookAndFeels;

type
  TfrmBrowsePosting = class(TfrmCxBrowse)
  procedure btnRefreshClick(Sender: TObject);
  procedure FormShow(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBrowsePosting: TfrmBrowsePosting;

implementation
   uses ufrmposting,Ulib, MAIN, uModuleConnection;
{$R *.dfm}

procedure TfrmBrowsePosting.btnRefreshClick(Sender: TObject);
begin
  Self.SQLMaster := 'select pos_nomor Nomor,pos_tanggal Tanggal,pos_nilai Nilai'
                  + ' from tposting '
                  + ' where pos_tanggal between ' + QuotD(startdate.DateTime) + ' and ' + QuotD(enddate.DateTime);



   inherited;
    cxGrdMaster.ApplyBestFit();
    cxGrdMaster.Columns[0].Width :=100;
    cxGrdMaster.Columns[1].Width :=100;
    
     cxGrdMaster.Columns[2].Summary.FooterKind:=skSum;
    cxGrdMaster.Columns[2].Summary.FooterFormat:='###,###,###,###';


end;

procedure TfrmBrowsePosting.FormShow(Sender: TObject);
begin
    ShowWindowAsync(Handle, SW_MAXIMIZE);
  inherited;
  btnRefreshClick(Self);
end;

procedure TfrmBrowsePosting.cxButton2Click(Sender: TObject);
var
  frmposting: Tfrmposting;
begin
  inherited;
    if ActiveMDIChild.Caption <> 'Posting' then
   begin
      frmposting  := frmmenu.ShowForm(Tfrmposting) as Tfrmposting;
      if frmposting.FLAGEDIT =False then
      frmposting.edtNomor.Text := frmposting.getmaxkode;
   end;
   frmposting.Show;
end;

end.
