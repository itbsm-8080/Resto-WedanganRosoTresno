object frmPos: TfrmPos
  Left = 17
  Top = 146
  Width = 1188
  Height = 543
  Align = alTop
  Caption = 'Point Of Sale'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object AdvPanel1: TAdvPanel
    Left = 569
    Top = 41
    Width = 603
    Height = 428
    Align = alClient
    BevelInner = bvRaised
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
    Caption.Font.Name = 'Tahoma'
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
    object AdvPanel4: TAdvPanel
      Left = 2
      Top = 384
      Width = 599
      Height = 42
      Align = alBottom
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
      object cxButton1: TcxButton
        Left = 89
        Top = 2
        Width = 87
        Height = 38
        Caption = 'Charge'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = cxButton1Click
        Align = alLeft
        Colors.Normal = clGray
        LookAndFeel.Kind = lfStandard
        LookAndFeel.SkinName = 'LondonLiquidSky'
      end
      object cxplit: TcxButton
        Left = 2
        Top = 2
        Width = 87
        Height = 38
        Caption = 'Split'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = cxplitClick
        Align = alLeft
        Colors.Normal = clGray
        LookAndFeel.Kind = lfStandard
        LookAndFeel.SkinName = 'LondonLiquidSky'
      end
      object AdvPanel7: TAdvPanel
        Left = 355
        Top = 2
        Width = 242
        Height = 38
        Align = alRight
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
        object edtTotal: TAdvEdit
          Left = 1
          Top = 0
          Width = 240
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
          TabOrder = 0
          Text = '0'
          Transparent = False
          Visible = True
        end
      end
    end
    object AdvPanel8: TAdvPanel
      Left = 2
      Top = 2
      Width = 599
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      Color = 5591377
      TabOrder = 1
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
      object Label6: TLabel
        Left = 209
        Top = 9
        Width = 35
        Height = 22
        Caption = 'Meja'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 348
        Top = 9
        Width = 63
        Height = 22
        Caption = 'Promo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object cxButton3: TcxButton
        Left = 0
        Top = 0
        Width = 88
        Height = 41
        Caption = 'List Order'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = cxButton3Click
        Align = alLeft
        Colors.Normal = clGray
        LookAndFeel.Kind = lfFlat
      end
      object cxtable: TcxButton
        Left = 612
        Top = 24
        Width = 100
        Height = 46
        Caption = 'Add Table'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        Visible = False
        OnClick = cxtableClick
        Colors.Normal = clGray
        LookAndFeel.Kind = lfFlat
      end
      object edtNomor: TAdvEdit
        Left = 608
        Top = 8
        Width = 121
        Height = 21
        AutoFocus = False
        EditAlign = eaLeft
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
        HintShowLargeText = False
        OleDropTarget = False
        OleDropSource = False
        Signed = False
        TabOrder = 2
        Transparent = False
        Visible = False
      end
      object edtmeja: TAdvEdit
        Left = 263
        Top = 6
        Width = 64
        Height = 30
        AutoFocus = False
        EditAlign = eaCenter
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
        Font.Height = -16
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        HintShowLargeText = False
        ParentFont = False
        OleDropTarget = False
        OleDropSource = False
        Signed = False
        TabOrder = 3
        Transparent = False
        Visible = True
      end
      object lblcustomer: TAdvEdit
        Left = 97
        Top = 9
        Width = 96
        Height = 26
        AutoFocus = False
        EditAlign = eaCenter
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
        ReadOnly = True
        Signed = False
        TabOrder = 4
        Transparent = False
        Visible = True
      end
      object lblnohp: TAdvEdit
        Left = 101
        Top = 44
        Width = 235
        Height = 26
        AutoFocus = False
        EditAlign = eaCenter
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
        ReadOnly = True
        Signed = False
        TabOrder = 5
        Transparent = False
        Visible = True
        OnChange = edtfilterChange
      end
      object cbDisc: TAdvComboBox
        Left = 405
        Top = 7
        Width = 130
        Height = 26
        Color = clWindow
        AutoFocus = False
        ButtonWidth = 19
        Flat = True
        FlatLineColor = clBlack
        FlatParentColor = True
        Etched = False
        FocusBorder = False
        DropWidth = 0
        Enabled = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsItalic]
        ItemHeight = 18
        LabelPosition = lpLeftTop
        LabelMargin = 4
        LabelTransparent = False
        LabelAlwaysEnabled = False
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'MS Sans Serif'
        LabelFont.Style = []
        ParentFont = False
        TabOrder = 6
        OnChange = cbDiscChange
      end
    end
    object cxGrid2: TcxGrid
      Left = 2
      Top = 43
      Width = 599
      Height = 300
      Align = alClient
      TabOrder = 2
      object cxgrdjual: TcxGridDBTableView
        OnDblClick = cxgrdjualDblClick
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
        OptionsView.Footer = True
        OptionsView.GridLines = glHorizontal
        OptionsView.GroupByBox = False
        OptionsView.RowSeparatorColor = clGray
        OptionsView.RowSeparatorWidth = 1
        Styles.Content = frmDetailItem.cxStyle2
        Styles.Footer = cxStyle3
        Styles.Header = cxStyle3
        object cxgrdjualColumn1: TcxGridDBColumn
          Caption = 'Name'
          DataBinding.FieldName = 'Nama'
          Options.Editing = False
          Width = 209
        end
        object cxgrdjualColumn2: TcxGridDBColumn
          DataBinding.FieldName = 'Qty'
          Options.Editing = False
          Styles.Content = cxStyle5
        end
        object cxgrdjualColumn9: TcxGridDBColumn
          Caption = 'Disc(%)'
          DataBinding.FieldName = 'Disc'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.;(,0.)'
          Styles.Content = cxStyle5
        end
        object cxgrdjualColumn3: TcxGridDBColumn
          Caption = 'Value'
          DataBinding.FieldName = 'value'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.;(,0.)'
          Options.Editing = False
          Styles.Content = cxStyle5
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
          Options.Editing = False
          Styles.Content = cxStyle2
          Width = 182
        end
      end
      object cxGrid2Level1: TcxGridLevel
        GridView = cxgrdjual
      end
    end
    object AdvPanel9: TAdvPanel
      Left = 2
      Top = 343
      Width = 599
      Height = 41
      Align = alBottom
      Color = 5591377
      TabOrder = 3
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
      object Label3: TLabel
        Left = 447
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
        Left = 204
        Top = 9
        Width = 97
        Height = 22
        Caption = 'Tax && Service'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsItalic]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object cxprint: TcxButton
        Left = 89
        Top = 2
        Width = 87
        Height = 37
        Caption = 'Print Bill'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = cxprintClick
        Align = alLeft
        Colors.Normal = clGray
        LookAndFeel.Kind = lfStandard
        LookAndFeel.SkinName = 'LondonLiquidSky'
      end
      object cxButton6: TcxButton
        Left = 2
        Top = 2
        Width = 87
        Height = 37
        Caption = 'Save Bill'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = cxButton6Click
        Align = alLeft
        Colors.Normal = clGray
        LookAndFeel.Kind = lfStandard
        LookAndFeel.SkinName = 'LondonLiquidSky'
      end
      object edtservice: TAdvEdit
        Left = 463
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
        TabOrder = 2
        Transparent = False
        Visible = True
      end
      object edttax: TAdvEdit
        Left = 321
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
        TabOrder = 3
        Transparent = False
        Visible = True
      end
    end
  end
  object AdvPanel3: TAdvPanel
    Left = 0
    Top = 469
    Width = 1172
    Height = 35
    Align = alBottom
    Color = 5591377
    TabOrder = 1
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
    Caption.Font.Name = 'Tahoma'
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
    object cxButton8: TcxButton
      Left = 1084
      Top = 1
      Width = 87
      Height = 33
      Caption = 'Close'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Visible = False
      OnClick = cxButton8Click
      Align = alRight
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        20000000000000040000C40E0000C40E00000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF001D63
        9B1619609839145D9562105A92880D5890A4135C92FC0C578FED999999FF7171
        71FF545454FF515151FF4F4F4FFF4C4C4CFF4A4A4AFF474747FF454545FF2567
        9DFF3274A8FF3D7CAFFF4784B5FF4E8ABAFF3E7EADFF0C578FEAFFFFFF00FFFF
        FF00585858FFA2A2A2FFA2A2A2FFA3A3A3FFA4A4A4FFA4A4A4FFA5A5A5FF2F6F
        A5FF78ABD2FF78ABD3FF73A7D1FF69A0CDFF407FAEFF0F5991EAFFFFFF00FFFF
        FF005C5C5CFFA1A1A1FF3C7340FFA0A1A1FFA3A3A3FFA3A3A3FFA4A4A4FF3674
        AAFF7DAFD4FF5B9AC9FF5495C7FF5896C8FF4180AEFF135C94EAFFFFFF00FFFF
        FF00606060FFA0A0A0FF3D7641FF367139FFA2A2A2FFA2A2A2FFA3A3A3FF3D79
        B0FF82B3D7FF629FCCFF5A9AC9FF5E9BCAFF4381AFFF196098EA37823EFF347E
        3BFF317937FF2E7534FF499150FF468F4CFF39733DFFA1A1A1FFA2A2A2FF457E
        B4FF88B7D9FF67A3CFFF619ECCFF639FCCFF4583B1FF1F649CEA3B8742FF89CB
        92FF84C88DFF80C688FF7BC383FF77C17FFF478F4DFF3B743FFFA1A1A1FF4C84
        BAFF8DBBDBFF6EA8D1FF66A6D1FF5FB4DFFF4785B1FF2569A1EA3E8B46FF8FCE
        99FF7DC687FF78C381FF73C07CFF74C07CFF79C281FF49904FFF547F57FF5489
        BFFF94BFDDFF75ADD4FF63B8E1FF4BD4FFFF428BB8FF2C6EA6EA41904AFF94D2
        9FFF91D09AFF8DCD96FF89CB92FF84C88DFF519858FF417C46FF9F9F9FFF5A8E
        C4FF98C3E0FF7CB3D7FF74AFD6FF5EC4EDFF4B88B3FF3473ABEA44944DFF4291
        4BFF3F8D48FF3D8945FF5DA465FF5AA061FF45834BFF9E9E9EFF9E9E9EFF6092
        C9FF9EC7E2FF83B8DAFF7DB4D7FF7EB3D7FF4F89B4FF3B79B1EAFFFFFF00FFFF
        FF00777777FF9A9A9AFF3D8A45FF498A4FFF9C9C9CFF9D9D9DFF9D9D9DFF6696
        CCFFA2CBE3FF89BDDCFF83B9DAFF84B9DAFF518BB5FF437EB6EAFFFFFF00FFFF
        FF007A7A7AFF999999FF529159FF999A99FF9B9B9BFF9C9C9CFF9C9C9CFF6C9A
        D0FFA7CEE5FF8FC1DFFF89BDDCFF8BBDDCFF538DB6FF4B84BCEAFFFFFF00FFFF
        FF007D7D7DFF999999FF999999FF9A9A9AFF9A9A9AFF9B9B9BFF9B9B9BFF6F9D
        D3FFAAD1E7FFABD1E7FF98C7E1FF91C2DEFF568FB7FF5289C1EAFFFFFF00FFFF
        FF00808080FF7E7E7EFF7C7C7CFF7A7A7AFF777777FF757575FF727272FF719E
        D4FF6F9ED6FF87B2DCFFABD3E8FFA9D0E6FF5890B8FF598EC6EAFFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00709ED6DB6D9CD4FF85B1DAFF5A91B9FF6093CBEAFFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF006D9CD4896A9AD2FB6697CFEE}
      LookAndFeel.Kind = lfStandard
      LookAndFeel.SkinName = 'LondonLiquidSky'
    end
    object cxrefund: TcxButton
      Left = 88
      Top = 1
      Width = 87
      Height = 33
      Caption = 'Refund'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = cxrefundClick
      Align = alLeft
      Colors.Normal = clLime
      LookAndFeel.Kind = lfFlat
      LookAndFeel.SkinName = 'LondonLiquidSky'
    end
    object cxButton2: TcxButton
      Left = 1
      Top = 1
      Width = 87
      Height = 33
      Caption = 'Tutup Kasir'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = cxButton2Click
      Align = alLeft
      Colors.Normal = clRed
      LookAndFeel.Kind = lfFlat
      LookAndFeel.SkinName = 'LondonLiquidSky'
    end
    object cxButton4: TcxButton
      Left = 175
      Top = 1
      Width = 87
      Height = 33
      Caption = 'Reprint'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = cxButton4Click
      Align = alLeft
      Colors.Normal = 16744576
      LookAndFeel.Kind = lfFlat
      LookAndFeel.SkinName = 'LondonLiquidSky'
    end
  end
  object AdvPanel2: TAdvPanel
    Left = 0
    Top = 0
    Width = 1172
    Height = 41
    Align = alTop
    BevelOuter = bvNone
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
    object lbljudul: TLabel
      Left = 15
      Top = 11
      Width = 135
      Height = 19
      Caption = 'POINT OF SALES'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object cxnew: TcxButton
      Left = 1071
      Top = 0
      Width = 101
      Height = 41
      Caption = 'New Order'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = cxnewClick
      Align = alRight
      Colors.Normal = clGray
      LookAndFeel.Kind = lfFlat
    end
  end
  object AdvPanel5: TAdvPanel
    Left = 0
    Top = 41
    Width = 569
    Height = 428
    Align = alLeft
    TabOrder = 3
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
    object AdvPanel6: TAdvPanel
      Left = 1
      Top = 1
      Width = 567
      Height = 72
      Align = alTop
      BevelOuter = bvNone
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
        Left = 18
        Top = 10
        Width = 63
        Height = 22
        Caption = 'Filter by'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 18
        Top = 42
        Width = 66
        Height = 22
        Caption = 'Category'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object edtfilter: TAdvEdit
        Left = 104
        Top = 8
        Width = 329
        Height = 26
        AutoFocus = False
        EditAlign = eaLeft
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
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Trebuchet MS'
        Font.Style = []
        HintShowLargeText = False
        ParentFont = False
        OleDropTarget = False
        OleDropSource = False
        Signed = False
        TabOrder = 0
        Transparent = False
        Visible = True
        OnChange = edtfilterChange
      end
      object cbcategory: TAdvComboBox
        Left = 104
        Top = 39
        Width = 329
        Height = 26
        Color = clWindow
        AutoFocus = False
        ButtonWidth = 19
        Flat = True
        FlatLineColor = clBlack
        FlatParentColor = True
        Etched = False
        FocusBorder = False
        DropWidth = 0
        Enabled = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'Trebuchet MS'
        Font.Style = [fsItalic]
        ItemHeight = 18
        LabelPosition = lpLeftTop
        LabelMargin = 4
        LabelTransparent = False
        LabelAlwaysEnabled = False
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'MS Sans Serif'
        LabelFont.Style = []
        ParentFont = False
        TabOrder = 1
        OnChange = cbcategoryChange
      end
    end
    object cxGrid1: TcxGrid
      Left = 1
      Top = 73
      Width = 567
      Height = 354
      Align = alClient
      BorderStyle = cxcbsNone
      TabOrder = 1
      object cxGrid1DBTableView1: TcxGridDBTableView
        OnDblClick = cxGrid1DBTableView1DblClick
        NavigatorButtons.ConfirmDelete = False
        OnCellClick = cxGrid1DBTableView1CellClick
        DataController.DataSource = DataSource1
        DataController.Filter.TranslateIn = True
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        FilterRow.ApplyChanges = fracImmediately
        NewItemRow.SeparatorWidth = 12
        OptionsView.GridLines = glNone
        OptionsView.GroupByBox = False
        OptionsView.RowSeparatorColor = clGray
        OptionsView.RowSeparatorWidth = 1
        Preview.AutoHeight = False
        Styles.Content = cxStyle2
        Styles.Selection = cxStyle1
        Styles.Header = cxStyle3
        object cxGrid1DBTableView1Column1: TcxGridDBColumn
          DataBinding.FieldName = 'foto'
          PropertiesClassName = 'TcxImageProperties'
          Properties.GraphicClassName = 'TJPEGImage'
          Properties.Proportional = False
          Properties.ReadOnly = True
          Properties.Stretch = True
          Options.Editing = False
          Styles.Content = cxStyle4
          Width = 72
          IsCaptionAssigned = True
        end
        object cxGrid1DBTableView1Column2: TcxGridDBColumn
          Caption = 'Name'
          DataBinding.FieldName = 'nama'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Options.Focusing = False
          Width = 301
        end
        object cxGrid1DBTableView1Column3: TcxGridDBColumn
          DataBinding.FieldName = 'price'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = ',0.;(,0.)'
          Options.Editing = False
          Width = 80
        end
        object cxGrid1DBTableView1Column4: TcxGridDBColumn
          DataBinding.FieldName = 'varian'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Width = 104
        end
        object cxGrid1DBTableView1Column5: TcxGridDBColumn
          DataBinding.FieldName = 'id'
          MinWidth = 0
          Styles.Content = cxStyle4
          Width = 0
          IsCaptionAssigned = True
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
  end
  object cxStyleRepository1: TcxStyleRepository
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
    object cxStyle5: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
    end
  end
  object cxStyleRepository2: TcxStyleRepository
    Left = 104
    Top = 65528
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
  object cxStyleRepository3: TcxStyleRepository
    Left = 72
    Top = 24
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
  object MyQuery1: TMyQuery
    Connection = frmMenu.MyConnection1
    SQL.Strings = (
      
        'SELECT id ,Nama,Category ,Harga Price, if(varian > 1,CONCAT(vari' +
        'an," Price"),"") Varian,foto FROM ('
      'select item_id id ,item_nama Nama,item_category Category ,foto,'
      
        '(SELECT COUNT(*) from titemvarian where iv_item_id=item_id) vari' +
        'an ,item_harga harga'
      'from titem ORDER BY   item_id) final')
    Left = 224
    Top = 144
    object MyQuery1id: TIntegerField
      FieldName = 'id'
    end
    object MyQuery1Nama: TStringField
      FieldName = 'Nama'
      Size = 30
    end
    object MyQuery1Category: TStringField
      FieldName = 'Category'
      Size = 30
    end
    object MyQuery1Price: TFloatField
      FieldName = 'Price'
    end
    object MyQuery1Varian: TStringField
      FieldName = 'Varian'
      Size = 26
    end
    object MyQuery1foto: TBlobField
      FieldName = 'foto'
    end
  end
  object DataSource1: TDataSource
    DataSet = MyQuery1
    Left = 392
    Top = 176
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
      Font.Height = -48
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      TextColor = clWhite
    end
  end
  object cxImageList1: TcxImageList
    FormatVersion = 1
    DesignInfo = 16318824
  end
end
