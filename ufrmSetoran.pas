unit ufrmSetoran;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AdvEdit, ExtCtrls, AdvPanel, Menus,
  cxLookAndFeelPainters, cxButtons, ComCtrls,SqlExpr;

type
  TfrmSetoran = class(TForm)
    AdvPanel1: TAdvPanel;
    AdvPanel2: TAdvPanel;
    lbljudul: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtPenjualan: TAdvEdit;
    edtVoucher: TAdvEdit;
    edtPiutang: TAdvEdit;
    edtOngkir: TAdvEdit;
    edtTunai: TAdvEdit;
    edtCard: TAdvEdit;
    Label7: TLabel;
    edtBiaya: TAdvEdit;
    Label8: TLabel;
    edtBayarCustomer: TAdvEdit;
    Label9: TLabel;
    edtBayarSuplier: TAdvEdit;
    Label10: TLabel;
    edtpendapatan: TAdvEdit;
    Label11: TLabel;
    AdvPanel5: TAdvPanel;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    Label12: TLabel;
    edtSetoran: TAdvEdit;
    Label13: TLabel;
    dtTanggal: TDateTimePicker;
    Label14: TLabel;
    edtNomor: TAdvEdit;
    Label15: TLabel;
    cbTipe: TComboBox;
    ChkHariIni: TCheckBox;
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function getmaxnomor:integer;
    procedure loaddata ;
    procedure cbTipeChange(Sender: TObject);
    procedure ChkHariIniClick(Sender: TObject);
    procedure dtTanggalChange(Sender: TObject);
  private
        FID: string;
        FFLAGEDIT: Boolean;
    { Private declarations }
  public
        property ID: string read FID write FID;
    property FLAGEDIT: Boolean read FFLAGEDIT write FFLAGEDIT;
    { Public declarations }
  end;

var
  frmSetoran: TfrmSetoran;

implementation
  uses MAIN,uModuleConnection, DB,ulib;
 {$R *.dfm}

procedure TfrmSetoran.cxButton3Click(Sender: TObject);
begin
release;
end;

procedure TfrmSetoran.cxButton2Click(Sender: TObject);
var
  s:string;
begin
  if edtSetoran.Text = ''  then
  begin
    ShowMessage('setoran masih nol');
    Exit;
  end;
  s:='delete from tsetoran where nomor = '+ edtNomor.Text + ';';
  xExecQuery(s,frmMenu.conn);
  s:='insert into tsetoran (nomor,tanggal,tunai,biaya,pendapatan,hutang,piutang,tipe) values ('
  + edtNomor.Text + ','
  + QuotD(dtTanggal.Date)+','
  + StringReplace(edtTunai.Text,',','',[rfReplaceAll])+','
  + StringReplace(edtBiaya.Text,',','',[rfReplaceAll])+','
  + StringReplace(edtpendapatan.Text,',','',[rfReplaceAll])+','
  + StringReplace(edtBayarSuplier.Text,',','',[rfReplaceAll])+','
  + StringReplace(edtBayarCustomer.Text,',','',[rfReplaceAll])+','
  + IntToStr(cbTipe.ItemIndex+1)+');';
    xExecQuery(s,frmmenu.conn);

