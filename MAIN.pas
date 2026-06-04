
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}                           
{$WARN UNIT_DEPRECATED ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}           
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
unit MAIN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, SqlExpr, ComCtrls, jpeg, ExtCtrls, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, cxLookAndFeels, dxSkinsForm,
  dxGDIPlusClasses, dxSkinsdxBarPainter, cxGraphics, cxControls,
  cxLookAndFeelPainters, dxRibbonSkins, cxClasses, dxRibbon, dxBar,
    dxNavBarCollns,
  dxNavBarBase, dxNavBar, dxBarDBNav,
  dxSkinsdxRibbonPainter,
   cxPC, dxDockControl,
  dxDockPanel, dxSkinsdxNavBar2Painter ,ShellAPI, ImgList, DBAccess,
  MyAccess, dxNavBarStyles;

type
  TfrmMenu = class(TForm)
    dxSkinController1: TdxSkinController;
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    User1: TMenuItem;
    IdentitasPerusahaan1: TMenuItem;
    Relogin1: TMenuItem;
    dxDockSite1: TdxDockSite;
    dxNavBar2: TdxNavBar;
    dxNavBarGroup1: TdxNavBarGroup;
    dxNavBarGroup2: TdxNavBarGroup;
    dxNavBarGroup3: TdxNavBarGroup;
    dxUser: TdxNavBarItem;
    dxIdentitas: TdxNavBarItem;
    dxRelogin: TdxNavBarItem;
    dxDockPanel1: TdxDockPanel;
    dxLayoutDockSite1: TdxLayoutDockSite;
    dxItem: TdxNavBarItem;
    dxKategori: TdxNavBarItem;
    ImageList1: TImageList;
    Image1: TImage;
    dxmodifier: TdxNavBarItem;
    dxSalesType: TdxNavBarItem;
    dxsalesbyitem: TdxNavBarItem;
    salesbyinv: TdxNavBarItem;
    MyConnection1: TMyConnection;
    dxNavBar2StyleItem1: TdxNavBarStyleItem;
    dxpos: TdxNavBarItem;
    dxcheck: TdxNavBarItem;
    dxNavBar2Group1: TdxNavBarGroup;
    dxlistvoid: TdxNavBarItem;
    dxsetoran: TdxNavBarItem;
    dxPosting: TdxNavBarItem;
    dxDisc: TdxNavBarItem;
    Accounting1: TMenuItem;
    Rekening1: TMenuItem;
    JurnalUmum1: TMenuItem;
    BrowseJurnal1: TMenuItem;
    BukuBesar1: TMenuItem;
    dxStokIn: TdxNavBarItem;
    dxlapstok: TdxNavBarItem;
    dxreturproduksi: TdxNavBarItem;
    dxKoreksiStok: TdxNavBarItem;
    dxbiayalain: TdxNavBarItem;
    dxUangMuka: TdxNavBarItem;
    dxPendapatanlain: TdxNavBarItem;
    dxAbsensi: TdxNavBarItem;
    dxBayarCustomer: TdxNavBarItem;
    LapUmurHutang1: TMenuItem;
    ListFakturOutstanding1: TMenuItem;
    Utulity1: TMenuItem;
    procedure FileExit1Execute(Sender: TObject);
    function ShowForm(AFormClass: TFormClass): TForm;
    procedure Maximized1Click(Sender: TObject);

    procedure FormShow(Sender: TObject);
    procedure bacafile;

    procedure Exit1Click(Sender: TObject);
    procedure frmUserClick(Sender: TObject);
    procedure frmRELoginClick(Sender: TObject);
    procedure dxNavBar1Item1Click(Sender: TObject);
    procedure dxReloginClick(Sender: TObject);
    procedure Relogin1Click(Sender: TObject);
    procedure dxDockPanel1AutoHideChanged(
  Sender: TdxCustomDockControl);
    procedure dxSalesTypeClick(Sender: TObject);
    procedure dxKategoriClick(Sender: TObject);
    procedure dxmodifierClick(Sender: TObject);
    procedure dxItemClick(Sender: TObject);
    procedure dxposClick(Sender: TObject);
    procedure dxIdentitasClick(Sender: TObject);
    procedure dxUserClick(Sender: TObject);
    procedure salesbyinvClick(Sender: TObject);
    procedure dxsalesbyitemClick(Sender: TObject);
    procedure dxcheckClick(Sender: TObject);
    procedure dxlistvoidClick(Sender: TObject);
    procedure dxsetoranClick(Sender: TObject);
    procedure dxPostingClick(Sender: TObject);
    procedure dxDiscClick(Sender: TObject);
    procedure Rekening1Click(Sender: TObject);
    procedure JurnalUmum1Click(Sender: TObject);
    procedure BrowseJurnal1Click(Sender: TObject);
    procedure BukuBesar1Click(Sender: TObject);
    procedure dxStokInClick(Sender: TObject);
    procedure dxlapstokClick(Sender: TObject);
    procedure dxreturproduksiClick(Sender: TObject);
    procedure dxKoreksiStokClick(Sender: TObject);
    procedure dxbiayalainClick(Sender: TObject);
    procedure dxUangMukaClick(Sender: TObject);
    procedure dxPendapatanlainClick(Sender: TObject);
    procedure dxAbsensiClick(Sender: TObject);
    procedure dxBayarCustomerClick(Sender: TObject);
