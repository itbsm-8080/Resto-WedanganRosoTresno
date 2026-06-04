unit ufrmItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, AdvPanel, ComCtrls, StdCtrls, AdvEdit,SqlExpr, Menus,
  cxLookAndFeelPainters, cxButtons,StrUtils, cxGraphics, cxLookAndFeels,
  dxSkinsCore, dxSkinsDefaultPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, MemDS, DBAccess, MyAccess, FMTBcd, DBClient,
  Provider, cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox, cxCurrencyEdit,
  cxImage,jpeg, cxDBEdit, cxListBox;

type
  TfrmItem = class(TForm)
    AdvPanel1: TAdvPanel;
    Label3: TLabel;
    edtNama: TAdvEdit;
    AdvPanel3: TAdvPanel;
    cxButton8: TcxButton;
    AdvPanel2: TAdvPanel;
    lbljudul: TLabel;
    AdvPanel4: TAdvPanel;
    cxButton1: TcxButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle2: TcxStyle;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxStyleRepository3: TcxStyleRepository;
    cxStyle3: TcxStyle;
    MyQuery1: TMyQuery;
    DataSource1: TDataSource;
    cxButton2: TcxButton;
    Label1: TLabel;
    cxExtLookupKategori: TcxExtLookupComboBox;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGrid1DBTableView1Column4: TcxGridDBColumn;
    Label2: TLabel;
    edtprice: TAdvEdit;
    cxButton4: TcxButton;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2DBTableView1Column1: TcxGridDBColumn;
    cxGrid2DBTableView1Column2: TcxGridDBColumn;
    cxGrid2Level1: TcxGridLevel;
    MyQuery2: TMyQuery;
    MyQuery2nama: TStringField;
    MyQuery2price: TFloatField;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    DataSource2: TDataSource;
    cxGrid1DBTableView1Column5: TcxGridDBColumn;
    MyQuery1id: TIntegerField;
    MyQuery1Nama: TStringField;
    MyQuery1Category: TStringField;
    MyQuery1Price: TFloatField;
    MyQuery1Varian: TStringField;
    cxButton3: TcxButton;
    OpenDialog1: TOpenDialog;
    MyQuery3: TMyQuery;
    MyQuery3item_id: TIntegerField;
    MyQuery3foto: TBlobField;
    DataSource3: TDataSource;
    Image1: TImage;
    procedure refreshdata;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure loaddata(akode:string) ;
    procedure simpandata;
    procedure deletedata;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function getmaxkode:string;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton8Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure listdata ;
    procedure FormShow(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    Procedure LoadBitmapFromBlob(Bitmap: TBitmap; Blob: TBlobField);

  private
    FCDSKategori: TClientDataset;
    FFLAGEDIT: Boolean;
    FID: string;
      function GetCDSKategori: TClientDataset;
      function getidcategory(anam:string):integer;

    { Private declarations }
  public
    property FLAGEDIT: Boolean read FFLAGEDIT write FFLAGEDIT;
    property ID: string read FID write FID;
    property CDSKategori: TClientDataset read GetCDSKategori write FCDSKategori;
    { Public declarations }
  end;

var
  frmItem: TfrmItem;

implementation
uses MAIN,uModuleConnection,uFrmbantuan,Ulib;

{$R *.dfm}

procedure TfrmItem.refreshdata;
begin
  FID:='';
  FLAGEDIT := FALSE;
  edtNama.Clear;
  Image1.Picture := nil;
  edtNama.SetFocus;
  cxExtLookupKategori.Clear;
  edtprice.Clear;  
  cxButton2.Visible:= False;
  ClientDataSet1.EmptyDataSet;
  listdata;
end;
procedure TfrmItem.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if Key = VK_F8 then
  begin
      Release;
  end;


  if Key= VK_F10 then
  begin
    try
      if (FLAGEDIT) and ( not cekedit(frmMenu.KDUSER,self.name)) then
        begin
           MessageDlg('Anda tidak berhak Edit di Modul ini',mtWarning, [mbOK],0);
           Exit;
        End;
         if (not FLAGEDIT) and ( not cekinsert(frmMenu.KDUSER,self.name)) then
        begin
           MessageDlg('Anda tidak berhak Insert di Modul ini',mtWarning, [mbOK],0);;
           Exit;
        End;
      
      if MessageDlg('Save data ?',mtCustom,
                                  [mbYes,mbNo], 0)= mrNo
      then Exit ;

      simpandata;
      refreshdata;
   except
     ShowMessage('failed');
     xRollback(frmMenu.conn);
     Exit;
   end;
    xCommit(frmMenu.conn);
  end;
end;

procedure TfrmItem.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      SelectNext(ActiveControl,True,True);
end;

procedure TfrmItem.loaddata(akode:string) ;
var
  s: string;
  tsql : TSQLQuery;
  bmp: TBitmap;
  stream : tmemorystream;
  Jpg: TJpegImage;
  Buffer      : Word;
begin
  s:= 'select iv_item_id,iv_nama,iv_price from titemvarian where iv_item_id = ' + Quot(akode) ;

tsql := xOpenQuery(s,frmMenu.conn);
with tsql do
begin
  try
    while not Eof do
    begin
      ClientDataSet1.Append;
      ClientDataSet1.Fields[0].AsString := Fields[1].AsString;
      ClientDataSet1.Fields[1].Asfloat :=Fields[2].Asfloat;
      Next;
    end

  finally
    Free;
  end;

 MyQuery3.close;
 MyQuery3.SQL.Text :='select item_id,foto from titem where item_id='+ Quot(akode) ;
 MyQuery3.Open;
 try
   if MyQuery3.FieldByName('foto').AsString <> '' then
   begin
     Jpg := TJpegImage.Create;
     stream := tmemorystream.Create;
     tblobfield(MyQuery3.FieldByName('foto')).SaveToStream(stream);
     stream.position := 0;
     Jpg.LoadFromStream(stream);
     image1.Picture.Graphic := Jpg;
   end
   else
       Image1.Picture := nil;
 except
 end;
//  bmp := TBitmap.Create;
//  try
//    LoadBitmapFromBlob(bmp, TBlobField(myquery3.FieldByName('foto')));
//    Image1.Picture.Assign(bmp);
//
//  finally
//    bmp.Free;
//  end;
 //----------
end;


end;


procedure TfrmItem.simpandata;
var
  s:string;
  foto: TMemoryStream;

begin
  if edtprice.text = '' then
     edtprice.text := '0';

if FLAGEDIT then
  s:='update titem set '
    + ' item_nama = ' + Quot(edtNama.Text)+ ','
    + ' item_category = ' + quot(cxExtLookupKategori.Text)+','
    + ' item_harga = ' + StringReplace(edtprice.Text ,',','',[rfReplaceAll])
    + ' where item_id= ' + quot(FID) + ';'
else
begin
  s :=  ' insert into titem '
             + ' (item_id,item_nama,item_category,item_harga) '
             + ' values ( '
             + getmaxkode + ','
             + Quot(edtNama.Text) +','
             + Quot(cxExtLookupKategori.Text) + ','
             + StringReplace(edtprice.Text,',','',[rfReplaceAll])
             + ');';
             fid:=getmaxkode;
end;
  xExecQuery(s,frmmenu.conn);

    s:='delete from titemvarian where iv_item_id='+Quot(FID)+';';
  xExecQuery(s,frmMenu.conn);
  ClientDataSet1.First;
  while not ClientDataSet1.Eof do
  begin
    s:='insert into titemvarian (iv_item_id,iv_nama,iv_price) values ('
    + Quot(fid) + ','
    + Quot(ClientDataSet1.Fields[0].AsString)+ ','
    + FloatToStr(ClientDataSet1.Fields[1].AsFloat)+');';
    xExecQuery(s,frmMenu.conn);

    ClientDataSet1.Next;
  end;


  // save image to blob
     if Image1.Picture <> nil then
    begin
        try
        Foto := TMemorystream.Create;
        // menampilkan gambar ke image1
        Image1.Picture.Graphic.SaveToStream(Foto);
        // menyimpan data ke tabel
        MyQuery3.SQL.Clear;
        s := 'update titem set foto=:foto where item_id= ' + quot(FID) + ';';

        MyQuery3.SQL.Add(s);
        MyQuery3.ParamByName('foto').loadfromstream(foto, ftBlob);
        MyQuery3.ExecSQL;
        except
        end;

    end;

  //---------
end;

procedure TfrmItem.deletedata;
var
  s:string;
begin

  s:='Delete from titem  '
    + ' where item_id= ' + quot(FID) + ';' ;

  xExecQuery(s,frmmenu.conn);

end;

procedure TfrmItem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   Release;
end;

function TfrmItem.getmaxkode:string;
var
  s:string;
begin
  s:='select max(item_id) from titem';
  with xOpenQuery(s,frmMenu.conn) do
  begin
    try
      if Fields[0].AsString = '' then
         result:= '1'
      else
         result:= IntToStr(fields[0].AsInteger+1);

    finally
      free;
    end;
  end;
end;

procedure TfrmItem.cxButton1Click(Sender: TObject);
begin
    try
      if edtnama.text ='' then
      begin
        showmessage('Category belum di isi') ;
        exit;
      end;
      if (FLAGEDIT) and ( not cekedit(frmMenu.KDUSER,self.name)) then
        begin
           MessageDlg('Anda tidak berhak Edit di Modul ini',mtWarning, [mbOK],0);
           Exit;
        End;
         if (not FLAGEDIT) and ( not cekinsert(frmMenu.KDUSER,self.name)) then
        begin
           MessageDlg('Anda tidak berhak Insert di Modul ini',mtWarning, [mbOK],0);;
           Exit;
        End;

      if MessageDlg('Save data ?',mtCustom,
                                  [mbYes,mbNo], 0)= mrNo
      then Exit ;

      simpandata;
      refreshdata;
   except
     ShowMessage('failed');
     xRollback(frmMenu.conn);
     Exit;
   end;
    xCommit(frmMenu.conn);
end;

procedure TfrmItem.cxButton8Click(Sender: TObject);
begin
Release;
end;

procedure TfrmItem.cxButton2Click(Sender: TObject);
begin
   try
      if (FLAGEDIT) and ( not cekdelete(frmMenu.KDUSER,self.name)) then
        begin
           MessageDlg('Anda tidak berhak Delete di Modul ini',mtWarning, [mbOK],0);
           Exit;
        End;


      if MessageDlg('Delete data ?',mtCustom,
                                  [mbYes,mbNo], 0)= mrNo
      then Exit ;

      deletedata;
      refreshdata;
   except
     ShowMessage('Failed');
     xRollback(frmMenu.conn);
     Exit;
   end;
    xCommit(frmMenu.conn);

end;


procedure TfrmItem.listdata ;
begin
MyQuery1.Close;
MyQuery1.SQL.Text :='SELECT id ,Nama,Category ,Harga Price ,if(varian > 1,CONCAT(varian," Price"),"") Varian FROM ('
+ ' select item_id id ,item_nama Nama,item_category Category ,'
+ ' (SELECT COUNT(*) from titemvarian where iv_item_id=item_id) varian ,item_harga harga'
+ ' from titem ORDER BY   item_id) final';
MyQuery1.Open;


end;
procedure TfrmItem.FormShow(Sender: TObject);
begin
refreshdata;
end;

procedure TfrmItem.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
edtNama.Text:=MyQuery1.Fields[1].AsString;
cxExtLookupKategori.EditValue := getidcategory(MyQuery1.Fields[2].AsString);
edtprice.Text := MyQuery1.Fields[3].AsString;
FID := MyQuery1.Fields[0].AsString;
FLAGEDIT:=True;
cxButton2.Visible:= True;
ClientDataSet1.EmptyDataSet;
loaddata(FID);
end;

procedure TfrmItem.FormCreate(Sender: TObject);
begin
    with TcxExtLookupHelper(cxExtLookupKategori.Properties) do
    LoadFromCDS(CDSKategori, 'Kode','Nama',['Kode'],Self);

end;

function TfrmItem.GetCDSKategori: TClientDataset;
var s:String;
begin
  If not Assigned(FCDSKategori) then
  begin
    S := 'select ct_nama as Nama, ct_id Kode'
        +' from tcategory ';


    FCDSKategori := TConextMain.cOpenCDS(S,nil);
  end;
  Result := FCDSKategori;
end;

function TfrmItem.getidcategory(anam:string):integer;
var
  s:string;
  tsql:tsqlquery;
begin
  S:='select ct_id from tcategory where ct_nama like '+Quot(anam);
  tsql:= xOpenQuery(s,frmMenu.conn);
  with tsql do
  begin
    if not Eof then
       result:= fields[0].AsInteger
    else
       result := 0;
  end;

end;


procedure TfrmItem.cxButton4Click(Sender: TObject);
begin
      ClientDataSet1.Open;
 If ClientDataSet1.State <> dsEdit then ClientDataSet1.Edit;

    ClientDataSet1.Append;

end;

procedure TfrmItem.cxButton3Click(Sender: TObject);
begin
if OpenDialog1.Execute then
begin
    Image1.Picture.LoadFromFile(OpenDialog1.filename);
end;
end;

Procedure TfrmItem.LoadBitmapFromBlob(Bitmap: TBitmap; Blob: TBlobField);
var
  ms, ms2: TMemoryStream;
begin
  ms := TMemoryStream.Create;
  try
    Blob.SaveToStream(ms);
    ms.Position := 0;
    Bitmap.LoadFromStream(ms);
  finally
    ms.Free;
  end;
end;

end.