if ChkHariIni.Checked then
begin
  s:='update tso_hdr set isposting=1 where noposting = 0'
    + ' and so_tanggal = ' + QuotD(dtTanggal.DateTime);
    xExecQuery(s,frmmenu.conn);
  s:='update tbayarcus_hdr set isposting=1 where noposting = 0'
      + ' and byc_tanggal = ' + QuotD(dtTanggal.DateTime);
    xExecQuery(s,frmmenu.conn);
  s:='update tbayarsup_hdr set isposting=1 where noposting = 0'
    + ' and bys_tanggal = ' + QuotD(dtTanggal.DateTime);
    xExecQuery(s,frmmenu.conn);
  s:='update tjurnal set isposting=1 where noposting = 0'
    + ' and jur_tanggal = ' + QuotD(dtTanggal.DateTime);
    xExecQuery(s,frmmenu.conn);

  s:='update tso_hdr set noposting='+edtnomor.Text+' where noposting = 0'
    + ' and so_tanggal = ' + QuotD(dtTanggal.DateTime);
    xExecQuery(s,frmmenu.conn);
  s:='update tbayarcus_hdr set noposting='+edtnomor.Text+' where noposting = 0'
    + ' and byc_tanggal = ' + QuotD(dtTanggal.DateTime);
    xExecQuery(s,frmmenu.conn);
  s:='update tbayarsup_hdr set noposting='+edtnomor.Text+' where noposting = 0'
    + ' and bys_tanggal = ' + QuotD(dtTanggal.DateTime);
    xExecQuery(s,frmmenu.conn);
  s:='update tjurnal set noposting='+edtnomor.Text+' where noposting = 0'
    + ' and jur_tanggal = ' + QuotD(dtTanggal.DateTime);
    xExecQuery(s,frmmenu.conn);
    xCommit(frmMenu.conn);
    loaddata;
    release;

end
else
begin
  s:='update tso_hdr set isposting=1 where noposting = 0';
    xExecQuery(s,frmmenu.conn);
  s:='update tbayarcus_hdr set isposting=1 where noposting = 0';
    xExecQuery(s,frmmenu.conn);
  s:='update tbayarsup_hdr set isposting=1 where noposting = 0';
    xExecQuery(s,frmmenu.conn);
  s:='update tjurnal set isposting=1 where noposting = 0';
    xExecQuery(s,frmmenu.conn);

  s:='update tso_hdr set noposting='+edtnomor.Text+' where noposting = 0';
    xExecQuery(s,frmmenu.conn);
  s:='update tbayarcus_hdr set noposting='+edtnomor.Text+' where noposting = 0';
    xExecQuery(s,frmmenu.conn);
  s:='update tbayarsup_hdr set noposting='+edtnomor.Text+' where noposting = 0';
    xExecQuery(s,frmmenu.conn);
  s:='update tjurnal set noposting='+edtnomor.Text+' where noposting = 0';
    xExecQuery(s,frmmenu.conn);
    xCommit(frmMenu.conn);
    loaddata;
    release;
end;
end;

procedure TfrmSetoran.FormShow(Sender: TObject);
begin
    IF frmMenu.aDatabase = 'msi' then
  begin
    Label15.Visible := false;
    cbTipe.Visible := False;
  end;
dttanggal.datetime := date;
edtNomor.Text := IntToStr(getmaxnomor);
loaddata;
end;

function TfrmSetoran.getmaxnomor:integer;
var
  s:string;
  tsql:TSQLQuery;
begin
  result:=1;
  s:='select max(nomor) from tsetoran ';

  tsql :=xOpenQuery(s,frmMenu.conn);
  if not tsql.Eof then
     Result := tsql.fields[0].AsInteger + 1;

end;

procedure TfrmSetoran.loaddata ;
var
  s:string;
  tsql:TSQLQuery;
  asetor:Double;
  sfilter : string;
begin
  if ChkHariIni.Checked then
  sfilter := ' and so_tanggal ='+QuotD(dtTanggal.DateTime)
  else
  sfilter :='';

if cbTipe.ItemIndex = 0 then
  s:='SELECT  SUM(so_amount) Total , sum(so_voucher) Voucher, '
+ ' sum(so_piutang) Piutang,'
+ ' sum(so_ongkir) Ongkir,'
+ ' sum(so_card) Card ,sum(so_dp) Cash'
+ ' FROM tso_hdr WHERE isposting =0'
+ sfilter
+ ' AND so_Nomor IN ('
+ ' SELECT distinct sod_so_nomor  FROM tso_dtl INNER JOIN tbarang ON brg_kode=sod_brg_kode'
+ ' WHERE brg_ktg_Kode LIKE "1.1%")'
else
  s:='SELECT  SUM(so_amount) Total , sum(so_voucher) Voucher, '
