unit ufrmListKas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmCxBrowse, Menus, cxLookAndFeelPainters, cxStyles,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, FMTBcd, Provider, SqlExpr, ImgList,
  ComCtrls, StdCtrls, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxButtons, ExtCtrls, AdvPanel, DBClient, cxLookAndFeels, cxContainer,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, dxSkinDarkRoom, dxSkinFoggy, dxSkinSeven,
  dxSkinSharp, dxSkinsDefaultPainters;

type
  TfrmListKas = class(TfrmCxBrowse)
    cxLookupRekeningCash: TcxExtLookupComboBox;
    Label3: TLabel;
  procedure btnRefreshClick(Sender: TObject);
  procedure FormShow(Sender: TObject);
  procedure cxButton6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  FCDSRekeningCash: TClientDataset;
  function GetCDSRekeningCash: TClientDataset;
    { Private declarations }
  public
  property CDSRekeningCash: TClientDataset read GetCDSRekeningCash write
      FCDSRekeningCash;
    { Public declarations }
  end;

var
  frmListKas: TfrmListKas;

implementation
   uses Ulib, MAIN, uModuleConnection, ufrmJurnalUmum;
{$R *.dfm}

procedure TfrmListKas.btnRefreshClick(Sender: TObject);
var
  xdebet,xkredit,xsaldo : Double;
  i:integer;
