unit uFrmDetailItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AdvEdit, Grids, BaseGrid, AdvGrid, DBAdvGrd, ExtCtrls,
  AdvPanel, FMTBcd, DB, DBClient, Provider, SqlExpr, AdvCombo, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Menus, cxButtons,cxCurrencyEdit, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue, cxContainer, cxLabel, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, cxCheckBox, MemDS, DBAccess, MyAccess,jpeg,strutils;

type
  TfrmDetailItem = class(TForm)
    AdvPanel4: TAdvPanel;
    SQLQuery1: TSQLQuery;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    ds2: TDataSource;
    cxStyleRepository3: TcxStyleRepository;
    cxStyle3: TcxStyle;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle2: TcxStyle;
    pnlHeader: TAdvPanel;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    lblnama: TcxLabel;
    cxStyle1: TcxStyle;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle4: TcxStyle;
    pnlRemove: TAdvPanel;
    cxremove: TcxButton;
    AdvPanel1: TAdvPanel;
    AdvPanel2: TAdvPanel;
    AdvPanel3: TAdvPanel;
    Label1: TLabel;
    edtqty: TAdvEdit;
    cxButton5: TcxButton;
    cxButton6: TcxButton;
    pnlvarian: TAdvPanel;
    Label2: TLabel;
    cbVarian: TcxComboBox;
    pnlModifier: TAdvPanel;
    Label3: TLabel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGrid1DBTableView1Column4: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    pnlsalestype: TAdvPanel;
    Label4: TLabel;
    cbsalestype: TcxComboBox;
    AdvPanel5: TAdvPanel;
    Label5: TLabel;
    edtNotes: TAdvEdit;
    AdvPanel6: TAdvPanel;
    Image1: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnTutupClick(Sender: TObject);
    procedure cxremoveClick(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure hitung;
    procedure hitung2;
    procedure FormCreate(Sender: TObject);
    procedure cbVarianPropertiesEditValueChanged(Sender: TObject);
    function GetCDS: TClientDataSet;
    procedure cxGrid1DBTableView1Column3PropertiesEditValueChanged(
      Sender: TObject);
//    function getmaxkode:string;
    function getnourut(auser:string):integer;
    procedure cxGrid1DBTableView1StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure cxButton5Click(Sender: TObject);
    function cekisprint(NOMOR :string;NOURUT:integer;KDUSER:string): Boolean;
  private
    { Private declarations }
    Fanamaform: string;
    FCDSMaster: TClientDataset;
    xnama :string;
    xprice : double;
    aharga  : double;
    ahrgfinal:double ;
    protected
    FCDS: TClientDataSet;
  public
    SQLMaster : string;
     property anamaform: string read Fanamaform write Fanamaform;
    property CDSMaster: TClientDataset read FCDSMaster write FCDSMaster;
    property CDS: TClientDataSet read GetCDS write FCDS;
    { Public declarations }
  end;

var
  frmDetailItem: TfrmDetailItem;

implementation
  uses MAIN,ulib,ufrmpos,uModuleConnection,ufrmOtorisasi;
{$R *.dfm}

procedure TfrmDetailItem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=caFree;
end;

procedure TfrmDetailItem.btnTutupClick(Sender: TObject);
begin
      Close;
end;

procedure TfrmDetailItem.cxremoveClick(Sender: TObject);
var
  s:string;
begin
  if cekisprint(IDNOMOR,IDNOURUT,frmMenu.KDUSER) then
  begin
       Application.CreateForm(Tfrmotorisasi,frmotorisasi);
       frmotorisasi.ShowModal;
       if  IDOTORISASI then
       begin
         if idnomor <> '' then
          s:='update tjual_dtl set jld_isdelete=1   where jld_nourut='+ IntToStr(IDNOURUT)
          + ' and jld_jl_nomor  =' + Quot(IDNOMOR) + ';'
         else
         s:='update tjual_dtl set jld_isdelete=1   where jld_nourut='+ IntToStr(IDNOURUT) + ' and jld_user = '+ Quot(frmMenu.KDUSER)
         + ' and jld_jl_nomor  =' + Quot(IDNOMOR) + ';';
         xExecQuery(s,frmMenu.conn);
         IDOTORISASI:= False;
       end;
// print void / delete


  end
  else
  begin
  if IDNOURUT > 0 then
  begin
    if idnomor <> '' then
        s:='delete from tjual_dtl where jld_nourut='+ IntToStr(IDNOURUT) 
    + ' and jld_jl_nomor  =' + Quot(IDNOMOR) + ';'
    else
    s:='delete from tjual_dtl where jld_nourut='+ IntToStr(IDNOURUT) + ' and jld_user = '+ Quot(frmMenu.KDUSER)
    + ' and jld_jl_nomor  =' + Quot(IDNOMOR) + ';';
    xExecQuery(s,frmMenu.conn);
  end;
  end;
      Close;

end;

procedure TfrmDetailItem.cxButton4Click(Sender: TObject);
begin
     edtQty.Text := IntToStr(StrToInt(edtQty.Text)+1);
  hitung;
end;

procedure TfrmDetailItem.cxButton2Click(Sender: TObject);
var
  s:string;
  xmodifier : string;
begin
  if cekisprint(IDNOMOR,IDNOURUT,frmMenu.KDUSER) then
  begin
    showmessage('ITEM INI SUDAH DI SAVE BILL/ PRINTED Tidak dapat di edit');
    exit;
  END;
  hitung2;
  cds.First;
  xmodifier := '' ;
  while not cds.Eof do
  begin
    if cds.FieldByName('chek').AsInteger = 1 then
       xmodifier := xmodifier + cds.fieldbyname('opsi').AsString+chr(13) ;
       cds.next;
  end;
  if IDNOURUT > 0 then
  begin
    s:='delete from tjual_dtl where jld_nourut='+ IntToStr(IDNOURUT) + ' and jld_user = '+ Quot(frmMenu.KDUSER)
    + ' and jld_jl_nomor  =' + Quot(IDNOMOR) + ';';
    xExecQuery(s,frmMenu.conn);
  end;

  s:='insert into tjual_dtl (jld_jl_nomor,jld_item,jld_qty,jld_price,jld_varian,'
  + ' jld_modifier,jld_salestype,jld_nourut,jld_user,jld_notes,jld_disc) values ('
  + Quot(IDNOMOR)+ ','
  + IDBARANG + ','
  + edtqty.Text + ','
  + FloatToStr(ahrgfinal)+','
  + Quot(cbVarian.Text)+','
  + Quot(xmodifier) +','
  + Quot(cbsalestype.Text)+','
  + IntToStr(getnourut(frmMenu.kduser))+','
  + Quot(frmMenu.KDUSER)+','
  + Quot(edtNotes.Text)+','
  + getnama('tcategory','ct_nama',getnama('titem','item_id',IDBARANG,'item_category'),'ct_disc')
  +');';
  xExecQuery(s,frmMenu.conn);

//        frmpos.CDS.Append;
//        frmpos.CDS.FieldByName('nama').AsString        := getnama('titem','item_id',IDBARANG,'item_nama')+chr(13)+cbsalestype.Text
//        +chr(13)+cbVarian.Text+chr(13)+xmodifier;
//        frmpos.CDS.FieldByName('qty').AsFloat          := StrToFloat(edtqty.Text);
//        frmpos.CDS.FieldByName('value').AsFloat        := StrToFloat(edtqty.Text)*aharga;
//        frmpos.CDS.FieldByName('salestype').AsString   := cbsalestype.Text;
//        frmpos.CDS.Post;


 close;
end;

procedure TfrmDetailItem.FormShow(Sender: TObject);
var
  s:string;
  tsql:TSQLQuery;
  stream : tmemorystream;
  Jpg: TJpegImage;

begin
  if IDNOURUT > 0  then
  begin
     pnlRemove.Visible := True;
     s:='select item_nama,jld_qty,jld_price,jld_varian,jld_salestype,jld_notes,foto from tjual_dtl inner join titem on item_id=jld_item and jld_nourut='+IntToStr(IDNOURUT)
     + ' and jld_jl_nomor = '+Quot(IDNOMOR);
     tsql := xOpenQuery(s,frmMenu.conn) ;
     with tsql do
     begin
       try
        xnama:=Fields[0].AsString;
        xprice :=Fields[2].AsFloat;
        lblnama.Caption := Fields[0].AsString + ' - ' + FormatFloat('##,###,###',Fields[2].AsFloat*Fields[1].AsFloat);
        cbVarian.Text := Fields[3].AsString;
        cbsalestype.Text := Fields[4].AsString;
        edtNotes.Text    := Fields[5].AsString;
        edtqty.Text := FloatToStr(Fields[1].AsFloat);

         try
           if FieldByName('foto').AsString <> '' then
           begin
             Jpg := TJpegImage.Create;
             stream := tmemorystream.Create;
             tblobfield(FieldByName('foto')).SaveToStream(stream);
             stream.position := 0;
             Jpg.LoadFromStream(stream);
             image1.Picture.Graphic := Jpg;
           end
           else
               Image1.Picture := nil;
         except
         end;

       finally
         Free;
       end;
     end;
 end
 else
 begin
     pnlRemove.Visible := False;
  s:='select item_nama,item_harga,foto from titem where item_id='+ Quot(IDBARANG);

  tsql:= xOpenQuery(s,frmMenu.conn);
  with tsql do
  begin
    try
        xnama:=Fields[0].AsString;
        xprice :=Fields[1].AsFloat;
        lblnama.Caption := Fields[0].AsString + ' - ' + FormatFloat('##,###,###',Fields[1].AsFloat);

         try
           if FieldByName('foto').AsString <> '' then
           begin
             Jpg := TJpegImage.Create;
             stream := tmemorystream.Create;
             tblobfield(FieldByName('foto')).SaveToStream(stream);
             stream.position := 0;
             Jpg.LoadFromStream(stream);
             image1.Picture.Graphic := Jpg;
           end
           else
               Image1.Picture := nil;
         except
         end;

    finally
      Free;
    end;
  end;
  end;

end;

procedure TfrmDetailItem.hitung;
var
  atotal: Double;
  s:string;
  tsql:tsqlquery;
  i:integer;
begin
aharga :=xprice;
  s:= 'select iv_price from titemvarian where iv_item_id='+ Quot(IDBARANG)
  + ' and iv_nama like '+ Quot(cbVarian.Text);
  tsql := xOpenQuery(s,frmMenu.conn);
  with tsql do
  begin
    try
      if Fields[0].AsFloat > 0 then
         aharga:= Fields[0].AsFloat;
    finally
      Free;
    end;
  end;
if CDS.FieldByName('chek').AsString = '1' then
   atotal := (aharga+ CDS.FieldByName('price').Asfloat)*StrToFloat(edtqty.Text)
else
    atotal := (aharga)*StrToFloat(edtqty.Text);

//  i:= cds.RecNo;
//  cds.First;
//  while not cds.eof do
//  begin
//    if cds.FieldByName('chek').AsInteger =1 then
//    begin
//      aharga:=aharga+cds.FieldByName('price').AsFloat;
//    end;
//    cds.next;
//  end;
//  cds.RecNo := i;
  atotal := aharga*StrToFloat(edtqty.Text);
  lblnama.Caption := xnama + ' - ' + FormatFloat('##,###,###',atotal);
  ahrgfinal:= atotal/StrToFloat(edtqty.Text);
end;


procedure TfrmDetailItem.hitung2;
var
  atotal: Double;
  s:string;
  tsql:tsqlquery;
  i:integer;
begin
aharga :=xprice;
  s:= 'select iv_price from titemvarian where iv_item_id='+ Quot(IDBARANG)
  + ' and iv_nama like '+ Quot(cbVarian.Text);
  tsql := xOpenQuery(s,frmMenu.conn);
  with tsql do
  begin
    try
      if Fields[0].AsFloat > 0 then
         aharga:= Fields[0].AsFloat;
    finally
      Free;
    end;
  end;
//if CDS.FieldByName('chek').AsString = '1' then
//   atotal := (aharga+ CDS.FieldByName('price').Asfloat)*StrToFloat(edtqty.Text)
//else
//    atotal := (aharga)*StrToFloat(edtqty.Text);

  i:= cds.RecNo;
  cds.First;
  while not cds.eof do
  begin
    if cds.FieldByName('chek').AsInteger =1 then
    begin
      aharga:=aharga+cds.FieldByName('price').AsFloat;
    end;
    cds.next;
  end;
  cds.RecNo := i;
  atotal := aharga*StrToFloat(edtqty.Text);
  lblnama.Caption := xnama + ' - ' + FormatFloat('##,###,###',atotal);
  ahrgfinal:= atotal/StrToFloat(edtqty.Text);
end;


procedure TfrmDetailItem.FormCreate(Sender: TObject);
var
  s:string;
  tsql:TSQLQuery;
begin
  s:='select iv_nama from titemvarian where iv_item_id='+ Quot(IDBARANG);
  tsql:=xOpenQuery(s,frmMenu.conn);
  with tsql do
  begin
    try
    if  eof then
       pnlVarian.Visible := False;
    First;
    while not eof do
    begin
      cbVarian.Properties.Items.Add(Fields[0].AsString);
      Next;
    end;
   finally
     Free;
   end;
   cbVarian.ItemIndex := 0 ;   
  end;
     TcxDBGridHelper(cxGrid1DBTableView1).LoadFromCDS(CDS, False, False);
  s:='SELECT md_nama modifier,mdo_nama opsi,mdo_price price FROM tmodifieritem  INNER JOIN tmodifieroption ON mdi_md_id=mdo_md_id '
    +  'INNER JOIN tmodifier ON md_id=mdo_md_id'
    + ' WHERE mdi_item='+Quot(IDBARANG);
  tsql:=xOpenQuery(s,frmMenu.conn);
  cds.EmptyDataSet;
  with tsql do
  begin
    try
      if Eof then
       pnlModifier.Visible := false;
      First;
      while not eof do
      begin
        CDS.Append;
        CDS.FieldByName('modifier').AsString    := fieldbyname('modifier').AsString;
        CDS.FieldByName('opsi').AsString        := fieldbyname('opsi').AsString;
        CDS.FieldByName('chek').asinteger        := 0;
        CDS.FieldByName('price').asfloat        := fieldbyname('price').AsFloat;        


        CDS.Post;
        Next;
      end;
    finally
      Free;
    end;
  end;
  cds.first;
    s:='select st_nama from tsalestype order by st_id';
  tsql:=xOpenQuery(s,frmMenu.conn);
  with tsql do
  begin
    try
    if  eof then
       pnlsalestype.Visible := False;
    First;
    while not eof do
    begin
      cbsalestype.Properties.Items.Add(Fields[0].AsString);
      Next;
    end;
   finally
     Free;
   end;
   cbsalestype.ItemIndex := 0 ;
  end;

end;

function TfrmDetailItem.GetCDS: TClientDataSet;
begin
  If not Assigned(FCDS) then
  begin
    FCDS := TClientDataSet.Create(Self);
    zAddField(FCDS, 'Modifier', ftString, False,30);
    zAddField(FCDS, 'opsi', ftString, False,30);
    zAddField(FCDS, 'chek', ftInteger, False,1);
    zAddField(FCDS, 'price', ftfloat, False);

    FCDS.CreateDataSet;
  end;
  Result := FCDS;
end;


procedure TfrmDetailItem.cbVarianPropertiesEditValueChanged(
  Sender: TObject);
begin
hitung;
end;

procedure TfrmDetailItem.cxGrid1DBTableView1Column3PropertiesEditValueChanged(
  Sender: TObject);
  var
    atotal :double;
begin

    If CDS.State <> dsEdit then CDS.Edit;
    if CDS.FieldByName('chek').AsString = '0' then
      CDS.FieldByName('chek').AsString := '1'
    else
      CDS.FieldByName('chek').AsString := '0';
      CDS.post;

//   hitung;
IF ahrgfinal =0 then
begin
   atotal := strtofloat(StringReplace((rightstr(lblnama.caption,length(lblnama.caption)-(pos('-',lblnama.caption)))),',','',[rfReplaceAll]));
   ahrgfinal:= atotal/StrToFloat(edtqty.Text);
end;

if CDS.FieldByName('chek').AsString = '1' then
   atotal := (ahrgfinal+ CDS.FieldByName('price').Asfloat)*StrToFloat(edtqty.Text)
else
    atotal := (ahrgfinal)*StrToFloat(edtqty.Text);
  lblnama.Caption := xnama + ' - ' + FormatFloat('##,###,###',atotal);
//  ahrgfinal:= atotal/StrToFloat(edtqty.Text);
end;

procedure TfrmDetailItem.cxGrid1DBTableView1StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
var
  AColumn : TcxCustomGridTableItem;
begin
  AColumn := (Sender as TcxGridDBTableView).GetColumnByFieldName('CHEK');

  if (AColumn <> nil)  and (ARecord <> nil) and (AItem <> nil) and
     (cVarToFloat(ARecord.Values[AColumn.Index]) > 0) then
    AStyle := cxStyle1;
end;

//function TfrmDetailItem.getmaxkode:string;
//var
//  s:string;
//begin
//  s:='select max(right(jld_jl_nomor,4)) from tjual_dtl where jld_jl_nomor like ' + quot(NOMERATOR+'.'+FormatDateTime('yymm',dtTanggal.Date)+'.%');
//
//  with xOpenQuery(s,frmMenu.conn) do
//  begin
//    try
//      if Fields[0].AsString = '' then
//         result:= NOMERATOR+'.'+FormatDateTime('yymm',dtTanggal.Date)+'.'+RightStr(IntToStr(10000+1),4)
//      else
//         result:= NOMERATOR+'.'+FormatDateTime('yymm',dtTanggal.Date)+'.'+RightStr(IntToStr(10000+fields[0].AsInteger+1),4);
//
//    finally
//      free;
//    end;
//  end;
//
//end;
function TfrmDetailItem.getnourut(auser:String):integer;
var
  s:string;
begin
  if idnomor <> '' then
   s:='select max(jld_nourut) from tjual_dtl where jld_jl_nomor like ' + quot(IDNOMOR)
  else
  s:='select max(jld_nourut) from tjual_dtl where jld_jl_nomor like ' + quot(IDNOMOR)
  + ' and jld_user ='+Quot(auser);

  with xOpenQuery(s,frmMenu.conn) do
  begin
    try
      if Fields[0].AsString = '' then
         result:= 1
      else
         result:= fields[0].AsInteger+1;

    finally
      free;
    end;
  end;

end;


procedure TfrmDetailItem.cxButton5Click(Sender: TObject);
begin
    if StrToInt(edtQty.Text) > 1 then
     edtQty.Text := IntToStr(StrToInt(edtQty.Text)-1);
  hitung;
end;

function TfrmDetailItem.cekisprint(NOMOR :string;NOURUT:integer;KDUSER:string): Boolean;
var
  s:string;
  tsql :tsqlquery;
begin
  Result := false;
  if nomor <> '' then
    s:='select * from tjual_dtl where jld_jl_nomor='+ Quot(NOMOR)
  + ' and jld_nourut='+ IntToStr(NOURUT)
  + ' and jld_status=1 '
  +';'
  else
  s:='select * from tjual_dtl where jld_jl_nomor='+ Quot(NOMOR)
  + ' and jld_nourut='+ IntToStr(NOURUT)
  + ' and jld_user = '+ Quot(KDUSER)
  + ' and jld_status=1 '
  +';';
  tsql:= xOpenQuery(s,frmMenu.conn);
  with tsql do
  begin
    try
      if not eof then
        Result := True;

    finally
      free;
    end;
  end;

end;

end.