+ ' sum(so_piutang) Piutang,'
+ ' sum(so_ongkir) Ongkir,'
+ ' sum(so_card) Card ,sum(so_dp) Cash'
+ ' FROM tso_hdr WHERE isposting =0'
+ sfilter
+ ' AND so_Nomor IN ('
+ ' SELECT distinct sod_so_nomor  FROM tso_dtl INNER JOIN tbarang ON brg_kode=sod_brg_kode'
+ ' WHERE brg_ktg_Kode LIKE "1.2%")';

tsql := xOpenQuery(s,frmMenu.conn);
with tsql do
begin
  try
    edtPenjualan.Text := FormatFloat('###,###,###',Fields[0].asfloat);
    edtVoucher.Text := FormatFloat('###,###,###',Fields[1].asfloat);
    edtPiutang.Text := FormatFloat('###,###,###',Fields[2].asfloat);
    edtOngkir.Text := FormatFloat('###,###,###',Fields[3].asfloat);
    edtCard.Text := FormatFloat('###,###,###',Fields[4].asfloat);
    edtTunai.Text := FormatFloat('###,###,###',Fields[5].asfloat);
    if edtTunai.Text = '' then
       edtTunai.Text :='0';




  finally
    Free;
  end;
end;

// pendapatan lain hanya untuk herbal

s:='select sum(jurd_debet) from  tjurnal '
+ ' inner join tjurnalitem on jur_no=jurd_jur_no '
+ ' where jur_no like '+ QuotedStr(frmMenu.KDCABANG+'-KM%')
+ ' and isposting = 0 ';
tsql := xOpenQuery(s,frmMenu.conn);
with tsql do
begin
  try
    edtpendapatan.Text := FormatFloat('###,###,###',Fields[0].asfloat);
        if edtpendapatan.Text = '' then
       edtpendapatan.Text :='0';
  finally
    Free;
  end;
end;
  if ChkHariIni.Checked then
  sfilter := ' and byc_tanggal ='+QuotD(dtTanggal.DateTime)
  else
  sfilter :='';


// Penerimaan piutang
  if cbTipe.ItemIndex = 0 then
s:='select sum(byc_nilai) from  tbayarcus_hdr '
+ ' where byc_nomor like '+ QuotedStr(frmMenu.KDCABANG+'-CR%')
+ ' and byc_rek_kode like '+ QuotedStr('11%')
+ ' and isposting = 0 '
+ sfilter
+ ' and byc_nomor in '
+ ' (SELECT distinct bycd_byc_nomor FROM tbayarcus_dtl INNER JOIN tso_hdr ON bycd_fp_nomor=so_nomor INNER JOIN'
+ ' tso_dtl ON  sod_so_nomor=so_nomor WHERE sod_ktg_kode LIKE "1.1%" and isposting =0 )'
else
s:='select sum(byc_nilai) from  tbayarcus_hdr '
+ ' where byc_nomor like '+ QuotedStr(frmMenu.KDCABANG+'-CR%')
+ ' and byc_rek_kode like '+ QuotedStr('11%')
+ ' and isposting = 0 '
+ sfilter
+ ' and byc_nomor in '
+ ' (SELECT distinct bycd_byc_nomor FROM tbayarcus_dtl INNER JOIN tso_hdr ON bycd_fp_nomor=so_nomor INNER JOIN'
+ ' tso_dtl ON  sod_so_nomor=so_nomor WHERE sod_ktg_kode LIKE "1.2%"  )';


tsql := xOpenQuery(s,frmMenu.conn);
with tsql do
begin
  try
    edtBayarCustomer.Text := FormatFloat('###,###,###',Fields[0].asfloat);
        if edtBayarCustomer.Text = '' then
       edtBayarCustomer.Text :='0';

  finally
    Free;
  end;
end;
  if ChkHariIni.Checked then
  sfilter := ' and bys_tanggal ='+QuotD(dtTanggal.DateTime)
  else
  sfilter :='';

