object frmRefund: TfrmRefund
  Left = 192
  Top = 125
  Width = 716
  Height = 480
  Caption = 'Refund'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object AdvPanel4: TAdvPanel
    Left = 0
    Top = 0
    Width = 700
    Height = 42
    Align = alTop
    Color = 5591377
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
    BorderWidth = 1
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
    object Label1: TLabel
      Left = 294
      Top = 9
      Width = 80
      Height = 29
      Caption = 'Refund'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxButton1: TcxButton
      Left = 552
      Top = 2
      Width = 146
      Height = 38
      Caption = 'Refund'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = cxButton1Click
      Align = alRight
      Colors.Normal = clGray
      LookAndFeel.Kind = lfStandard
      LookAndFeel.SkinName = 'LondonLiquidSky'
    end
    object cxtable: TcxButton
      Left = 2
      Top = 2
      Width = 99
      Height = 38
      Caption = 'Cancel'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = cxtableClick
      Align = alLeft
      Colors.Normal = clGray
    end
  end
  object cxGrid2: TcxGrid
    Left = 0
    Top = 42
    Width = 700
    Height = 358
    Align = alClient
    TabOrder = 1
    object cxgrdjual: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0.;(,0.)'
          Kind = skSum
          Column = cxgrdjualColumn3
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.HideSelection = True
      OptionsSelection.InvertSelect = False
      OptionsView.CellAutoHeight = True
      OptionsView.GroupByBox = False
      OptionsView.RowSeparatorColor = clGray
      OptionsView.RowSeparatorWidth = 1
      Styles.Content = frmDetailItem.cxStyle2
      Styles.Selection = cxStyle6
      Styles.OnGetContentStyle = cxgrdjualStylesGetContentStyle
      Styles.Footer = cxStyle3
      Styles.Header = cxStyle3
      object cxgrdjualColumn1: TcxGridDBColumn
        Caption = 'Name'
        DataBinding.FieldName = 'Nama'
        Options.Editing = False
        Styles.Content = cxStyle2
        Width = 209
      end
      object cxgrdjualColumn2: TcxGridDBColumn
        DataBinding.FieldName = 'Qty'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.;(,0.)'
        Properties.OnEditValueChanged = cxgrdjualColumn2PropertiesEditValueChanged
        Styles.Content = cxStyle4
      end
      object cxgrdjualColumn3: TcxGridDBColumn
        Caption = 'Price'
        DataBinding.FieldName = 'value'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.;(,0.)'
        Options.Editing = False
        Styles.Content = cxStyle4
        Width = 131
      end
      object cxgrdjualColumn4: TcxGridDBColumn
        Caption = 'Sales Type'
        DataBinding.FieldName = 'salestype'
        Visible = False
        Options.Editing = False
        Width = 116
      end
      object cxgrdjualColumn5: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
      end
      object cxgrdjualColumn6: TcxGridDBColumn
        DataBinding.FieldName = 'nomor'
        Visible = False
      end
      object cxgrdjualColumn7: TcxGridDBColumn
        DataBinding.FieldName = 'nourut'
        Visible = False
      end
      object cxgrdjualColumn8: TcxGridDBColumn
        Caption = 'Notes'
        DataBinding.FieldName = 'notes'
        Visible = False
        Options.Editing = False
        Width = 182
      end
      object cxgrdjualColumn9: TcxGridDBColumn
        Caption = 'Chek'
        DataBinding.FieldName = 'chek'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Properties.OnEditValueChanged = cxgrdjualColumn9PropertiesEditValueChanged
        Styles.Content = cxStyle4
      end
    end
    object cxGrid2Level1: TcxGridLevel
      GridView = cxgrdjual
    end
  end
  object AdvPanel9: TAdvPanel
    Left = 0
    Top = 400
    Width = 700
    Height = 41
    Align = alBottom
    Color = 5591377
    TabOrder = 2
    UseDockManager = True
    AnchorHint = False
    AutoSize.Enabled = False
    AutoSize.Height = True
    AutoSize.Width = True
    AutoHideChildren = True
    BackgroundPosition = bpTopLeft
    BorderColor = clBlack
    BorderShadow = False
    BorderWidth = 1
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
    DesignSize = (
      700
      41)
    FullHeight = 0
    object Label3: TLabel
      Left = 286
      Top = 9
      Width = 8
      Height = 22
      Caption = '/'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 11
      Top = 9
      Width = 97
      Height = 22
      Caption = 'Tax && Service'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object edtsc: TAdvEdit
      Left = 300
      Top = 6
      Width = 97
      Height = 26
      AutoFocus = False
      EditAlign = eaRight
      EditType = etString
      ErrorMarkerPos = 0
      ErrorMarkerLen = 0
      ErrorColor = clRed
      ErrorFontColor = clWhite
      ExcelStyleDecimalSeparator = False
      Flat = False
      FlatLineColor = clBlack
      FlatParentColor = True
      FocusAlign = eaDefault
      FocusBorder = False
      FocusColor = clWindow
      FocusFontColor = clWindowText
      FocusLabel = False
      FocusWidthInc = 0
      ModifiedColor = clHighlight
      DisabledColor = clSilver
      URLColor = clBlue
      ReturnIsTab = False
      LengthLimit = 0
      TabOnFullLength = False
      Precision = 0
      LabelPosition = lpLeftTop
      LabelMargin = 4
      LabelTransparent = False
      LabelAlwaysEnabled = False
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'MS Sans Serif'
      LabelFont.Style = []
      Lookup.CaseSensitive = False
      Lookup.Color = clWindow
      Lookup.DisplayCount = 4
      Lookup.Enabled = False
      Lookup.History = False
      Lookup.NumChars = 2
      Lookup.Multi = False
      Lookup.Separator = ';'
      Persistence.Enable = False
      Persistence.Location = plInifile
      Color = clWindow
      Enabled = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsItalic]
      HintShowLargeText = False
      ParentFont = False
      OleDropTarget = False
      OleDropSource = False
      Signed = False
      TabOrder = 0
      Text = '='
      Transparent = False
      Visible = True
    end
    object edttax: TAdvEdit
      Left = 153
      Top = 7
      Width = 117
      Height = 26
      AutoFocus = False
      EditAlign = eaRight
      EditType = etString
      ErrorMarkerPos = 0
      ErrorMarkerLen = 0
      ErrorColor = clRed
      ErrorFontColor = clWhite
      ExcelStyleDecimalSeparator = False
      Flat = False
      FlatLineColor = clBlack
      FlatParentColor = True
      FocusAlign = eaDefault
      FocusBorder = False
      FocusColor = clWindow
      FocusFontColor = clWindowText
      FocusLabel = False
      FocusWidthInc = 0
      ModifiedColor = clHighlight
      DisabledColor = clSilver
      URLColor = clBlue
      ReturnIsTab = False
      LengthLimit = 0
      TabOnFullLength = False
      Precision = 0
      LabelPosition = lpLeftTop
      LabelMargin = 4
      LabelTransparent = False
      LabelAlwaysEnabled = False
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'MS Sans Serif'
      LabelFont.Style = []
      Lookup.CaseSensitive = False
      Lookup.Color = clWindow
      Lookup.DisplayCount = 4
      Lookup.Enabled = False
      Lookup.History = False
      Lookup.NumChars = 2
      Lookup.Multi = False
      Lookup.Separator = ';'
      Persistence.Enable = False
      Persistence.Location = plInifile
      Color = clWindow
      Enabled = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsItalic]
      HintShowLargeText = False
      ParentFont = False
      OleDropTarget = False
      OleDropSource = False
      Signed = False
      TabOrder = 1
      Transparent = False
      Visible = True
    end
    object edtTotal: TAdvEdit
      Left = 449
      Top = 1
      Width = 245
      Height = 37
      AutoFocus = False
      EditAlign = eaRight
      EditType = etMoney
      ErrorMarkerPos = 0
      ErrorMarkerLen = 0
      ErrorColor = clRed
      ErrorFontColor = clWhite
      ExcelStyleDecimalSeparator = False
      Flat = False
      FlatLineColor = clBlack
      FlatParentColor = True
      FocusAlign = eaDefault
      FocusBorder = False
      FocusColor = clWindow
      FocusFontColor = clWindowText
      FocusLabel = False
      FocusWidthInc = 0
      ModifiedColor = clHighlight
      DisabledColor = clSilver
      URLColor = clBlue
      ReturnIsTab = False
      LengthLimit = 0
      TabOnFullLength = False
      Precision = 0
      LabelPosition = lpLeftTop
      LabelMargin = 4
      LabelTransparent = False
      LabelAlwaysEnabled = False
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'MS Sans Serif'
      LabelFont.Style = []
      Lookup.CaseSensitive = False
      Lookup.Color = clWindow
      Lookup.DisplayCount = 4
      Lookup.Enabled = False
      Lookup.History = False
      Lookup.NumChars = 2
      Lookup.Multi = False
      Lookup.Separator = ';'
      Persistence.Enable = False
      Persistence.Location = plInifile
      Anchors = [akTop, akRight]
      Color = clYellow
      Enabled = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -24
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold, fsItalic]
      HintShowLargeText = False
      ParentFont = False
      OleDropTarget = False
      OleDropSource = False
      ReadOnly = True
      Signed = False
      TabOrder = 2
      Text = '0'
      Transparent = False
      Visible = True
    end
  end
  object cxStyleRepository4: TcxStyleRepository
    Left = 24
    Top = 96
    PixelsPerInch = 96
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -21
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      TextColor = clBlack
    end
  end
  object cxStyleRepository2: TcxStyleRepository
    Left = 88
    Top = 96
    PixelsPerInch = 96
    object cxStyle2: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Trebuchet MS'
      Font.Style = []
    end
  end
  object cxStyleRepository3: TcxStyleRepository
    Left = 56
    Top = 96
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
  object ds2: TDataSource
    DataSet = ClientDataSet1
    Left = 409
    Top = 238
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 368
    Top = 248
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLQuery1
    Left = 328
    Top = 216
  end
  object SQLQuery1: TSQLQuery
    Params = <>
    Left = 278
    Top = 232
  end
  object cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clSilver
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor]
      Color = clWhite
    end
  end
end
