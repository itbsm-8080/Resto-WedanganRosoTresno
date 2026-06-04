object frmListBill2: TfrmListBill2
  Left = 425
  Top = 193
  Width = 671
  Height = 399
  Caption = 'History Bill'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object AdvPanel1: TAdvPanel
    Left = 0
    Top = 0
    Width = 655
    Height = 41
    Align = alTop
    Color = clWhite
    TabOrder = 0
    UseDockManager = True
    AnchorHint = False
    AutoSize.Enabled = False
    AutoSize.Height = True
    AutoSize.Width = True
    AutoHideChildren = True
    BackgroundPosition = bpTopLeft
    BorderColor = clBlack
    BorderShadow = False
    Buffered = True
    CanMove = False
    CanSize = False
    Caption.ButtonPosition = cbpRight
    Caption.Color = clHighlight
    Caption.ColorTo = clNone
    Caption.CloseColor = clBtnFace
    Caption.CloseButton = False
    Caption.CloseButtonColor = clWhite
    Caption.Flat = False
    Caption.Font.Charset = DEFAULT_CHARSET
    Caption.Font.Color = clHighlightText
    Caption.Font.Height = -11
    Caption.Font.Name = 'MS Sans Serif'
    Caption.Font.Style = []
    Caption.Height = 20
    Caption.Indent = 0
    Caption.MinMaxButton = False
    Caption.MinMaxButtonColor = clWhite
    Caption.ShadeLight = 200
    Caption.ShadeGrain = 32
    Caption.ShadeType = stNormal
    Caption.Shape = csRectangle
    Caption.TopIndent = 0
    Caption.Visible = False
    Collaps = False
    CollapsColor = clGray
    CollapsDelay = 20
    CollapsSteps = 0
    ColorTo = clNone
    FixedTop = False
    FixedLeft = False
    FixedHeight = False
    FixedWidth = False
    FreeOnClose = False
    Hover = False
    HoverColor = clNone
    HoverFontColor = clNone
    Indent = 0
    LineSpacing = 0
    Position.Save = False
    Position.Location = clRegistry
    ShadowColor = clGray
    ShadowOffset = 2
    ShowMoveCursor = False
    TextVAlign = tvaTop
    TopIndent = 0
    URLColor = clBlue
    FullHeight = 0
    object cxLabel1: TcxLabel
      Left = 1
      Top = 1
      Align = alLeft
      Caption = 'History Bill'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clGray
      Style.Font.Height = -16
      Style.Font.Name = 'Trebuchet MS'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taLeftJustify
      Properties.Alignment.Vert = taVCenter
      AnchorY = 21
    end
    object dtTanggal: TcxDateEdit
      Left = 112
      Top = 4
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'Trebuchet MS'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 1
      Width = 201
    end
    object cxrefresh: TcxButton
      Left = 555
      Top = 1
      Width = 99
      Height = 39
      Caption = 'Refresh'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = cxrefreshClick
      Align = alRight
      Colors.Normal = clGray
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 41
    Width = 655
    Height = 319
    Align = alClient
    TabOrder = 1
    object cxGrid1DBTableView1: TcxGridDBTableView
      OnDblClick = cxGrid1DBTableView1DblClick
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      FilterRow.ApplyChanges = fracImmediately
      OptionsView.GroupByBox = False
      Styles.Content = cxStyle2
      Styles.Header = cxStyle3
      object cxGrid1DBTableView1Column1: TcxGridDBColumn
        Caption = 'Number'
        DataBinding.FieldName = 'nomor'
        Options.Editing = False
        Width = 118
      end
      object cxGrid1DBTableView1Column2: TcxGridDBColumn
        Caption = 'Billing Name'
        DataBinding.FieldName = 'nama'
        Options.Editing = False
        Width = 275
      end
      object cxGrid1DBTableView1Column3: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'tim'
        Options.Editing = False
        Width = 139
      end
      object cxGrid1DBTableView1Column4: TcxGridDBColumn
        Caption = 'Table'
        DataBinding.FieldName = 'meja'
        Options.Editing = False
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object cxStyleRepository3: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 5591377
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
  end
  object cxStyleRepository2: TcxStyleRepository
    Top = 48
    PixelsPerInch = 96
    object cxStyle2: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = []
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 24
    Top = 64
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      TextColor = clWhite
    end
  end
  object MyQuery1: TMyQuery
    Connection = frmMenu.MyConnection1
    SQL.Strings = (
      
        'select jl_nomor nomor,jl_atasnama nama, jl_tanggal tim ,jl_table' +
        ' Meja from tjual'
      'where jl_status=1')
    Left = 224
    Top = 144
    object MyQuery1nomor: TStringField
      FieldName = 'nomor'
    end
    object MyQuery1nama: TStringField
      FieldName = 'nama'
      Size = 30
    end
    object MyQuery1tim: TDateTimeField
      FieldName = 'tim'
    end
    object MyQuery1Meja: TStringField
      FieldName = 'Meja'
      Size = 30
    end
  end
  object DataSource1: TDataSource
    DataSet = MyQuery1
    Left = 392
    Top = 176
  end
end
