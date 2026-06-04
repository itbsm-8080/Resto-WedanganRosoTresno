unit ufrmBrowseSetoran;

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
  TfrmBrowseSetoran = class(TfrmCxBrowse)
    panelmemo: TAdvPanel;
    memojual: TAdvMemo;
    cxButton5: TcxButton;
    cxButton9: TcxButton;
    AdvPanel4: TAdvPanel;
    cxButton10: TcxButton;
  procedure btnRefreshClick(Sender: TObject);
  procedure FormShow(Sender: TObject);
  procedure cxButton6Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure cxButton9Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure doslip3;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBrowseSetoran: TfrmBrowseSetoran;

implementation
   uses ufrmsetoran,Ulib, MAIN, uModuleConnection,ureport;
{$R *.dfm}

procedure TfrmBrowseSetoran.btnRefreshClick(Sender: TObject);
begin

  Self.SQLMaster := 'SELECT a.user_kode Kode,user_nama Nama,Tanggal,Setoran,Selisih,Cash,Card,Other Piutang,'
  + ' (select sum(jurd_debet) from tjurnal inner join tjurnalitem on jur_no=jurd_jur_no and jur_tipetransaksi="Uang Muka Penjualan" and jurd_rek_kode="11.001" where  jur_tanggal=a.tanggal and user_create=a.user_kode)  Dp_Cash,'
  + ' (select sum(jurd_debet) from tjurnal inner join tjurnalitem on jur_no=jurd_jur_no and jur_tipetransaksi="Uang Muka Penjualan" and jurd_rek_kode="12.001" where jur_tanggal=a.tanggal and user_create=a.user_kode)  Dp_Bank,'
  + ' (select sum(jurd_debet) from tjurnal inner join tjurnalitem on jur_no=jurd_jur_no  and jurd_debet > 0 and jur_tipetransaksi ='+Quot('Pembayaran Lain') + ' where jur_tanggal=a.tanggal and user_create=a.user_kode)  Biaya,'
  + ' (select sum(jurd_kredit) from tjurnal inner join tjurnalitem on jur_no=jurd_jur_no  and jurd_kredit > 0 and jur_tipetransaksi ='+Quot('Pendapatan Lain') + ' where jur_tanggal=a.tanggal and user_create=a.user_kode)  Pendapatan,'
  + ' Cash+Card+Other Total, c.nama Shift '
+ ' FROM tbukakasir a INNER JOIN tuser b ON a.user_kode=b.user_kode'
+ ' LEFT JOIN tmasterkode c on c.kode = a.shift '
+ ' where tanggal between ' + QuotD(startdate.DateTime) + ' and ' + QuotD(enddate.DateTime)
+ ' order by tanggal ';
   inherited;
    cxGrdMaster.ApplyBestFit();
    cxGrdMaster.Columns[0].Width :=100;
    cxGrdMaster.Columns[1].Width :=200;
    cxGrdMaster.Columns[2].Width :=100;
    cxGrdMaster.Columns[3].Width :=100;
    cxGrdMaster.Columns[4].Width :=100;
    cxGrdMaster.Columns[5].Width :=100;
    cxGrdMaster.Columns[6].Width :=100;
    cxGrdMaster.Columns[7].Width :=100;
    cxGrdMaster.Columns[8].Width :=100;
    cxGrdMaster.Columns[9].Width :=100;

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
     cxGrdMaster.Columns[12].Summary.FooterKind:=skSum;
    cxGrdMaster.Columns[12].Summary.FooterFormat:='###,###,###,###';
    cxGrdMaster.Columns[3].Summary.FooterKind:=skSum;
    cxGrdMaster.Columns[3].Summary.FooterFormat:='###,###,###,###';
    cxGrdMaster.Columns[4].Summary.FooterKind:=skSum;
    cxGrdMaster.Columns[4].Summary.FooterFormat:='###,###,###,###';
    cxGrdMaster.Columns[5].Summary.FooterKind:=skSum;
    cxGrdMaster.Columns[5].Summary.FooterFormat:='###,###,###,###';
    cxGrdMaster.Columns[6].Summary.FooterKind:=skSum;
    cxGrdMaster.Columns[6].Summary.FooterFormat:='###,###,###,###';

