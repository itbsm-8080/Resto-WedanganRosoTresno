unit ufrmcharge;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, AdvEdit, cxButtons,
  ExtCtrls, AdvPanel, cxControls, cxContainer, cxEdit, cxLabel, cxGraphics,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox,SqlExpr,math;

type
  TfrmCharge = class(TForm)
    AdvPanel1: TAdvPanel;
    cxButton1: TcxButton;
    cxtable: TcxButton;
    AdvPanel2: TAdvPanel;
    lblTotal: TcxLabel;
    AdvPanel3: TAdvPanel;
    edtOther: TAdvEdit;
    AdvPanel4: TAdvPanel;
    Label1: TLabel;
    Label2: TLabel;
    edtDiscpr: TAdvEdit;
    edtDisc: TAdvEdit;
    AdvPanel5: TAdvPanel;
    edtCard: TAdvEdit;
    AdvPanel6: TAdvPanel;
    edtCash: TAdvEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btncash: TcxButton;
    btncash2: TcxButton;
    edtEDClain: TAdvEdit;
    AdvEdit5: TAdvEdit;
    AdvPanel7: TAdvPanel;
    Label6: TLabel;
    Label7: TLabel;
    edtReceipt: TAdvEdit;
    edtkembali: TAdvEdit;
    cbEdc: TcxComboBox;
    cbOther: TcxComboBox;
    btncash3: TcxButton;
    Label9: TLabel;
    edtDP: TAdvEdit;
    edtnamaDP: TAdvEdit;
    cxButton2: TcxButton;
    NomorUangMuka: TAdvEdit;
    Label8: TLabel;
    cbJenisCustoemer: TcxComboBox;
    procedure cxtableClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure setbuttoncash;
    procedure edtDiscprExit(Sender: TObject);
    procedure edtDiscprKeyPress(Sender: TObject; var Key: Char);
    procedure edtDiscChange(Sender: TObject);
    procedure hitung;
    procedure btncashClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure btncash2Click(Sender: TObject);
    procedure cbEdcPropertiesChange(Sender: TObject);
    procedure cbOtherPropertiesChange(Sender: TObject);
    procedure btncash3Click(Sender: TObject);
    procedure doprinslip;
    procedure cxButton2Click(Sender: TObject);
  private
    nkembali,nbayar  :double;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCharge: TfrmCharge;

implementation
    uses MAIN,uModuleConnection,Ulib, ufrmOtorisasi,ureport, ufrmListdp;
{$R *.dfm}

procedure TfrmCharge.cxtableClick(Sender: TObject);
//var
//  s:string;
//  tsql: TSQLQuery;
begin
// Application.CreateForm(TfrmListdp,frmListdp);
//  frmListdp.ShowModal;
//
//  NomorUangMuka.Text := IDNOMORDP;
//  s:='select um_nomor,um_customer,um_nilai,um_jenisbayar from tuangmuka where um_nomor='+Quot(NomorUangMuka.Text);
//  tsql := xOpenQuery(s,frmMenu.conn);
//  with tsql do
//  begin
//    try
//      if not eof then
//      begin
//        edtnamaDP.Text := fieldbyname('um_customer').AsString;
//        edtDP.Text := fieldbyname('um_nilai').AsString;
//        hitung;
//      end;
//     finally
//       Free;
//    end;
//  end;
    close;
end;

procedure TfrmCharge.FormShow(Sender: TObject);
var
  s:string;
  tsql:tsqlquery;
  xtot:double;
begin

   s:='select * from tjual where jl_nomor ='+QuotedStr(IDNOMOR);
   tsql := xOpenQuery(s,frmMenu.conn);
   with tsql do
   begin
     try
       if not eof then
       begin
         xtot:=fieldbyname('jl_amount').asfloat+fieldbyname('jl_sc').asfloat+fieldbyname('jl_tax').asfloat;
         lblTotal.Caption := FormatFloat('###,###,###',fieldbyname('jl_amount').asfloat+fieldbyname('jl_sc').asfloat+fieldbyname('jl_tax').asfloat);
       end;

     finally
       Free;
     end;
   end;
   setbuttoncash;
   hitung;


end;

procedure TfrmCharge.setbuttoncash;
var
   xtot,xcash,xcash2,xcash3:double;
