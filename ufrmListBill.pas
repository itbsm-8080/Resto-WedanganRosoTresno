unit ufrmListBill;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxContainer, cxLabel, ExtCtrls, AdvPanel,
  MemDS, DBAccess, MyAccess, Menus, cxLookAndFeelPainters, StdCtrls,
  cxButtons,sqlexpr;

type
  TfrmListBill = class(TForm)
    AdvPanel1: TAdvPanel;
    cxLabel1: TcxLabel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxStyleRepository3: TcxStyleRepository;
    cxStyle3: TcxStyle;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle2: TcxStyle;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    MyQuery1: TMyQuery;
    DataSource1: TDataSource;
    MyQuery1nomor: TStringField;
    MyQuery1nama: TStringField;
    MyQuery1tim: TTimeField;
    cxGrid1DBTableView1Column4: TcxGridDBColumn;
    MyQuery1Meja: TStringField;
    AdvPanel2: TAdvPanel;
    cxremove: TcxButton;
    cxButton1: TcxButton;
    cxStyleRepository4: TcxStyleRepository;
    cxStyle4: TcxStyle;
    procedure FormShow(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure cxremoveClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListBill: TfrmListBill;

implementation
    uses MAIN,uModuleConnection, ufrmotorisasi,ulib,ureport;
{$R *.dfm}

procedure TfrmListBill.FormShow(Sender: TObject);
var
  s:String;
begin

            s:='select jl_nomor nomor,jl_atasnama nama, timediff(now(),jl_tanggal) tim ,'
        + ' jl_table Meja,jl_nohp from tjual'
        +  ' where jl_status=1';
MyQuery1.Close;
MyQuery1.SQL.Text :=s;
MyQuery1.Open;

end;

procedure TfrmListBill.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
   IDNOMOR := MyQuery1.Fields[0].AsString;
   
   close;
end;

procedure TfrmListBill.cxremoveClick(Sender: TObject);
var
  s:string;
begin
       Application.CreateForm(Tfrmotorisasi,frmotorisasi);
       frmotorisasi.ShowModal;
       if  IDOTORISASI then
       begin
         s:='update tjual set jl_status=3 where jl_nomor ='+ quot(myquery1.fields[0].asstring)+';';
         xExecQuery(s,frmMenu.conn);
         s:='update tjual_dtl set jld_status=3   where '
         + ' jld_jl_nomor  =' + quot(myquery1.fields[0].asstring) + ';';
         xExecQuery(s,frmMenu.conn);
         IDOTORISASI:= False;
         MyQuery1.Refresh;
       end;
end;

procedure TfrmListBill.cxButton1Click(Sender: TObject);
var
  s: string ;
  ftsreport : TTSReport;
  tsql :TSQLQuery;
begin

          s:= ' SELECT * '
       + ' ,'+Quot(zNamaProfile)+ ' as znama ,'
       + Quot(zAddress)+ ' as zalamat ,'
       + Quot(zNotelp)+ ' as znotelp ,'
       + Quot(zFooter)+ ' as zfooter '
       + ' FROM tjual inner join tjual_dtl on jl_nomor=jld_jl_nomor'
       + ' INNER JOIN titem ON item_id=jld_item'
       + ' INNER JOIN tcategory ON ct_nama=item_category'
       + ' WHERE jld_isdelete = 0 '
       + ' AND jld_jl_nomor='+Quot(MyQuery1.Fields[0].AsString)
       + ' order by jld_salestype,jld_nourut';
  tsql:=xOpenQuery(s,frmmenu.conn) ;
  with tsql do
  begin
    try
      if Eof then
      exit;
    finally
      free;
    end;
  end;

  ftsreport := TTSReport.Create(nil);
  try
    ftsreport.Nama := 'food';
    zprinter := frmMenu.aPRINTER;

    ftsreport.AddSQL(s);

    ftsreport.ShowReport;
  finally
     ftsreport.Free;
  end;
end;

end.