end;

procedure TfrmBrowseSetoran.FormShow(Sender: TObject);
begin
    ShowWindowAsync(Handle, SW_MAXIMIZE);
  inherited;
  btnRefreshClick(Self);
end;

procedure TfrmBrowseSetoran.cxButton6Click(Sender: TObject);
begin
  inherited;
  refreshdata;
end;

procedure TfrmBrowseSetoran.ComboBox1Change(Sender: TObject);
begin
  inherited;
  btnRefreshClick(Self);
end;

procedure TfrmBrowseSetoran.cxButton5Click(Sender: TObject);
begin
  inherited;
    if (FileExists('setoran.txt')) then
      DeleteFile(PChar('setoran.txt'));
      MemoJual.Lines.SaveToFile('setoran.txt');


  CetakFile(ExtractFilePath(Application.ExeName) + '\setoran.txt');

  panelmemo.Visible := false;
end;

procedure TfrmBrowseSetoran.cxButton9Click(Sender: TObject);
begin
  inherited;
panelmemo.Visible :=False;
end;

procedure TfrmBrowseSetoran.cxButton3Click(Sender: TObject);
var
  s: string ;
  ftsreport : TTSReport;
begin

  ftsreport := TTSReport.Create(nil);
  try
    ftsreport.Nama := 'setoran';
    zprinter := frmMenu.aPRINTER;

          s:=' select *,'+Quot(CDSMaster.FieldByname('NAMA').AsString)+' nmkasir from tbukakasir where tanggal='+QuotD(CDSMaster.FieldByname('tanggal').AsDATETIME)
            +' and  user_kode='+ quot(CDSMaster.FieldByname('kode').AsString);


    ftsreport.AddSQL(s);

       S:='SELECT *,'+Quot(CDSMaster.FieldByname('NAMA').AsString)+' NMKASIR,'+QuotD(CDSMaster.FieldByname('tanggal').AsDATETIME)+' tgl FROM ('
       + ' SELECT "CARD" Tipe,jl_bank keterangan,SUM(jl_card) FROM tjual WHERE jl_tanggal BETWEEN '+QuotD(CDSMaster.FieldByname('tanggal').AsDATETIME)
       +' and '+QuotD(CDSMaster.FieldByname('tanggal').AsDATETIME+1)
       + ' AND jl_card > 0'
       + ' AND jl_userkasir='+Quot(CDSMaster.FieldByname('KODE').AsString)
       + ' GROUP BY keterangan '
       + ' UNION '
       + ' SELECT "Other" Tipe,jl_other keterangan,SUM(jl_othervalue) FROM tjual WHERE jl_tanggal BETWEEN '+QuotD(CDSMaster.FieldByname('tanggal').AsDATETIME)
       + ' and '+QuotD(CDSMaster.FieldByname('tanggal').AsDATETIME+1)
       + ' AND jl_othervalue > 0'
       + ' AND jl_userkasir='+Quot(CDSMaster.FieldByname('KODE').AsString)
       + ' GROUP BY keterangan) FINAL';
    ftsreport.AddSQL(s);