begin

 Self.SQLMaster :='select "" Nomor,'+quot(FormatDateTime('yyyy-mm-dd',startdate.datetime)) +' Tanggal,"Saldo Awal" Keterangan,"" Rekening,0 Debet, 0 Kredit, ifnull(sum(jurd_debet-jurd_kredit),0) Saldo,"" Memo '
                  + ' from tjurnalitem inner join tjurnal'
                  + ' on jurd_jur_no=jur_no where '
                  + ' jurd_rek_kode= '+quot(vartostr(cxlookupRekeningcash.editvalue))+' and jur_tanggal < '+quotd(startdate.DateTime)
                  + ' union'
                  + ' select nomor,tanggal,Keterangan,Rekening,Debet,kredit,saldo, if(Memo IS null,(SELECT jl_jeniscustomer FROM tjual WHERE jl_nomor=nomor LIMIT 1),memo) Memo from ('
                  + ' SELECT jurd_jur_no Nomor, DATE_FORMAT(tanggal,"%Y-%m-%d") Tanggal, jurd_keterangan Keterangan,rek_nama Rekening,'
                  + ' jurd_kredit Debet,jurd_debet Kredit, 0 Saldo,cc Memo,'
                  + ' case when debet > 0 then (select count(*) from tjurnalitem where jurd_jur_no=a.nomor and jurd_debet>0)'
                  + ' else (select count(*) from tjurnalitem where jurd_jur_no=a.nomor  and jurd_kredit>0) end sendiri'
                  + ' FROM tjurnalitem b'
                  + ' INNER JOIN ('
                  + ' SELECT jurd_jur_no nomor,jur_tanggal tanggal,jur_tipetransaksi,jur_keterangan,jurd_debet debet,jurd_kredit kredit,jurd_cc_kode cc'
                  + ' FROM tjurnalitem'
                  + ' INNER JOIN tjurnal ON jurd_jur_no=jur_no'
                  + ' WHERE jurd_rek_kode= '+ quot(VarToStr(cxlookupRekeningcash.editvalue))+ ' AND jur_tanggal BETWEEN '+quotd(startdate.DateTime)+' and '+quotd(enddate.DateTime)+ ') a ON b.jurd_jur_no=a.nomor'
                  + ' INNER JOIN trekening ON rek_kode=jurd_rek_kode'

                  + ' WHERE jurd_rek_kode <> ' + quot(VarToStr(cxlookupRekeningcash.editvalue))
                  + ' having   sendiri = 1'
                  + ' union'
                  + ' SELECT DISTINCT jurd_jur_no Nomor, DATE_FORMAT(tanggal,"%Y-%m-%d") Tanggal, jur_keterangan Keterangan,'
                  + ' (case when a.debet > 0'
                  + ' then'
                  + ' (select rek_nama from tjurnalitem inner join trekening on rek_kode=jurd_rek_kode where jurd_jur_no=b.jurd_jur_no and jurd_kredit > 0  limit 1) else'
                  + ' (select rek_nama from tjurnalitem inner join trekening on rek_kode=jurd_rek_kode where jurd_jur_no=b.jurd_jur_no and jurd_debet > 0  limit 1) end'
                  + ' ) Rekening,'
                  + ' case when a.debet > 0 then  a.debet else 0 end Kredit,'
                  + ' case when a.kredit > 0 then  a.kredit else 0 end Debet,'
                  + ' 0 Saldo,cc Memo,'
                  + ' case when debet > 0 then (select count(*) from tjurnalitem where jurd_jur_no=a.nomor and jurd_debet>0)'
                  + ' else (select count(*) from tjurnalitem where jurd_jur_no=a.nomor  and jurd_kredit>0) end sendiri'
                  + ' FROM tjurnalitem b'
                  + ' INNER JOIN ('
                  + ' SELECT jurd_jur_no nomor,jur_tanggal tanggal,jur_tipetransaksi,jur_keterangan,jurd_debet debet,jurd_kredit kredit,jurd_cc_kode cc'
                  + ' FROM tjurnalitem'
                  + ' INNER JOIN tjurnal ON jurd_jur_no=jur_no'
                  + ' WHERE jurd_rek_kode= ' + quot(VarToStr(cxlookupRekeningcash.editvalue)) + ' AND jur_tanggal BETWEEN '+quotd(startdate.DateTime)+' and '+quotd(enddate.DateTime)+ ') a ON b.jurd_jur_no=a.nomor'
                  + ' INNER JOIN trekening ON rek_kode=jurd_rek_kode'

                  + ' WHERE jurd_rek_kode <> ' + quot(VarToStr(cxlookupRekeningcash.editvalue))
                  + ' having sendiri > 1) final order by tanggal,nomor ';


   inherited;
    cxGrdMaster.ApplyBestFit();
    cxGrdMaster.Columns[0].Width :=100;
    cxGrdMaster.Columns[1].Width :=100;
    cxGrdMaster.Columns[2].Width :=100;
    cxGrdMaster.Columns[3].Width :=200;
    cxGrdMaster.Columns[4].Width :=100;
    cxGrdMaster.Columns[5].Width :=100;
    cxGrdMaster.Columns[6].Width :=100;
    cxGrdMaster.Columns[7].Width :=100;
    cxGrdMaster.Columns[5].Summary.FooterKind:=skSum;
    cxGrdMaster.Columns[5].Summary.FooterFormat:='###,###,###,###';
    cxGrdMaster.Columns[4].Summary.FooterKind:=skSum;
    cxGrdMaster.Columns[4].Summary.FooterFormat:='###,###,###,###';
    cdsmaster.First;
    xsaldo:=0;
    i:=0;
    while not CDSMaster.Eof do
    begin
      if  i > 0 then
      begin
          If CDSMaster.State <> dsEdit then CDSMaster.Edit;
      CDSMaster.FieldByName('saldo').AsFloat := xsaldo + CDSMaster.FieldByName('Debet').AsFloat - CDSMaster.FieldByName('kredit').AsFloat;
      end;
      xsaldo :=CDSMaster.FieldByName('saldo').AsFloat;
      i:=i+1;
      CDSMaster.Next;
    end;


end;

procedure TfrmListKas.FormShow(Sender: TObject);
begin
  ShowWindowAsync(Handle, SW_MAXIMIZE);
  inherited;
  btnRefreshClick(Self);
end;

procedure TfrmListKas.cxButton6Click(Sender: TObject);
begin
  inherited;
  refreshdata;
end;

function TfrmListKas.GetCDSRekeningCash: TClientDataset;
var s:String;
begin
  If not Assigned(FCDSRekeningCash) then
  begin
    S := 'select rek_nama as Rekening, rek_kode Kode '
        +' from trekening';


    FCDSRekeningCash := TConextMain.cOpenCDS(S,nil);
  end;
  Result := FCDSRekeningCash;
end;

procedure TfrmListKas.FormCreate(Sender: TObject);
begin
  inherited;
    with TcxExtLookupHelper(cxLookupRekeningCash.Properties) do
    LoadFromCDS(CDSRekeningCash, 'Kode','Rekening',['Kode'],Self);

end;

end.
