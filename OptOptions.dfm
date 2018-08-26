object OptOptionForm: TOptOptionForm
  Left = 476
  Top = 510
  HelpContext = 1005
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Huge Optimal Solver'
  ClientHeight = 257
  ClientWidth = 405
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
  object Button1: TButton
    Left = 275
    Top = 216
    Width = 75
    Height = 22
    Caption = 'OK'
    TabOrder = 0
    OnClick = Button1Click
  end
  object CheckUseHuge: TCheckBox
    Left = 59
    Top = 214
    Width = 137
    Height = 18
    Caption = 'Use Huge Optimal Solver'
    Enabled = False
    TabOrder = 1
    OnClick = CheckUseHugeClick
  end
  object Panel1: TPanel
    Left = 14
    Top = 9
    Width = 377
    Height = 182
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 2
      Top = 2
      Width = 373
      Height = 178
      Align = alClient
      Alignment = taCenter
    end
  end
end