//    procedure LapUmurHutang1Click(Sender: TObject);
    procedure ListFakturOutstanding1Click(Sender: TObject);



  private
    { Private declarations }

    FaDatabase: string;
    FaHost: string;
    Fapassword: string;
    Fauser: string;
    Fapathimage : string;
    Fprinter : string;
    Fprinter2 : string;

    ishak : Boolean;
  public
    { Public declarations }
    conn: TSQLConnection;
        KDUSER,NMUSER,KDCABANG,NMCABANG,USERID : String;
        otorisasi : Boolean;
      property aDatabase: string read FaDatabase write FaDatabase;
      property aHost: string read FaHost write FaHost;
      property apassword: string read Fapassword write Fapassword;
      property apathimage: string read Fapathimage write Fapathimage;
      property auser: string read Fauser write Fauser;
      property aPRINTER: string read Fprinter write Fprinter;
      property aPRINTER2: string read Fprinter2 write Fprinter2;

  end;

var

  frmMenu: TfrmMenu;

//  for help / bantuan...
  xCancel : boolean;
  xkembali : double;
  varglobal : string;
  varglobal1 : string;
  varglobal2 : string;
  sqlbantuan : string;
  sqlfilter : string;
  zVersi:string;
  IDSKU :integer;
  IEDIT : integer;
  IDBARANG :string;
  IDNOURUT : Integer;
  IDNOMOR : string;
  IDNOMORDP : string;  
  IDMEJA:string;
  IDCustomer:string;
  idHP :string;
  IDOTORISASI,ISSUKSES:Boolean;
  ISSOUND : boolean;
  zNamaProfile,zAddress,zNotelp,zFooter,zotorisasi,zprinter :string;
  zTax,zSc :double;
  ynomor :String;
implementation
 uses Ulib,uModuleConnection,ufrmUser, UfrmLogin,ufrmsalestype,ufrmCategory,
 ufrmModifier,ufrmitem,ufrmpos,ufrmperusahaan,ufrmBrowseSalesbyInv,ufrmListJual,
 ufrmCheckList,ufrmlistvoid,ufrmbrowsesetoran,ufrmbrowseposting,ufrmdiscount,ufrmbrowserekening,
 ufrmBrowseJurnalUmum,ufrmBrowsejurnal2,ufrmListKas,ufrmStokIn,ufrmLapStok,ufrmReturn ,ufrmkoreksistok,
 ufrmBrowsePembayaranLain,ufrmbrowseuangmuka,ufrmBrowsePendapatanLain,ufrmBrowseAbsensi,
 ufrmVerifikasiAbsensi,ufrmBrowseBayarCustomer,ufrmListFOS;
{$R *.dfm}


procedure TfrmMenu.FileExit1Execute(Sender: TObject);
begin
  application.terminate;
end;

function TfrmMenu.ShowForm(AFormClass: TFormClass): TForm;
var
  aForm: TForm;
  i: Integer;
  s:string;
  tsql:TSQLQuery;
begin
//  inherited;

