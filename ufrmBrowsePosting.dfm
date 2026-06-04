inherited frmBrowsePosting: TfrmBrowsePosting
  Left = 370
  Top = 143
  Caption = 'Posting'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited AdvPanel1: TAdvPanel
    FullHeight = 0
    inherited cxButton1: TcxButton
      Visible = False
    end
    inherited cxButton2: TcxButton
      OnClick = cxButton2Click
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
  end
  inherited AdvPanel2: TAdvPanel
    FullHeight = 0
  end
  inherited AdvPanel3: TAdvPanel
    FullHeight = 0
    inherited cxGrid: TcxGrid
      inherited cxGrdMaster: TcxGridDBTableView
        OptionsView.Footer = True
      end
    end
  end
end
