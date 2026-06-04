unit ufrmClerek;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxContainer, cxLabel, ExtCtrls, AdvPanel,
  MemDS, DBAccess, MyAccess, Menus, cxLookAndFeelPainters, StdCtrls,
  cxButtons,sqlexpr, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  AdvEdit, AdvCombo;

type
  TfrmClerek = class(TForm)
    AdvPanel1: TAdvPanel;
    cxLabel1: TcxLabel;
    cxStyleRepository3: TcxStyleRepository;
    cxStyle3: TcxStyle;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle2: TcxStyle;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    MyQuery1: TMyQuery;
    DataSource1: TDataSource;
    dtTanggal: TcxDateEdit;
    MyQuery1nomor: TStringField;
    MyQuery1nama: TStringField;
    MyQuery1tim: TDateTimeField;
    MyQuery1Meja: TStringField;
    AdvPanel2: TAdvPanel;
    cxrefresh: TcxButton;
    AdvPanel3: TAdvPanel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    edtuser: TAdvEdit;
    cxLabel4: TcxLabel;
    edtsetoran: TAdvEdit;
    cxLabel5: TcxLabel;
    cbShift: TAdvComboBox;
    procedure FormShow(Sender: TObject);
    procedure cxrefreshClick(Sender: TObject);
    function cekoderada:boolean;
    function ceksetoranada:boolean;
    Procedure doslipsetoran;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClerek: TfrmClerek;

implementation
    uses MAIN,uModuleConnection, ufrmotorisasi,ulib,ureport;
{$R *.dfm}

procedure TfrmClerek.FormShow(Sender: TObject);
var
  s:String;
  tsql:tsqlquery;
  displayText: String;
begin
  dttanggal.Date := date;
  edtuser.Text := frmmenu.NMUSER;

  s:='select nama, kode from tmasterkode';
  tsql := xOpenQuery(s,frmmenu.conn);
  cbShift.items.Clear;
//  cbShift.items.Add('ALL');
  cbShift.Items.Add('None');
  with tsql do
  begin
    try
      while not EOF do
      begin
        displayText := Fields[0].AsString + ' - ' + Fields[1].AsString;
        cbShift.Items.Add(displayText);
        Next; // Pindah ke baris berikutnya
      end;
    finally
      Free;
    end;
  end;

  if cbShift.Items.Count > 0 then
    cbShift.ItemIndex := 0;
end;

procedure TfrmClerek.cxrefreshClick(Sender: TObject);
var
  s:String;
  tsql:Tsqlquery;
  abiaya,apendapatan,adp, acash ,acard, aother,arefund,aselisih:double;
  ashiftCode: String;
begin
  // cek transaksi order

  if cbShift.ItemIndex = 0 then
  begin
    ShowMessage('Silakan pilih shift terlebih dahulu.');
    Exit;
  end;

//  if cekoderada then
//  begin
//    showmessage('Ada ORDER Yang belum Selesai ');
//    exit;
//  end;

  if ceksetoranada then
  begin
    if MessageDlg('Sudah Pernah di Tutup Kasir, Lanjut ?',mtCustom,
                                  [mbYes,mbNo], 0)= mrNo then
    exit
    else
    begin
         Application.CreateForm(Tfrmotorisasi,frmotorisasi);
         frmotorisasi.ShowModal;
         if  not IDOTORISASI then
         begin
           exit;
         end
         else
         begin
             s:='delete from tbukakasir where tanggal = '+ quotd(dttanggal.date)
              + '  and user_kode=' + quot(frmmenu.KDUSER);
              xExecQuery(s,frmMenu.conn);

         end;
    end;
  end;

    s:='select sum(jl_cash) cash,sum(jl_card) card,sum(jl_othervalue) other,jl_dp dp from tjual where jl_tanggal between '+ quotd(dttanggal.date)
  + ' and '+ quotd(dttanggal.date+1)
  + '  and jl_userkasir=' + quot(frmmenu.KDUSER);
  tsql:=xOpenQuery(s,frmmenu.conn);
  with tsql do
  begin
    try
      if not eof then
      begin
          acash:=fields[0].AsFloat;
          acard:=fields[1].AsFloat;
          aother:=fields[2].AsFloat;
          adp  := fields[3].AsFloat;

      end;
    finally
        free;
    end;
  end;

  aselisih := strtofloat(stringreplace(edtsetoran.text,',','',[rfReplaceAll]))-acash;

  ashiftCode := Copy(cbShift.Text, Pos(' - ', cbShift.Text) + 3, Length(cbShift.Text));

  s:='insert into tbukakasir (user_kode,tanggal,setoran,cash,card,other,selisih, shift,dp) values ('
  + quot(frmmenu.KDUSER) + ','
  + QuotD(dttanggal.Date) + ','
  + StringReplace(edtsetoran.Text,',','',[rfReplaceAll])+','
  + floattostr(acash)+','
  + floattostr(acard)+','
  + floattostr(aother)+','
  + floattostr(aselisih)+ ','
  + Quot(ashiftCode)  +','
  + floattostr(adp)
  + ');';
  xExecQuery(s,frmmenu.conn);

  s:='call jurnal_penjualan ('+ quotd(dttanggal.date)+ ');';
  xExecQuery(s,frmMenu.conn);

  doslipsetoran;
close;
end;

function TfrmClerek.cekoderada:boolean;
var
  s:string;
  tsql:tsqlquery;
begin
  result:=false;
  s:='select * from tjual where jl_status=1 and jl_tanggal between '+ quotd(dttanggal.date)
  + '  and ' + quotd(dttanggal.date+1);
  tsql:=xOpenQuery(s,frmmenu.conn);
  with tsql do
  begin
    try
      if not eof then
         result := true;
    finally
        free;
    end;
  end;