begin
   if edtDisc.Text = '' then
      edtDisc.Text := '0';

   xtot :=StrToFloat(StringReplace(lblTotal.Caption,',','',[rfReplaceAll]))-StrToFloat(StringReplace(edtdisc.text,',','',[rfReplaceAll]));
   xcash  := ceil(xtot/5000)*5000;
   btncash.Caption :=FormatFloat('###,###,###',xcash);
   xcash2  := ceil(xtot/10000)*10000;
   btncash2.Caption :=FormatFloat('###,###,###',xcash2);
   xcash3  := ceil(xtot/50000)*50000;
   btncash3.Caption :=FormatFloat('###,###,###',xcash3);
end;

procedure TfrmCharge.edtDiscprExit(Sender: TObject);
begin
// if edtDiscpr.Text = '' then
//     edtDiscpr.Text := '0';
//  edtDisc.Text :=   FormatFloat('###,###,###',StrToFloat(edtDiscpr.Text)/100*strtofloat(StringReplace(lblTotal.Caption,',','',[rfReplaceAll])));
end;

procedure TfrmCharge.edtDiscprKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
begin
  Application.CreateForm(Tfrmotorisasi,frmotorisasi);
       frmotorisasi.ShowModal;
       if  IDOTORISASI then
       begin
            if edtDiscpr.Text = '' then
               edtDiscpr.Text := '0';
            edtDisc.Text :=   FormatFloat('###,###,###',StrToFloat(edtDiscpr.Text)/100*strtofloat(StringReplace(lblTotal.Caption,',','',[rfReplaceAll])));
            IDOTORISASI:=FALSE;
        end
        ELSE
             edtDiscpr.Text := '0';
end;
end;

procedure TfrmCharge.edtDiscChange(Sender: TObject);
begin
  setbuttoncash;
hitung;
end;

procedure TfrmCharge.hitung;
var
  adp,adisc,acash,acard,aother :double;
  xamount : double;
begin
  if edtdisc.text = '' then
     edtdisc.Text := '0';
  if edtCash.text = '' then
     edtCash.Text := '0';
  if edtCard.text = '' then
     edtCard.Text := '0';
  if edtDP.text = '' then
     edtDP.Text := '0';

   if edtOther.text = '' then
     edtOther.Text := '0';

  xamount := StrToFloat(StringReplace(lblTotal.Caption,',','',[rfReplaceAll]));
  adisc := StrToFloat(stringreplace(edtDisc.Text,',','',[rfReplaceAll]));
  acash := StrToFloat(stringreplace(edtCash.Text,',','',[rfReplaceAll]));
  acard := StrToFloat(stringreplace(edtCard.Text,',','',[rfReplaceAll]));
  adp := StrToFloat(stringreplace(edtdp.Text,',','',[rfReplaceAll]));

  aother := StrToFloat(stringreplace(edtOther.Text,',','',[rfReplaceAll]));
  nbayar := acard+acash+aother+adisc+adp;
  nkembali:= nbayar-xamount;
  edtReceipt.text := FormatFloat('###,###,###',nbayar);
  edtKembali.text := FormatFloat('###,###,###',nkembali);
  xkembali := nkembali;
end;

procedure TfrmCharge.btncashClick(Sender: TObject);
var
  anilai:double;
begin
  anilai := StrToFloat(StringReplace(btncash.Caption,',','',[rfReplaceAll]));
  edtCash.Text := FormatFloat('###,###,###',anilai);
end;

procedure TfrmCharge.cxButton1Click(Sender: TObject);
var
  s:string;
