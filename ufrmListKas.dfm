inherited frmListKas: TfrmListKas
  Left = 288
  Top = 157
  Caption = 'Buku Besar'
  ClientWidth = 936
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited AdvPanel1: TAdvPanel
    Width = 936
    FullHeight = 0
    inherited cxButton1: TcxButton
      Visible = False
    end
    inherited cxButton2: TcxButton
      Visible = False
    end
    inherited cxButton3: TcxButton
      Visible = False
    end
    inherited cxButton4: TcxButton
      Visible = False
    end
    inherited cxButton6: TcxButton
      Visible = False
    end
    inherited cxButton8: TcxButton
      Left = 847
    end
  end
  inherited AdvPanel2: TAdvPanel
    Width = 936
    Height = 57
    FullHeight = 0
    object Label3: TLabel [2]
      Left = 14
      Top = 32
      Width = 55
      Height = 13
      Caption = 'Rekening'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited btnRefresh: TcxButton
      Left = 848
      Height = 55
    end
    object cxLookupRekeningCash: TcxExtLookupComboBox
      Left = 109
      Top = 28
      Properties.ImmediatePost = True
      Style.Color = clWindow
      Style.LookAndFeel.Kind = lfFlat
      Style.TransparentBorder = True
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 3
      Width = 440
    end
  end
  inherited AdvPanel3: TAdvPanel
    Top = 57
    Width = 936
    Height = 383
    FullHeight = 0
    inherited cxGrid: TcxGrid
      Width = 932
      Height = 379
      inherited cxGrdMaster: TcxGridDBTableView
        OptionsView.Footer = True
      end
    end
  end
end
