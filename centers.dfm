object CenterDlg: TCenterDlg
  Left = 595
  Top = 427
  Width = 283
  Height = 350
  BorderIcons = []
  Caption = 'Edit Center Twists'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 21
    Top = 248
    Width = 223
    Height = 13
    Caption = 'Mismatch counts clockwise in 90 degree steps '
  end
  object Button1: TButton
    Left = 96
    Top = 277
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 0
    OnClick = Button1Click
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 16
    Width = 75
    Height = 105
    Caption = 'U-mismatch'
    TabOrder = 1
    object RadioButton1: TRadioButton
      Left = 4
      Top = 16
      Width = 32
      Height = 17
      Caption = '0'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = UClick
    end
    object RadioButton2: TRadioButton
      Tag = 1
      Left = 4
      Top = 37
      Width = 32
      Height = 17
      Caption = '1'
      TabOrder = 1
      OnClick = UClick
    end
    object RadioButton3: TRadioButton
      Tag = 2
      Left = 4
      Top = 59
      Width = 32
      Height = 17
      Caption = '2'
      TabOrder = 2
      OnClick = UClick
    end
    object RadioButton4: TRadioButton
      Tag = 3
      Left = 4
      Top = 81
      Width = 32
      Height = 17
      Caption = '3'
      TabOrder = 3
      OnClick = UClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 100
    Top = 16
    Width = 75
    Height = 105
    Caption = 'R-mismatch'
    TabOrder = 2
    object RadioButton5: TRadioButton
      Left = 4
      Top = 16
      Width = 32
      Height = 17
      Caption = '0'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = RClick
    end
    object RadioButton6: TRadioButton
      Tag = 1
      Left = 4
      Top = 37
      Width = 32
      Height = 17
      Caption = '1'
      TabOrder = 1
      OnClick = RClick
    end
    object RadioButton7: TRadioButton
      Tag = 2
      Left = 4
      Top = 59
      Width = 32
      Height = 17
      Caption = '2'
      TabOrder = 2
      OnClick = RClick
    end
    object RadioButton8: TRadioButton
      Tag = 3
      Left = 4
      Top = 81
      Width = 32
      Height = 17
      Caption = '3'
      TabOrder = 3
      OnClick = RClick
    end
  end
  object GroupBox3: TGroupBox
    Left = 184
    Top = 16
    Width = 75
    Height = 105
    Caption = 'F-mismatch'
    TabOrder = 3
    object RadioButton9: TRadioButton
      Left = 4
      Top = 16
      Width = 32
      Height = 17
      Caption = '0'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = FClick
    end
    object RadioButton10: TRadioButton
      Tag = 1
      Left = 4
      Top = 37
      Width = 32
      Height = 17
      Caption = '1'
      TabOrder = 1
      OnClick = FClick
    end
    object RadioButton11: TRadioButton
      Tag = 2
      Left = 4
      Top = 59
      Width = 32
      Height = 17
      Caption = '2'
      TabOrder = 2
      OnClick = FClick
    end
    object RadioButton12: TRadioButton
      Tag = 3
      Left = 4
      Top = 81
      Width = 32
      Height = 17
      Caption = '3'
      TabOrder = 3
      OnClick = FClick
    end
  end
  object GroupBox4: TGroupBox
    Left = 16
    Top = 130
    Width = 75
    Height = 105
    Caption = 'D-mismatch'
    TabOrder = 4
    object RadioButton13: TRadioButton
      Left = 4
      Top = 16
      Width = 32
      Height = 17
      Caption = '0'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = DClick
    end
    object RadioButton14: TRadioButton
      Tag = 1
      Left = 4
      Top = 37
      Width = 32
      Height = 17
      Caption = '1'
      TabOrder = 1
      OnClick = DClick
    end
    object RadioButton15: TRadioButton
      Tag = 2
      Left = 4
      Top = 59
      Width = 32
      Height = 17
      Caption = '2'
      TabOrder = 2
      OnClick = DClick
    end
    object RadioButton16: TRadioButton
      Tag = 3
      Left = 4
      Top = 81
      Width = 32
      Height = 17
      Caption = '3'
      TabOrder = 3
      OnClick = DClick
    end
  end
  object GroupBox5: TGroupBox
    Left = 100
    Top = 130
    Width = 75
    Height = 105
    Caption = 'L-mismatch'
    TabOrder = 5
    object RadioButton17: TRadioButton
      Left = 4
      Top = 16
      Width = 32
      Height = 17
      Caption = '0'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = LClick
    end
    object RadioButton18: TRadioButton
      Tag = 1
      Left = 4
      Top = 37
      Width = 32
      Height = 17
      Caption = '1'
      TabOrder = 1
      OnClick = LClick
    end
    object RadioButton19: TRadioButton
      Tag = 2
      Left = 4
      Top = 59
      Width = 32
      Height = 17
      Caption = '2'
      TabOrder = 2
      OnClick = LClick
    end
    object RadioButton20: TRadioButton
      Tag = 3
      Left = 4
      Top = 81
      Width = 32
      Height = 17
      Caption = '3'
      TabOrder = 3
      OnClick = LClick
    end
  end
  object GroupBox6: TGroupBox
    Left = 184
    Top = 130
    Width = 75
    Height = 105
    Caption = 'B-mismatch'
    TabOrder = 6
    object RadioButton21: TRadioButton
      Left = 4
      Top = 16
      Width = 32
      Height = 17
      Caption = '0'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = BClick
    end
    object RadioButton22: TRadioButton
      Tag = 1
      Left = 4
      Top = 37
      Width = 32
      Height = 17
      Caption = '1'
      TabOrder = 1
      OnClick = BClick
    end
    object RadioButton23: TRadioButton
      Tag = 2
      Left = 4
      Top = 59
      Width = 32
      Height = 17
      Caption = '2'
      TabOrder = 2
      OnClick = BClick
    end
    object RadioButton24: TRadioButton
      Tag = 3
      Left = 4
      Top = 81
      Width = 32
      Height = 17
      Caption = '3'
      TabOrder = 3
      OnClick = BClick
    end
  end
end
