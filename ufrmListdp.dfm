object frmListDP: TfrmListDP
  Left = 336
  Top = 93
  Width = 758
  Height = 565
  Caption = 'List DP'
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
    Width = 742
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
      Align = alClient
      Caption = 'List DP'
      ParentColor = False
      ParentFont = False
      Style.Color = 5591377
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clGray
      Style.Font.Height = -16
      Style.Font.Name = 'Trebuchet MS'
      Style.Font.Style = []
      Style.TextColor = clWhite
      Style.IsFontAssigned = True
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 41
    Width = 742
    Height = 485
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
        Caption = 'Customer Name'
        DataBinding.FieldName = 'nama'
        Options.Editing = False
        Width = 275
      end
      object cxGrid1DBTableView1Column3: TcxGridDBColumn
        DataBinding.FieldName = 'nilai'
        Options.Editing = False
        Width = 139
      end
      object cxGrid1DBTableView1Column4: TcxGridDBColumn
        Caption = 'Jenis Bayar'
        DataBinding.FieldName = 'jenisbayar'
        Options.Editing = False
        Width = 156
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
      
        'select um_nomor nomor,um_customer nama, um_nilai Nilai,um_jenisb' +
        'ayar jenisbayar from tuangmuka'
      'where um_isrealisasi=0')
    Left = 224
    Top = 144
    object MyQuery1nomor: TStringField
      FieldName = 'nomor'
      Size = 30
    end
    object MyQuery1nama: TStringField
      FieldName = 'nama'
      Size = 100
    end
    object MyQuery1Nilai: TFloatField
      FieldName = 'Nilai'
    end
    object MyQuery1jenisbayar: TStringField
      FieldName = 'jenisbayar'
    end
  end
  object DataSource1: TDataSource
    DataSet = MyQuery1
    Left = 392
    Top = 176
  end
  object cxStyleRepository4: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle4: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Trebuchet MS'
      Font.Style = []
    end
  end
end
