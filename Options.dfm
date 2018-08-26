object OptionForm: TOptionForm
  Left = 493
  Top = 624
  HelpContext = 1005
  BorderIcons = [biMinimize]
  BorderStyle = bsDialog
  ClientHeight = 153
  ClientWidth = 358
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox2: TGroupBox
    Tag = 18
    Left = 15
    Top = 13
    Width = 329
    Height = 84
    Caption = 'Stop automatic search at'
    TabOrder = 0
    object RadioButton6: TRadioButton
      Tag = 19
      Left = 88
      Top = 56
      Width = 71
      Height = 17
      Caption = '19 moves'
      TabOrder = 3
      OnClick = RBStopAtClick
    end
    object RadioButton7: TRadioButton
      Tag = 20
      Left = 168
      Top = 24
      Width = 71
      Height = 17
      Caption = '20 moves'
      Checked = True
      TabOrder = 4
      TabStop = True
      OnClick = RBStopAtClick
    end
    object RadioButton8: TRadioButton
      Tag = 21
      Left = 168
      Top = 56
      Width = 71
      Height = 17
      Caption = '21 moves'
      TabOrder = 5
      OnClick = RBStopAtClick
    end
    object RadioButton9: TRadioButton
      Tag = 22
      Left = 248
      Top = 24
      Width = 71
      Height = 17
      Caption = '22 moves'
      TabOrder = 6
      OnClick = RBStopAtClick
    end
    object RadioButton10: TRadioButton
      Tag = 18
      Left = 88
      Top = 24
      Width = 71
      Height = 17
      Caption = '18 moves'
      TabOrder = 2
      OnClick = RBStopAtClick
    end
    object RadioButton1: TRadioButton
      Tag = 23
      Left = 248
      Top = 56
      Width = 71
      Height = 17
      Caption = '23 moves'
      TabOrder = 7
      OnClick = RBStopAtClick
    end
    object RadioButton2: TRadioButton
      Tag = 16
      Left = 8
      Top = 24
      Width = 71
      Height = 17
      Caption = '16 moves'
      TabOrder = 0
      OnClick = RBStopAtClick
    end
    object RadioButton3: TRadioButton
      Tag = 17
      Left = 8
      Top = 56
      Width = 71
      Height = 17
      Caption = '17 moves'
      TabOrder = 1
      OnClick = RBStopAtClick
    end
  end
  object Button1: TButton
    Left = 234
    Top = 114
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 1
    OnClick = Button1Click
  end
  object CheckBox1: TCheckBox
    Left = 34
    Top = 118
    Width = 113
    Height = 17
    Caption = 'Use Triple Search'
    TabOrder = 2
    OnClick = CheckBox1Click
  end
end
