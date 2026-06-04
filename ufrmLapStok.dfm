inherited frmLapStok: TfrmLapStok
  Left = 499
  Top = 142
  Caption = 'Lap. Stok'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited AdvPanel1: TAdvPanel
    FullHeight = 0
    inherited cxButton1: TcxButton
      Visible = False
    end
    inherited cxButton2: TcxButton
      Visible = False
    end
    inherited cxButton3: TcxButton
      Left = 451
      OnClick = cxButton3Click
    end
    inherited cxButton4: TcxButton
      Visible = False
    end
    inherited cxButton7: TcxButton
      Left = 263
    end
    inherited cxButton6: TcxButton
      Left = 350
      Visible = False
    end
  end
  inherited AdvPanel2: TAdvPanel
    FullHeight = 0
  end
  inherited AdvPanel3: TAdvPanel
    FullHeight = 0
    inherited cxGrid: TcxGrid
      inherited cxGrdMaster: TcxGridDBTableView
        DataController.DataSource = DataSource1
        OptionsView.Footer = True
        OptionsView.GroupByBox = True
        Styles.Content = cxStyle1
        Styles.Header = cxStyle1
      end
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -13
      Font.Name = 'Trebuchet MS'
      Font.Style = []
    end
  end
  object DataSource1: TDataSource
    DataSet = SQLQuery1
    Left = 472
    Top = 201
  end
end
