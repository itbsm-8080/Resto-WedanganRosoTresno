unit ufrmBrowsePendapatanLain;

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
  TfrmBrowsePendapatanLain = class(TfrmCxBrowse)
  procedure btnRefreshClick(Sender: TObject);
  procedure FormShow(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  procedure cxButton6Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBrowsePendapatanLain: TfrmBrowsePendapatanLain;

implementation
   uses ufrmPendapatanLain,Ulib, MAIN, uModuleConnection;
{$R *.dfm}

procedure TfrmBrowsePendapatanLain.btnRefreshClick(Sender: TObject);
begin
  Self.SQLMaster := ' select jur_no Nomor,jur_tanggal Tanggal, jur_keterangan Keterangan,'
                  + ' sum(jurd_debet) Nilai ,a.user_create '
                  + ' from tjurnal a'
                  + ' inner join tjurnalitem on jurd_jur_no =jur_no'
                  + ' where jur_tipetransaksi='+quot('Pendapatan Lain')
                  + ' and jur_tanggal between ' + QuotD(startdate.DateTime) + ' and ' + QuotD(enddate.DateTime)
                  + ' group by jur_no '
                  + ' order by jur_no ';

  Self.SQLDetail := 'select JUR_NO Nomor,JURD_REK_KODE Account,rek_nama AccountName, jurd_debet Debet,jurd_kredit Kredit,jurd_keterangan Keterangan,cc_nama CostCenter from tjurnal'
                    + ' inner join tjurnalitem on jur_no=jurd_jur_no'
                    + ' inner join trekening on rek_kode=jurd_rek_KODE'
                    + ' LEFT JOIN tcostcenter on cc_kode=jurd_cc_kode'
                    + ' where jur_tipetransaksi='+ quot('Pendapatan Lain')
                    + ' and jur_tanggal between ' + QuotD(startdate.DateTime) + ' and ' + QuotD(enddate.DateTime)
                    + ' order by JUR_NO ,jurd_nourut';
 Self.MasterKeyField := 'Nomor';
   inherited;
    cxGrdMaster.ApplyBestFit();
    cxGrdMaster.Columns[0].Width :=100;
    cxGrdMaster.Columns[1].Width :=100;
    cxGrdMaster.Columns[2].Width :=200;
    cxGrdMaster.Columns[3].Width :=100;

    cxGrdDetail.Columns[2].Width :=200;
    cxGrdDetail.Columns[3].Width :=80;
    cxGrdDetail.Columns[4].Width :=80;
    cxGrdMaster.Columns[3].Summary.FooterKind:=skSum;
    cxGrdMaster.Columns[3].Summary.FooterFormat:='###,###,###,###';

end;

procedure TfrmBrowsePendapatanLain.FormShow(Sender: TObject);
begin
    ShowWindowAsync(Handle, SW_MAXIMIZE);
  inherited;
  btnRefreshClick(Self);
end;

procedure TfrmBrowsePendapatanLain.cxButton2Click(Sender: TObject);
var
  frmPendapatanLain: TfrmPendapatanLain;
begin
  inherited;
    if ActiveMDIChild.Caption <> 'Pendapatan Lain lain' then
   begin
      frmPendapatanLain  := frmmenu.ShowForm(TfrmPendapatanLain) as TfrmPendapatanLain;
      if frmPendapatanLain.FLAGEDIT = false then
      frmPendapatanLain.edtNomor.Text := frmPendapatanLain.getmaxkode;
   end;
   frmPendapatanLain.Show;
end;

procedure TfrmBrowsePendapatanLain.cxButton1Click(Sender: TObject);
var
  frmPendapatanLain: TfrmPendapatanLain;
begin
  inherited;
  If CDSMaster.FieldByname('Nomor').IsNull then exit;
  if ActiveMDIChild.Caption <> 'Pendapatan Lain lain' then
   begin
//      ShowForm(TfrmBrowseBarang).Show;
      frmPendapatanLain  := frmmenu.ShowForm(TfrmPendapatanLain) as TfrmPendapatanLain;
      frmPendapatanLain.ID := CDSMaster.FieldByname('Nomor').AsString;
      frmPendapatanLain.FLAGEDIT := True;
      frmPendapatanLain.edtnOMOR.Text := CDSMaster.FieldByname('Nomor').AsString;
      frmPendapatanLain.loaddataALL(CDSMaster.FieldByname('Nomor').AsString);
//      if CDSMaster.FieldByname('IsClosed').AsString = 'Sudah' then
//      begin
//        ShowMessage('Transaksi ini sudah tutup Periode,Tidak dapat di edit');
//        frmPembayaranLain.cxButton2.Enabled :=False;
//        frmPembayaranLain.cxButton1.Enabled :=False;
//      end;
   end;
   frmPendapatanLain.Show;
end;

procedure TfrmBrowsePendapatanLain.cxButton6Click(Sender: TObject);
begin
  inherited;
  refreshdata;
end;

procedure TfrmBrowsePendapatanLain.cxButton3Click(Sender: TObject);
begin
  inherited;
  frmPendapatanLain.doslipmutasi(CDSMaster.FieldByname('Nomor').AsString);
end;

end.
