unit ufrmBrowseUangMuka;

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
  TfrmBrowseUangMuka = class(TfrmCxBrowse)
  procedure btnRefreshClick(Sender: TObject);
  procedure FormShow(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  procedure cxButton6Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBrowseUangMuka: TfrmBrowseUangMuka;

implementation
   uses ufrmuangmuka,Ulib, MAIN, uModuleConnection,ureport;
{$R *.dfm}

procedure TfrmBrowseUangMuka.btnRefreshClick(Sender: TObject);
begin
  Self.SQLMaster := 'select um_nomor Nomor,um_tanggal Tanggal,um_customer Customer,um_jenisbayar JenisBayar,um_nilai Nilai,if(um_isrealisasi=0,"Belum","Sudah") Realisasi,user_create,date_create'
  + ' from tuangmuka where um_tanggal between '+ QuotD(startdate.DateTime) + ' and ' + QuotD(enddate.DateTime);
   inherited;
    cxGrdMaster.ApplyBestFit();
    cxGrdMaster.Columns[0].Width :=100;
    cxGrdMaster.Columns[1].Width :=200;
end;

procedure TfrmBrowseUangMuka.FormShow(Sender: TObject);
begin
    ShowWindowAsync(Handle, SW_MAXIMIZE);
  inherited;
  btnRefreshClick(Self);
end;

procedure TfrmBrowseUangMuka.cxButton2Click(Sender: TObject);
var
  frmuangmuka: Tfrmuangmuka;
begin
  inherited;
    if ActiveMDIChild.Caption <> 'Uang Muka' then
   begin
      frmuangmuka  := frmmenu.ShowForm(Tfrmuangmuka) as Tfrmuangmuka;
   end;
   frmuangmuka.Show;
end;

procedure TfrmBrowseUangMuka.cxButton1Click(Sender: TObject);
var
  frmuangmuka: Tfrmuangmuka;
begin
  inherited;
  If CDSMaster.FieldByname('nomor').IsNull then exit;
  if ActiveMDIChild.Caption <> 'Uang Muka' then
   begin
//      ShowForm(TfrmBrowseBarang).Show;
      frmuangmuka  := frmmenu.ShowForm(Tfrmuangmuka) as Tfrmuangmuka;
      frmuangmuka.ID := CDSMaster.FieldByname('nomor').AsString;
      frmuangmuka.FLAGEDIT := True;
      frmuangmuka.edtnomor.Text := CDSMaster.FieldByname('nomor').AsString;
      frmuangmuka.loaddata(CDSMaster.FieldByname('nomor').AsString);

   end;
   frmuangmuka.Show;
end;

procedure TfrmBrowseUangMuka.cxButton6Click(Sender: TObject);
begin
  inherited;
  refreshdata;
end;

procedure TfrmBrowseUangMuka.cxButton4Click(Sender: TObject);
var
  s:string;
begin
  inherited;
     try
       if not cekdelete(frmMenu.KDUSER,'frmuangmuka') then
      begin
         MessageDlg('Anda tidak berhak Menghapus di Modul ini',mtWarning, [mbOK],0);
         Exit;
      End;
      if MessageDlg('Yakin ingin hapus ?',mtCustom,
                                  [mbYes,mbNo], 0)= mrNo
      then Exit ;
       s:='delete from tuangmuka '
        + ' where um_nomor = ' + quot(CDSMaster.FieldByname('nomor').AsString) + ';' ;
      xExecQuery(s,frmmenu.conn);


      CDSMaster.Delete;
   except
     MessageDlg('Gagal Hapus',mtError, [mbOK],0);
     xRollback(frmMenu.conn);
     Exit;
   end;
    xCommit(frmMenu.conn);

end;

procedure TfrmBrowseUangMuka.cxButton3Click(Sender: TObject);
var
  s: string ;
  ftsreport : TTSReport;
begin

  ftsreport := TTSReport.Create(nil);
  try
    ftsreport.Nama := 'dp';
    zprinter := frmMenu.aPRINTER;

          s:= ' select '
       + ' *,'+Quot(zNamaProfile)+ ' as znama ,'
       +Quot(zAddress)+ ' as zalamat ,'
       +Quot(zNotelp)+ ' as znotelp ,'
       +Quot(zFooter)+ ' as zfooter '
       + ' from tuangmuka '
       + ' where '
       + ' um_nomor=' + quot(CDSMaster.FieldByname('nomor').AsString);

    ftsreport.AddSQL(s);

    ftsreport.ShowReport;
  finally
     ftsreport.Free;
  end;
end;

end.