//         try
//           frmmenu.conn := xCreateConnection(ctMySQL,frmmenu.aHost,frmmenu.aDatabase,frmmenu.auser,frmmenu.apassword);
//          except
//         end;
    s:='select * from tprofile';
    tsql:=xOpenQuery(s,frmMenu.conn);
    with tsql do
    begin
      try
        zNamaProfile:=Fields[0].AsString;
        zAddress := fields[1].AsString;
        zNotelp := fields[2].AsString;
        zFooter :=fields[3].AsString;
        zSc := StrToFloat(Fields[4].AsString);
        ztax := StrToFloat(Fields[5].AsString);
        zotorisasi :=fields[6].AsString;

      finally
        free;
      end;
    end;
// SETING PROFIL

//---------------------

  for i := 0 to MDIChildCount - 1 do
  begin
    if MDIChildren[i].ClassName = AFormClass.ClassName then
    begin
      Result := MDIChildren[i];
      // mdiChildrenTabs.TabIndex := GetTabSetIndex(Result);
      Exit;
    end;
  end;

  aForm := AFormClass.Create(Application);
  aForm.FormStyle := fsMDIChild;
//  aForm.Position := poDefault;


//  aForm.WindowState := wsMaximized;
  Result := (aForm as AFormClass);

end;

procedure TfrmMenu.Maximized1Click(Sender: TObject);
begin
  if MDIChildCount <> 0 then
   ActiveMDIChild.WindowState := wsMaximized;
end;

procedure TfrmMenu.FormShow(Sender: TObject);
var
   sql:string;
   tsql:TSQLQuery;
    AppVersi,DbVersi:Double;
begin

      bacafile;
      StatusBar1.Panels[1].Text := 'Connected  to ' + aHost;
      StatusBar1.Panels[2].Text := 'Database  ' + aDatabase;
      conn := xCreateConnection(ctMySQL,aHost,aDatabase,auser,apassword);
      MyConnection1.Username := auser;
      MyConnection1.Password := apassword;
      MyConnection1.Database := aDatabase;
      MyConnection1.Server := aHost ;
      MyConnection1.Connected:= true;
      ThousandSeparator:=',';
      ShortDateFormat := 'M/d/yyyy';
      DateSeparator   := '/';
      DecimalSeparator:= '.';
      zVersi:='5.0.5';
      StatusBar1.Panels[4].Text := 'Versi ' + zversi;
      Application.UpdateFormatSettings:=True;
// cek ver si
  sql:='select versi from tversi where aplikasi="Resto"';
  tsql := xOpenQuery(sql,frmmenu.conn);
  AppVersi:=StrToFloat(StringReplace(zVersi,'.','',[rfReplaceAll]));
  DbVersi:=StrToFloat(StringReplace(tsql.FieldByName('versi').AsString,'.','',[rfReplaceAll]));
  if AppVersi<dbVersi then
  begin
    ShowMessage('Program belum Update, Hubungi Programmer');
    Application.Terminate;
  end;
  frmLogin.Show;
end;

