object StartManSetupForm: TStartManSetupForm
  Left = 471
  Top = 327
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Start Search for Selected Cubes'
  ClientHeight = 158
  ClientWidth = 321
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 220
    Top = 88
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 0
    OnClick = Button1Click
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 306
    Height = 69
    Caption = 'Search Type'
    TabOrder = 1
    object RBTwoPhase: TRadioButton
      Left = 9
      Top = 19
      Width = 224
      Height = 17
      Caption = 'Two-Phase-Algorithm - Main Window'
      TabOrder = 0
    end
    object RBOptimal: TRadioButton
      Left = 9
      Top = 42
      Width = 208
      Height = 17
      Caption = 'Optimal Solver - Main WIndows'
      Checked = True
      TabOrder = 1
      TabStop = True
    end
    object Panel1: TPanel
      Left = 88
      Top = 112
      Width = 185
      Height = 41
      Caption = 'Panel1'
      TabOrder = 2
    end
  end
  object BCancel: TButton
    Left = 220
    Top = 121
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = BCancelClick
  end
  object GBTriggerLength: TGroupBox
    Left = 8
    Top = 83
    Width = 185
    Height = 63
    Caption = 'Start if current Length exceeds'
    TabOrder = 3
    object RadioButton1: TRadioButton
      Left = 11
      Top = 26
      Width = 29
      Height = 17
      Caption = '0'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object RadioButton2: TRadioButton
      Tag = 18
      Left = 53
      Top = 26
      Width = 38
      Height = 17
      Caption = '18'
      TabOrder = 1
    end
    object RadioButton3: TRadioButton
      Tag = 19
      Left = 96
      Top = 26
      Width = 38
      Height = 17
      Caption = '19'
      TabOrder = 2
    end
    object RadioButton4: TRadioButton
      Tag = 20
      Left = 139
      Top = 26
      Width = 38
      Height = 17
      Caption = '20'
      TabOrder = 3
    end
  end
end
