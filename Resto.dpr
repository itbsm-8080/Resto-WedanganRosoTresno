program Resto;

uses
  Forms,
  MAIN in 'MAIN.pas' {frmMenu},
  uFrmbantuan in 'bantu\uFrmbantuan.pas' {frmBantuan},
  Ulib in 'bantu\Ulib.pas',
  uModuleConnection in 'bantu\uModuleConnection.pas',
  uReport in 'bantu\uReport.pas',
  UfrmLogin in 'UfrmLogin.pas' {frmLogin},
  ufrmCxBrowse in 'ufrmCxBrowse.pas' {frmCxBrowse},
  ufrmsalestype in 'ufrmsalestype.pas' {frmsalestype},
  ufrmCategory in 'ufrmCategory.pas' {frmCategory},
  ufrmModifier in 'ufrmModifier.pas' {frmModifier},
  ufrmItem in 'ufrmItem.pas' {frmItem},
  ufrmPos in 'ufrmPos.pas' {frmPos},
  uFrmDetailItem in 'bantu\uFrmDetailItem.pas' {frmDetailItem},
  ufrmPerusahaan in 'ufrmPerusahaan.pas' {frmPerusahaan},
  uFrmMeja in 'bantu\uFrmMeja.pas' {frmMeja},
  ufrmInputCustomer in 'ufrmInputCustomer.pas' {frmInputCustomer},
  ufrmListBill in 'ufrmListBill.pas' {frmListBill},
  ufrmcharge in 'ufrmcharge.pas' {frmCharge},
  ufrmOtorisasi in 'ufrmOtorisasi.pas' {frmOtorisasi},
  ufrmUser in 'ufrmUser.pas' {frmUser},
  ufrmBrowseSalesbyInv in 'ufrmBrowseSalesbyInv.pas' {frmBrowseSalesByInv},
  ufrmListJual in 'ufrmListJual.pas' {frmListJual},
  ufrmCheckList in 'ufrmCheckList.pas' {frmCheckList},
  ufrmListVoid in 'ufrmListVoid.pas' {frmListVoid},
  ufrmSplit in 'ufrmSplit.pas' {frmSplit},
  ufrmListBill2 in 'ufrmListBill2.pas' {frmListBill2},
  ufrmRefund in 'ufrmRefund.pas' {frmRefund},
  ufrmClerek in 'ufrmClerek.pas' {frmClerek},
  ufrmBrowseSetoran in 'ufrmBrowseSetoran.pas' {frmBrowseSetoran},
  ufrmchange in 'ufrmchange.pas' {frmChange},
  ufrmBrowsePosting in 'ufrmBrowsePosting.pas' {frmBrowsePosting},
  ufrmPosting in 'ufrmPosting.pas' {frmPosting},
  ufrmDiscount in 'ufrmDiscount.pas' {frmDiscount},
  ufrmBrowseRekening in 'ufrmBrowseRekening.pas' {frmBrowseRekening},
  ufrmRekening in 'ufrmRekening.pas' {frmRekening},
  ufrmJurnalUmum in 'ufrmJurnalUmum.pas' {frmJurnalUmum},
  ufrmBrowseJurnal2 in 'ufrmBrowsejurnal2.pas' {frmBrowseJurnal2},
  ufrmBrowseJurnalUmum in 'ufrmBrowseJurnalUmum.pas' {frmBrowseJurnalUmum},
  ufrmListKas in 'ufrmListKas.pas' {frmListKas},
  ufrmStokIn in 'ufrmStokIn.pas' {frmStokIn},
  ufrmListProduct in 'ufrmListproduct.pas' {frmListProduct},
  ufrmLapStok in 'ufrmLapStok.pas' {frmLapStok},
  ufrmReturn in 'ufrmReturn.pas' {frmReturn},
  ufrmKoreksiStok in 'ufrmKoreksiStok.pas' {frmKoreksiStok},
  ufrmBrowsePembayaranLain in 'ufrmBrowsePembayaranLain.pas' {frmBrowsePembayaranLain},
  ufrmPembayaranLain in 'ufrmPembayaranLain.pas' {frmPembayaranLain},
  ufrmBrowseUangMuka in 'ufrmBrowseUangMuka.pas' {frmBrowseUangMuka},
  ufrmUangMuka in 'ufrmUangMuka.pas' {frmUangMuka},
  ufrmListdp in 'ufrmListdp.pas' {frmListDP},
  ufrmPendapatanLain in 'ufrmPendapatanLain.pas' {frmPendapatanLain},
  ufrmBrowsePendapatanLain in 'ufrmBrowsePendapatanLain.pas' {frmBrowsePendapatanLain},
  ufrmBrowseAbsensi in 'ufrmBrowseAbsensi.pas' {frmBrowseAbsensi},
  ufrmVerifikasiAbsensi in 'ufrmVerifikasiAbsensi.pas' {frmVerifikasiAbsensi},
  ufrmBayarCustomer in 'ufrmBayarCustomer.pas' {frmBayarCustomer},
  ufrmBrowseBayarCustomer in 'ufrmBrowseBayarCustomer.pas' {frmBrowseBayarCustomer},
  ufrmListFOS in 'ufrmListFOS.pas' {frmListFOS},
  ufrmListIOS in 'ufrmListIOS.pas' {frmListIOS};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmMeja, frmMeja);
  Application.Run;
  end.
