object ServSetupForm: TServSetupForm
  Left = 550
  Top = 632
  HelpContext = 1005
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Web Server Setup'
  ClientHeight = 116
  ClientWidth = 254
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
  object Label2: TLabel
    Left = 6
    Top = 16
    Width = 19
    Height = 13
    Caption = 'Port'
  end
  object CBEnable: TCheckBox
    Left = 121
    Top = 14
    Width = 120
    Height = 17
    Caption = 'Enable Web Server'
    TabOrder = 0
    OnClick = CBEnableClick
  end
  object EPort: TEdit
    Left = 54
    Top = 12
    Width = 50
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 90
    Top = 78
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 2
    OnClick = Button1Click
  end
  object CBWebSrvOut: TCheckBox
    Left = 16
    Top = 48
    Width = 233
    Height = 17
    Caption = 'Write answer to textfile webserv_ans.txt'
    TabOrder = 3
    OnClick = CBWebSrvOutClick
  end
end
