object Coset: TCoset
  Left = 522
  Top = 506
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Coset Explorer'
  ClientHeight = 408
  ClientWidth = 396
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  DesignSize = (
    396
    408)
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonStart: TButton
    Left = 160
    Top = 336
    Width = 101
    Height = 25
    Caption = 'Continue Search'
    TabOrder = 0
    OnClick = ButtonStartClick
  end
  object ButtonStop: TButton
    Left = 44
    Top = 336
    Width = 97
    Height = 25
    Caption = 'Interrupt Search'
    Enabled = False
    TabOrder = 1
    OnClick = ButtonStopClick
  end
  object Info: TMemo
    Left = 0
    Top = 0
    Width = 396
    Height = 329
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object ButtonAddCubes: TButton
    Left = 44
    Top = 368
    Width = 217
    Height = 25
    Caption = 'Add unsolved Cubes to Main Window'
    TabOrder = 3
    OnClick = ButtonAddCubesClick
  end
  object ButtonExit: TButton
    Left = 284
    Top = 368
    Width = 75
    Height = 25
    Caption = 'Exit Search'
    TabOrder = 4
  end
end
