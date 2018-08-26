object AboutForm: TAboutForm
  Left = 496
  Top = 542
  BorderStyle = bsDialog
  Caption = 'Info about Cube Explorer'
  ClientHeight = 174
  ClientWidth = 244
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
  object Bevel1: TBevel
    Left = 16
    Top = 16
    Width = 215
    Height = 113
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 26
    Top = 29
    Width = 193
    Height = 59
    HelpContext = 1007
    Alignment = taCenter
    AutoSize = False
    WordWrap = True
  end
  object Label2: TLabel
    Left = 54
    Top = 104
    Width = 136
    Height = 13
    Cursor = crHandPoint
    Caption = 'email: kociemba@t-online.de'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentColor = False
    ParentFont = False
    OnClick = Label2Click
  end
  object Button1: TButton
    Left = 85
    Top = 140
    Width = 75
    Height = 25
    HelpContext = 1007
    Caption = 'OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
end