begin
  if cbJenisCustoemer.ItemIndex < 0 then
  begin
    ShowMessage('Jenis Customer harus di isi ');
    Exit;
  end;
  if edtKembali.text ='' then
     edtKembali.text := '0';
  if StrToFloatDef(StringReplace(edtKembali.text,',','',[rfReplaceAll]),0) < 0 then
  begin
    ShowMessage('Pembayaran Masih Kurang ');
    Exit;
  end
  else
  begin
    s:='update tjual set '
    + ' jl_discount='+stringreplace(edtDisc.Text,',','',[rfReplaceAll]) +','
    + ' jl_cash='+floattostr(StrToFloat(stringreplace(edtCash.Text,',','',[rfReplaceAll]))-nkembali) +','
    + ' jl_card='+stringreplace(edtcard.Text,',','',[rfReplaceAll]) +','
    + ' jl_othervalue='+stringreplace(edtOther.Text,',','',[rfReplaceAll]) +','
    + ' jl_dp='+ stringreplace(edtdp.Text,',','',[rfReplaceAll]) +','
    + ' jl_nomordp ='+quot(NomorUangMuka.Text)+','
    + ' jl_bank='+QuotedStr(cbEdc.Text) +','
    + ' jl_jeniscustomer='+QuotedStr(cbJenisCustoemer.Text) +','
    + ' jl_status=2 ,'
    + ' jl_receipt='+floattostr(nbayar) + ','
    + ' jl_kembali='+floattostr(nkembali) + ','
    + ' jl_tglbayar ='+ quotd(cGetServerTime,True) +','
    + ' jl_userkasir ='+ QuotedStr(frmMenu.KDUSER)+','
    + ' jl_other='+QuotedStr(cbOther.Text) +' where jl_nomor='+ QuotedStr(IDNOMOR)+';';
   xExecQuery(s,frmMenu.conn);
   s:='update tjual_dtl set jld_status=2 where jld_isdelete =0 and jld_jl_nomor ='+ QuotedStr(IDNOMOR)+';';
      xExecQuery(s,frmMenu.conn);
   s:='update tuangmuka set um_isrealisasi=1 where um_nomor ='+ QuotedStr(IDNOMORDP)+';';
      xExecQuery(s,frmMenu.conn);

      ISSUKSES:= True;
      doprinslip;
    close;
  end;
end;

procedure TfrmCharge.btncash2Click(Sender: TObject);
var
  anilai:double;
begin
  anilai := StrToFloat(StringReplace(btnCash2.caption,',','',[rfReplaceAll]));
  edtCash.Text := FormatFloat('###,###,###',anilai);
end;

procedure TfrmCharge.cbEdcPropertiesChange(Sender: TObject);
begin
IF cbEdc.Text = '' then
   edtCard.Text := '0'
else
   edtCard.Text := lblTotal.Caption;
end;

procedure TfrmCharge.cbOtherPropertiesChange(Sender: TObject);
begin
IF cbOther.Text = '' then
   edtOther.Text := '0'
else
   edtOther.Text := lblTotal.Caption;
end;

procedure TfrmCharge.btncash3Click(Sender: TObject);
var
  anilai:double;
begin
  anilai := StrToFloat(StringReplace(btnCash3.caption,',','',[rfReplaceAll]));
  edtCash.Text := FormatFloat('###,###,###',anilai);
end;


procedure TfrmCharge.doprinslip;
var
  s: string ;
  ftsreport : TTSReport;
begin

  ftsreport := TTSReport.Create(nil);
  try
    ftsreport.Nama := 'charge';
    if StrToFloatDef(stringreplace(edtCash.Text,',','',[rfReplaceAll]),0) > 0 then
       zprinter := frmMenu.aPRINTER2
    else
       zprinter := frmMenu.aPRINTER;

          s:= ' select '
       + ' *,'+Quot(zNamaProfile)+ ' as znama ,'
       +Quot(zAddress)+ ' as zalamat ,'
       +Quot(zNotelp)+ ' as znotelp ,'
       +Quot(zFooter)+ ' as zfooter '
       + ' from tjual '
       + ' inner join tjual_dtl on jl_nomor=jld_jl_nomor'
       + ' inner join titem on item_id=jld_item'
       + ' where '
       + ' jl_nomor=' + quot(IDNOMOR)
       + ' and jld_isdelete =0'
       + ' order by jld_salestype,jld_nourut';
    ftsreport.AddSQL(s);

    ftsreport.ShowReport;
  finally
     ftsreport.Free;
  end;
end;
procedure TfrmCharge.cxButton2Click(Sender: TObject);
var
  s:string;
  tsql: TSQLQuery;
begin
 Application.CreateForm(TfrmListdp,frmListdp);
  frmListdp.ShowModal;

  NomorUangMuka.Text := IDNOMORDP;
  s:='select um_nomor,um_customer,um_nilai,um_jenisbayar from tuangmuka where um_nomor='+Quot(NomorUangMuka.Text);
  tsql := xOpenQuery(s,frmMenu.conn);
  with tsql do
  begin
    try
      if not eof then
      begin
        edtnamaDP.Text := fieldbyname('um_customer').AsString;
        edtDP.Text := fieldbyname('um_nilai').AsString;
        hitung;
        IDNOMORDP:='';
      end;
     finally
       Free;
    end;
  end;

end;

end.
