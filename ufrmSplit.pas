unit ufrmSplit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxCurrencyEdit, StdCtrls, AdvEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxButtons, ExtCtrls, AdvPanel, cxCheckBox,
  FMTBcd, SqlExpr, Provider, DBClient, cxSpinEdit;

type
  TfrmSplit = class(TForm)
    AdvPanel4: TAdvPanel;
    cxButton1: TcxButton;
    cxGrid2: TcxGrid;
    cxgrdjual: TcxGridDBTableView;
    cxgrdjualColumn1: TcxGridDBColumn;
    cxgrdjualColumn2: TcxGridDBColumn;
    cxgrdjualColumn3: TcxGridDBColumn;
    cxgrdjualColumn4: TcxGridDBColumn;
    cxgrdjualColumn5: TcxGridDBColumn;
    cxgrdjualColumn6: TcxGridDBColumn;
    cxgrdjualColumn7: TcxGridDBColumn;
    cxgrdjualColumn8: TcxGridDBColumn;
    cxGrid2Level1: TcxGridLevel;
    AdvPanel9: TAdvPanel;
    Label3: TLabel;
    Label2: TLabel;
    edtsc: TAdvEdit;
    edttax: TAdvEdit;
    edtTotal: TAdvEdit;
    cxStyleRepository4: TcxStyleRepository;
    cxStyle4: TcxStyle;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle2: TcxStyle;
    cxStyleRepository3: TcxStyleRepository;
    cxStyle3: TcxStyle;
    cxgrdjualColumn9: TcxGridDBColumn;
    ds2: TDataSource;
    ClientDataSet1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    SQLQuery1: TSQLQuery;
    Label1: TLabel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle5: TcxStyle;
    cxtable: TcxButton;
    cxStyle6: TcxStyle;
    procedure FormCreate(Sender: TObject);
    function GetCDS: TClientDataSet;
    procedure cxgrdjualColumn9PropertiesEditValueChanged(Sender: TObject);
    procedure cxgrdjualStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure hitung;
    procedure cxtableClick(Sender: TObject);
    function cekistax(asalestype:string):boolean;
    function cekissc(asalestype:string):boolean;
    procedure cxgrdjualColumn2PropertiesEditValueChanged(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure simpandata;
  private
    { Private declarations }
    protected
    FCDS: TClientDataSet;

  public
    { Public declarations }
       property CDS: TClientDataSet read GetCDS write FCDS;
  end;

var
  frmSplit: TfrmSplit;

implementation
uses MAIN,ulib,ufrmpos,uModuleConnection,ufrmOtorisasi, ufrmcharge;
{$R *.dfm}
function TfrmSplit.GetCDS: TClientDataSet;
begin
  If not Assigned(FCDS) then
  begin
    FCDS := TClientDataSet.Create(Self);
    zAddField(FCDS, 'nama', ftString, False,30);
    zAddField(FCDS, 'Qty', ftfloat,  False);
    zAddField(FCDS, 'value', ftfloat, False);
    zAddField(FCDS, 'salestype', ftString, False,30);
    zAddField(FCDS, 'id', ftinteger,  False);
    zAddField(FCDS, 'nomor', ftString, False,30);
    zAddField(FCDS, 'nourut', ftinteger,  False);
    zAddField(FCDS, 'notes', ftString, False,30);
    zAddField(FCDS, 'chek', ftInteger, False,1);
    FCDS.CreateDataSet;
  end;
  Result := FCDS;
end;

procedure TfrmSplit.FormCreate(Sender: TObject);
var
  S:string;
  tsql:tsqlquery;
begin
     TcxDBGridHelper(cxgrdjual).LoadFromCDS(CDS, False, False);
  s:='SELECT item_nama Nama,jld_qty QTY,jld_price value,jld_salestype salestype ,'
+ ' jld_item ID,jld_jl_nomor Nomor,jld_nourut nourut,jld_notes notes,'
+ ' jld_varian,jld_modifier,jld_notes'
+ ' FROM tjual_dtl'
+ ' INNER JOIN tjual ON jl_nomor = jld_jl_nomor'
+ ' AND jld_isdelete=0'
+ ' INNER JOIN titem ON item_id=jld_item'
+ ' WHERE jld_jl_nomor ='+quot(IDNOMOR);
  tsql:=xOpenQuery(s,frmMenu.conn);
  cds.EmptyDataSet;
  with tsql do
  begin
    try
      First;
      while not eof do
      begin
        CDS.Append;
        CDS.FieldByName('nama').AsString    := fieldbyname('nama').AsString+chr(13)
        +fieldbyname('jld_varian').AsString+chr(13)+fieldbyname('jld_modifier').AsString
        +chr(13)+fieldbyname('jld_notes').AsString ;
        CDS.FieldByName('nomor').AsString        := fieldbyname('nomor').AsString;
        CDS.FieldByName('salestype').AsString        := fieldbyname('salestype').AsString;
        CDS.FieldByName('notes').AsString        := fieldbyname('notes').AsString;

        CDS.FieldByName('chek').asinteger        := 0;
        CDS.FieldByName('nourut').asinteger        := fieldbyname('nourut').asinteger;
        CDS.FieldByName('id').asinteger        := fieldbyname('id').asinteger;

        CDS.FieldByName('qty').asfloat        := fieldbyname('qty').AsFloat;
        CDS.FieldByName('value').asfloat        := fieldbyname('value').AsFloat;



        CDS.Post;
        Next;
      end;
    finally
      Free;
    end;
  end;


end;

procedure TfrmSplit.cxgrdjualColumn9PropertiesEditValueChanged(
  Sender: TObject);
begin
    If CDS.State <> dsEdit then CDS.Edit;
    if CDS.FieldByName('chek').AsString = '0' then
      CDS.FieldByName('chek').AsString := '1'
    else
      CDS.FieldByName('chek').AsString := '0';
      CDS.post;
   hitung;
end;

procedure TfrmSplit.cxgrdjualStylesGetContentStyle(
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

procedure TfrmSplit.hitung;
var
  atotal :double;
  xtax,xsc,atax,asc :double;

begin
  atotal:=0;
  cds.First;
  while not cds.eof do
  begin
    if cds.FieldByName('chek').AsInteger =1 then
    begin
      atotal:=atotal+(cds.FieldByName('value').AsFloat*cds.FieldByName('qty').AsFloat);
      if cekistax(cds.FieldByName('salestype').AsString) then
      xtax := zTax *  (cds.FieldByName('value').AsFloat*cds.FieldByName('qty').AsFloat)/100;
      if cekissc(cds.FieldByName('salestype').AsString) then
      xsc := zsc *  ((cds.FieldByName('value').AsFloat*cds.FieldByName('qty').AsFloat)+xtax)/100;
      asc := asc+xsc;
      atax:= atax+xtax;
    end;
    cds.next;
  end;
  edttax.text :=FormatFloat('##,###,###',atax);
  edtsc.text :=FormatFloat('##,###,###',asc);
  edtTotal.text := FormatFloat('##,###,###',atotal+atax+asc);
end;
procedure TfrmSplit.cxtableClick(Sender: TObject);
begin
close;
end;

function TfrmSplit.cekistax(asalestype:string):boolean;
var
  s:string;
  tsql:tsqlquery;
begin
  result:= false;
  s:='select st_tax from tsalestype where st_nama='+ Quot(asalestype);
  tsql:= xOpenQuery(s,frmMenu.conn);
  with tsql do
  begin
    try
      if fields[0].AsInteger=1 then
         result:= true;
    finally
      free;
    end;
  end;
end;

function TfrmSplit.cekissc(asalestype:string):boolean;
var
  s:string;
  tsql:tsqlquery;
begin
  result:= false;
  s:='select st_sc from tsalestype where st_nama='+ Quot(asalestype);
  tsql:= xOpenQuery(s,frmMenu.conn);
  with tsql do
  begin
    try
      if fields[0].AsInteger=1 then
         result:= true;
    finally
      free;
    end;
  end;
end;

procedure TfrmSplit.cxgrdjualColumn2PropertiesEditValueChanged(
  Sender: TObject);
begin
    If CDS.State <> dsEdit then CDS.Edit;
      CDS.post;
   hitung;

end;

procedure TfrmSplit.cxButton1Click(Sender: TObject);
begin
  simpandata;




Close;
end;

procedure TfrmSplit.simpandata;
var
  s:string;
  xamount,xsc,xtax : double;
  tsql:TSQLQuery;
  anomor :string;
begin
  if edtsc.Text = '' then
    edtsc.Text :='0';
  if edttax.Text = '' then
   edttax.Text := '0';
   s:='SELECT jl_nomor,jl_tanggal,jl_status,jl_amount,jl_sc,jl_tax,jl_atasnama ,jl_table FROM tjual'
+ ' WHERE jl_nomor LIKE '+Quot(IDNOMOR);
tsql:=xOpenQuery(s,frmMenu.conn);
with tsql do
begin
  try
    anomor :=frmpos.getmaxkode;
    xsc := strtofloat(StringReplace(edtsc.Text,',','',[rfReplaceAll]));
    xtax := strtofloat(StringReplace(edttax.Text,',','',[rfReplaceAll]));
    xamount :=strtofloat(StringReplace(edttotal.Text,',','',[rfReplaceAll]));
    xamount := xamount - xtax -xsc;
    s:='insert into tjual (jl_nomor,jl_tanggal,jl_status,jl_amount,jl_sc,jl_tax,'
    + ' jl_atasnama ,jl_table) values ('
    + Quot(anomor)+','
    + QuotD(fields[1].AsDateTime,true)+','
    + inttostr(fields[2].AsInteger)+','
    + floattostr(xamount) + ','
    + floattostr(xsc) + ','
    + floattostr(xtax) + ','
    + quot('Split '+ IDNOMOR)+','
    + Quot(fields[7].AsString)
    +');';
    xExecQuery(s,frmmenu.conn);

    s:= 'update tjual set '
      + ' jl_amount = jl_amount -'+ FloatToStr(xamount)+','
      + ' jl_sc = jl_sc -'+ FloatToStr(xsc)+','
      + ' jl_tax = jl_tax -'+ FloatToStr(xtax)+' where jl_nomor ='+ Quot(IDNOMOR)+';';
    xExecQuery(s,frmmenu.conn);
  finally
    free;
  end;

  cds.First;
  while not cds.Eof  do
  begin
    if CDS.FieldByName('chek').AsInteger=1 then
    begin
       s:= 'insert into tjual_dtl (jld_jl_nomor,jld_item,jld_qty,jld_price,jld_salestype,'
        + ' jld_nourut,jld_status,jld_user,jld_notes,jld_iseksekusi) values ( '
        + Quot(anomor)+','
        + IntToStr(cds.fieldbyname('ID').AsInteger)+','
        + FloatToStr(CDs.fieldbyname('QTY').AsFloat)+','
        + FloatToStr(CDs.fieldbyname('value').AsFloat)+','
        + Quot(cds.fieldbyname('salestype').AsString)+','
        + IntToStr(cds.fieldbyname('nourut').AsInteger)+',1,'
        + Quot(frmmenu.KDUSER)+','
        + Quot(cds.fieldbyname('notes').AsString)+',1);';
      xExecQuery(s,frmMenu.conn);

      s:= 'update tjual_dtl set jld_qty=jld_qty-'+floattostr(CDs.fieldbyname('QTY').AsFloat)
      + ' where jld_jl_nomor ='+Quot(IDNOMOR)
      + ' and jld_nourut='+inttostr(cds.fieldbyname('nourut').AsInteger)+';';
      xExecQuery(s,frmMenu.conn);



    end;
    cds.Next;
  end;
      s:= 'delete from tjual_dtl '
      + ' where jld_jl_nomor ='+Quot(IDNOMOR)
      + ' and jld_qty=0 ;' ;


      xExecQuery(s,frmMenu.conn);

end;
  IDNOMOR := Anomor;
  Application.CreateForm(TfrmCharge,frmCharge);
  frmCharge.ShowModal;
  if ISSUKSES THEN
  begin
     CLOSE;
  end;

//   frmpos.refreshdata;
//   frmpos.loaditemorder(anomor);
//   xamount :=cVarToFloat(TcxDBGridHelper(cxgrdjual).GetFooterSummary('value'));
end;
end.