end;


function TfrmClerek.ceksetoranada:boolean;
var
  s:string;
  tsql:tsqlquery;
begin
  result:=false;
  s:='select * from tbukakasir where tanggal = '+ quotd(dttanggal.date)
  + '  and user_kode=' + quot(frmmenu.KDUSER);
  tsql:=xOpenQuery(s,frmmenu.conn);
  with tsql do
  begin
    try
      if not eof then
         result := true;
    finally
        free;
    end;
  end;

end;

Procedure TfrmClerek.doslipsetoran;
var
  s: string ;
  ftsreport : TTSReport;
begin

  ftsreport := TTSReport.Create(nil);
  try
    ftsreport.Nama := 'setoran';
    zprinter := frmMenu.aPRINTER;

          s:=' select *,'+Quot(frmmenu.NMUSER)+' nmkasir,'
          + ' (select sum(jurd_debet) from tjurnal inner join tjurnalitem on jur_no=jurd_jur_no and jur_tipetransaksi="Uang Muka Penjualan" and jurd_rek_kode="11.001" where  jur_tanggal=a.tanggal and user_create=a.user_kode)  Dp_Cash,'
          + ' (select sum(jurd_debet) from tjurnal inner join tjurnalitem on jur_no=jurd_jur_no  and jurd_debet > 0 and jur_tipetransaksi ='+Quot('Pembayaran Lain') + ' where jur_tanggal=a.tanggal and user_create=a.user_kode)  Biaya,'
          + ' (select sum(jurd_kredit) from tjurnal inner join tjurnalitem on jur_no=jurd_jur_no  and jurd_kredit > 0 and jur_tipetransaksi ='+Quot('Pendapatan Lain') + ' where jur_tanggal=a.tanggal and user_create=a.user_kode)  Pendapatan'
          + '  from tbukakasir a where tanggal='+QuotD(dttanggal.Date)
            +' and  user_kode='+ quot(frmmenu.kduser);


    ftsreport.AddSQL(s);

       S:='SELECT *,'+Quot(frmmenu.NMUSER)+' NMKASIR,'+QuotD(dttanggal.date)+' tgl FROM ('
       + ' SELECT "CARD" Tipe,jl_bank keterangan,SUM(jl_card) FROM tjual WHERE jl_tanggal BETWEEN '+QuotD(dttanggal.Date)
       +' and '+QuotD(dttanggal.Date+1)
       + ' AND jl_card > 0'
       + ' AND jl_userkasir='+Quot(FRMMENU.KDUSER)
       + ' GROUP BY keterangan '
       + ' UNION '
       + ' SELECT "Other" Tipe,jl_other keterangan,SUM(jl_othervalue) FROM tjual WHERE jl_tanggal BETWEEN '+QuotD(dttanggal.Date)
       + ' and '+QuotD(dttanggal.Date+1)
       + ' AND jl_othervalue > 0'
       + ' AND jl_userkasir='+Quot(FRMMENU.KDUSER)
       + ' GROUP BY keterangan) FINAL';
    ftsreport.AddSQL(s);
//
//    s:='SELECT jl_userkasir nmkasir,jl_bank keterangan,SUM(jl_card)  FROM tjual WHERE jl_tanggal BETWEEN '+QuotD(dttanggal.Date)
//       + ' and '+QuotD(dttanggal.Date+1)
//       + ' AND jl_userkasir='+Quot(FRMMENU.KDUSER)+' and jl_card > 0 GROUP BY jl_bank'
//       + ' UNION'
//       + ' SELECT jl_userkasir nmkasir,jl_other keterangan,SUM(jl_othervalue)  FROM tjual WHERE jl_tanggal BETWEEN '+QuotD(dttanggal.Date)
//       + ' and '+QuotD(dttanggal.Date+1)
//       + ' AND jl_userkasir='+Quot(FRMMENU.KDUSER)+'  and jl_othervalue > 0  GROUP BY jl_other';
//    ftsreport.AddSQL(s);


    s:='SELECT user_create kasir,rek_nama,jurd_keterangan,jurd_debet FROM tjurnal INNER JOIN tjurnalitem ON jur_no=jurd_jur_no'
+ ' INNER JOIN trekening ON rek_kode=jurd_rek_kode'
+ ' WHERE jur_tanggal='+QuotD(dttanggal.Date)+' AND user_create='+Quot(FRMMENU.KDUSER)
+ ' AND jurd_debet > 0 and jur_tipetransaksi = '+Quot('Pembayaran Lain');

    ftsreport.AddSQL(s);

    s:='SELECT user_create kasir,rek_nama,jurd_keterangan,jurd_kredit FROM tjurnal INNER JOIN tjurnalitem ON jur_no=jurd_jur_no'
+ ' INNER JOIN trekening ON rek_kode=jurd_rek_kode'
+ ' WHERE jur_tanggal='+QuotD(dttanggal.Date)+' AND user_create='+Quot(FRMMENU.KDUSER)
+ ' AND jurd_kredit > 0 and jur_tipetransaksi = '+Quot('Pendapatan Lain');

    ftsreport.AddSQL(s);

 s:='SELECT user_create kasir,rek_nama,jurd_keterangan,jurd_debet FROM tjurnal INNER JOIN tjurnalitem ON jur_no=jurd_jur_no'
+ ' INNER JOIN trekening ON rek_kode=jurd_rek_kode'
+ ' WHERE jur_tanggal='+QuotD(dttanggal.Date)+' AND user_create='+Quot(FRMMENU.KDUSER)
+ ' AND jurd_debet > 0 and jur_tipetransaksi ='+Quot('Uang Muka Penjualan');

    ftsreport.AddSQL(s);


    ftsreport.ShowReport;
  finally
     ftsreport.Free;
  end;
end;


end.
