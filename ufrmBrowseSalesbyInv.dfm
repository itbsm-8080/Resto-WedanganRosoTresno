inherited frmBrowseSalesByInv: TfrmBrowseSalesByInv
  Left = 499
  Top = 142
  Caption = 'Browse Sales By Inv'
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
      Visible = False
    end
    inherited cxButton4: TcxButton
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
        OptionsView.Footer = True
        OptionsView.GroupByBox = True
      end
    end
  end
end
