object Incomplete: TIncomplete
  Left = 400
  Top = 446
  BorderStyle = bsDialog
  Caption = 'Maneuver Window (incomplete cubes)'
  ClientHeight = 513
  ClientWidth = 411
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    411
    513)
  PixelsPerInch = 96
  TextHeight = 13
  object ManInfo: TMemo
    Left = 0
    Top = 0
    Width = 409
    Height = 361
    Anchors = [akLeft, akTop, akRight]
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object BStop: TButton
    Left = 216
    Top = 373
    Width = 169
    Height = 33
    Caption = 'Stop Search'
    TabOrder = 1
    OnClick = BStopClick
  end
  object BAdd: TButton
    Left = 216
    Top = 467
    Width = 169
    Height = 33
    Caption = 'Add Solutions to Main Window'
    TabOrder = 2
    OnClick = BAddClick
  end
  object GroupBox1: TGroupBox
    Left = 13
    Top = 373
    Width = 191
    Height = 67
    Caption = 'Faces to Exclude'
    TabOrder = 3
    object FFilter: TCheckBox
      Left = 124
      Top = 18
      Width = 29
      Height = 17
      Caption = 'F'
      TabOrder = 0
    end
    object DFilter: TCheckBox
      Left = 46
      Top = 18
      Width = 29
      Height = 17
      Caption = 'D'
      TabOrder = 1
    end
    object LFilter: TCheckBox
      Left = 85
      Top = 18
      Width = 29
      Height = 17
      Caption = 'L'
      TabOrder = 2
    end
    object BFilter: TCheckBox
      Left = 8
      Top = 18
      Width = 29
      Height = 17
      Caption = 'B'
      TabOrder = 3
    end
    object SliceAllowed: TCheckBox
      Left = 8
      Top = 41
      Width = 129
      Height = 17
      Caption = 'Allow Slice Moves'
      TabOrder = 4
      OnClick = SliceAllowedClick
    end
  end
  object BClear: TButton
    Left = 216
    Top = 420
    Width = 169
    Height = 33
    Caption = 'Clear Window'
    TabOrder = 4
    OnClick = BClearClick
  end
  object CenTwistExclude: TGroupBox
    Left = 13
    Top = 447
    Width = 191
    Height = 53
    Caption = 'Center Twists to Ignore'
    TabOrder = 5
    object UTwist: TCheckBox
      Left = 4
      Top = 24
      Width = 31
      Height = 17
      Caption = 'U'
      TabOrder = 0
    end
    object DTwist: TCheckBox
      Left = 34
      Top = 24
      Width = 31
      Height = 17
      Caption = 'D'
      TabOrder = 1
    end
    object RTwist: TCheckBox
      Left = 65
      Top = 24
      Width = 31
      Height = 17
      Caption = 'R'
      TabOrder = 2
    end
    object LTwist: TCheckBox
      Left = 95
      Top = 24
      Width = 31
      Height = 17
      Caption = 'L'
      TabOrder = 3
    end
    object FTwist: TCheckBox
      Left = 126
      Top = 24
      Width = 31
      Height = 17
      Caption = 'F'
      TabOrder = 4
    end
    object BTwist: TCheckBox
      Left = 157
      Top = 24
      Width = 31
      Height = 17
      Caption = 'B'
      TabOrder = 5
    end
  end
end