procedure TfrmMenu.bacafile;
 var
 ltemp : TStringList;

 begin
 ltemp := TStringList.Create;
 ltemp.loadfromfile(ExtractFileDir(application.ExeName) + '\' + 'default.cfg');
   aHost     := ltemp[0];
   aDatabase := ltemp[1];
   auser     := ltemp[2];
   apassword := ltemp [3];
   apathimage := ltemp [5];
   aprinter := ltemp [6];
   aprinter2 := ltemp [7];

   ltemp.free;
 end;


procedure TfrmMenu.Exit1Click(Sender: TObject);
begin
 Close;
end;

procedure TfrmMenu.frmUserClick(Sender: TObject);
begin
  if ( not ceKVIEW(frmMenu.KDUSER,'ufrmuser')) then
        begin
           MessageDlg('Anda tidak berhak Membuka di Modul ini',mtWarning, [mbOK],0);
           ishak:=False;
           Exit;
        End
        else
           ishak:= True;

  if ActiveMDIChild.Caption <> 'Master User' then
 begin
    ShowForm(TfrmUser).Show;

 end;
     if ishak then
    ActiveMDIChild.WindowState := wsMaximized;

end;

procedure TfrmMenu.frmRELoginClick(Sender: TObject);
var
  i : Integer;
begin
   for i := 0 to MDIChildCount - 1 do
   begin
      MDIChildren[i].Release;
   end;
   Self.Enabled := False;
   frmlogin.edtuser.Clear;
   frmlogin.edtPassword.Clear;
   frmLogin.Show;
end;


procedure TfrmMenu.dxNavBar1Item1Click(Sender: TObject);
begin
frmUserClick(self);
end;


procedure TfrmMenu.dxReloginClick(Sender: TObject);
var
  i : Integer;
begin
   for i := 0 to MDIChildCount - 1 do
  begin
      MDIChildren[i].Release;
  end;
   Self.Enabled := False;
   frmlogin.edtuser.Clear;
   frmlogin.edtPassword.Clear;
   frmLogin.Show;

end;





procedure TfrmMenu.Relogin1Click(Sender: TObject);
var
  i : Integer;
begin
   for i := 0 to MDIChildCount - 1 do
  begin
      MDIChildren[i].Release;
  end;
   Self.Enabled := False;
   frmlogin.edtuser.Clear;
   frmlogin.edtPassword.Clear;
   frmLogin.Show;

end;


procedure TfrmMenu.dxDockPanel1AutoHideChanged(
  Sender: TdxCustomDockControl);
begin
  if dxDockPanel1.AutoHide then
     dxDockSite1.Width := 24
  else
     dxDockSite1.Width := 200;
end;


procedure TfrmMenu.dxSalesTypeClick(Sender: TObject);
begin
  if ( not ceKVIEW(frmMenu.KDUSER,'ufrmSalestype')) then
        begin
           MessageDlg('Anda tidak berhak Membuka di Modul ini',mtWarning, [mbOK],0);
           ishak:=False;
           Exit;
        End
        else
           ishak:= True;

   if ActiveMDIChild.Caption <> 'Sales Type' then
 begin
    ShowForm(Tfrmsalestype).Show;
    if ishak then
    ActiveMDIChild.WindowState := wsMaximized;
 end;

end;

procedure TfrmMenu.dxKategoriClick(Sender: TObject);
begin
  if ( not ceKVIEW(frmMenu.KDUSER,'ufrmcategory')) then
        begin
           MessageDlg('Anda tidak berhak Membuka di Modul ini',mtWarning, [mbOK],0);
           ishak:=False;
           Exit;
        End
        else
           ishak:= True;

     if ActiveMDIChild.Caption <> 'Category' then
 begin
    ShowForm(TfrmCategory).Show;
    if ishak then
    ActiveMDIChild.WindowState := wsMaximized;
 end;


end;

procedure TfrmMenu.dxmodifierClick(Sender: TObject);
begin
 if ( not ceKVIEW(frmMenu.KDUSER,'ufrmModifier')) then
        begin
           MessageDlg('Anda tidak berhak Membuka di Modul ini',mtWarning, [mbOK],0);
           ishak:=False;
           Exit;
        End
        else
           ishak:= True;

      if ActiveMDIChild.Caption <> 'Modifier' then
 begin
    ShowForm(TfrmModifier).Show;
    if ishak then
    ActiveMDIChild.WindowState := wsMaximized;
 end;

end;

procedure TfrmMenu.dxItemClick(Sender: TObject);
begin
  if ( not ceKVIEW(frmMenu.KDUSER,'ufrmitem')) then
        begin
           MessageDlg('Anda tidak berhak Membuka di Modul ini',mtWarning, [mbOK],0);
           ishak:=False;
           Exit;
        End
        else
           ishak:= True;

      if ActiveMDIChild.Caption <> 'Item' then
 begin
    ShowForm(TfrmItem).Show;
    if ishak then
    ActiveMDIChild.WindowState := wsMaximized;
 end;

end;

procedure TfrmMenu.dxposClick(Sender: TObject);
begin
  if ( not ceKVIEW(frmMenu.KDUSER,'ufrmPos')) then
        begin
           MessageDlg('Anda tidak berhak Membuka di Modul ini',mtWarning, [mbOK],0);
           ishak:=False;
           Exit;
        End
        else
           ishak:= True;

if ActiveMDIChild.Caption <> 'Point of Sale' then
 begin
    ShowForm(TfrmPos).Show;
    if ishak then
    ActiveMDIChild.WindowState := wsMaximized;

 end;

end;

procedure TfrmMenu.dxIdentitasClick(Sender: TObject);
begin
  if ( not ceKVIEW(frmMenu.KDUSER,'ufrmPerusahaan')) then
        begin
           MessageDlg('Anda tidak berhak Membuka di Modul ini',mtWarning, [mbOK],0);
           ishak:=False;
           Exit;
        End
        else
           ishak:= True;

if ActiveMDIChild.Caption <> 'Perusahaan' then
 begin
    ShowForm(TfrmPerusahaan).Show;
    if ishak then
    ActiveMDIChild.WindowState := wsMaximized;
 end;

end;

procedure TfrmMenu.dxUserClick(Sender: TObject);
begin
  if ( not ceKVIEW(frmMenu.KDUSER,'ufrmUser')) then
        begin
           MessageDlg('Anda tidak berhak Membuka di Modul ini',mtWarning, [mbOK],0);
           ishak:=False;
           Exit;
        End
        else
           ishak:= True;

if ActiveMDIChild.Caption <> 'Master User' then
 begin
    ShowForm(TfrmUser).Show;
    if ishak then
   ActiveMDIChild.WindowState := wsMaximized;
 end;

end;

procedure TfrmMenu.salesbyinvClick(Sender: TObject);
begin
  if ( not ceKVIEW(frmMenu.KDUSER,'ufrmBrowseSalesbyInv')) then
        begin
           MessageDlg('Anda tidak berhak Membuka di Modul ini',mtWarning, [mbOK],0);
           ishak:=False;
           Exit;
        End
        else
           ishak:= True;

if ActiveMDIChild.Caption <> 'Browse Sales by Inv' then
 begin
    ShowForm(TfrmBrowseSalesByInv).Show;
    if ishak then
   ActiveMDIChild.WindowState := wsMaximized;
 end;

end;

procedure TfrmMenu.dxsalesbyitemClick(Sender: TObject);
begin
  if ( not ceKVIEW(frmMenu.KDUSER,'ufrmlistjual')) then
        begin
           MessageDlg('Anda tidak berhak Membuka di Modul ini',mtWarning, [mbOK],0);
           ishak:=False;
           Exit;
        End
        else
           ishak:= True;

if ActiveMDIChild.Caption <> 'Sales by item' then
 begin
    ShowForm(TfrmListJual).Show;
    if ishak then
   ActiveMDIChild.WindowState := wsMaximized;
 end;


end;

procedure TfrmMenu.dxcheckClick(Sender: TObject);
begin
  if ( not ceKVIEW(frmMenu.KDUSER,'ufrmChecklist')) then
        begin
           MessageDlg('Anda tidak berhak Membuka di Modul ini',mtWarning, [mbOK],0);
           ishak:=False;
           Exit;
        End
        else
           ishak:= True;

if ActiveMDIChild.Caption <> 'Check List Order' then
 begin
    ShowForm(TfrmCheckList).Show;
    if ishak then
   ActiveMDIChild.WindowState := wsMaximized;
 end;


end;

procedure TfrmMenu.dxlistvoidClick(Sender: TObject);
begin
if ActiveMDIChild.Caption <> 'List Void' then
 begin
    ShowForm(TfrmListvoid).Show;
    if ishak then
   ActiveMDIChild.WindowState := wsMaximized;
 end;

end;

procedure TfrmMenu.dxsetoranClick(Sender: TObject);
begin
    if ( not ceKVIEW(frmMenu.KDUSER,'ufrmBrowseSetoran')) then
        begin
           MessageDlg('Anda tidak berhak Membuka di Modul ini',mtWarning, [mbOK],0);
           ishak:=False;
           Exit;
        End
        else
           ishak:= True;

if ActiveMDIChild.Caption <> 'Browse Setoran' then
 begin
    ShowForm(TfrmBrowsesetoran).Show;
    if ishak then
   ActiveMDIChild.WindowState := wsMaximized;
 end;

end;

procedure TfrmMenu.dxPostingClick(Sender: TObject);
begin
    if ( not ceKVIEW(frmMenu.KDUSER,'ufrmPosting')) then
        begin
           MessageDlg('Anda tidak berhak Membuka di Modul ini',mtWarning, [mbOK],0);
           ishak:=False;
           Exit;
        End
        else
           ishak:= True;

if ActiveMDIChild.Caption <> 'Browse Posting' then
 begin
    ShowForm(TfrmBrowsePosting).Show;
    if ishak then
   ActiveMDIChild.WindowState := wsMaximized;
 end;

end;

procedure TfrmMenu.dxDiscClick(Sender: TObject);
begin
    if ( not ceKVIEW(frmMenu.KDUSER,'ufrmDiscount')) then
        begin
           MessageDlg('Anda tidak berhak Membuka di Modul ini',mtWarning, [mbOK],0);
           ishak:=False;
           Exit;
        End
        else
           ishak:= True;

if ActiveMDIChild.Caption <> 'Discount' then
 begin
    ShowForm(TfrmDiscount).Show;
    if ishak then
   ActiveMDIChild.WindowState := wsMaximized;
 end;

end;

procedure TfrmMenu.Rekening1Click(Sender: TObject);
begin
   if ( not ceKVIEW(frmMenu.KDUSER,'ufrmRekening')) then
        begin
           MessageDlg('Anda tidak berhak Membuka di Modul ini',mtWarning, [mbOK],0);
           ishak:=False;
           Exit;
        End
        else
           ishak:= True;

if ActiveMDIChild.Caption <> 'Browse Rekening' then
 begin
    ShowForm(TfrmBrowseRekening).Show;
    if ishak then
   ActiveMDIChild.WindowState := wsMaximized;
 end;
end;

procedure TfrmMenu.JurnalUmum1Click(Sender: TObject);
begin
  if ( not ceKVIEW(frmMenu.KDUSER,'ufrmjurnalumum')) then
        begin
           MessageDlg('Anda tidak berhak Membuka di Modul ini',mtWarning, [mbOK],0);
           ishak:=False;
           Exit;
        End
        else
           ishak:= True;

if ActiveMDIChild.Caption <> 'Browse Jurnal Umum' then
 begin
    ShowForm(TfrmBrowsejurnalumum).Show;
    if ishak then
   ActiveMDIChild.WindowState := wsMaximized;
 end;
end;

procedure TfrmMenu.BrowseJurnal1Click(Sender: TObject);
begin
    if ( not ceKVIEW(frmMenu.KDUSER,'ufrmjurnal2')) then
        begin
           MessageDlg('Anda tidak berhak Membuka di Modul ini',mtWarning, [mbOK],0);
           ishak:=False;
           Exit;
        End
        else
           ishak:= True;

if ActiveMDIChild.Caption <> 'List Jurnal' then
 begin
    ShowForm(TfrmBrowsejurnal2).Show;
    if ishak then
   ActiveMDIChild.WindowState := wsMaximized;
 end;
end;

procedure TfrmMenu.BukuBesar1Click(Sender: TObject);
begin
    if ( not ceKVIEW(frmMenu.KDUSER,'ufrmlistkas')) then
        begin
           MessageDlg('Anda tidak berhak Membuka di Modul ini',mtWarning, [mbOK],0);
           ishak:=False;
           Exit;
        End
        else
           ishak:= True;

 if ActiveMDIChild.Caption <> 'Buku Besar' then
 begin
    ShowForm(Tfrmlistkas).Show;
    if ishak then
   ActiveMDIChild.WindowState := wsMaximized;
 end;
end;

procedure TfrmMenu.dxStokInClick(Sender: TObject);
begin
   if ( not ceKVIEW(frmMenu.KDUSER,'ufrmStokIn')) then
        begin
           MessageDlg('Anda tidak berhak Membuka di Modul ini',mtWarning, [mbOK],0);
           ishak:=False;
           Exit;
        End
        else
           ishak:= True;

 if ActiveMDIChild.Caption <> 'Stok In' then
 begin
    ShowForm(TfrmStokIn).Show;
    if ishak then
   ActiveMDIChild.WindowState := wsMaximized;
 end;
end;

procedure TfrmMenu.dxlapstokClick(Sender: TObject);
begin
    if ( not ceKVIEW(frmMenu.KDUSER,'ufrmLapStok')) then
        begin
           MessageDlg('Anda tidak berhak Membuka di Modul ini',mtWarning, [mbOK],0);
           ishak:=False;
           Exit;
        End
        else
           ishak:= True;

if ActiveMDIChild.Caption <> 'Lap. Stok' then
 begin
    ShowForm(TfrmLapStok).Show;
    if ishak then
   ActiveMDIChild.WindowState := wsMaximized;
 end;

end;
procedure TfrmMenu.dxreturproduksiClick(Sender: TObject);
begin
   if ( not ceKVIEW(frmMenu.KDUSER,'ufrmReturn')) then
        begin
           MessageDlg('Anda tidak berhak Membuka di Modul ini',mtWarning, [mbOK],0);
           ishak:=False;
           Exit;
        End
        else
           ishak:= True;

if ActiveMDIChild.Caption <> 'Return Production' then
 begin
    ShowForm(TfrmReturn).Show;
    if ishak then
   ActiveMDIChild.WindowState := wsMaximized;
 end;
end;

procedure TfrmMenu.dxKoreksiStokClick(Sender: TObject);
begin
   if ( not ceKVIEW(frmMenu.KDUSER,'ufrmKoreksiStok')) then
        begin
           MessageDlg('Anda tidak berhak Membuka di Modul ini',mtWarning, [mbOK],0);
           ishak:=False;
           Exit;
        End
        else
           ishak:= True;

if ActiveMDIChild.Caption <> 'Koreksi Stok' then
 begin
    ShowForm(TfrmKoreksiStok).Show;
    if ishak then
   ActiveMDIChild.WindowState := wsMaximized;
 end;
end;

procedure TfrmMenu.dxbiayalainClick(Sender: TObject);
begin
   if ( not ceKVIEW(frmMenu.KDUSER,'ufrmPembayaranlain')) then
        begin
           MessageDlg('Anda tidak berhak Membuka di Modul ini',mtWarning, [mbOK],0);
           ishak:=False;
           Exit;
        End
        else
           ishak:= True;

if ActiveMDIChild.Caption <> 'Browse Pembayaran Lain Lain' then
 begin
    ShowForm(TfrmBrowsePembayaranLain).Show;
    if ishak then
   ActiveMDIChild.WindowState := wsMaximized;
 end;

end;

procedure TfrmMenu.dxUangMukaClick(Sender: TObject);
begin
if ActiveMDIChild.Caption <> 'Browse UangMuka' then
 begin
    ShowForm(TfrmBrowseUangMuka).Show;
    if ishak then
   ActiveMDIChild.WindowState := wsMaximized;
 end;

end;

procedure TfrmMenu.dxPendapatanlainClick(Sender: TObject);
begin
if ActiveMDIChild.Caption <> 'Browse Pendapatan Lain Lain' then
 begin
    ShowForm(TfrmBrowsePendapatanlain).Show;
    if ishak then
   ActiveMDIChild.WindowState := wsMaximized;
 end;

end;

procedure TfrmMenu.dxAbsensiClick(Sender: TObject);
begin
if ActiveMDIChild.Caption <> 'Verifikasi Absen' then
 begin
    ShowForm(TfrmVerifikasiAbsensi).Show;
    if ishak then
   ActiveMDIChild.WindowState := wsMaximized;
 end;

end;

procedure TfrmMenu.dxBayarCustomerClick(Sender: TObject);
begin
  if ActiveMDIChild.Caption <> 'Pembayaran Cusotmer' then
 begin
    ShowForm(TfrmBrowseBayarCustomer).Show;
    if ishak then
   ActiveMDIChild.WindowState := wsMaximized;
 end;      
end;

//procedure TfrmMenu.LapUmurHutang1Click(Sender: TObject);
//begin
//    if ActiveMDIChild.Caption <> 'Lap. Umur Hutang' then
//   begin
//      ShowForm(TfrmListIos).Show;
//   end;
//end;


procedure TfrmMenu.ListFakturOutstanding1Click(Sender: TObject);
begin
 if ActiveMDIChild.Caption <> 'List Faktur Outstanding' then
 begin
    ShowForm(TfrmListFOS).Show;
 end;
end;

end.