//     s:='SELECT jl_userkasir nmkasir,jl_bank keterangan,SUM(jl_card)  FROM tjual WHERE jl_tanggal BETWEEN '+QuotD(CDSMaster.FieldByname('tanggal').AsDATETIME)
//       + ' and '+QuotD(CDSMaster.FieldByname('tanggal').AsDATETIME+1)
//       + ' AND jl_userkasir='+Quot(CDSMaster.FieldByname('KODE').AsString)+' and jl_card > 0 GROUP BY jl_bank'
//       + ' UNION'
//       + ' SELECT jl_userkasir nmkasir,jl_other keterangan,SUM(jl_othervalue)  FROM tjual WHERE jl_tanggal BETWEEN '+QuotD(CDSMaster.FieldByname('tanggal').AsDATETIME)
//       + ' and '+QuotD(CDSMaster.FieldByname('tanggal').AsDATETIME+1)
//       + ' AND jl_userkasir='+Quot(CDSMaster.FieldByname('KODE').AsString)+'  and jl_othervalue > 0  GROUP BY jl_other';
//    ftsreport.AddSQL(s);

    s:='SELECT user_create kasir,rek_nama,jurd_keterangan,jurd_debet FROM tjurnal INNER JOIN tjurnalitem ON jur_no=jurd_jur_no'
+ ' INNER JOIN trekening ON rek_kode=jurd_rek_kode'
+ ' WHERE jur_tanggal='+QuotD(CDSMaster.FieldByname('tanggal').AsDATETIME)+' AND user_create='+Quot(CDSMaster.FieldByname('KODE').AsString)
+ ' AND jurd_debet > 0 ';
    ftsreport.AddSQL(s);

    ftsreport.ShowReport;
  finally
     ftsreport.Free;
  end;
end;


procedure TfrmBrowseSetoran.doslip3;
var
  s,ss,sss: string ;
  tsql,tsql2,tsql3 : TSQLQuery ;
  nselisih,nsetoran,ntunai,nkartu,nvoucher : double;
  cd,varTF1,vartf : TextFile ;
  acustomer,atelp,varFile1,varFile,varFile3  : string ;
  xitem : integer;
  xqty  : double;
begin
  MemoJual.Clear;
        MemoJual.Lines.Add(StrPadRight('',32,'-'));
        MemoJual.Lines.Add(StrPadcenter('S E T O R A N  K A S I R',32,' '));
        MemoJual.Lines.Add(StrPadRight('',32,'-'));
   sss := 'select a.user_kode,ip,cash,card,voucher,setoran,selisih,user_nama FROM tbukakasir a inner join tuser b on a.user_kode=b.user_id '
     + ' where a.user_kode='+ CDSMaster.FieldByname('KODE').AsString
     + ' and tanggal = '+ QuotD(CDSMaster.FieldByname('tanggal').asdatetime);
   tsql3 := xOpenQuery(sss,frmMenu.conn);
   with tsql3 do
    begin
      try
        MemoJual.Lines.Add( 'User    ' + StrPadright(Fields[0].AsString+'/'+Fields[7].AsString,30,' '))  ;
        MemoJual.Lines.Add( 'Tanggal ' + FormatDateTime('dd-mm-yyyy',CDSMaster.FieldByname('tanggal').asdatetime));
        ntunai := Fields[2].asfloat;
        nkartu := Fields[3].asfloat;
        nvoucher := Fields[4].asfloat;
        nsetoran := Fields[5].asfloat;
        nselisih := Fields[6].asfloat;


      finally
        Free;
      end;
    end;



   MemoJual.Lines.Add(StrPadRight('',32,'-'));
    if ntunai > 0  then
    MemoJual.Lines.Add('      Tunai       '+ StrPadleft(FormatFloat('##,###,###',ntunai),12,' '));
    if nkartu > 0 then
    MemoJual.Lines.Add('      Kartu       '+ StrPadleft(FormatFloat('##,###,###',nkartu),12,' '));
    if nvoucher > 0 then
    MemoJual.Lines.Add('      Voucher     '+ StrPadleft(FormatFloat('##,###,###',nvoucher),12,' '));
   MemoJual.Lines.Add(StrPadRight('',32,'-'));
    MemoJual.Lines.Add('      Setoran      '+ StrPadleft(FormatFloat('##,###,###',nsetoran),12,' '));
    MemoJual.Lines.Add('');

    MemoJual.Lines.Add('      Selisih        '+ StrPadleft(FormatFloat('#,###,###',nselisih),12,' '));
    MemoJual.Lines.Add('');
    MemoJual.Lines.Add('');

end;

end.
