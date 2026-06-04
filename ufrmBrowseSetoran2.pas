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
   uses ufrmsetoran,Ulib, MAIN, uModuleConnection;
{$R *.dfm}

procedure TfrmBrowseSetoran.btnRefreshClick(Sender: TObject);
begin
  Self.SQLMaster := 'SELECT user_nama Kasir,Tanggal,Setoran,Selisih,Cash,Card,Other '
+ ' FROM tbukakasir a INNER JOIN tuser b ON a.user_kode=b.user_kode'
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
    cxGrdMaster.Columns[2].Summary.FooterKind:=skSum;
    cxGrdMaster.Columns[2].Summary.FooterFormat:='###,###,###,###';

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
  s:String;
  aselisih,acash,acard,avoucher:double;
  tsql:TSQLQuery;
begin
  panelmemo.visible := true;
  s:='SELECT SUM(so_dp),SUM(so_card),SUM(so_voucher) FROM tso_hdr '
  + ' WHERE so_tanggal='+QuotedStr(FormatDateTime('yyyy-mm-dd',CDSMaster.FieldByname('tanggal').AsDateTime))
  + ' AND so_user_kasir ='+QuotedStr(CDSMaster.FieldByname('kasir').AsString);
  tsql :=xOpenQuery(s,frmmenu.conn);
  with tsql do
  begin
    try
      acash := Fields[0].AsFloat;
      acard := Fields[1].AsFloat;
      avoucher := Fields[2].AsFloat;
      aselisih :=strtofloat(StringReplace(CDSMaster.FieldByname('setoran').AsString,',','',[rfReplaceAll])) - Fields[0].AsFloat;
     finally
       free;
     end
  end;

  doslip3;


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
     + ' where a.user_kode='+ CDSMaster.FieldByname('kasir').AsString
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