// pembayaran supplier
if cbTipe.ItemIndex = 0 then
s:='select sum(bys_nilai) from  tbayarsup_hdr '
+ ' where bys_nomor like '+ QuotedStr('VP%')
+ ' and bys_rek_kode like '+ QuotedStr('11%')
+ ' and isposting = 0 '
+ sfilter
+ ' and bys_nomor in '
+ ' (SELECT distinct bysd_bys_nomor FROM tbayarsup_dtl INNER JOIN tinv_hdr ON bysd_inv_nomor=inv_nomor INNER JOIN'
+ ' tinv_dtl ON  invd_inv_nomor=inv_nomor inner join tbarang on brg_kode=invd_brg_kode WHERE brg_ktg_kode LIKE "1.1%"  )'
else
s:='select sum(bys_nilai) from  tbayarsup_hdr '
+ ' where bys_nomor like '+ QuotedStr('VP%')
+ ' and bys_rek_kode like '+ QuotedStr('11%')
+ ' and isposting = 0 '
+ sfilter
+ ' and bys_nomor in '
+ ' (SELECT distinct bysd_bys_nomor FROM tbayarsup_dtl INNER JOIN tinv_hdr ON bysd_inv_nomor=inv_nomor INNER JOIN '
+ ' tinv_dtl ON  invd_inv_nomor=inv_nomor inner join tbarang on brg_kode=invd_brg_kode WHERE brg_ktg_kode LIKE "1.2%"  )';
tsql := xOpenQuery(s,frmMenu.conn);
with tsql do
begin
  try
    edtBayarSuplier.Text := FormatFloat('###,###,###',Fields[0].asfloat);
        if edtBayarSuplier.Text = '' then
       edtBayarSuplier.Text :='0';

  finally
    Free;
  end;
end;
  if ChkHariIni.Checked then
  sfilter := ' and jur_tanggal ='+QuotD(dtTanggal.DateTime)
  else
  sfilter :='';


  if cbTipe.ItemIndex = 0 then
s:='select sum(jurd_kredit) from  tjurnal '
+ ' inner join tjurnalitem on jur_no=jurd_jur_no '
+ ' where jur_no like '+ QuotedStr(frmMenu.KDCABANG+'-KK%')
+ ' AND jur_tipe=1 '
+ sfilter
+ ' and isposting = 0 '
else
s:='select sum(jurd_kredit) from  tjurnal '
+ ' inner join tjurnalitem on jur_no=jurd_jur_no '
+ ' where jur_no like '+ QuotedStr(frmMenu.KDCABANG+'-KK%')
+ ' AND jur_tipe=2 '
+ sfilter
+ ' and isposting = 0 ';

tsql := xOpenQuery(s,frmMenu.conn);
with tsql do
begin
  try
    edtBiaya.Text := FormatFloat('###,###,###',Fields[0].asfloat);
        if edtBiaya.Text = '' then
       edtBiaya.Text :='0';

  finally
    Free;
  end;
end;
asetor := StrToFloatDef(StringReplace(edtTunai.Text,',','',[rfReplaceAll]),0)+
          StrToFloatDef(StringReplace(edtpendapatan.Text,',','',[rfReplaceAll]),0)+
          StrToFloatDef(StringReplace(edtBayarCustomer.Text,',','',[rfReplaceAll]),0)-
          StrToFloatDef(StringReplace(edtBayarSuplier.Text,',','',[rfReplaceAll]),0)-
          StrToFloatDef(StringReplace(edtBiaya.Text,',','',[rfReplaceAll]),0);
edtSetoran.Text := FormatFloat('###,###,###',asetor);

end;
procedure TfrmSetoran.cbTipeChange(Sender: TObject);
begin
loaddata;
end;

procedure TfrmSetoran.ChkHariIniClick(Sender: TObject);
begin
  loaddata;
end;

procedure TfrmSetoran.dtTanggalChange(Sender: TObject);
begin
loaddata;
end;

end.
