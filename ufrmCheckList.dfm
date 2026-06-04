object frmCheckList: TfrmCheckList
  Left = 287
  Top = 126
  Width = 1026
  Height = 543
  Caption = 'Check List Order'
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
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object AdvPanel2: TAdvPanel
    Left = 0
    Top = 0
    Width = 1010
    Height = 41
    Align = alTop
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
      Width = 129
      Height = 19
      Caption = 'CheckList Order'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 580
      Top = 9
      Width = 89
      Height = 22
      Caption = 'Refresh tiap'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBtnShadow
      Font.Height = -16
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 740
      Top = 9
      Width = 39
      Height = 22
      Caption = 'Detik'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBtnShadow
      Font.Height = -16
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 256
      Top = 10
      Width = 63
      Height = 22
      Caption = 'Filter By'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBtnShadow
      Font.Height = -16
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object edtdetik: TAdvEdit
      Left = 682
      Top = 6
      Width = 46
      Height = 30
      AutoFocus = False
      EditAlign = eaCenter
      EditType = etNumeric
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
      TabOrder = 0
      Text = '15'
      Transparent = False
      Visible = True
      OnExit = edtdetikExit
      OnKeyPress = edtdetikKeyPress
    end
    object cbFilter: TComboBox
      Left = 352
      Top = 8
      Width = 145
      Height = 26
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ItemHeight = 18
      ItemIndex = 0
      ParentFont = False
      TabOrder = 1
      Text = 'FOOD'
      Items.Strings = (
        'FOOD'
        'DRINK')
    end
    object chkrefresh: TCheckBox
      Left = 808
      Top = 11
      Width = 121
      Height = 17
      Caption = 'Stop Refresh'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 41
    Width = 1010
    Height = 463
    ActivePage = cxTabSheet1
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ClientRectBottom = 461
    ClientRectLeft = 2
    ClientRectRight = 1008
    ClientRectTop = 33
    object cxTabSheet1: TcxTabSheet
      Caption = 'Belum Diproses'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ImageIndex = 0
      ParentFont = False
      object AdvPanel1: TAdvPanel
        Left = 0
        Top = 376
        Width = 1006
        Height = 52
        Align = alBottom
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
        object Label3: TLabel
          Left = 192
          Top = 12
          Width = 162
          Height = 22
          Caption = 'TAKE AWAY / GO FOOD'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBtnShadow
          Font.Height = -16
          Font.Name = 'Trebuchet MS'
          Font.Style = [fsItalic]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 56
          Top = 12
          Width = 79
          Height = 22
          Caption = 'Void Order'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBtnShadow
          Font.Height = -16
          Font.Name = 'Trebuchet MS'
          Font.Style = [fsItalic]
          ParentFont = False
        end
        object cxButton1: TcxButton
          Left = 850
          Top = 2
          Width = 154
          Height = 48
          Caption = 'Apply'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Trebuchet MS'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = cxButton1Click
          Align = alRight
          Colors.Normal = 13147142
          LookAndFeel.Kind = lfStandard
          LookAndFeel.SkinName = 'LondonLiquidSky'
        end
        object AdvPanel5: TAdvPanel
          Left = 16
          Top = 12
          Width = 33
          Height = 22
          Color = clMaroon
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
        end
        object AdvPanel6: TAdvPanel
          Left = 152
          Top = 12
          Width = 33
          Height = 22
          Color = clFuchsia
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
        end
      end
      object MediaPlayer1: TMediaPlayer
        Left = 528
        Top = 424
        Width = 253
        Height = 30
        Visible = False
        TabOrder = 1
      end
      object cxGrid1: TcxGrid
        Left = 0
        Top = 0
        Width = 1006
        Height = 376
        Align = alClient
        TabOrder = 2
        object cxGridDBTableView2: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = DataSource2
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnSorting = False
          OptionsSelection.HideSelection = True
          OptionsSelection.InvertSelect = False
          OptionsView.CellAutoHeight = True
          Styles.Content = cxStyle2
          Styles.OnGetContentStyle = cxGrid1DBTableView1Column3StylesGetContentStyle
          Styles.Header = cxStyle2
          object cxGridDBColumn11: TcxGridDBColumn
            Caption = 'Jam'
            DataBinding.FieldName = 'jam'
            Options.Editing = False
            Width = 169
          end
          object cxGridDBColumn13: TcxGridDBColumn
            DataBinding.FieldName = 'nama'
            Options.Editing = False
            Width = 179
          end
          object cxGridDBColumn14: TcxGridDBColumn
            DataBinding.FieldName = 'Qty'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 82
          end
          object cxGridDBColumn15: TcxGridDBColumn
            DataBinding.FieldName = 'varian'
            Options.Editing = False
            Width = 118
          end
          object cxGridDBColumn16: TcxGridDBColumn
            DataBinding.FieldName = 'modifier'
            Options.Editing = False
            Width = 147
          end
          object cxGridDBColumn17: TcxGridDBColumn
            DataBinding.FieldName = 'SalesType'
            Options.Editing = False
            Width = 109
          end
          object cxGridDBColumn18: TcxGridDBColumn
            Caption = 'Check'
            DataBinding.FieldName = 'chek'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.ValueChecked = 1
            Properties.ValueUnchecked = 0
            Properties.OnEditValueChanged = cxGridDBColumn18PropertiesEditValueChanged
            Width = 71
          end
          object cxGridDBColumn19: TcxGridDBColumn
            DataBinding.FieldName = 'nourut'
            Visible = False
          end
          object cxGridDBColumn20: TcxGridDBColumn
            DataBinding.FieldName = 'nomor'
            Visible = False
          end
          object cxGridDBColumn21: TcxGridDBColumn
            DataBinding.FieldName = 'meja'
            Options.Editing = False
            Width = 114
          end
          object cxGridDBColumn22: TcxGridDBColumn
            DataBinding.FieldName = 'customer'
            Options.Editing = False
            Width = 224
          end
          object cxGridDBColumn23: TcxGridDBColumn
            DataBinding.FieldName = 'ID'
            PropertiesClassName = 'TcxTextEditProperties'
            Styles.Content = cxStyle7
            IsCaptionAssigned = True
          end
        end
        object cxGridLevel2: TcxGridLevel
          GridView = cxGridDBTableView2
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'Sudah Diproses'
      ImageIndex = 1
      object AdvPanel4: TAdvPanel
        Left = 0
        Top = 376
        Width = 1006
        Height = 52
        Align = alBottom
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
        object cxButton2: TcxButton
          Left = 850
          Top = 2
          Width = 154
          Height = 48
          Caption = 'Apply'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Trebuchet MS'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = cxButton2Click
          Align = alRight
          Colors.Normal = clRed
          LookAndFeel.Kind = lfStandard
          LookAndFeel.SkinName = 'LondonLiquidSky'
        end
      end
      object cxGrid2: TcxGrid
        Left = 0
        Top = 0
        Width = 1006
        Height = 376
        Align = alClient
        TabOrder = 1
        object cxGridDBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = DataSource1
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnSorting = False
          OptionsSelection.HideSelection = True
          OptionsSelection.InvertSelect = False
          OptionsView.CellAutoHeight = True
          Styles.Content = cxStyle2
          Styles.OnGetContentStyle = cxGrid1DBTableView1Column3StylesGetContentStyle
          Styles.Header = cxStyle2
          object cxGridDBColumn1: TcxGridDBColumn
            Caption = 'Jam Eksekusi'
            DataBinding.FieldName = 'jam'
            Options.Editing = False
            Width = 169
          end
          object cxGridDBTableView1Column3: TcxGridDBColumn
            Caption = 'Jam Order'
            DataBinding.FieldName = 'jam2'
            Width = 108
          end
          object cxGridDBColumn2: TcxGridDBColumn
            DataBinding.FieldName = 'nama'
            Options.Editing = False
            Width = 179
          end
          object cxGridDBTableView1Column1: TcxGridDBColumn
            Caption = 'Qty'
            DataBinding.FieldName = 'Qty'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 82
          end
          object cxGridDBColumn3: TcxGridDBColumn
            DataBinding.FieldName = 'varian'
            Options.Editing = False
            Width = 118
          end
          object cxGridDBColumn4: TcxGridDBColumn
            DataBinding.FieldName = 'modifier'
            Options.Editing = False
            Width = 147
          end
          object cxGridDBColumn5: TcxGridDBColumn
            DataBinding.FieldName = 'SalesType'
            Options.Editing = False
            Width = 109
          end
          object cxGridDBColumn6: TcxGridDBColumn
            Caption = 'Check'
            DataBinding.FieldName = 'chek'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.ValueChecked = 1
            Properties.ValueUnchecked = 0
            Properties.OnEditValueChanged = cxGridDBColumn6PropertiesEditValueChanged
            Width = 71
          end
          object cxGridDBColumn7: TcxGridDBColumn
            DataBinding.FieldName = 'nourut'
            Visible = False
          end
          object cxGridDBColumn8: TcxGridDBColumn
            DataBinding.FieldName = 'nomor'
            Visible = False
          end
          object cxGridDBColumn9: TcxGridDBColumn
            DataBinding.FieldName = 'meja'
            Options.Editing = False
            Width = 114
          end
          object cxGridDBColumn10: TcxGridDBColumn
            DataBinding.FieldName = 'customer'
            Options.Editing = False
            Width = 224
          end
          object cxGridDBTableView1Column2: TcxGridDBColumn
            DataBinding.FieldName = 'ID'
            PropertiesClassName = 'TcxTextEditProperties'
            Styles.Content = cxStyle7
            IsCaptionAssigned = True
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGridDBTableView1
        end
      end
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 56
    Top = 8
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clYellow
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      TextColor = clBlack
    end
  end
  object cxStyleRepository2: TcxStyleRepository
    Left = 72
    PixelsPerInch = 96
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
    end
  end
  object cxStyleRepository3: TcxStyleRepository
    Left = 48
    PixelsPerInch = 96
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMaroon
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
  end
  object cxStyleRepository4: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clFuchsia
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      TextColor = clBlack
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
  end
  object Timer1: TTimer
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 658
    Top = 184
  end
  object cxStyleRepository5: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle6: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Trebuchet MS'
      Font.Style = []
    end
  end
  object cxStyleRepository6: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle7: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      TextColor = clWhite
    end
  end
  object MyQuery1: TMyQuery
    Connection = frmMenu.MyConnection1
    SQL.Strings = (
      
        'SELECT  jl_table Meja,jl_atasnama Customer, date_FORMAT(jld_tgle' +
        'ksekusi,"%H:%i:%s") jam,date_FORMAT(jld_tglorder,"%H:%i:%s") jam' +
        '2,'
      'item_nama Nama,jld_qty qty,'
      'jld_varian Varian,jld_modifier Modifier,'
      'jld_salestype SalesType,'
      
        'jld_nourut nourut,jld_jl_nomor Nomor,ITEM_ID ID,CAST(0 AS UNSIGN' +
        'ED)  chek'
      'FROM tjual_dtl inner join titem on jld_item=item_id'
      'INNER JOIN tjual ON jl_nomor=jld_jl_nomor'
      'WHERE jld_status in (1,2) AND jld_iseksekusi=1'
      'and jl_tanggal >= now()'
      'ORDER BY jld_tgleksekusi desc'
      'limit 0')
    Left = 338
    Top = 210
    object MyQuery1Meja: TStringField
      FieldName = 'Meja'
      Origin = 'tjual.jl_table'
      Size = 30
    end
    object MyQuery1Customer: TStringField
      FieldName = 'Customer'
      Origin = 'tjual.jl_atasnama'
      Size = 30
    end
    object MyQuery1jam: TStringField
      FieldName = 'jam'
      Origin = 'jam'
      Size = 13
    end
    object MyQuery1jam2: TStringField
      FieldName = 'jam2'
      Origin = 'jam2'
      Size = 13
    end
    object MyQuery1Nama: TStringField
      FieldName = 'Nama'
      Origin = 'titem.item_nama'
      Size = 30
    end
    object MyQuery1qty: TFloatField
      FieldName = 'qty'
      Origin = 'tjual_dtl.jld_qty'
    end
    object MyQuery1Varian: TStringField
      FieldName = 'Varian'
      Origin = 'tjual_dtl.jld_varian'
    end
    object MyQuery1Modifier: TStringField
      FieldName = 'Modifier'
      Origin = 'tjual_dtl.jld_modifier'
      Size = 100
    end
    object MyQuery1SalesType: TStringField
      FieldName = 'SalesType'
      Origin = 'tjual_dtl.jld_salestype'
    end
    object MyQuery1nourut: TIntegerField
      FieldName = 'nourut'
      Origin = 'tjual_dtl.jld_nourut'
    end
    object MyQuery1Nomor: TStringField
      FieldName = 'Nomor'
      Origin = 'tjual_dtl.jld_jl_nomor'
    end
    object MyQuery1ID: TIntegerField
      FieldName = 'ID'
      Origin = 'titem.item_id'
    end
    object MyQuery1chek: TLargeintField
      FieldName = 'chek'
      Origin = 'chek'
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = MyQuery1
    Left = 362
    Top = 258
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 490
    Top = 186
    object ClientDataSet1Meja: TStringField
      FieldName = 'Meja'
      Origin = 'tjual.jl_table'
      Size = 30
    end
    object ClientDataSet1Customer: TStringField
      FieldName = 'Customer'
      Origin = 'tjual.jl_atasnama'
      Size = 30
    end
    object ClientDataSet1jam: TStringField
      FieldName = 'jam'
      Origin = 'jam'
      Size = 13
    end
    object ClientDataSet1jam2: TStringField
      FieldName = 'jam2'
      Origin = 'jam2'
      Size = 13
    end
    object ClientDataSet1Nama: TStringField
      FieldName = 'Nama'
      Origin = 'titem.item_nama'
      Size = 30
    end
    object ClientDataSet1qty: TFloatField
      FieldName = 'qty'
      Origin = 'tjual_dtl.jld_qty'
    end
    object ClientDataSet1Varian: TStringField
      FieldName = 'Varian'
      Origin = 'tjual_dtl.jld_varian'
    end
    object ClientDataSet1Modifier: TStringField
      FieldName = 'Modifier'
      Origin = 'tjual_dtl.jld_modifier'
      Size = 100
    end
    object ClientDataSet1SalesType: TStringField
      FieldName = 'SalesType'
      Origin = 'tjual_dtl.jld_salestype'
    end
    object ClientDataSet1nourut: TIntegerField
      FieldName = 'nourut'
      Origin = 'tjual_dtl.jld_nourut'
    end
    object ClientDataSet1Nomor: TStringField
      FieldName = 'Nomor'
      Origin = 'tjual_dtl.jld_jl_nomor'
    end
    object ClientDataSet1ID: TIntegerField
      FieldName = 'ID'
      Origin = 'titem.item_id'
    end
    object ClientDataSet1chek: TLargeintField
      FieldName = 'chek'
      Origin = 'chek'
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 554
    Top = 226
  end
  object MyQuery2: TMyQuery
    Connection = frmMenu.MyConnection1
    SQL.Strings = (
      
        'SELECT  jl_table Meja,jl_atasnama Customer, date_FORMAT(jld_tglo' +
        'rder,"%H:%i:%s") jam,item_nama Nama,jld_qty Qty, jld_varian Vari' +
        'an,concat(jld_modifier," ",jld_notes) Modifier, cast(0 as unsign' +
        'ed) chek,jld_salestype SalesType, jld_nourut nourut,jld_jl_nomor' +
        ' Nomor,jld_isdelete isdelete,item_id ID FROM tjual_dtl inner joi' +
        'n titem on jld_item=item_id INNER JOIN tjual ON jl_nomor=jld_jl_' +
        'nomor INNER JOIN tcategory ON ct_nama=item_category  WHERE jld_s' +
        'tatus in (1,2) AND jld_iseksekusi=0 AND ct_printername = '#39'FOOD'#39' ' +
        'and jl_tanggal >= '#39'2022/08/12'#39' ORDER BY jl_tanggal , jld_nourut')
    Left = 218
    Top = 226
    object MyQuery2Meja: TStringField
      FieldName = 'Meja'
      Origin = 'tjual.jl_table'
      Size = 30
    end
    object MyQuery2Customer: TStringField
      FieldName = 'Customer'
      Origin = 'tjual.jl_atasnama'
      Size = 30
    end
    object MyQuery2jam: TStringField
      FieldName = 'jam'
      Origin = 'jam'
      Size = 13
    end
    object MyQuery2Nama: TStringField
      FieldName = 'Nama'
      Origin = 'titem.item_nama'
      Size = 30
    end
    object MyQuery2Qty: TFloatField
      FieldName = 'Qty'
      Origin = 'tjual_dtl.jld_qty'
    end
    object MyQuery2Varian: TStringField
      FieldName = 'Varian'
      Origin = 'tjual_dtl.jld_varian'
    end
    object MyQuery2Modifier: TStringField
      FieldName = 'Modifier'
      Origin = 'Modifier'
      Size = 151
    end
    object MyQuery2chek: TLargeintField
      FieldName = 'chek'
      Origin = 'chek'
    end
    object MyQuery2SalesType: TStringField
      FieldName = 'SalesType'
      Origin = 'tjual_dtl.jld_salestype'
    end
    object MyQuery2nourut: TIntegerField
      FieldName = 'nourut'
      Origin = 'tjual_dtl.jld_nourut'
    end
    object MyQuery2Nomor: TStringField
      FieldName = 'Nomor'
      Origin = 'tjual_dtl.jld_jl_nomor'
    end
    object MyQuery2isdelete: TIntegerField
      FieldName = 'isdelete'
      Origin = 'tjual_dtl.jld_isdelete'
    end
    object MyQuery2ID: TIntegerField
      FieldName = 'ID'
      Origin = 'titem.item_id'
    end
  end
  object DataSetProvider2: TDataSetProvider
    DataSet = MyQuery2
    Left = 242
    Top = 274
  end
  object ClientDataSet2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider2'
    Left = 370
    Top = 202
    object ClientDataSet2Meja: TStringField
      FieldName = 'Meja'
      Size = 30
    end
    object ClientDataSet2Customer: TStringField
      FieldName = 'Customer'
      Size = 30
    end
    object ClientDataSet2jam: TStringField
      FieldName = 'jam'
      Size = 13
    end
    object ClientDataSet2Nama: TStringField
      FieldName = 'Nama'
      Size = 30
    end
    object ClientDataSet2Qty: TFloatField
      FieldName = 'Qty'
    end
    object ClientDataSet2Varian: TStringField
      FieldName = 'Varian'
    end
    object ClientDataSet2Modifier: TStringField
      FieldName = 'Modifier'
      Size = 151
    end
    object ClientDataSet2chek: TLargeintField
      FieldName = 'chek'
    end
    object ClientDataSet2SalesType: TStringField
      FieldName = 'SalesType'
    end
    object ClientDataSet2nourut: TIntegerField
      FieldName = 'nourut'
    end
    object ClientDataSet2Nomor: TStringField
      FieldName = 'Nomor'
    end
    object ClientDataSet2isdelete: TIntegerField
      FieldName = 'isdelete'
    end
    object ClientDataSet2ID: TIntegerField
      FieldName = 'ID'
    end
  end
  object DataSource2: TDataSource
    DataSet = ClientDataSet2
    Left = 434
    Top = 242
  end
end
