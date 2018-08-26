object OptimalBatch: TOptimalBatch
  Left = 438
  Top = 715
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Define Maximum Autorun Thread Number'
  ClientHeight = 113
  ClientWidth = 283
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
  object GroupBox1: TGroupBox
    Left = 10
    Top = 8
    Width = 265
    Height = 56
    Caption = 'Maximum Number of Threads'
    TabOrder = 0
    object RadioButton1: TRadioButton
      Tag = 1
      Left = 15
      Top = 22
      Width = 34
      Height = 17
      Caption = '1'
      TabOrder = 0
      OnClick = RadioButton1Click
    end
    object RadioButton2: TRadioButton
      Tag = 2
      Left = 55
      Top = 22
      Width = 34
      Height = 17
      Caption = '2'
      TabOrder = 1
      OnClick = RadioButton1Click
    end
    object RadioButton3: TRadioButton
      Tag = 4
      Left = 95
      Top = 22
      Width = 34
      Height = 17
      Caption = '4'
      TabOrder = 2
      OnClick = RadioButton1Click
    end
    object RadioButton4: TRadioButton
      Tag = 8
      Left = 135
      Top = 22
      Width = 34
      Height = 17
      Caption = '8'
      Checked = True
      TabOrder = 3
      TabStop = True
      OnClick = RadioButton1Click
    end
    object RadioButton5: TRadioButton
      Tag = 16
      Left = 175
      Top = 22
      Width = 34
      Height = 17
      Caption = '16'
      TabOrder = 4
      OnClick = RadioButton1Click
    end
    object RadioButton6: TRadioButton
      Tag = 32
      Left = 215
      Top = 22
      Width = 34
      Height = 17
      Caption = '32'
      TabOrder = 5
      OnClick = RadioButton1Click
    end
  end
  object Button1: TButton
    Left = 104
    Top = 75
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 1
    OnClick = Button1Click
  end
end
