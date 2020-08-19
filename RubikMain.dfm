object Form1: TForm1
  Left = 284
  Top = 401
  HelpContext = 1008
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  AutoScroll = False
  ClientHeight = 502
  ClientWidth = 857
  Color = clBtnFace
  Constraints.MinHeight = 532
  Constraints.MinWidth = 652
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnMouseWheel = FormMouseWheel
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object PageCtrl: TPageControl
    Left = 513
    Top = 0
    Width = 344
    Height = 502
    ActivePage = TabSheet1
    Align = alRight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabIndex = 0
    TabOrder = 0
    TabStop = False
    OnChange = PageCtrlChange
    object TabSheet1: TTabSheet
      HelpContext = 1002
      Caption = 'Facelet Editor'
      DesignSize = (
        336
        474)
      object FacePaint: TPaintBox
        Left = 3
        Top = 12
        Width = 332
        Height = 250
        Anchors = [akLeft, akTop, akRight]
        Color = clBtnFace
        ParentColor = False
        OnMouseDown = FacePaintMouseDown
        OnMouseMove = FacePaintMouseMove
        OnPaint = FacePaintPaint
      end
      object Bevel1: TBevel
        Left = -3
        Top = 265
        Width = 341
        Height = 2
        Anchors = [akLeft, akTop, akRight]
      end
      object LSelColor: TLabel
        Left = 223
        Top = 231
        Width = 89
        Height = 16
        Caption = 'Selected Color'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object ProgressLabel: TLabel
        Left = 11
        Top = 449
        Width = 206
        Height = 13
        Alignment = taCenter
        Anchors = [akLeft, akBottom]
        AutoSize = False
      end
      object Bevel9: TBevel
        Left = -15
        Top = 469
        Width = 351
        Height = 10
        Anchors = [akLeft, akTop, akRight]
        Shape = bsTopLine
      end
      object AutoRunIdx: TLabel
        Left = 10
        Top = 433
        Width = 3
        Height = 13
        Visible = False
      end
      object GroupBox1: TGroupBox
        Left = 109
        Top = 269
        Width = 120
        Height = 104
        Caption = 'Apply Move'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
        object ButtonU: TButton
          Left = 42
          Top = 14
          Width = 35
          Height = 21
          HelpContext = 1006
          Caption = 'U'
          TabOrder = 0
          OnClick = ButtonXClick
          OnMouseDown = ButtonMouseDown
          OnMouseUp = ButtonMouseUp
        end
        object ButtonR: TButton
          Left = 5
          Top = 14
          Width = 35
          Height = 21
          HelpContext = 1006
          Caption = 'R'
          TabOrder = 1
          OnClick = ButtonXClick
          OnMouseDown = ButtonMouseDown
          OnMouseUp = ButtonMouseUp
        end
        object ButtonF: TButton
          Left = 80
          Top = 14
          Width = 35
          Height = 21
          HelpContext = 1006
          Caption = 'F'
          TabOrder = 2
          OnClick = ButtonXClick
          OnMouseDown = ButtonMouseDown
          OnMouseUp = ButtonMouseUp
        end
        object ButtonD: TButton
          Left = 42
          Top = 35
          Width = 35
          Height = 21
          HelpContext = 1006
          Caption = 'D'
          TabOrder = 3
          OnClick = ButtonXClick
          OnMouseDown = ButtonMouseDown
          OnMouseUp = ButtonMouseUp
        end
        object ButtonL: TButton
          Left = 5
          Top = 35
          Width = 35
          Height = 21
          HelpContext = 1006
          Caption = 'L'
          TabOrder = 4
          OnClick = ButtonXClick
          OnMouseDown = ButtonMouseDown
          OnMouseUp = ButtonMouseUp
        end
        object ButtonB: TButton
          Left = 80
          Top = 35
          Width = 35
          Height = 21
          HelpContext = 1006
          Caption = 'B'
          TabOrder = 5
          OnClick = ButtonXClick
          OnMouseDown = ButtonMouseDown
          OnMouseUp = ButtonMouseUp
        end
        object ButtonE: TButton
          Left = 42
          Top = 57
          Width = 35
          Height = 21
          HelpContext = 1006
          Caption = 'E'
          TabOrder = 6
          OnClick = ButtonXClick
          OnMouseDown = ButtonMouseDown
          OnMouseUp = ButtonMouseUp
        end
        object Buttony: TButton
          Left = 42
          Top = 79
          Width = 35
          Height = 21
          HelpContext = 1006
          Caption = 'y'
          TabOrder = 7
          OnClick = ButtonXClick
          OnMouseDown = ButtonMouseDown
          OnMouseUp = ButtonMouseUp
        end
        object ButtonS: TButton
          Left = 80
          Top = 57
          Width = 35
          Height = 21
          HelpContext = 1006
          Caption = 'S'
          TabOrder = 8
          OnClick = ButtonXClick
          OnMouseDown = ButtonMouseDown
          OnMouseUp = ButtonMouseUp
        end
        object ButtonM: TButton
          Left = 5
          Top = 57
          Width = 35
          Height = 21
          HelpContext = 1006
          Caption = 'M'
          TabOrder = 9
          OnClick = ButtonXClick
          OnMouseDown = ButtonMouseDown
          OnMouseUp = ButtonMouseUp
        end
        object Buttonx: TButton
          Left = 5
          Top = 79
          Width = 35
          Height = 21
          HelpContext = 1006
          Caption = 'x'
          TabOrder = 10
          OnClick = ButtonXClick
          OnMouseDown = ButtonMouseDown
          OnMouseUp = ButtonMouseUp
        end
        object Buttonz: TButton
          Left = 80
          Top = 79
          Width = 35
          Height = 21
          HelpContext = 1006
          Caption = 'z'
          TabOrder = 11
          OnClick = ButtonXClick
          OnMouseDown = ButtonMouseDown
          OnMouseUp = ButtonMouseUp
        end
      end
      object GroupBox2: TGroupBox
        Left = 230
        Top = 269
        Width = 103
        Height = 104
        Caption = 'Reset To'
        TabOrder = 2
        object ButtonEmpty: TButton
          Left = 4
          Top = 15
          Width = 55
          Height = 26
          Caption = 'Empty'
          TabOrder = 0
          OnClick = ButtonEmptyClick
        end
        object ButtonClear: TButton
          Left = 4
          Top = 44
          Width = 55
          Height = 26
          Caption = 'Clean'
          TabOrder = 1
          OnClick = ButtonClearClick
        end
        object ButtonRandom: TButton
          Left = 4
          Top = 73
          Width = 55
          Height = 26
          Caption = 'Random'
          TabOrder = 2
          OnClick = ButtonRandomClick
        end
        object ButtonEmptyC: TButton
          Left = 62
          Top = 15
          Width = 16
          Height = 26
          Caption = 'C'
          TabOrder = 3
          OnClick = ButtonEmptyCClick
        end
        object ButtonEmptyE: TButton
          Left = 81
          Top = 15
          Width = 16
          Height = 26
          Caption = 'E'
          TabOrder = 4
          OnClick = ButtonEmptyEClick
        end
        object ButtonClearC: TButton
          Left = 62
          Top = 44
          Width = 16
          Height = 26
          Caption = 'C'
          TabOrder = 5
          OnClick = ButtonClearCClick
        end
        object ButtonClearE: TButton
          Left = 81
          Top = 44
          Width = 16
          Height = 26
          Caption = 'E'
          TabOrder = 6
          OnClick = ButtonClearEClick
        end
        object ButtonRandomC: TButton
          Left = 62
          Top = 73
          Width = 16
          Height = 26
          Caption = 'C'
          TabOrder = 7
          OnClick = ButtonRandomClick
        end
        object ButtonRandomE: TButton
          Left = 81
          Top = 73
          Width = 16
          Height = 26
          Caption = 'E'
          TabOrder = 8
          OnClick = ButtonRandomClick
        end
      end
      object ButtonCustomize: TButton
        Left = 199
        Top = 424
        Width = 130
        Height = 24
        Caption = 'Customize Selected Color'
        TabOrder = 3
        OnClick = ButtonCustomizeClick
      end
      object GroupBox3: TGroupBox
        Left = 1
        Top = 269
        Width = 107
        Height = 104
        Caption = 'Add Pattern'
        TabOrder = 0
        object ButtonAddSolve: TButton
          Left = 5
          Top = 14
          Width = 97
          Height = 41
          HelpContext = 1002
          Caption = ' Add and Solve '
          Enabled = False
          TabOrder = 0
          OnClick = ButtonAddSolveClick
        end
        object ButtonAddGen: TButton
          Left = 5
          Top = 58
          Width = 97
          Height = 41
          HelpContext = 1001
          Caption = 'Add and Generate'
          TabOrder = 1
          OnClick = ButtonAddSolveClick
        end
      end
      object ProgressBar: TProgressBar
        Left = 10
        Top = 430
        Width = 177
        Height = 13
        Min = 0
        Max = 100
        TabOrder = 4
      end
      object GroupBox8: TGroupBox
        Left = 0
        Top = 376
        Width = 333
        Height = 42
        Caption = 'Enter Maneuver'
        TabOrder = 5
        object EManeuver: TEdit
          Left = 6
          Top = 13
          Width = 253
          Height = 21
          TabOrder = 0
          OnKeyDown = EManeuverKeyDown
        end
        object BApplyMan: TButton
          Left = 265
          Top = 13
          Width = 60
          Height = 20
          Caption = 'Apply'
          TabOrder = 1
          OnClick = BApplyManClick
        end
      end
      object ColorCheck: TCheckBox
        Left = 2
        Top = 231
        Width = 88
        Height = 17
        Caption = 'AutoFix Colors'
        Checked = True
        State = cbChecked
        TabOrder = 6
        OnClick = ColorCheckClick
      end
    end
    object PatEdit: TTabSheet
      HelpContext = 1003
      Caption = 'Pattern Editor'
      ImageIndex = 1
      DesignSize = (
        336
        474)
      object Bevel2: TBevel
        Left = 229
        Top = 0
        Width = 12
        Height = 461
        Shape = bsLeftLine
      end
      object CurShape: TShape
        Left = 243
        Top = 192
        Width = 77
        Height = 65
        Brush.Color = clRed
      end
      object Label1: TLabel
        Left = 235
        Top = 263
        Width = 89
        Height = 16
        Caption = 'Selected Type'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Bevel7: TBevel
        Left = -4
        Top = 462
        Width = 348
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        Shape = bsTopLine
      end
      object CheckBoxA1: TCheckBox
        Left = 191
        Top = 42
        Width = 35
        Height = 17
        TabStop = False
        AllowGrayed = True
        Caption = 'All'
        Checked = True
        State = cbChecked
        TabOrder = 4
        OnClick = CheckBoxAOnClick
      end
      object CheckBoxF1: TCheckBox
        Left = 160
        Top = 33
        Width = 31
        Height = 18
        TabStop = False
        Caption = 'F'
        Checked = True
        State = cbChecked
        TabOrder = 5
        OnClick = CheckBoxOnClick
      end
      object CheckBoxR1: TCheckBox
        Left = 126
        Top = 33
        Width = 31
        Height = 18
        TabStop = False
        Caption = 'R'
        Checked = True
        State = cbChecked
        TabOrder = 6
        OnClick = CheckBoxOnClick
      end
      object CheckBoxU1: TCheckBox
        Left = 92
        Top = 33
        Width = 31
        Height = 18
        TabStop = False
        Caption = 'U'
        Checked = True
        State = cbChecked
        TabOrder = 7
        OnClick = CheckBoxOnClick
      end
      object CheckBoxD1: TCheckBox
        Left = 92
        Top = 51
        Width = 31
        Height = 18
        TabStop = False
        Caption = 'D'
        Checked = True
        State = cbChecked
        TabOrder = 8
        OnClick = CheckBoxOnClick
      end
      object CheckBoxL1: TCheckBox
        Left = 126
        Top = 51
        Width = 31
        Height = 18
        TabStop = False
        Caption = 'L'
        Checked = True
        State = cbChecked
        TabOrder = 9
        OnClick = CheckBoxOnClick
      end
      object CheckBoxB1: TCheckBox
        Left = 160
        Top = 51
        Width = 31
        Height = 18
        TabStop = False
        Caption = 'B'
        Checked = True
        State = cbChecked
        TabOrder = 10
        OnClick = CheckBoxOnClick
      end
      object CheckBoxA2: TCheckBox
        Left = 191
        Top = 132
        Width = 35
        Height = 17
        TabStop = False
        AllowGrayed = True
        Caption = 'All'
        Checked = True
        State = cbChecked
        TabOrder = 11
        OnClick = CheckBoxAOnClick
      end
      object CheckBoxU2: TCheckBox
        Left = 92
        Top = 123
        Width = 31
        Height = 18
        TabStop = False
        Caption = 'U'
        Checked = True
        State = cbChecked
        TabOrder = 12
        OnClick = CheckBoxOnClick
      end
      object CheckBoxD2: TCheckBox
        Left = 92
        Top = 141
        Width = 31
        Height = 17
        TabStop = False
        Caption = 'D'
        Checked = True
        State = cbChecked
        TabOrder = 13
        OnClick = CheckBoxOnClick
      end
      object CheckBoxR2: TCheckBox
        Left = 126
        Top = 123
        Width = 31
        Height = 18
        TabStop = False
        Caption = 'R'
        Checked = True
        State = cbChecked
        TabOrder = 14
        OnClick = CheckBoxOnClick
      end
      object CheckBoxL2: TCheckBox
        Left = 126
        Top = 141
        Width = 31
        Height = 17
        TabStop = False
        Caption = 'L'
        Checked = True
        State = cbChecked
        TabOrder = 15
        OnClick = CheckBoxOnClick
      end
      object CheckBoxF2: TCheckBox
        Left = 160
        Top = 123
        Width = 31
        Height = 18
        TabStop = False
        Caption = 'F'
        Checked = True
        State = cbChecked
        TabOrder = 16
        OnClick = CheckBoxOnClick
      end
      object CheckBoxB2: TCheckBox
        Left = 160
        Top = 141
        Width = 31
        Height = 17
        TabStop = False
        Caption = 'B'
        Checked = True
        State = cbChecked
        TabOrder = 17
        OnClick = CheckBoxOnClick
      end
      object CheckBoxA3: TCheckBox
        Left = 191
        Top = 221
        Width = 35
        Height = 17
        TabStop = False
        AllowGrayed = True
        Caption = 'All'
        Checked = True
        State = cbChecked
        TabOrder = 18
        OnClick = CheckBoxAOnClick
      end
      object CheckBoxU3: TCheckBox
        Left = 92
        Top = 212
        Width = 31
        Height = 18
        TabStop = False
        Caption = 'U'
        Checked = True
        State = cbChecked
        TabOrder = 19
        OnClick = CheckBoxOnClick
      end
      object CheckBoxD3: TCheckBox
        Left = 92
        Top = 230
        Width = 31
        Height = 17
        TabStop = False
        Caption = 'D'
        Checked = True
        State = cbChecked
        TabOrder = 20
        OnClick = CheckBoxOnClick
      end
      object CheckBoxR3: TCheckBox
        Left = 126
        Top = 212
        Width = 31
        Height = 18
        TabStop = False
        Caption = 'R'
        Checked = True
        State = cbChecked
        TabOrder = 21
        OnClick = CheckBoxOnClick
      end
      object CheckBoxL3: TCheckBox
        Left = 126
        Top = 230
        Width = 31
        Height = 17
        TabStop = False
        Caption = 'L'
        Checked = True
        State = cbChecked
        TabOrder = 22
        OnClick = CheckBoxOnClick
      end
      object CheckBoxF3: TCheckBox
        Left = 160
        Top = 212
        Width = 31
        Height = 18
        TabStop = False
        Caption = 'F'
        Checked = True
        State = cbChecked
        TabOrder = 23
        OnClick = CheckBoxOnClick
      end
      object CheckBoxB3: TCheckBox
        Left = 160
        Top = 230
        Width = 31
        Height = 17
        TabStop = False
        Caption = 'B'
        Checked = True
        State = cbChecked
        TabOrder = 24
        OnClick = CheckBoxOnClick
      end
      object CheckBoxA4: TCheckBox
        Left = 191
        Top = 311
        Width = 35
        Height = 17
        TabStop = False
        AllowGrayed = True
        Caption = 'All'
        Checked = True
        State = cbChecked
        TabOrder = 25
        OnClick = CheckBoxAOnClick
      end
      object CheckBoxU4: TCheckBox
        Left = 92
        Top = 302
        Width = 31
        Height = 18
        TabStop = False
        Caption = 'U'
        Checked = True
        State = cbChecked
        TabOrder = 26
        OnClick = CheckBoxOnClick
      end
      object CheckBoxD4: TCheckBox
        Left = 92
        Top = 320
        Width = 31
        Height = 17
        TabStop = False
        Caption = 'D'
        Checked = True
        State = cbChecked
        TabOrder = 27
        OnClick = CheckBoxOnClick
      end
      object CheckBoxR4: TCheckBox
        Left = 126
        Top = 302
        Width = 31
        Height = 18
        TabStop = False
        Caption = 'R'
        Checked = True
        State = cbChecked
        TabOrder = 28
        OnClick = CheckBoxOnClick
      end
      object CheckBoxL4: TCheckBox
        Left = 126
        Top = 320
        Width = 31
        Height = 17
        TabStop = False
        Caption = 'L'
        Checked = True
        State = cbChecked
        TabOrder = 29
        OnClick = CheckBoxOnClick
      end
      object CheckBoxF4: TCheckBox
        Left = 160
        Top = 302
        Width = 31
        Height = 18
        TabStop = False
        Caption = 'F'
        Checked = True
        State = cbChecked
        TabOrder = 30
        OnClick = CheckBoxOnClick
      end
      object CheckBoxB4: TCheckBox
        Left = 160
        Top = 320
        Width = 31
        Height = 17
        TabStop = False
        Caption = 'B'
        Checked = True
        State = cbChecked
        TabOrder = 31
        OnClick = CheckBoxOnClick
      end
      object CheckBoxA5: TCheckBox
        Left = 191
        Top = 400
        Width = 35
        Height = 17
        TabStop = False
        AllowGrayed = True
        Caption = 'All'
        Checked = True
        State = cbChecked
        TabOrder = 32
        OnClick = CheckBoxAOnClick
      end
      object CheckBoxU5: TCheckBox
        Left = 92
        Top = 391
        Width = 31
        Height = 18
        TabStop = False
        Caption = 'U'
        Checked = True
        State = cbChecked
        TabOrder = 33
        OnClick = CheckBoxOnClick
      end
      object CheckBoxD5: TCheckBox
        Left = 92
        Top = 409
        Width = 31
        Height = 17
        TabStop = False
        Caption = 'D'
        Checked = True
        State = cbChecked
        TabOrder = 34
        OnClick = CheckBoxOnClick
      end
      object CheckBoxR5: TCheckBox
        Left = 126
        Top = 391
        Width = 31
        Height = 18
        TabStop = False
        Caption = 'R'
        Checked = True
        State = cbChecked
        TabOrder = 35
        OnClick = CheckBoxOnClick
      end
      object CheckBoxL5: TCheckBox
        Left = 126
        Top = 409
        Width = 31
        Height = 17
        TabStop = False
        Caption = 'L'
        Checked = True
        State = cbChecked
        TabOrder = 36
        OnClick = CheckBoxOnClick
      end
      object CheckBoxF5: TCheckBox
        Left = 160
        Top = 391
        Width = 31
        Height = 18
        TabStop = False
        Caption = 'F'
        Checked = True
        State = cbChecked
        TabOrder = 37
        OnClick = CheckBoxOnClick
      end
      object CheckBoxB5: TCheckBox
        Left = 160
        Top = 409
        Width = 31
        Height = 17
        TabStop = False
        Caption = 'B'
        Checked = True
        State = cbChecked
        TabOrder = 38
        OnClick = CheckBoxOnClick
      end
      object PatBox1: TGroupBox
        Left = 7
        Top = 3
        Width = 83
        Height = 86
        TabOrder = 39
      end
      object PatBox2: TGroupBox
        Left = 7
        Top = 94
        Width = 83
        Height = 86
        TabOrder = 40
      end
      object PatBox3: TGroupBox
        Left = 7
        Top = 185
        Width = 83
        Height = 86
        TabOrder = 41
      end
      object PatBox4: TGroupBox
        Left = 7
        Top = 275
        Width = 83
        Height = 86
        TabOrder = 42
      end
      object PatBox5: TGroupBox
        Left = 7
        Top = 366
        Width = 83
        Height = 86
        TabOrder = 43
      end
      object CheckBoxContinuous: TCheckBox
        Left = 238
        Top = 436
        Width = 82
        Height = 17
        Caption = 'Continuous'
        TabOrder = 3
      end
      object GroupBox4: TGroupBox
        Left = 243
        Top = 10
        Width = 77
        Height = 167
        Caption = 'Pattern Type'
        TabOrder = 44
        object PatShape1: TShape
          Tag = 1
          Left = 2
          Top = 18
          Width = 71
          Height = 25
          Brush.Color = clRed
          OnMouseDown = PatShapeMouseDown
        end
        object PatShape2: TShape
          Tag = 2
          Left = 2
          Top = 42
          Width = 71
          Height = 25
          Brush.Color = clYellow
          OnMouseDown = PatShapeMouseDown
        end
        object PatShape3: TShape
          Tag = 3
          Left = 2
          Top = 66
          Width = 71
          Height = 25
          Brush.Color = clLime
          OnMouseDown = PatShapeMouseDown
        end
        object PatShape4: TShape
          Tag = 4
          Left = 2
          Top = 90
          Width = 71
          Height = 25
          Brush.Color = clBlue
          OnMouseDown = PatShapeMouseDown
        end
        object PatShape5: TShape
          Tag = 5
          Left = 2
          Top = 114
          Width = 71
          Height = 25
          OnMouseDown = PatShapeMouseDown
        end
        object PatShape6: TShape
          Tag = 6
          Left = 2
          Top = 138
          Width = 71
          Height = 25
          Brush.Color = clGray
          OnMouseDown = PatShapeMouseDown
        end
      end
      object PatClear: TButton
        Left = 238
        Top = 304
        Width = 89
        Height = 24
        Caption = 'Clear Patterns'
        TabOrder = 0
        OnClick = PatClearClick
      end
      object RunPatButton: TButton
        Left = 238
        Top = 340
        Width = 89
        Height = 53
        Caption = 'Start Search'
        TabOrder = 1
        OnClick = RunPatButtonClick
      end
      object FindGenerators: TCheckBox
        Left = 238
        Top = 410
        Width = 98
        Height = 17
        Caption = 'Find Generators'
        TabOrder = 2
      end
    end
    object TabSym: TTabSheet
      HelpContext = 1010
      Caption = 'Symmetry Editor'
      ImageIndex = 4
      DesignSize = (
        336
        474)
      object Bevel6: TBevel
        Left = 219
        Top = 274
        Width = 9
        Height = 189
        Shape = bsLeftLine
      end
      object Bevel8: TBevel
        Left = -10
        Top = 462
        Width = 351
        Height = 10
        Anchors = [akLeft, akTop, akRight]
        Shape = bsTopLine
      end
      object GBSpeed: TGroupBox
        Left = 1
        Top = 82
        Width = 334
        Height = 193
        Caption = 'Current Symmetry Selection'
        TabOrder = 0
        object SBr2e1: TSpeedButton
          Tag = 14
          Left = 8
          Top = 16
          Width = 37
          Height = 37
          Hint = 'r2e: 1/2 Rotation around an edge'
          AllowAllUp = True
          GroupIndex = 1
          Flat = True
          Glyph.Data = {
            5A030000424D5A03000000000000760000002800000025000000250000000100
            040000000000E402000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFF
            FFFFFFFFFFFF000FFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFF00F0F00FFFFFFF
            FFFFFFFFF000FFFFFFFFFFFF00FFF0FFF00FFFFFFFFFFFFFF000FFFFFFFFFF00
            FFFFF0FFFFF00FFFFFFFFFFFF000FFFFFFFF00FFFFFFF0FFFFFFF00FFFFFFFFF
            F000FFFFFF00FFFFFFFFF0FFFFFFFFF00FFFFFFFF000FFFF00FFFFFFFFFF999F
            FFFFFFFFF00FFFFFF000FFFF0FFFFFFFFFF99999FFFFFFFFFF0FFFFFF000FFFF
            0FFFFFFFFFF99999FFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFF99999FFFFFFFF
            FF0FFFFFF000FFFF0FFFFFFFFFFF999FFFFFFFFFFF0FFFFFF000FFFF0FFFFFFF
            FFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFF
            F000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FF
            FFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF
            0FFFFFFFFFFF000FFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFF00FFF00FFFFFFF
            FF0FFFFFF000FFFF0FFFFFFF00FFFFFFF00FFFFFFF0FFFFFF000FFFF0FFFFF00
            FFFFFFFFFFF00FFFFF0FFFFFF000FFFF0FFF00FFFFFFFFFFFFFFF00FFF0FFFFF
            F000FFFF0F00FFFFFFFFFFFFFFFFFFF00F0FFFFFF000FFFF00FFFFFFFFFFFFFF
            FFFFFFFFF00FFFFFF000FFFFFF00FFFFFFFFFFFFFFFFFFF00FFFFFFFF000FFFF
            FFFF00FFFFFFFFFFFFFFF00FFFFFFFFFF000FFFFFFFFFF00FFFFFFFFFFF00FFF
            FFFFFFFFF000FFFFFFFFFFFF00FFFFFFF00FFFFFFFFFFFFFF000FFFFFFFFFFFF
            FF00FFF00FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000}
          ParentShowHint = False
          PopupMenu = ApplySymPopUp
          ShowHint = True
          OnClick = SBSymmetriesClick
          OnMouseDown = SBr2e1MouseDown
        end
        object SBr2e2: TSpeedButton
          Tag = 10
          Left = 46
          Top = 16
          Width = 37
          Height = 37
          Hint = 'r2e: 1/2 Rotation around an edge'
          AllowAllUp = True
          GroupIndex = 2
          Flat = True
          Glyph.Data = {
            5A030000424D5A03000000000000760000002800000025000000250000000100
            040000000000E402000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFF
            FFFFFFFFFFFF000FFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFF00F0F00FFFFFFF
            FFFFFFFFF000FFFFFFFFFFFF00FFF0FFF00FFFFFFFFFFFFFF000FFFFFFFFFF00
            FFFFF0FFFFF00FFFFFFFFFFFF000FFFFFFFF00FFFFFFF0FFFFFFF00FFFFFFFFF
            F000FFFFFF00FFFFFFFFF0FFFFFFFFF00FFFFFFFF000FFFF00FFFFFFFFFFF0FF
            FFFFFFFFF00FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF
            0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFF
            FF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFF
            FFFFF0FFFFFFFFFFFF0FFFFFF000FFF999FFFFFFFFFFF0FFFFFFFFFFF999FFFF
            F000FF99999FFFFFFFFFF0FFFFFFFFFF99999FFFF000FF99999FFFFFFFFFF0FF
            FFFFFFFF99999FFFF000FF99999FFFFFFFFFF0FFFFFFFFFF99999FFFF000FFF9
            99FFFFFFFFFF000FFFFFFFFFF999FFFFF000FFFF0FFFFFFFFF00FFF00FFFFFFF
            FF0FFFFFF000FFFF0FFFFFFF00FFFFFFF00FFFFFFF0FFFFFF000FFFF0FFFFF00
            FFFFFFFFFFF00FFFFF0FFFFFF000FFFF0FFF00FFFFFFFFFFFFFFF00FFF0FFFFF
            F000FFFF0F00FFFFFFFFFFFFFFFFFFF00F0FFFFFF000FFFF00FFFFFFFFFFFFFF
            FFFFFFFFF00FFFFFF000FFFFFF00FFFFFFFFFFFFFFFFFFF00FFFFFFFF000FFFF
            FFFF00FFFFFFFFFFFFFFF00FFFFFFFFFF000FFFFFFFFFF00FFFFFFFFFFF00FFF
            FFFFFFFFF000FFFFFFFFFFFF00FFFFFFF00FFFFFFFFFFFFFF000FFFFFFFFFFFF
            FF00FFF00FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000}
          ParentShowHint = False
          PopupMenu = ApplySymPopUp
          ShowHint = True
          OnClick = SBSymmetriesClick
          OnMouseDown = SBr2e1MouseDown
        end
        object SBr2e3: TSpeedButton
          Tag = 18
          Left = 84
          Top = 16
          Width = 37
          Height = 37
          Hint = 'r2e: 1/2 Rotation around an edge'
          AllowAllUp = True
          GroupIndex = 3
          Flat = True
          Glyph.Data = {
            5A030000424D5A03000000000000760000002800000025000000250000000100
            040000000000E402000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFF
            FFFFFFFFFFFF000FFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFF00F0F00FFFFFFF
            FFFFFFFFF000FFFFFFFFFFFF00FFF0FFF00FFFFFFFFFFFFFF000FFFFFFFFFF00
            FFFFF0FFFFF00FFFFFFFFFFFF000FFFFFFFF00FFFFFFF0FFFFFFF00FFFFFFFFF
            F000FFFFFF00FFFFFFFFF0FFFFFFFFF00FFFFFFFF000FFFF00FFFFFFFFFFF0FF
            FFFFFFFFF00FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF
            0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFF
            FF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFF
            FFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFF
            F000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FF
            FFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF
            0FFFFF999FFF000FFFFFFFFFFF0FFFFFF000FFFF0FFFF9999900FFF00FFFFFFF
            FF0FFFFFF000FFFF0FFFF99999FFFFFFF00FFFFFFF0FFFFFF000FFFF0FFFF999
            99FFFFFFFFF00FFFFF0FFFFFF000FFFF0FFF00999FFFFFFFFFFFF00FFF0FFFFF
            F000FFFF0F00FFFFFFFFFFFFFFFFFFF00F0FFFFFF000FFFF00FFFFFFFFFFFFFF
            FFFFFFFFF00FFFFFF000FFFFFF00FFFFFFFFFFFFFFFFFFF00FFFFFFFF000FFFF
            FFFF00FFFFFFFFFFFFFFF00FFFFFFFFFF000FFFFFFFFFF00FFFFFFFFFFF00FFF
            FFFFFFFFF000FFFFFFFFFFFF00FFFFFFF00FFFFFFFFFFFFFF000FFFFFFFFFFFF
            FF00FFF00FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000}
          ParentShowHint = False
          PopupMenu = ApplySymPopUp
          ShowHint = True
          OnClick = SBSymmetriesClick
          OnMouseDown = SBr2e1MouseDown
        end
        object SBr2e4: TSpeedButton
          Tag = 42
          Left = 122
          Top = 16
          Width = 37
          Height = 37
          Hint = 'r2e: 1/2 Rotation around an edge'
          AllowAllUp = True
          GroupIndex = 4
          Flat = True
          Glyph.Data = {
            5A030000424D5A03000000000000760000002800000025000000250000000100
            040000000000E402000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFF
            FFFFFFFFFFFF000FFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFF00F0F00FF999FF
            FFFFFFFFF000FFFFFFFFFFFF00FFF0FFF099999FFFFFFFFFF000FFFFFFFFFF00
            FFFFF0FFFF99999FFFFFFFFFF000FFFFFFFF00FFFFFFF0FFFF99999FFFFFFFFF
            F000FFFFFF00FFFFFFFFF0FFFFF999F00FFFFFFFF000FFFF00FFFFFFFFFFF0FF
            FFFFFFFFF00FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF
            0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFF
            FF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFF
            FFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFF
            F000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FF
            FFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF
            0FFFFFFFFFFF000FFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFF00FFF00FFFFFFF
            FF0FFFFFF000FFFF0FFFFFFF00FFFFFFF00FFFFFFF0FFFFFF000FFFF0FFFFF00
            FFFFFFFFFFF00FFFFF0FFFFFF000FFFF0FFF00FFFFFFFFFFFFFFF00FFF0FFFFF
            F000FFFF0F00FFFFFFFFFFFFFFFFFFF00F0FFFFFF000FFFF00FFFFFFFFFFFFFF
            FFFFFFFFF00FFFFFF000FFFFFF00FF999FFFFFFFFFFFFFF00FFFFFFFF000FFFF
            FFFF099999FFFFFFFFFFF00FFFFFFFFFF000FFFFFFFFF99999FFFFFFFFF00FFF
            FFFFFFFFF000FFFFFFFFF99999FFFFFFF00FFFFFFFFFFFFFF000FFFFFFFFFF99
            9F00FFF00FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000}
          ParentShowHint = False
          PopupMenu = ApplySymPopUp
          ShowHint = True
          OnClick = SBSymmetriesClick
          OnMouseDown = SBr2e1MouseDown
        end
        object SBr2e5: TSpeedButton
          Tag = 26
          Left = 160
          Top = 16
          Width = 37
          Height = 37
          Hint = 'r2e: 1/2 Rotation around an edge'
          AllowAllUp = True
          GroupIndex = 5
          Flat = True
          Glyph.Data = {
            5A030000424D5A03000000000000760000002800000025000000250000000100
            040000000000E402000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFF
            FFFFFFFFFFFF000FFFFFFFFFFFFFFFFFF000FFFFFFFF999FFF00F0F00FFFFFFF
            FFFFFFFFF000FFFFFFF9999900FFF0FFF00FFFFFFFFFFFFFF000FFFFFFF99999
            FFFFF0FFFFF00FFFFFFFFFFFF000FFFFFFF99999FFFFF0FFFFFFF00FFFFFFFFF
            F000FFFFFF00999FFFFFF0FFFFFFFFF00FFFFFFFF000FFFF00FFFFFFFFFFF0FF
            FFFFFFFFF00FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF
            0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFF
            FF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFF
            FFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFF
            F000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FF
            FFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF
            0FFFFFFFFFFF000FFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFF00FFF00FFFFFFF
            FF0FFFFFF000FFFF0FFFFFFF00FFFFFFF00FFFFFFF0FFFFFF000FFFF0FFFFF00
            FFFFFFFFFFF00FFFFF0FFFFFF000FFFF0FFF00FFFFFFFFFFFFFFF00FFF0FFFFF
            F000FFFF0F00FFFFFFFFFFFFFFFFFFF00F0FFFFFF000FFFF00FFFFFFFFFFFFFF
            FFFFFFFFF00FFFFFF000FFFFFF00FFFFFFFFFFFFF999FFF00FFFFFFFF000FFFF
            FFFF00FFFFFFFFFF9999900FFFFFFFFFF000FFFFFFFFFF00FFFFFFFF99999FFF
            FFFFFFFFF000FFFFFFFFFFFF00FFFFFF99999FFFFFFFFFFFF000FFFFFFFFFFFF
            FF00FFF00999FFFFFFFFFFFFF000FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000}
          ParentShowHint = False
          PopupMenu = ApplySymPopUp
          ShowHint = True
          OnClick = SBSymmetriesClick
          OnMouseDown = SBr2e1MouseDown
        end
        object SBr2e6: TSpeedButton
          Tag = 38
          Left = 198
          Top = 16
          Width = 37
          Height = 37
          Hint = 'r2e: 1/2 Rotation around an edge'
          AllowAllUp = True
          GroupIndex = 6
          Flat = True
          Glyph.Data = {
            5A030000424D5A03000000000000760000002800000025000000250000000100
            040000000000E402000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFF
            FFFFFFFFFFFF000FFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFF00F0F00FFFFFFF
            FFFFFFFFF000FFFFFFFFFFFF00FFF0FFF00FFFFFFFFFFFFFF000FFFFFFFFFF00
            FFFFF0FFFFF00FFFFFFFFFFFF000FFFFFFFF00FFFFFFF0FFFFFFF00FFFFFFFFF
            F000FFFFFF00FFFFFFFFF0FFFFFFFFF00FFFFFFFF000FFFF00FFFFFFFFFFF0FF
            FFFFFFFFF00FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF
            0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFF
            FF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFF
            FFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFF
            F000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FF
            FFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF
            0FFFFFFFFFFF000FFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFF00FFF00F999FFF
            FF0FFFFFF000FFFF0FFFFFFF00FFFFFFF99999FFFF0FFFFFF000FFFF0FFFFF00
            FFFFFFFFF99999FFFF0FFFFFF000FFFF0FFF00FFFFFFFFFFF999990FFF0FFFFF
            F000FFFF0F00FFFFFFFFFFFFFF999FF00F0FFFFFF000FFFF00FFFFFFFFFFFFFF
            FFFFFFFFF00FFFFFF000FFFFFF00FFFFFFFFFFFFFFFFFFF00FFFFFFFF000FFFF
            FFFF00FFFFFFFFFFFFFFF00FFFFFFFFFF000FFFFFFFFFF00FFFFFFFFFFF00FFF
            FFFFFFFFF000FFFFFFFFFFFF00FFFFFFF00FFFFFFFFFFFFFF000FFFFFFFFFFFF
            FF00FFF00FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000}
          ParentShowHint = False
          PopupMenu = ApplySymPopUp
          ShowHint = True
          OnClick = SBSymmetriesClick
          OnMouseDown = SBr2e1MouseDown
        end
        object SBme1: TSpeedButton
          Tag = 7
          Left = 8
          Top = 56
          Width = 37
          Height = 37
          Hint = 'me: Reflection through a plane'
          AllowAllUp = True
          GroupIndex = 7
          Flat = True
          Glyph.Data = {
            5A030000424D5A03000000000000760000002800000025000000250000000100
            040000000000E402000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFF
            FFFFFFFFFFFF000FFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFF00F0F00FFFFFFF
            FFFFFFFFF000FFFFFFFFFFFF00FFF0FFF00FFFFFFFFFFFFFF000FFFFFFFFFF00
            FFFFF0FFFFF00FFFFFFFFFFFF000FFFFFFFF00FFFFFFF0FFFFFFF00FFFFFFFFF
            F000FFFFFF00FFFFFFFFF0FFFFFFFFF00FFFFFFFF000FFFF00FFFFFFFFFFF0FF
            FFFFFFFFF00FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF
            0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFF
            FF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFF
            FFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFF
            F000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FF
            FFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF
            0FFFFFFFFFFF000FFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFF00FFF00FFFFFFF
            FF0FFFFFF000FFFF0FFFFFFF00FFFFFFF00FFFFFFF0FFFFFF000FFFF0FFFFF00
            FFFFFFFFFFF00FFFFF0FFFFFF000FFFF0FFF00FFFFFFFFFFFFFFF00FFF0FFFFF
            F000FFFF0F00FFFFFFFFFFFFFFFFFFF00F0FFFFFF000FFFF0099999999999999
            99999999900FFFFFF000FFFFFF00FFFFFFFFFFFFFFFFFFF00FFFFFFFF000FFFF
            FFFF00FFFFFFFFFFFFFFF00FFFFFFFFFF000FFFFFFFFFF00FFFFFFFFFFF00FFF
            FFFFFFFFF000FFFFFFFFFFFF00FFFFFFF00FFFFFFFFFFFFFF000FFFFFFFFFFFF
            FF00FFF00FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000}
          ParentShowHint = False
          PopupMenu = ApplySymPopUp
          ShowHint = True
          OnClick = SBSymmetriesClick
          OnMouseDown = SBr2e1MouseDown
        end
        object SBme2: TSpeedButton
          Tag = 3
          Left = 46
          Top = 56
          Width = 37
          Height = 37
          Hint = 'me: Reflection through a plane'
          AllowAllUp = True
          GroupIndex = 8
          Flat = True
          Glyph.Data = {
            5A030000424D5A03000000000000760000002800000025000000250000000100
            040000000000E402000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFF
            FFFFFFFFFFFF000FFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFF00F0F00FFFFFFF
            FFFFFFFFF000FFFFFFFFFFFF00FFF0FFF00FFFFFFFFFFFFFF000FFFFFFFFFF00
            FFFFF0FFFFF00FFFFFFFFFFFF000FFFFFFFF00FFFFFFF0FFFFFFF00FFFFFFFFF
            F000FFFFFF00FFFFFFFFF0FFFFFFFFF00FFFFFFFF000FFFF00FFFFFFFFFFF0FF
            FFFFFFFFF00FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF
            0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFF
            FF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFF
            FFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFF
            F000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FF
            FFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF
            0FFFFFFFFFFF000FFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFF00F9F00FFFFFFF
            FF0FFFFFF000FFFF0FFFFFFF00FFF9FFF00FFFFFFF0FFFFFF000FFFF0FFFFF00
            FFFFF9FFFFF00FFFFF0FFFFFF000FFFF0FFF00FFFFFFF9FFFFFFF00FFF0FFFFF
            F000FFFF0F00FFFFFFFFF9FFFFFFFFF00F0FFFFFF000FFFF00FFFFFFFFFFF9FF
            FFFFFFFFF00FFFFFF000FFFFFF00FFFFFFFFF9FFFFFFFFF00FFFFFFFF000FFFF
            FFFF00FFFFFFF9FFFFFFF00FFFFFFFFFF000FFFFFFFFFF00FFFFF9FFFFF00FFF
            FFFFFFFFF000FFFFFFFFFFFF00FFF9FFF00FFFFFFFFFFFFFF000FFFFFFFFFFFF
            FF00F9F00FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000}
          ParentShowHint = False
          PopupMenu = ApplySymPopUp
          ShowHint = True
          OnClick = SBSymmetriesClick
          OnMouseDown = SBr2e1MouseDown
        end
        object SBme3: TSpeedButton
          Tag = 27
          Left = 84
          Top = 56
          Width = 37
          Height = 37
          Hint = 'me: Reflection through a plane'
          AllowAllUp = True
          GroupIndex = 9
          Flat = True
          Glyph.Data = {
            5A030000424D5A03000000000000760000002800000025000000250000000100
            040000000000E402000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFF
            FFFFFFFFFFFF000FFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFF00F0900FFFFFFF
            FFFFFFFFF000FFFFFFFFFFFF00FFF0F9F00FFFFFFFFFFFFFF000FFFFFFFFFF00
            FFFFF0F9FFF00FFFFFFFFFFFF000FFFFFFFF00FFFFFFF0FF9FFFF00FFFFFFFFF
            F000FFFFFF00FFFFFFFFF0FF9FFFFFF00FFFFFFFF000FFFF00FFFFFFFFFFF0FF
            F9FFFFFFF00FFFFFF000FFFF0FFFFFFFFFFFF0FFF9FFFFFFFF0FFFFFF000FFFF
            0FFFFFFFFFFFF0FFFF9FFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFF9FFFFF
            FF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFF9FFFFFF0FFFFFF000FFFF0FFFFFFF
            FFFFF0FFFFF9FFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFF9FFFFF0FFFFF
            F000FFFF0FFFFFFFFFFFF0FFFFFFF9FFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FF
            FFFFF9FFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFF9FFF0FFFFFF000FFFF
            0FFFFFFFFFFF000FFFFFFF9FFF0FFFFFF000FFFF0FFFFFFFFF00FFF00FFFFFF9
            FF0FFFFFF000FFFF0FFFFFFF00FFFFFFF00FFFF9FF0FFFFFF000FFFF0FFFFF00
            FFFFFFFFFFF00FFF9F0FFFFFF000FFFF0FFF00FFFFFFFFFFFFFFF00F9F0FFFFF
            F000FFFF0F00FFFFFFFFFFFFFFFFFFF0090FFFFFF000FFFF00FFFFFFFFFFFFFF
            FFFFFFFFF00FFFFFF000FFFFFF00FFFFFFFFFFFFFFFFFFF00FFFFFFFF000FFFF
            FFFF00FFFFFFFFFFFFFFF00FFFFFFFFFF000FFFFFFFFFF00FFFFFFFFFFF00FFF
            FFFFFFFFF000FFFFFFFFFFFF00FFFFFFF00FFFFFFFFFFFFFF000FFFFFFFFFFFF
            FF00FFF00FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000}
          ParentShowHint = False
          PopupMenu = ApplySymPopUp
          ShowHint = True
          OnClick = SBSymmetriesClick
          OnMouseDown = SBr2e1MouseDown
        end
        object SBme4: TSpeedButton
          Tag = 35
          Left = 122
          Top = 56
          Width = 37
          Height = 37
          Hint = 'me: Reflection through a plane'
          AllowAllUp = True
          GroupIndex = 10
          Flat = True
          Glyph.Data = {
            5A030000424D5A03000000000000760000002800000025000000250000000100
            040000000000E402000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFF
            FFFFFFFFFFFF000FFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFF00F0F00FFFFFFF
            FFFFFFFFF000FFFFFFFFFFFF00FFF0FFF00FFFFFFFFFFFFFF000FFFFFFFFFF00
            FFFFF0FFFFF00FFFFFFFFFFFF000FFFFFFFF00FFFFFFF0FFFFFFF00FFFFFFFFF
            F000FFFFFF00FFFFFFFFF0FFFFFFFFF00FFFFFFFF000FFFF00FFFFFFFFFFF0FF
            FFFFFFFFF00FFFFFF000FFFF09FFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF
            0F99FFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFF9FFFFFFFF0FFFFFFFFFF
            FF0FFFFFF000FFFF0FFFF9FFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFF99
            FFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFF9FFFF0FFFFFFFFFFFF0FFFFF
            F000FFFF0FFFFFFFF9FFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFF99F0FF
            FFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFF90FFFFFFFFFFFF0FFFFFF000FFFF
            0FFFFFFFFFFF000FFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFF00FFF00FFFFFFF
            FF0FFFFFF000FFFF0FFFFFFF00FFFFFFF00FFFFFFF0FFFFFF000FFFF0FFFFF00
            FFFFFFFFFFF00FFFFF0FFFFFF000FFFF0FFF00FFFFFFFFFFFFFFF00FFF0FFFFF
            F000FFFF0F00FFFFFFFFFFFFFFFFFFF00F0FFFFFF000FFFF00FFFFFFFFFFFFFF
            FFFFFFFFF00FFFFFF000FFFFFF00FFFFFFFFFFFFFFFFFFF00FFFFFFFF000FFFF
            FFFF00FFFFFFFFFFFFFFF00FFFFFFFFFF000FFFFFFFFFF00FFFFFFFFFFF00FFF
            FFFFFFFFF000FFFFFFFFFFFF00FFFFFFF00FFFFFFFFFFFFFF000FFFFFFFFFFFF
            FF00FFF00FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000}
          ParentShowHint = False
          PopupMenu = ApplySymPopUp
          ShowHint = True
          OnClick = SBSymmetriesClick
          OnMouseDown = SBr2e1MouseDown
        end
        object SBme5: TSpeedButton
          Tag = 19
          Left = 160
          Top = 56
          Width = 37
          Height = 37
          Hint = 'me: Reflection through a plane'
          AllowAllUp = True
          GroupIndex = 11
          Flat = True
          Glyph.Data = {
            5A030000424D5A03000000000000760000002800000025000000250000000100
            040000000000E402000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFF
            FFFFFFFFFFFF000FFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFF00F0F00FFFFFFF
            FFFFFFFFF000FFFFFFFFFFFF00FFF0FFF00FFFFFFFFFFFFFF000FFFFFFFFFF00
            FFFFF0FFFFF00FFFFFFFFFFFF000FFFFFFFF00FFFFFFF0FFFFFFF00FFFFFFFFF
            F000FFFFFF00FFFFFFFFF0FFFFFFFFF00FFFFFFFF000FFFF00FFFFFFFFFFF0FF
            FFFFFFFFF00FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFF90FFFFFF000FFFF
            0FFFFFFFFFFFF0FFFFFFFFF99F0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFF9F
            FF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFF9FFFF0FFFFFF000FFFF0FFFFFFF
            FFFFF0FFFFF99FFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFF9FFFFFFF0FFFFF
            F000FFFF0FFFFFFFFFFFF0FFF9FFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0F9
            9FFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF09FFFFFFFFFFF0FFFFFF000FFFF
            0FFFFFFFFFFF000FFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFF00FFF00FFFFFFF
            FF0FFFFFF000FFFF0FFFFFFF00FFFFFFF00FFFFFFF0FFFFFF000FFFF0FFFFF00
            FFFFFFFFFFF00FFFFF0FFFFFF000FFFF0FFF00FFFFFFFFFFFFFFF00FFF0FFFFF
            F000FFFF0F00FFFFFFFFFFFFFFFFFFF00F0FFFFFF000FFFF00FFFFFFFFFFFFFF
            FFFFFFFFF00FFFFFF000FFFFFF00FFFFFFFFFFFFFFFFFFF00FFFFFFFF000FFFF
            FFFF00FFFFFFFFFFFFFFF00FFFFFFFFFF000FFFFFFFFFF00FFFFFFFFFFF00FFF
            FFFFFFFFF000FFFFFFFFFFFF00FFFFFFF00FFFFFFFFFFFFFF000FFFFFFFFFFFF
            FF00FFF00FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000}
          ParentShowHint = False
          PopupMenu = ApplySymPopUp
          ShowHint = True
          OnClick = SBSymmetriesClick
          OnMouseDown = SBr2e1MouseDown
        end
        object SBme6: TSpeedButton
          Tag = 47
          Left = 198
          Top = 56
          Width = 37
          Height = 37
          Hint = 'me: Reflection through a plane'
          AllowAllUp = True
          GroupIndex = 12
          Flat = True
          Glyph.Data = {
            5A030000424D5A03000000000000760000002800000025000000250000000100
            040000000000E402000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFF
            FFFFFFFFFFFF000FFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFF0090F00FFFFFFF
            FFFFFFFFF000FFFFFFFFFFFF00FF90FFF00FFFFFFFFFFFFFF000FFFFFFFFFF00
            FFF9F0FFFFF00FFFFFFFFFFFF000FFFFFFFF00FFFFF9F0FFFFFFF00FFFFFFFFF
            F000FFFFFF00FFFFFF9FF0FFFFFFFFF00FFFFFFFF000FFFF00FFFFFFF9FFF0FF
            FFFFFFFFF00FFFFFF000FFFF0FFFFFFFF9FFF0FFFFFFFFFFFF0FFFFFF000FFFF
            0FFFFFFF9FFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFF9FFFF0FFFFFFFFFF
            FF0FFFFFF000FFFF0FFFFFF9FFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFF9F
            FFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFF9FFFFFF0FFFFFFFFFFFF0FFFFF
            F000FFFF0FFFF9FFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFF9FFFFFFF0FF
            FFFFFFFFFF0FFFFFF000FFFF0FFF9FFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF
            0FFF9FFFFFFF000FFFFFFFFFFF0FFFFFF000FFFF0FF9FFFFFF00FFF00FFFFFFF
            FF0FFFFFF000FFFF0F9FFFFF00FFFFFFF00FFFFFFF0FFFFFF000FFFF0F9FFF00
            FFFFFFFFFFF00FFFFF0FFFFFF000FFFF09FF00FFFFFFFFFFFFFFF00FFF0FFFFF
            F000FFFF0900FFFFFFFFFFFFFFFFFFF00F0FFFFFF000FFFF00FFFFFFFFFFFFFF
            FFFFFFFFF00FFFFFF000FFFFFF00FFFFFFFFFFFFFFFFFFF00FFFFFFFF000FFFF
            FFFF00FFFFFFFFFFFFFFF00FFFFFFFFFF000FFFFFFFFFF00FFFFFFFFFFF00FFF
            FFFFFFFFF000FFFFFFFFFFFF00FFFFFFF00FFFFFFFFFFFFFF000FFFFFFFFFFFF
            FF00FFF00FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000}
          ParentShowHint = False
          PopupMenu = ApplySymPopUp
          ShowHint = True
          OnClick = SBSymmetriesClick
          OnMouseDown = SBr2e1MouseDown
        end
        object SBr2f1: TSpeedButton
          Tag = 4
          Left = 8
          Top = 104
          Width = 37
          Height = 37
          Hint = 'r2f: 1/2 Rotation around a face'
          AllowAllUp = True
          GroupIndex = 17
          Flat = True
          Glyph.Data = {
            5A030000424D5A03000000000000760000002800000025000000250000000100
            040000000000E402000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFF
            FFFFFFFFFFFF000FFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFF00F0F00FFFFFFF
            FFFFFFFFF000FFFFFFFFFFFF00FFF0FFF00FFFFFFFFFFFFFF000FFFFFFFFFF00
            FFFFF0FFFFF00FFFFFFFFFFFF000FFFFFFFF00FFFFFFF0FFFFFFF00FFFFFFFFF
            F000FFFFFF00FFFFFFFFF0FFFFFFFFF00FFFFFFFF000FFFF00FFFFFFFFFFF0FF
            FFFFFFFFF00FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF
            0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFF
            FF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFF
            FFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFF
            F000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FF
            FFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF
            0FFFFFFFFFFF000FFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFF00FFF00FFFFFFF
            FF0FFFFFF000FFFF0FFFFFFF00FFFFFFF00FFFFFFF0FFFFFF000FFFF0FFFFF00
            FFFFFFFFFFF00FFFFF0FFFFFF000FFFF0FFF00FFFFFF999FFFFFF00FFF0FFFFF
            F000FFFF0F00FFFFFFF99999FFFFFFF00F0FFFFFF000FFFF00FFFFFFFFF99999
            FFFFFFFFF00FFFFFF000FFFFFF00FFFFFFF99999FFFFFFF00FFFFFFFF000FFFF
            FFFF00FFFFFF999FFFFFF00FFFFFFFFFF000FFFFFFFFFF00FFFFFFFFFFF00FFF
            FFFFFFFFF000FFFFFFFFFFFF00FFFFFFF00FFFFFFFFFFFFFF000FFFFFFFFFFFF
            FF00FFF00FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000}
          ParentShowHint = False
          PopupMenu = ApplySymPopUp
          ShowHint = True
          OnClick = SBSymmetriesClick
          OnMouseDown = SBr2e1MouseDown
        end
        object SBr2f2: TSpeedButton
          Tag = 12
          Left = 46
          Top = 104
          Width = 37
          Height = 37
          Hint = 'r2f: 1/2 Rotation around a face'
          AllowAllUp = True
          GroupIndex = 18
          Flat = True
          Glyph.Data = {
            5A030000424D5A03000000000000760000002800000025000000250000000100
            040000000000E402000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFF
            FFFFFFFFFFFF000FFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFF00F0F00FFFFFFF
            FFFFFFFFF000FFFFFFFFFFFF00FFF0FFF00FFFFFFFFFFFFFF000FFFFFFFFFF00
            FFFFF0FFFFF00FFFFFFFFFFFF000FFFFFFFF00FFFFFFF0FFFFFFF00FFFFFFFFF
            F000FFFFFF00FFFFFFFFF0FFFFFFFFF00FFFFFFFF000FFFF00FFFFFFFFFFF0FF
            FFFFFFFFF00FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF
            0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFF999FF
            FF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFF99999FFF0FFFFFF000FFFF0FFFFFFF
            FFFFF0FFFF99999FFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFF99999FFF0FFFFF
            F000FFFF0FFFFFFFFFFFF0FFFFF999FFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FF
            FFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF
            0FFFFFFFFFFF000FFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFF00FFF00FFFFFFF
            FF0FFFFFF000FFFF0FFFFFFF00FFFFFFF00FFFFFFF0FFFFFF000FFFF0FFFFF00
            FFFFFFFFFFF00FFFFF0FFFFFF000FFFF0FFF00FFFFFFFFFFFFFFF00FFF0FFFFF
            F000FFFF0F00FFFFFFFFFFFFFFFFFFF00F0FFFFFF000FFFF00FFFFFFFFFFFFFF
            FFFFFFFFF00FFFFFF000FFFFFF00FFFFFFFFFFFFFFFFFFF00FFFFFFFF000FFFF
            FFFF00FFFFFFFFFFFFFFF00FFFFFFFFFF000FFFFFFFFFF00FFFFFFFFFFF00FFF
            FFFFFFFFF000FFFFFFFFFFFF00FFFFFFF00FFFFFFFFFFFFFF000FFFFFFFFFFFF
            FF00FFF00FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000}
          ParentShowHint = False
          PopupMenu = ApplySymPopUp
          ShowHint = True
          OnClick = SBSymmetriesClick
          OnMouseDown = SBr2e1MouseDown
        end
        object SBr2f3: TSpeedButton
          Tag = 8
          Left = 84
          Top = 104
          Width = 37
          Height = 37
          Hint = 'r2f: 1/2 Rotation around a face'
          AllowAllUp = True
          GroupIndex = 19
          Flat = True
          Glyph.Data = {
            5A030000424D5A03000000000000760000002800000025000000250000000100
            040000000000E402000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFF
            FFFFFFFFFFFF000FFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFF00F0F00FFFFFFF
            FFFFFFFFF000FFFFFFFFFFFF00FFF0FFF00FFFFFFFFFFFFFF000FFFFFFFFFF00
            FFFFF0FFFFF00FFFFFFFFFFFF000FFFFFFFF00FFFFFFF0FFFFFFF00FFFFFFFFF
            F000FFFFFF00FFFFFFFFF0FFFFFFFFF00FFFFFFFF000FFFF00FFFFFFFFFFF0FF
            FFFFFFFFF00FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF
            0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFF999FFFFF0FFFFFFFFFF
            FF0FFFFFF000FFFF0FFF99999FFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFF9999
            9FFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFF99999FFFF0FFFFFFFFFFFF0FFFFF
            F000FFFF0FFFF999FFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FF
            FFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF
            0FFFFFFFFFFF000FFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFF00FFF00FFFFFFF
            FF0FFFFFF000FFFF0FFFFFFF00FFFFFFF00FFFFFFF0FFFFFF000FFFF0FFFFF00
            FFFFFFFFFFF00FFFFF0FFFFFF000FFFF0FFF00FFFFFFFFFFFFFFF00FFF0FFFFF
            F000FFFF0F00FFFFFFFFFFFFFFFFFFF00F0FFFFFF000FFFF00FFFFFFFFFFFFFF
            FFFFFFFFF00FFFFFF000FFFFFF00FFFFFFFFFFFFFFFFFFF00FFFFFFFF000FFFF
            FFFF00FFFFFFFFFFFFFFF00FFFFFFFFFF000FFFFFFFFFF00FFFFFFFFFFF00FFF
            FFFFFFFFF000FFFFFFFFFFFF00FFFFFFF00FFFFFFFFFFFFFF000FFFFFFFFFFFF
            FF00FFF00FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000}
          ParentShowHint = False
          PopupMenu = ApplySymPopUp
          ShowHint = True
          OnClick = SBSymmetriesClick
          OnMouseDown = SBr2e1MouseDown
        end
        object SBr41: TSpeedButton
          Tag = 2
          Left = 122
          Top = 104
          Width = 37
          Height = 37
          Hint = 'r4: 1/4 Rotation around a face'
          AllowAllUp = True
          GroupIndex = 20
          Flat = True
          Glyph.Data = {
            5A030000424D5A03000000000000760000002800000025000000250000000100
            040000000000E402000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFF
            FFFFFFFFFFFF000FFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFF00F0F00FFFFFFF
            FFFFFFFFF000FFFFFFFFFFFF00FFF0FFF00FFFFFFFFFFFFFF000FFFFFFFFFF00
            FFFFF0FFFFF00FFFFFFFFFFFF000FFFFFFFF00FFFFFFF0FFFFFFF00FFFFFFFFF
            F000FFFFFF00FFFFFFFFF0FFFFFFFFF00FFFFFFFF000FFFF00FFFFFFFFFFF0FF
            FFFFFFFFF00FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF
            0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFF
            FF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFF
            FFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFF
            F000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FF
            FFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF
            0FFFFFFFFFFF000FFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFF00FFF00FFFFFFF
            FF0FFFFFF000FFFF0FFFFFFF00FFFFFFF00FFFFFFF0FFFFFF000FFFF0FFFFF00
            FFFFFFFFFFF00FFFFF0FFFFFF000FFFF0FFF00FFFFFFCCCFFFFFF00FFF0FFFFF
            F000FFFF0F00FFFFFFFCCCCCFFFFFFF00F0FFFFFF000FFFF00FFFFFFFFFCCCCC
            FFFFFFFFF00FFFFFF000FFFFFF00FFFFFFFCCCCCFFFFFFF00FFFFFFFF000FFFF
            FFFF00FFFFFFCCCFFFFFF00FFFFFFFFFF000FFFFFFFFFF00FFFFFFFFFFF00FFF
            FFFFFFFFF000FFFFFFFFFFFF00FFFFFFF00FFFFFFFFFFFFFF000FFFFFFFFFFFF
            FF00FFF00FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000}
          ParentShowHint = False
          PopupMenu = ApplySymPopUp
          ShowHint = True
          OnClick = SBSymmetriesClick
          OnMouseDown = SBr2e1MouseDown
        end
        object SBr42: TSpeedButton
          Tag = 22
          Left = 160
          Top = 104
          Width = 37
          Height = 37
          Hint = 'r4: 1/4 Rotation around a face'
          AllowAllUp = True
          GroupIndex = 21
          Flat = True
          Glyph.Data = {
            5A030000424D5A03000000000000760000002800000025000000250000000100
            040000000000E402000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFF
            FFFFFFFFFFFF000FFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFF00F0F00FFFFFFF
            FFFFFFFFF000FFFFFFFFFFFF00FFF0FFF00FFFFFFFFFFFFFF000FFFFFFFFFF00
            FFFFF0FFFFF00FFFFFFFFFFFF000FFFFFFFF00FFFFFFF0FFFFFFF00FFFFFFFFF
            F000FFFFFF00FFFFFFFFF0FFFFFFFFF00FFFFFFFF000FFFF00FFFFFFFFFFF0FF
            FFFFFFFFF00FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF
            0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFCCCFF
            FF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFCCCCCFFF0FFFFFF000FFFF0FFFFFFF
            FFFFF0FFFFCCCCCFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFCCCCCFFF0FFFFF
            F000FFFF0FFFFFFFFFFFF0FFFFFCCCFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FF
            FFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF
            0FFFFFFFFFFF000FFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFF00FFF00FFFFFFF
            FF0FFFFFF000FFFF0FFFFFFF00FFFFFFF00FFFFFFF0FFFFFF000FFFF0FFFFF00
            FFFFFFFFFFF00FFFFF0FFFFFF000FFFF0FFF00FFFFFFFFFFFFFFF00FFF0FFFFF
            F000FFFF0F00FFFFFFFFFFFFFFFFFFF00F0FFFFFF000FFFF00FFFFFFFFFFFFFF
            FFFFFFFFF00FFFFFF000FFFFFF00FFFFFFFFFFFFFFFFFFF00FFFFFFFF000FFFF
            FFFF00FFFFFFFFFFFFFFF00FFFFFFFFFF000FFFFFFFFFF00FFFFFFFFFFF00FFF
            FFFFFFFFF000FFFFFFFFFFFF00FFFFFFF00FFFFFFFFFFFFFF000FFFFFFFFFFFF
            FF00FFF00FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000}
          ParentShowHint = False
          PopupMenu = ApplySymPopUp
          ShowHint = True
          OnClick = SBSymmetriesClick
          OnMouseDown = SBr2e1MouseDown
        end
        object SBr43: TSpeedButton
          Tag = 34
          Left = 198
          Top = 104
          Width = 37
          Height = 37
          Hint = 'r4: 1/4 Rotation around a face'
          AllowAllUp = True
          GroupIndex = 22
          Flat = True
          Glyph.Data = {
            5A030000424D5A03000000000000760000002800000025000000250000000100
            040000000000E402000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFF
            FFFFFFFFFFFF000FFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFF00F0F00FFFFFFF
            FFFFFFFFF000FFFFFFFFFFFF00FFF0FFF00FFFFFFFFFFFFFF000FFFFFFFFFF00
            FFFFF0FFFFF00FFFFFFFFFFFF000FFFFFFFF00FFFFFFF0FFFFFFF00FFFFFFFFF
            F000FFFFFF00FFFFFFFFF0FFFFFFFFF00FFFFFFFF000FFFF00FFFFFFFFFFF0FF
            FFFFFFFFF00FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF
            0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFCCCFFFFF0FFFFFFFFFF
            FF0FFFFFF000FFFF0FFFCCCCCFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFCCCC
            CFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFCCCCCFFFF0FFFFFFFFFFFF0FFFFF
            F000FFFF0FFFFCCCFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FF
            FFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF
            0FFFFFFFFFFF000FFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFF00FFF00FFFFFFF
            FF0FFFFFF000FFFF0FFFFFFF00FFFFFFF00FFFFFFF0FFFFFF000FFFF0FFFFF00
            FFFFFFFFFFF00FFFFF0FFFFFF000FFFF0FFF00FFFFFFFFFFFFFFF00FFF0FFFFF
            F000FFFF0F00FFFFFFFFFFFFFFFFFFF00F0FFFFFF000FFFF00FFFFFFFFFFFFFF
            FFFFFFFFF00FFFFFF000FFFFFF00FFFFFFFFFFFFFFFFFFF00FFFFFFFF000FFFF
            FFFF00FFFFFFFFFFFFFFF00FFFFFFFFFF000FFFFFFFFFF00FFFFFFFFFFF00FFF
            FFFFFFFFF000FFFFFFFFFFFF00FFFFFFF00FFFFFFFFFFFFFF000FFFFFFFFFFFF
            FF00FFF00FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000}
          ParentShowHint = False
          PopupMenu = ApplySymPopUp
          ShowHint = True
          OnClick = SBSymmetriesClick
          OnMouseDown = SBr2e1MouseDown
        end
        object SBmf1: TSpeedButton
          Tag = 9
          Left = 8
          Top = 144
          Width = 37
          Height = 37
          Hint = 'mf: Reflection through a plane'
          AllowAllUp = True
          GroupIndex = 23
          Flat = True
          Glyph.Data = {
            5A030000424D5A03000000000000760000002800000025000000250000000100
            040000000000E402000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFF
            FFFFFFFFFFFF000FFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFF00F0F00FFFFFFF
            FFFFFFFFF000FFFFFFFFFFFF00FFF0FFF00FFFFFFFFFFFFFF000FFFFFFFFFF00
            FFFFF0FFFFF00FFFFFFFFFFFF000FFFFFFFF00FFFFFFF0FFFFFFF00FFFFFFFFF
            F000FFFFFF00FFFFFFFFF0FFFFFFFFF00FFFFFFFF000FFFF00FFFFFFFFFFF0FF
            FFFFFFFFF00FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF
            0FFFFFFFFFFF909FFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFF99F0F99FFFFFFF
            FF0FFFFFF000FFFF0FFFFFFF99FFF0FFF99FFFFFFF0FFFFFF000FFFF0FFFFF99
            FFFFF0FFFFF99FFFFF0FFFFFF000FFFF0FFF99FFFFFFF0FFFFFFF99FFF0FFFFF
            F000FFFF0F99FFFFFFFFF0FFFFFFFFF99F0FFFFFF000FFFF09FFFFFFFFFFF0FF
            FFFFFFFFF90FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF
            0FFFFFFFFFFF000FFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFF00FFF00FFFFFFF
            FF0FFFFFF000FFFF0FFFFFFF00FFFFFFF00FFFFFFF0FFFFFF000FFFF0FFFFF00
            FFFFFFFFFFF00FFFFF0FFFFFF000FFFF0FFF00FFFFFFFFFFFFFFF00FFF0FFFFF
            F000FFFF0F00FFFFFFFFFFFFFFFFFFF00F0FFFFFF000FFFF00FFFFFFFFFFFFFF
            FFFFFFFFF00FFFFFF000FFFFFF00FFFFFFFFFFFFFFFFFFF00FFFFFFFF000FFFF
            FFFF00FFFFFFFFFFFFFFF00FFFFFFFFFF000FFFFFFFFFF00FFFFFFFFFFF00FFF
            FFFFFFFFF000FFFFFFFFFFFF00FFFFFFF00FFFFFFFFFFFFFF000FFFFFFFFFFFF
            FF00FFF00FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000}
          ParentShowHint = False
          PopupMenu = ApplySymPopUp
          ShowHint = True
          OnClick = SBSymmetriesClick
          OnMouseDown = SBr2e1MouseDown
        end
        object SBmf2: TSpeedButton
          Tag = 1
          Left = 46
          Top = 144
          Width = 37
          Height = 37
          Hint = 'mf: Reflection through a plane'
          AllowAllUp = True
          GroupIndex = 24
          Flat = True
          Glyph.Data = {
            5A030000424D5A03000000000000760000002800000025000000250000000100
            040000000000E402000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFF
            FFFFFFFFFFFF000FFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFF00F0F00FFFFFFF
            FFFFFFFFF000FFFFFFFFFFFF00FFF0FFF00FFFFFFFFFFFFFF000FFFFFFFFFF00
            FFFFF0FFFFF00FFFFFFFFFFFF000FFFFFFFF009FFFFFF0FFFFFFF00FFFFFFFFF
            F000FFFFFF00FF9FFFFFF0FFFFFFFFF00FFFFFFFF000FFFF00FFFF9FFFFFF0FF
            FFFFFFFFF00FFFFFF000FFFF0FFFFF9FFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF
            0FFFFF9FFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFF9FFFFFF0FFFFFFFFFF
            FF0FFFFFF000FFFF0FFFFF9FFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFF9F
            FFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFF9FFFFFF0FFFFFFFFFFFF0FFFFF
            F000FFFF0FFFFF9FFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFF9FFFFFF0FF
            FFFFFFFFFF0FFFFFF000FFFF0FFFFF9FFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF
            0FFFFF9FFFFF000FFFFFFFFFFF0FFFFFF000FFFF0FFFFF9FFF00FFF00FFFFFFF
            FF0FFFFFF000FFFF0FFFFF9F00FFFFFFF00FFFFFFF0FFFFFF000FFFF0FFFFF00
            9FFFFFFFFFF00FFFFF0FFFFFF000FFFF0FFF00FFF99FFFFFFFFFF00FFF0FFFFF
            F000FFFF0F00FFFFFFF99FFFFFFFFFF00F0FFFFFF000FFFF00FFFFFFFFFFF99F
            FFFFFFFFF00FFFFFF000FFFFFF00FFFFFFFFFFF99FFFFFF00FFFFFFFF000FFFF
            FFFF00FFFFFFFFFFF99FF00FFFFFFFFFF000FFFFFFFFFF00FFFFFFFFFFF00FFF
            FFFFFFFFF000FFFFFFFFFFFF00FFFFFFF00FFFFFFFFFFFFFF000FFFFFFFFFFFF
            FF00FFF00FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000}
          ParentShowHint = False
          PopupMenu = ApplySymPopUp
          ShowHint = True
          OnClick = SBSymmetriesClick
          OnMouseDown = SBr2e1MouseDown
        end
        object SBmf3: TSpeedButton
          Tag = 5
          Left = 84
          Top = 144
          Width = 37
          Height = 37
          Hint = 'mf: Reflection through a plane'
          AllowAllUp = True
          GroupIndex = 25
          Flat = True
          Glyph.Data = {
            5A030000424D5A03000000000000760000002800000025000000250000000100
            040000000000E402000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFF
            FFFFFFFFFFFF000FFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFF00F0F00FFFFFFF
            FFFFFFFFF000FFFFFFFFFFFF00FFF0FFF00FFFFFFFFFFFFFF000FFFFFFFFFF00
            FFFFF0FFFFF00FFFFFFFFFFFF000FFFFFFFF00FFFFFFF0FFFFFF900FFFFFFFFF
            F000FFFFFF00FFFFFFFFF0FFFFFF9FF00FFFFFFFF000FFFF00FFFFFFFFFFF0FF
            FFFF9FFFF00FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFF9FFFFF0FFFFFF000FFFF
            0FFFFFFFFFFFF0FFFFFF9FFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFF9FFF
            FF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFF9FFFFF0FFFFFF000FFFF0FFFFFFF
            FFFFF0FFFFFF9FFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFF9FFFFF0FFFFF
            F000FFFF0FFFFFFFFFFFF0FFFFFF9FFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FF
            FFFF9FFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFF9FFFFF0FFFFFF000FFFF
            0FFFFFFFFFFF000FFFFF9FFFFF0FFFFFF000FFFF0FFFFFFFFF00FFF00FFF9FFF
            FF0FFFFFF000FFFF0FFFFFFF00FFFFFFF00F9FFFFF0FFFFFF000FFFF0FFFFF00
            FFFFFFFFFFF00FFFFF0FFFFFF000FFFF0FFF00FFFFFFFFFFF99FF00FFF0FFFFF
            F000FFFF0F00FFFFFFFFFFF99FFFFFF00F0FFFFFF000FFFF00FFFFFFFFFFF99F
            FFFFFFFFF00FFFFFF000FFFFFF00FFFFFFF99FFFFFFFFFF00FFFFFFFF000FFFF
            FFFF00FFF99FFFFFFFFFF00FFFFFFFFFF000FFFFFFFFFF099FFFFFFFFFF00FFF
            FFFFFFFFF000FFFFFFFFFFFF00FFFFFFF00FFFFFFFFFFFFFF000FFFFFFFFFFFF
            FF00FFF00FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000}
          ParentShowHint = False
          PopupMenu = ApplySymPopUp
          ShowHint = True
          OnClick = SBSymmetriesClick
          OnMouseDown = SBr2e1MouseDown
        end
        object SBm41: TSpeedButton
          Tag = 11
          Left = 122
          Top = 144
          Width = 37
          Height = 37
          Hint = 'm4: 1/4 Rotation + Reflection through the center'
          AllowAllUp = True
          GroupIndex = 26
          Flat = True
          Glyph.Data = {
            5A030000424D5A03000000000000760000002800000025000000250000000100
            040000000000E402000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFF
            FFFFFFFFFFFF000FFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFF00F0F00FFFFFFF
            FFFFFFFFF000FFFFFFFFFFFF00FFF0FFF00FFFFFFFFFFFFFF000FFFFFFFFFF00
            FFFFF0FFFFF00FFFFFFFFFFFF000FFFFFFFF00FFFFFFF0FFFFFFF00FFFFFFFFF
            F000FFFFFF00FFFFFFFFF0FFFFFFFFF00FFFFFFFF000FFFF00FFFFFFFFFFF0FF
            FFFFFFFFF00FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF
            0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFF
            FF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFF
            FFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFF
            F000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FF
            FFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF
            0FFFFFFFFFFF000FFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFF00FFF00FFFFFFF
            FF0FFFFFF000FFFF0FFFFFFF00FFFFFFF00FFFFFFF0FFFFFF000FFFF0FFFFF00
            FFFFFFFFFFF00FFFFF0FFFFFF000FFFF0FFF00FFFFFFBBBFFFFFF00FFF0FFFFF
            F000FFFF0F00FFFFFFFBBBBBFFFFFFF00F0FFFFFF000FFFF00FFFFFFFFFBBBBB
            FFFFFFFFF00FFFFFF000FFFFFF00FFFFFFFBBBBBFFFFFFF00FFFFFFFF000FFFF
            FFFF00FFFFFFBBBFFFFFF00FFFFFFFFFF000FFFFFFFFFF00FFFFFFFFFFF00FFF
            FFFFFFFFF000FFFFFFFFFFFF00FFFFFFF00FFFFFFFFFFFFFF000FFFFFFFFFFFF
            FF00FFF00FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000}
          ParentShowHint = False
          PopupMenu = ApplySymPopUp
          ShowHint = True
          OnClick = SBSymmetriesClick
          OnMouseDown = SBr2e1MouseDown
        end
        object SBm42: TSpeedButton
          Tag = 23
          Left = 160
          Top = 144
          Width = 37
          Height = 37
          Hint = 'm4: 1/4 Rotation + Reflection through the center'
          AllowAllUp = True
          GroupIndex = 27
          Flat = True
          Glyph.Data = {
            5A030000424D5A03000000000000760000002800000025000000250000000100
            040000000000E402000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFF
            FFFFFFFFFFFF000FFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFF00F0F00FFFFFFF
            FFFFFFFFF000FFFFFFFFFFFF00FFF0FFF00FFFFFFFFFFFFFF000FFFFFFFFFF00
            FFFFF0FFFFF00FFFFFFFFFFFF000FFFFFFFF00FFFFFFF0FFFFFFF00FFFFFFFFF
            F000FFFFFF00FFFFFFFFF0FFFFFFFFF00FFFFFFFF000FFFF00FFFFFFFFFFF0FF
            FFFFFFFFF00FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF
            0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFBBBFF
            FF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFBBBBBFFF0FFFFFF000FFFF0FFFFFFF
            FFFFF0FFFFBBBBBFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFBBBBBFFF0FFFFF
            F000FFFF0FFFFFFFFFFFF0FFFFFBBBFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FF
            FFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF
            0FFFFFFFFFFF000FFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFF00FFF00FFFFFFF
            FF0FFFFFF000FFFF0FFFFFFF00FFFFFFF00FFFFFFF0FFFFFF000FFFF0FFFFF00
            FFFFFFFFFFF00FFFFF0FFFFFF000FFFF0FFF00FFFFFFFFFFFFFFF00FFF0FFFFF
            F000FFFF0F00FFFFFFFFFFFFFFFFFFF00F0FFFFFF000FFFF00FFFFFFFFFFFFFF
            FFFFFFFFF00FFFFFF000FFFFFF00FFFFFFFFFFFFFFFFFFF00FFFFFFFF000FFFF
            FFFF00FFFFFFFFFFFFFFF00FFFFFFFFFF000FFFFFFFFFF00FFFFFFFFFFF00FFF
            FFFFFFFFF000FFFFFFFFFFFF00FFFFFFF00FFFFFFFFFFFFFF000FFFFFFFFFFFF
            FF00FFF00FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000}
          ParentShowHint = False
          PopupMenu = ApplySymPopUp
          ShowHint = True
          OnClick = SBSymmetriesClick
          OnMouseDown = SBr2e1MouseDown
        end
        object SBm43: TSpeedButton
          Tag = 39
          Left = 198
          Top = 144
          Width = 37
          Height = 37
          Hint = 'm4: 1/4 Rotation + Reflection through the center'
          AllowAllUp = True
          GroupIndex = 28
          Flat = True
          Glyph.Data = {
            5A030000424D5A03000000000000760000002800000025000000250000000100
            040000000000E402000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFF
            FFFFFFFFFFFF000FFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFF00F0F00FFFFFFF
            FFFFFFFFF000FFFFFFFFFFFF00FFF0FFF00FFFFFFFFFFFFFF000FFFFFFFFFF00
            FFFFF0FFFFF00FFFFFFFFFFFF000FFFFFFFF00FFFFFFF0FFFFFFF00FFFFFFFFF
            F000FFFFFF00FFFFFFFFF0FFFFFFFFF00FFFFFFFF000FFFF00FFFFFFFFFFF0FF
            FFFFFFFFF00FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF
            0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFBBBFFFFF0FFFFFFFFFF
            FF0FFFFFF000FFFF0FFFBBBBBFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFBBBB
            BFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFBBBBBFFFF0FFFFFFFFFFFF0FFFFF
            F000FFFF0FFFFBBBFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FF
            FFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF
            0FFFFFFFFFFF000FFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFF00FFF00FFFFFFF
            FF0FFFFFF000FFFF0FFFFFFF00FFFFFFF00FFFFFFF0FFFFFF000FFFF0FFFFF00
            FFFFFFFFFFF00FFFFF0FFFFFF000FFFF0FFF00FFFFFFFFFFFFFFF00FFF0FFFFF
            F000FFFF0F00FFFFFFFFFFFFFFFFFFF00F0FFFFFF000FFFF00FFFFFFFFFFFFFF
            FFFFFFFFF00FFFFFF000FFFFFF00FFFFFFFFFFFFFFFFFFF00FFFFFFFF000FFFF
            FFFF00FFFFFFFFFFFFFFF00FFFFFFFFFF000FFFFFFFFFF00FFFFFFFFFFF00FFF
            FFFFFFFFF000FFFFFFFFFFFF00FFFFFFF00FFFFFFFFFFFFFF000FFFFFFFFFFFF
            FF00FFF00FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000}
          ParentShowHint = False
          PopupMenu = ApplySymPopUp
          ShowHint = True
          OnClick = SBSymmetriesClick
          OnMouseDown = SBr2e1MouseDown
        end
        object SBr31: TSpeedButton
          Tag = 16
          Left = 247
          Top = 18
          Width = 37
          Height = 37
          Hint = 'r3: 1/3 Rotation around a corner'
          AllowAllUp = True
          GroupIndex = 13
          Flat = True
          Glyph.Data = {
            5A030000424D5A03000000000000760000002800000025000000250000000100
            040000000000E402000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFF
            FFFFFFFFFFFF000FFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFF00F0F00FFFFFFF
            FFFFFFFFF000FFFFFFFFFFFF00FFF0FFF00FFFFFFFFFFFFFF000FFFFFFFFFF00
            FFFFF0FFFFF00FFFFFFFFFFFF000FFFFFFFF00FFFFFFF0FFFFFFF00FFFFFFFFF
            F000FFFFFF00FFFFFFFFF0FFFFFFFFF00FFFFFFFF000FFFF00FFFFFFFFFFF0FF
            FFFFFFFFF00FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF
            0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFF
            FF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFF
            FFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFF
            F000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFAAAF
            FFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFAAAAAFFFFFFFFFF0FFFFFF000FFFF
            0FFFFFFFFFFAAAAAFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFF0AAAAA0FFFFFFF
            FF0FFFFFF000FFFF0FFFFFFF00FFAAAFF00FFFFFFF0FFFFFF000FFFF0FFFFF00
            FFFFFFFFFFF00FFFFF0FFFFFF000FFFF0FFF00FFFFFFFFFFFFFFF00FFF0FFFFF
            F000FFFF0F00FFFFFFFFFFFFFFFFFFF00F0FFFFFF000FFFF00FFFFFFFFFFFFFF
            FFFFFFFFF00FFFFFF000FFFFFF00FFFFFFFFFFFFFFFFFFF00FFFFFFFF000FFFF
            FFFF00FFFFFFFFFFFFFFF00FFFFFFFFFF000FFFFFFFFFF00FFFFFFFFFFF00FFF
            FFFFFFFFF000FFFFFFFFFFFF00FFFFFFF00FFFFFFFFFFFFFF000FFFFFFFFFFFF
            FF00FFF00FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000}
          ParentShowHint = False
          PopupMenu = ApplySymPopUp
          ShowHint = True
          OnClick = SBSymmetriesClick
          OnMouseDown = SBr2e1MouseDown
        end
        object SB26: TSpeedButton
          Tag = 20
          Left = 285
          Top = 18
          Width = 37
          Height = 37
          Hint = 'r3: 1/3 Rotation around a corner'
          AllowAllUp = True
          GroupIndex = 14
          Flat = True
          Glyph.Data = {
            5A030000424D5A03000000000000760000002800000025000000250000000100
            040000000000E402000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFF
            FFFFFFFFFFFF000FFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFF00F0F00FFFFFFF
            FFFFFFFFF000FFFFFFFFFFFF00FFF0FFF00FFFFFFFFFFFFFF000FFFFFFFFFF00
            FFFFF0FFFFF00FFFFFFFFFFFF000FFFFFFFF00FFFFFFF0FFFFFFF00FFAAAFFFF
            F000FFFFFF00FFFFFFFFF0FFFFFFFFF0AAAAAFFFF000FFFF00FFFFFFFFFFF0FF
            FFFFFFFFAAAAAFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFAAAAAFFFF000FFFF
            0FFFFFFFFFFFF0FFFFFFFFFFFAAAFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFF
            FF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFF
            FFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFF
            F000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FF
            FFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF
            0FFFFFFFFFFF000FFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFF00FFF00FFFFFFF
            FF0FFFFFF000FFFF0FFFFFFF00FFFFFFF00FFFFFFF0FFFFFF000FFFF0FFFFF00
            FFFFFFFFFFF00FFFFF0FFFFFF000FFFAAAFF00FFFFFFFFFFFFFFF00FFF0FFFFF
            F000FFAAAAA0FFFFFFFFFFFFFFFFFFF00F0FFFFFF000FFAAAAAFFFFFFFFFFFFF
            FFFFFFFFF00FFFFFF000FFAAAAA0FFFFFFFFFFFFFFFFFFF00FFFFFFFF000FFFA
            AAFF00FFFFFFFFFFFFFFF00FFFFFFFFFF000FFFFFFFFFF00FFFFFFFFFFF00FFF
            FFFFFFFFF000FFFFFFFFFFFF00FFFFFFF00FFFFFFFFFFFFFF000FFFFFFFFFFFF
            FF00FFF00FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000}
          ParentShowHint = False
          PopupMenu = ApplySymPopUp
          ShowHint = True
          OnClick = SBSymmetriesClick
          OnMouseDown = SBr2e1MouseDown
        end
        object SB27: TSpeedButton
          Tag = 24
          Left = 247
          Top = 56
          Width = 37
          Height = 37
          Hint = 'r3: 1/3 Rotation around a corner'
          AllowAllUp = True
          GroupIndex = 15
          Flat = True
          Glyph.Data = {
            5A030000424D5A03000000000000760000002800000025000000250000000100
            040000000000E402000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFAAAF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFAAAAAFFFFFFFFFFFFFFFFF000FFFF
            FFFFFFFFFFFAAAAAFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFF0AAAAA0FFFFFFF
            FFFFFFFFF000FFFFFFFFFFFF00FFAAAFF00FFFFFFFFFFFFFF000FFFFFFFFFF00
            FFFFF0FFFFF00FFFFFFFFFFFF000FFFFFFFF00FFFFFFF0FFFFFFF00FFFFFFFFF
            F000FFFFFF00FFFFFFFFF0FFFFFFFFF00FFFFFFFF000FFFF00FFFFFFFFFFF0FF
            FFFFFFFFF00FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF
            0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFF
            FF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFF
            FFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFF
            F000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FF
            FFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF
            0FFFFFFFFFFF000FFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFF00FFF00FFFFFFF
            FF0FFFFFF000FFFF0FFFFFFF00FFFFFFF00FFFFFFF0FFFFFF000FFFF0FFFFF00
            FFFFFFFFFFF00FFFFF0FFFFFF000FFFF0FFF00FFFFFFFFFFFFFFF00FFF0FFFFF
            F000FFFF0F00FFFFFFFFFFFFFFFFFFF00F0FFFFFF000FFFF00FFFFFFFFFFFFFF
            FFFFFFFFF00FFFFFF000FFFFFF00FFFFFFFFFFFFFFFFFFF00FFFFFFFF000FFFF
            FFFF00FFFFFFFFFFFFFFF00FFFFFFFFFF000FFFFFFFFFF00FFFFFFFFFFF00FFF
            FFFFFFFFF000FFFFFFFFFFFF00FFAAAFF00FFFFFFFFFFFFFF000FFFFFFFFFFFF
            FF0AAAAA0FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFAAAAAFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFAAAAAFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFAAAF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000}
          ParentShowHint = False
          PopupMenu = ApplySymPopUp
          ShowHint = True
          OnClick = SBSymmetriesClick
          OnMouseDown = SBr2e1MouseDown
        end
        object SB28: TSpeedButton
          Tag = 28
          Left = 285
          Top = 56
          Width = 37
          Height = 37
          Hint = 'r3: 1/3 Rotation around a corner'
          AllowAllUp = True
          GroupIndex = 16
          Flat = True
          Glyph.Data = {
            5A030000424D5A03000000000000760000002800000025000000250000000100
            040000000000E402000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFF
            FFFFFFFFFFFF000FFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFF00F0F00FFFFFFF
            FFFFFFFFF000FFFFFFFFFFFF00FFF0FFF00FFFFFFFFFFFFFF000FFFFFFFFFF00
            FFFFF0FFFFF00FFFFFFFFFFFF000FFFAAAFF00FFFFFFF0FFFFFFF00FFFFFFFFF
            F000FFAAAAA0FFFFFFFFF0FFFFFFFFF00FFFFFFFF000FFAAAAAFFFFFFFFFF0FF
            FFFFFFFFF00FFFFFF000FFAAAAAFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFA
            AAFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFF
            FF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFF
            FFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFF
            F000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FF
            FFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF
            0FFFFFFFFFFF000FFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFF00FFF00FFFFFFF
            FF0FFFFFF000FFFF0FFFFFFF00FFFFFFF00FFFFFFF0FFFFFF000FFFF0FFFFF00
            FFFFFFFFFFF00FFFFF0FFFFFF000FFFF0FFF00FFFFFFFFFFFFFFF00FFAAAFFFF
            F000FFFF0F00FFFFFFFFFFFFFFFFFFF0AAAAAFFFF000FFFF00FFFFFFFFFFFFFF
            FFFFFFFFAAAAAFFFF000FFFFFF00FFFFFFFFFFFFFFFFFFF0AAAAAFFFF000FFFF
            FFFF00FFFFFFFFFFFFFFF00FFAAAFFFFF000FFFFFFFFFF00FFFFFFFFFFF00FFF
            FFFFFFFFF000FFFFFFFFFFFF00FFFFFFF00FFFFFFFFFFFFFF000FFFFFFFFFFFF
            FF00FFF00FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000}
          ParentShowHint = False
          PopupMenu = ApplySymPopUp
          ShowHint = True
          OnClick = SBSymmetriesClick
          OnMouseDown = SBr2e1MouseDown
        end
        object SBmc: TSpeedButton
          Tag = 13
          Left = 267
          Top = 104
          Width = 37
          Height = 37
          Hint = 'mc: Reflection through the center'
          AllowAllUp = True
          GroupIndex = 29
          Flat = True
          Glyph.Data = {
            5A030000424D5A03000000000000760000002800000025000000250000000100
            040000000000E402000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFF
            FFFFFFFFFFFF000FFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFF00F0F00FFFFFFF
            FFFFFFFFF000FFFFFFFFFFFF00FFF0FFF00FFFFFFFFFFFFFF000FFFFFFFFFF00
            FFFFF0FFFFF00FFFFFFFFFFFF000FFFFFFFF00FFFFFFF0FFFFFFF00FFFFFFFFF
            F000FFFFFF00FFFFFFFFF0FFFFFFFFF00FFFFFFFF000FFFF00FFFFFFFFFFF0FF
            FFFFFFFFF00FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF
            0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFF
            FF0FFFFFF000FFFF0FFFFFFFFFFFD0DFFFFFFFFFFF0FFFFFF000FFFF0FFFFFFF
            FFFDD0DDFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFDD0DDFFFFFFFFFF0FFFFF
            F000FFFF0FFFFFFFFFFDD0DDFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFD0DF
            FFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFFFFF0FFFFFFFFFFFF0FFFFFF000FFFF
            0FFFFFFFFFFF000FFFFFFFFFFF0FFFFFF000FFFF0FFFFFFFFF00FFF00FFFFFFF
            FF0FFFFFF000FFFF0FFFFFFF00FFFFFFF00FFFFFFF0FFFFFF000FFFF0FFFFF00
            FFFFFFFFFFF00FFFFF0FFFFFF000FFFF0FFF00FFFFFFFFFFFFFFF00FFF0FFFFF
            F000FFFF0F00FFFFFFFFFFFFFFFFFFF00F0FFFFFF000FFFF00FFFFFFFFFFFFFF
            FFFFFFFFF00FFFFFF000FFFFFF00FFFFFFFFFFFFFFFFFFF00FFFFFFFF000FFFF
            FFFF00FFFFFFFFFFFFFFF00FFFFFFFFFF000FFFFFFFFFF00FFFFFFFFFFF00FFF
            FFFFFFFFF000FFFFFFFFFFFF00FFFFFFF00FFFFFFFFFFFFFF000FFFFFFFFFFFF
            FF00FFF00FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000}
          ParentShowHint = False
          PopupMenu = ApplySymPopUp
          ShowHint = True
          OnClick = SBSymmetriesClick
          OnMouseDown = SBr2e1MouseDown
        end
        object Bevel12: TBevel
          Left = 240
          Top = 6
          Width = 9
          Height = 185
          Shape = bsLeftLine
        end
        object Bevel13: TBevel
          Left = 1
          Top = 97
          Width = 239
          Height = 18
          Shape = bsTopLine
        end
        object Bevel14: TBevel
          Left = 241
          Top = 97
          Width = 92
          Height = 18
          Shape = bsTopLine
        end
        object CSelfInverse: TCheckBox
          Left = 250
          Top = 156
          Width = 79
          Height = 17
          Caption = 'Selfinverse'
          TabOrder = 0
          OnClick = CSelfInverseClick
        end
      end
      object GBNumCol: TGroupBox
        Left = 8
        Top = 334
        Width = 207
        Height = 43
        Caption = 'Number of Colors'
        TabOrder = 1
        object CBn1: TCheckBox
          Left = 8
          Top = 17
          Width = 33
          Height = 17
          Caption = '1'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
        object CBn3: TCheckBox
          Left = 75
          Top = 17
          Width = 33
          Height = 17
          Caption = '3'
          TabOrder = 2
        end
        object CBn2: TCheckBox
          Left = 41
          Top = 17
          Width = 33
          Height = 17
          Caption = '2'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
        object CBn4: TCheckBox
          Left = 109
          Top = 17
          Width = 33
          Height = 17
          Caption = '4'
          TabOrder = 3
        end
        object CBn5: TCheckBox
          Left = 143
          Top = 17
          Width = 33
          Height = 17
          Caption = '5'
          TabOrder = 4
        end
        object CBn6: TCheckBox
          Left = 177
          Top = 17
          Width = 28
          Height = 17
          Caption = '6'
          TabOrder = 5
        end
      end
      object SymFindGenerators: TCheckBox
        Left = 225
        Top = 440
        Width = 98
        Height = 17
        Caption = 'Find Generators'
        TabOrder = 3
      end
      object CBContinuous: TCheckBox
        Left = 225
        Top = 402
        Width = 82
        Height = 19
        Caption = 'Continuous'
        TabOrder = 4
      end
      object BRunSym: TButton
        Left = 235
        Top = 285
        Width = 89
        Height = 37
        Caption = 'Start Search'
        TabOrder = 2
        OnClick = BRunSymClick
      end
      object GroupBox11: TGroupBox
        Left = 1
        Top = 4
        Width = 209
        Height = 75
        Caption = 'Select one of the 33 Symmetry Types'
        TabOrder = 5
        object CbSymmetries: TComboBox
          Left = 8
          Top = 18
          Width = 193
          Height = 43
          Style = csOwnerDrawFixed
          DropDownCount = 5
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 37
          ParentFont = False
          TabOrder = 0
          OnChange = CbSymmetriesChange
          OnDrawItem = CbSymmetriesDrawItem
          Items.Strings = (
            'Oh'
            'O'
            'Td'
            'D3d'
            'Th '
            'C3v'
            'T'
            'D4h'
            'D3'
            'D4'
            'D2d (face)'
            'C4v'
            'C4h'
            'D2h (edge)'
            'D2d (edge)'
            'S6'
            'D2h (face)'
            'C2v (a1)'
            'C2v (b)'
            'C2h (b)'
            'D2 (edge)'
            'C4'
            'D2 (face)'
            'S4'
            'C2h (a)'
            'C2v (a2)'
            'C3'
            'Cs (b)'
            'C2 (b)'
            'C2 (a)'
            'Cs (a)'
            'Ci'
            'C1 (Identitiy)')
        end
      end
      object GBSymmetry: TGroupBox
        Left = 8
        Top = 276
        Width = 207
        Height = 55
        Caption = 'Symmetry/Antisymmetry'
        TabOrder = 6
        object CBExactSym: TCheckBox
          Left = 8
          Top = 14
          Width = 150
          Height = 17
          Caption = 'Exactly this symmetry'
          TabOrder = 0
        end
        object CBExactAsym: TCheckBox
          Left = 8
          Top = 32
          Width = 150
          Height = 17
          Caption = 'Exactly this antisymmetry'
          TabOrder = 1
        end
      end
      object GBPermutation: TGroupBox
        Left = 8
        Top = 380
        Width = 207
        Height = 76
        Caption = 'Permutation'
        TabOrder = 7
        object RBAll: TRadioButton
          Left = 71
          Top = 13
          Width = 68
          Height = 17
          Caption = 'Full Cube'
          Checked = True
          TabOrder = 0
          TabStop = True
        end
        object RBEdgesE: TRadioButton
          Left = 10
          Top = 33
          Width = 87
          Height = 17
          Caption = 'Edges Even'
          TabOrder = 1
        end
        object RBCornersE: TRadioButton
          Left = 111
          Top = 33
          Width = 92
          Height = 17
          Caption = 'Corners Even'
          TabOrder = 2
        end
        object RBEdgesO: TRadioButton
          Left = 10
          Top = 53
          Width = 84
          Height = 17
          Caption = 'Edges Odd'
          TabOrder = 3
          OnClick = RBEdgesOClick
        end
        object RBCornersO: TRadioButton
          Left = 111
          Top = 53
          Width = 87
          Height = 17
          Caption = 'Corners Odd'
          TabOrder = 4
          OnClick = RBCornersOClick
        end
      end
      object CBIsomorph: TCheckBox
        Left = 225
        Top = 421
        Width = 107
        Height = 16
        Caption = 'Allow Isomorphics'
        TabOrder = 8
        OnClick = CBIsomorphClick
      end
      object GroupBox10: TGroupBox
        Left = 214
        Top = 4
        Width = 119
        Height = 75
        Caption = 'Type Info'
        TabOrder = 9
        object Label8: TLabel
          Left = 3
          Top = 34
          Width = 23
          Height = 13
          Caption = 'Size:'
        end
        object LSymSize: TLabel
          Left = 29
          Top = 34
          Width = 3
          Height = 13
        end
        object Label9: TLabel
          Left = 3
          Top = 16
          Width = 56
          Height = 13
          Caption = 'Symmetries:'
        end
        object LSymN: TLabel
          Left = 63
          Top = 17
          Width = 3
          Height = 13
        end
      end
      object GroupBox12: TGroupBox
        Left = 224
        Top = 328
        Width = 111
        Height = 51
        Caption = 'Show'
        TabOrder = 10
        object RBSym: TRadioButton
          Left = 2
          Top = 13
          Width = 102
          Height = 17
          Caption = 'Symmetry Buttons'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = RBSymClick
        end
        object RBASym: TRadioButton
          Left = 2
          Top = 31
          Width = 105
          Height = 17
          Caption = 'AntiSymmetry Box'
          TabOrder = 1
          OnClick = RBASymClick
        end
      end
      object GBAntiSym: TGroupBox
        Left = 1
        Top = 82
        Width = 334
        Height = 193
        HelpContext = 1020
        Caption = 'Subgroup of Index 2'
        TabOrder = 11
        Visible = False
        object CBASy: TComboBox
          Left = 8
          Top = 18
          Width = 193
          Height = 43
          Style = csOwnerDrawFixed
          DropDownCount = 5
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 37
          ParentFont = False
          TabOrder = 0
          OnChange = CBASyChange
          OnDrawItem = CBASyDrawItem
        end
        object MemoAntisym: TMemo
          Left = 5
          Top = 81
          Width = 324
          Height = 91
          BevelKind = bkTile
          BevelOuter = bvNone
          Color = clBtnFace
          Lines.Strings = (
            'From the first ComboBox you select a Point Group G.'
            'With the lower ComboBox you select a subgroup H of index 2 in G.'
            'We search cubes c with the following properties:'
            '1. All elements of H are in the symmetry group of c.'
            '2. Applying any other  element of G to c gives the inverse of c.')
          TabOrder = 1
        end
      end
      object CBSelfInverse: TCheckBox
        Left = 225
        Top = 384
        Width = 93
        Height = 17
        Caption = 'No Selfinverse'
        TabOrder = 12
      end
    end
    object TabVideo: TTabSheet
      HelpContext = 1009
      Caption = 'Web Cam'
      ImageIndex = 3
      DesignSize = (
        336
        474)
      object Bevel4: TBevel
        Left = -8
        Top = 419
        Width = 336
        Height = 9
        Anchors = [akLeft, akTop, akRight]
        Shape = bsTopLine
      end
      object Bevel5: TBevel
        Left = 0
        Top = 352
        Width = 336
        Height = 15
        Anchors = [akLeft, akTop, akRight]
        Shape = bsTopLine
      end
      object Bevel10: TBevel
        Left = -15
        Top = 462
        Width = 351
        Height = 10
        Anchors = [akLeft, akTop, akRight]
        Shape = bsTopLine
      end
      object GroupBox5: TGroupBox
        Left = 9
        Top = 153
        Width = 310
        Height = 124
        Caption = 'Current Face To Scan'
        TabOrder = 0
        object ILeft: TImage
          Left = 49
          Top = 15
          Width = 44
          Height = 40
          Picture.Data = {
            07544269746D6170020E0000424D020E00000000000042000000280000002C00
            0000280000000100100003000000C00D0000C30E0000C30E0000000000000000
            0000007C0000E00300001F000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7F0000000000000000FF7F0000000000000000FF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7F0000FF7F0000FF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
            FF7F0000FF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7F000000000000000000000000000000000000000000000000000000000000
            000000000000FF7FFF7FFF7FFF7FFF7F0000000000000000FF7F0000FF7FFF7F
            0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000
            FF7FFF7FFF7FFF7F0000FF7FFF7F0000FF7F0000FF7FFF7F0000FF7F00000000
            0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F0000FF7F0000FF7F
            0000FF7FFF7F0000FF7F0000FF7FFF7F0000FF7F0000FF7F0000FF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7F0000FF7F000000000000FF7F0000000000000000
            FF7F0000000000000000FF7F000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7F00000000FF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000FF7F
            FF7FFF7F00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7F00000000
            00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7F00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000
            000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000FF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
            00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FDE7BFF7F
            FF7FFF7FFF7FFF7FFF7F00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000FF7FFF7FFF7FFF7FFF7F
            FF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FDE7BFF7FFF7FFF7FFF7FFF7F
            FF7FFF7F0000FF7FFF7FFF7F000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FDE7BFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000
            0000FF7F0000FF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FDE7BFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7F00000000FF7F
            FF7FFF7F0000FF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7F0000
            FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F9C73FF7F
            FF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7F0000FF7FFF7FFF7F0000FF7F
            FF7FFF7FFF7FFF7FFF7F00000000FF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7F
            FF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7F0000FF7F00000000FF7FFF7FFF7FFF7FFF7F000000000000
            000000000000000000000000000000000000000000000000000000000000FF7F
            FF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7F000039670000FF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7F
            FF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000396739670000
            FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7F0000FF7F
            FF7FFF7FFF7FFF7FFF7FFF7F000039673967396739670000FF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7F0000
            00000000396739673967396739670000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7F00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7F0000FF7FFF7FFF7F0000FF7F00000000000039673967396739673967
            3967396739670000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
            FF7FFF7F0000000039673967396739673967396739673967396739670000FF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FDE7BFF7F0000FF7F00003967
            39673967396739673967396739673967396739670000FF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FDE7BDE7BDE7B
            DE7BBD77BD77FF7FFF7FFF7FFF7FFF7FFF7F0000000039673967396739673967
            396739673967396700000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000000000000000
            0000000000000000000000000000396739673967396739673967396700000000
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7F00003967396739673967396739673967396739673967
            3967396739673967396739673967396739670000FF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7F000039673967396739673967396739673967396739673967396739673967
            39673967000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000039673967
            39673967396739673967396739673967396739670000000000000000FF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000396739673967396739670000
            000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7F000000000000000000000000FF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7F}
        end
        object IFront: TImage
          Left = 138
          Top = 18
          Width = 44
          Height = 40
          Picture.Data = {
            07544269746D6170020E0000424D020E00000000000042000000280000002C00
            0000280000000100100003000000C00D0000C30E0000C30E0000000000000000
            0000007C0000E00300001F000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7F0000000000000000FF7F0000000000000000FF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7F0000FF7F0000FF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
            FF7F0000FF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7F000000000000000000000000000000000000000000000000000000000000
            000000000000FF7FFF7FFF7FFF7FFF7F0000000000000000FF7F0000FF7FFF7F
            0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000
            FF7FFF7FFF7FFF7F0000FF7FFF7F0000FF7F0000FF7FFF7F0000FF7F00000000
            0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F0000FF7F0000FF7F
            0000FF7FFF7F0000FF7F0000FF7FFF7F0000FF7F0000FF7F0000FF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7F0000FF7F000000000000FF7F0000000000000000
            FF7F0000000000000000FF7F000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7F00000000FF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000FF7F
            FF7FFF7F00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7F00000000
            00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7F00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000
            000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000FF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
            00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FDE7BFF7F
            FF7FFF7FFF7FFF7FFF7F00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000FF7FFF7FFF7FFF7FFF7F
            FF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FDE7BFF7FFF7FFF7FFF7FFF7F
            FF7FFF7F0000FF7FFF7FFF7F000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FDE7BFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000
            0000FF7F0000FF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FDE7BFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7F00000000FF7F
            FF7FFF7F0000FF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7F0000
            FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F9C73FF7F
            FF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7F0000FF7FFF7FFF7F0000FF7F
            FF7FFF7FFF7FFF7FFF7F00000000FF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7F
            FF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7F0000FF7F00000000FF7FFF7FFF7FFF7FFF7F000000000000
            000000000000000000000000000000000000000000000000000000000000FF7F
            FF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7F000039670000FF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7F
            FF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000396739670000
            FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7F0000FF7F
            FF7FFF7FFF7FFF7FFF7FFF7F000039673967396739670000FF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7F0000
            00000000396739673967396739670000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7F00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7F0000FF7FFF7FFF7F0000FF7F00000000000039673967396739673967
            3967396739670000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
            FF7FFF7F0000000039673967396739673967396739673967396739670000FF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FDE7BFF7F0000FF7F00003967
            39673967396739673967396739673967396739670000FF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FDE7BDE7BDE7B
            DE7BBD77BD77FF7FFF7FFF7FFF7FFF7FFF7F0000000039673967396739673967
            396739673967396700000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000000000000000
            0000000000000000000000000000396739673967396739673967396700000000
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7F00003967396739673967396739673967396739673967
            3967396739673967396739673967396739670000FF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7F000039673967396739673967396739673967396739673967396739673967
            39673967000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000039673967
            39673967396739673967396739673967396739670000000000000000FF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000396739673967396739670000
            000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7F000000000000000000000000FF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7F}
        end
        object IRight: TImage
          Left = 226
          Top = 18
          Width = 44
          Height = 40
          Picture.Data = {
            07544269746D6170020E0000424D020E00000000000042000000280000002C00
            0000280000000100100003000000C00D0000C30E0000C30E0000000000000000
            0000007C0000E00300001F000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7F0000000000000000FF7F0000000000000000FF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7F0000FF7F0000FF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
            FF7F0000FF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7F000000000000000000000000000000000000000000000000000000000000
            000000000000FF7FFF7FFF7FFF7FFF7F0000000000000000FF7F0000FF7FFF7F
            0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000
            FF7FFF7FFF7FFF7F0000FF7FFF7F0000FF7F0000FF7FFF7F0000FF7F00000000
            0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F0000FF7F0000FF7F
            0000FF7FFF7F0000FF7F0000FF7FFF7F0000FF7F0000FF7F0000FF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7F0000FF7F000000000000FF7F0000000000000000
            FF7F0000000000000000FF7F000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7F00000000FF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000FF7F
            FF7FFF7F00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7F00000000
            00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7F00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000
            000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000FF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
            00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FDE7BFF7F
            FF7FFF7FFF7FFF7FFF7F00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000FF7FFF7FFF7FFF7FFF7F
            FF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FDE7BFF7FFF7FFF7FFF7FFF7F
            FF7FFF7F0000FF7FFF7FFF7F000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FDE7BFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000
            0000FF7F0000FF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FDE7BFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7F00000000FF7F
            FF7FFF7F0000FF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7F0000
            FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F9C73FF7F
            FF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7F0000FF7FFF7FFF7F0000FF7F
            FF7FFF7FFF7FFF7FFF7F00000000FF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7F
            FF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7F0000FF7F00000000FF7FFF7FFF7FFF7FFF7F000000000000
            000000000000000000000000000000000000000000000000000000000000FF7F
            FF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7F000039670000FF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7F
            FF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000396739670000
            FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7F0000FF7F
            FF7FFF7FFF7FFF7FFF7FFF7F000039673967396739670000FF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7F0000
            00000000396739673967396739670000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7F00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7F0000FF7FFF7FFF7F0000FF7F00000000000039673967396739673967
            3967396739670000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
            FF7FFF7F0000000039673967396739673967396739673967396739670000FF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FDE7BFF7F0000FF7F00003967
            39673967396739673967396739673967396739670000FF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FDE7BDE7BDE7B
            DE7BBD77BD77FF7FFF7FFF7FFF7FFF7FFF7F0000000039673967396739673967
            396739673967396700000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000000000000000
            0000000000000000000000000000396739673967396739673967396700000000
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7F00003967396739673967396739673967396739673967
            3967396739673967396739673967396739670000FF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7F000039673967396739673967396739673967396739673967396739673967
            39673967000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000039673967
            39673967396739673967396739673967396739670000000000000000FF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000396739673967396739670000
            000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7F000000000000000000000000FF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7F}
        end
        object IUp: TImage
          Left = 50
          Top = 69
          Width = 44
          Height = 40
          Picture.Data = {
            07544269746D6170020E0000424D020E00000000000042000000280000002C00
            0000280000000100100003000000C00D0000C30E0000C30E0000000000000000
            0000007C0000E00300001F000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000
            FF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F0000FF7FFF7F
            0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F0000FF7FFF7F0000FF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7F0000000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F
            0000000000000000FF7F0000FF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000FF7FFF7FFF7F
            FF7F0000000039673967396739670000FF7FFF7FFF7FFF7F0000FF7FFF7F0000
            FF7F0000FF7FFF7F0000FF7F000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7F0000FF7F00003967
            39673967396739670000FF7FFF7FFF7F0000FF7FFF7F0000FF7F0000FF7FFF7F
            0000FF7F0000FF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7F0000FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7F00003967396739673967
            39670000FF7FFF7F0000000000000000FF7F0000000000000000FF7F00000000
            0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7F
            FF7FFF7F0000FF7FFF7FFF7FFF7FFF7F396739673967396739670000FF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7F0000FF7F
            FF7FFF7FFF7FFF7F0000396739673967396739670000FF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7F
            FF7F0000396739673967396739670000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000FF7F
            FF7FFF7FFF7FFF7FFF7F0000000000000000000000000000FF7F000039673967
            3967396739670000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7F
            0000FF7FFF7FFF7FFF7FFF7FFF7F000000000000396739673967396739673967
            0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7F0000FF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7F
            FF7FFF7FFF7F0000FF7F00000000396739673967396739670000FF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F
            FF7FFF7F0000FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7F0000
            FF7FFF7F0000396739673967396739670000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7F00000000FF7F
            FF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7F0000
            39673967396739670000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7F0000FF7FFF7FFF7FFF7FFF7F0000
            FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7F0000396739673967
            39670000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7F0000FF7FFF7F0000FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7F
            FF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7F00003967396739670000FF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F
            0000FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
            FF7FFF7FFF7FFF7FFF7FFF7F0000396739670000FF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7F
            FF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7F
            FF7FFF7FFF7F000039670000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            0000FF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
            39670000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7F
            FF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000396739670000FF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000
            FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
            FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000396739670000FF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F0000FF7FFF7FFF7F
            FF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7F
            FF7FFF7FFF7F0000396739670000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7F0000FF7FFF7FFF7F0000FF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
            396739670000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7F0000FF7FFF7F0000FF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000396739670000FF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F
            FF7FFF7F0000FF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
            FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000396739670000FF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7F0000
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7F
            FF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000000000000000000000000000
            00000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7F0000FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F
            FF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000FF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7F0000
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7F0000FF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7F0000FF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7F00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
            0000000000000000000000000000000000000000000000000000000000000000
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7F}
        end
        object IDown: TImage
          Left = 138
          Top = 69
          Width = 44
          Height = 40
          Picture.Data = {
            07544269746D6170020E0000424D020E00000000000042000000280000002C00
            0000280000000100100003000000C00D0000C30E0000C30E0000000000000000
            0000007C0000E00300001F000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F0000000000000000
            FF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7F0000FF7F0000FF7FFF7F0000FF7F0000FF7FFF7F
            0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7F0000FF7F0000FF7FFF7F0000FF7F0000FF7FFF7F0000FF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
            000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7F0000FF7F
            0000000000000000FF7F0000FF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000FF7FFF7FFF7FFF7F0000
            000039673967396739670000FF7FFF7FFF7FFF7F0000FF7F0000FF7FFF7F0000
            FF7F0000FF7FFF7F0000FF7F000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7F0000FF7F0000396739673967
            396739670000FF7FFF7FFF7F0000FF7F0000FF7FFF7F0000FF7F0000FF7FFF7F
            0000FF7F0000FF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
            FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7F0000396739673967396739670000
            FF7FFF7F0000FF7F0000000000000000FF7F0000000000000000FF7F00000000
            0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7F
            0000FF7FFF7FFF7FFF7FFF7F396739673967396739670000FF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7F
            FF7FFF7F0000396739673967396739670000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7F0000FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
            396739673967396739670000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000FF7FFF7FFF7F
            FF7FFF7FFF7F0000000000000000000000000000FF7F00003967396739673967
            39670000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7F0000FF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7F0000FF7F
            FF7FFF7FFF7FFF7FFF7F0000000000003967396739673967396739670000FF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            0000FF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7F
            FF7F0000FF7F00000000396739673967396739670000FF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7F
            0000FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7F
            0000396739673967396739670000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7F00000000FF7FFF7FFF7F
            FF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7F000039673967
            396739670000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7F0000FF7FFF7F0000FF7FFF7FFF7FFF7FFF7F0000FF7FFF7F
            FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7F000039673967396739670000
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            0000FF7FFF7F0000FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7F
            FF7F0000FF7FFF7FFF7FFF7FFF7F00003967396739670000FF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F0000FF7F
            FF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7F
            FF7FFF7FFF7FFF7F0000396739670000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7F
            0000000000000000FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7F
            FF7F000039670000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F
            FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F000039670000
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7F
            FF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000396739670000FF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000FF7FFF7F
            FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7F
            FF7FFF7FFF7FFF7FFF7F0000396739670000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F0000FF7FFF7FFF7FFF7FFF7F
            0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7F
            FF7F0000396739670000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7F0000FF7FFF7F0000FF7FFF7FFF7F0000FF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F000039673967
            0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            0000FF7FFF7F0000FF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000396739670000FF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7F
            0000FF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7F
            FF7FFF7FFF7FFF7FFF7F0000396739670000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7F0000FF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7F
            FF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7F000000000000000000000000000000000000000000000000
            000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
            FF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7F
            FF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000FF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7F0000FF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7F0000FF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            00000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000
            00000000000000000000000000000000000000000000000000000000FF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
            FF7FFF7FFF7FFF7FFF7FFF7FFF7F}
        end
        object RbB: TRadioButton
          Tag = 5
          Left = 9
          Top = 29
          Width = 30
          Height = 17
          Caption = 'B'
          Checked = True
          Enabled = False
          TabOrder = 1
          TabStop = True
          OnClick = RbFaceClick
        end
        object RbL: TRadioButton
          Tag = 4
          Left = 96
          Top = 30
          Width = 28
          Height = 17
          Caption = 'L'
          Enabled = False
          TabOrder = 2
          OnClick = RbFaceClick
        end
        object RbF: TRadioButton
          Tag = 2
          Left = 184
          Top = 31
          Width = 29
          Height = 17
          Caption = 'F'
          Enabled = False
          TabOrder = 3
          OnClick = RbFaceClick
        end
        object RbR: TRadioButton
          Tag = 1
          Left = 272
          Top = 31
          Width = 30
          Height = 18
          Caption = 'R'
          Enabled = False
          TabOrder = 4
          OnClick = RbFaceClick
        end
        object RbU: TRadioButton
          Left = 95
          Top = 81
          Width = 30
          Height = 17
          Caption = 'U'
          Enabled = False
          TabOrder = 5
          OnClick = RbFaceClick
        end
        object RbD: TRadioButton
          Tag = 3
          Left = 184
          Top = 81
          Width = 31
          Height = 17
          Caption = 'D'
          Enabled = False
          TabOrder = 6
          OnClick = RbFaceClick
        end
        object BScan: TButton
          Left = 225
          Top = 66
          Width = 75
          Height = 50
          Caption = 'Scan'
          Enabled = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = BScanClick
        end
      end
      object DisplayGroupBox: TGroupBox
        Left = 201
        Top = 8
        Width = 127
        Height = 47
        Caption = 'Display'
        TabOrder = 1
        object RbHue: TRadioButton
          Left = 5
          Top = 22
          Width = 40
          Height = 17
          Caption = 'Hue'
          Checked = True
          Enabled = False
          TabOrder = 0
          TabStop = True
        end
        object RbSat: TRadioButton
          Left = 45
          Top = 22
          Width = 38
          Height = 17
          Caption = 'Sat'
          Enabled = False
          TabOrder = 1
        end
        object RbVal: TRadioButton
          Left = 85
          Top = 23
          Width = 37
          Height = 17
          Caption = 'Val'
          Enabled = False
          TabOrder = 2
        end
      end
      object BTransferCam: TButton
        Left = 16
        Top = 294
        Width = 137
        Height = 37
        Caption = 'Solve Scanned Cube'
        Enabled = False
        TabOrder = 2
        OnClick = BTransferCamClick
      end
      object GroupBox7: TGroupBox
        Left = 7
        Top = 8
        Width = 186
        Height = 143
        Caption = 'Recognition Parameters'
        TabOrder = 3
        object GroupBox13: TGroupBox
          Left = 9
          Top = 15
          Width = 169
          Height = 79
          Caption = 'Upper Hue Treshhold'
          TabOrder = 0
          object LOrange: TLabel
            Left = 4
            Top = 22
            Width = 38
            Height = 13
            Caption = 'Orange:'
            Enabled = False
          end
          object LYellow: TLabel
            Left = 85
            Top = 22
            Width = 34
            Height = 13
            Caption = 'Yellow:'
            Enabled = False
          end
          object LGreen: TLabel
            Left = 4
            Top = 54
            Width = 32
            Height = 13
            Caption = 'Green:'
            Enabled = False
          end
          object LBlue: TLabel
            Left = 85
            Top = 54
            Width = 24
            Height = 13
            Caption = 'Blue:'
            Enabled = False
          end
          object ETreshOrange: TEdit
            Left = 46
            Top = 18
            Width = 26
            Height = 21
            Enabled = False
            TabOrder = 0
            Text = '20'
            OnChange = ETreshOrangeChange
          end
          object ETreshYellow: TEdit
            Left = 122
            Top = 18
            Width = 26
            Height = 21
            Enabled = False
            TabOrder = 1
            Text = '60'
            OnChange = ETreshYellowChange
          end
          object ETreshGreen: TEdit
            Left = 46
            Top = 50
            Width = 26
            Height = 21
            Enabled = False
            TabOrder = 2
            Text = '125'
            OnChange = ETreshGreenChange
          end
          object ETreshBlue: TEdit
            Left = 122
            Top = 50
            Width = 26
            Height = 21
            Enabled = False
            TabOrder = 3
            Text = '220'
            OnChange = ETreshBlueChange
          end
        end
        object RODistance: TGroupBox
          Left = 9
          Top = 98
          Width = 170
          Height = 38
          Caption = 'Red-Orange Distance'
          TabOrder = 1
          Visible = False
          object HueSep: TRadioButton
            Left = 3
            Top = 17
            Width = 73
            Height = 17
            Caption = 'Hue based'
            Checked = True
            TabOrder = 0
            TabStop = True
          end
          object ValSep: TRadioButton
            Left = 80
            Top = 17
            Width = 83
            Height = 17
            Caption = 'Value based'
            TabOrder = 1
          end
        end
        object SampleNumber: TGroupBox
          Left = 9
          Top = 98
          Width = 170
          Height = 38
          Caption = 'Number of Samples'
          TabOrder = 2
          object sampleRed: TLabel
            Left = 8
            Top = 18
            Width = 23
            Height = 13
            Caption = 'Red:'
          end
          object sampleOrange: TLabel
            Left = 47
            Top = 17
            Width = 38
            Height = 13
            Caption = 'Orange:'
          end
          object Button1: TButton
            Left = 110
            Top = 13
            Width = 51
            Height = 18
            Caption = 'Clear'
            TabOrder = 0
            OnClick = Button1Click
          end
        end
      end
      object GroupBox9: TGroupBox
        Left = 5
        Top = 357
        Width = 324
        Height = 54
        Caption = 'Capture Devices'
        TabOrder = 4
        object CapDevs: TComboBox
          Left = 11
          Top = 19
          Width = 305
          Height = 21
          ItemHeight = 0
          TabOrder = 0
          OnChange = CapDevsChange
        end
      end
      object CapConfig: TButton
        Left = 16
        Top = 429
        Width = 153
        Height = 25
        Caption = 'Capture Device Configuration'
        Enabled = False
        TabOrder = 5
        OnClick = CapConfigClick
      end
      object CapFormat: TButton
        Left = 184
        Top = 429
        Width = 145
        Height = 25
        Caption = 'Capture Format'
        Enabled = False
        TabOrder = 6
        OnClick = CapFormatClick
      end
      object BRyanHeise: TButton
        Left = 24
        Top = 331
        Width = 121
        Height = 25
        Caption = 'Virtual Cube Solver'
        TabOrder = 7
        Visible = False
        OnClick = BRyanHeiseClick
      end
      object GroupBox15: TGroupBox
        Left = 201
        Top = 69
        Width = 127
        Height = 57
        Caption = 'Recognition Mode'
        TabOrder = 8
        object RBAutomatic: TRadioButton
          Left = 9
          Top = 16
          Width = 79
          Height = 17
          Caption = 'Automatic'
          TabOrder = 0
          OnClick = RBAutomaticClick
        end
        object RBInteractive: TRadioButton
          Left = 9
          Top = 34
          Width = 111
          Height = 17
          Caption = 'Interactive'
          Checked = True
          TabOrder = 1
          TabStop = True
          OnClick = RBInteractiveClick
        end
        object CBPatternRec: TCheckBox
          Left = 10
          Top = 56
          Width = 108
          Height = 17
          Caption = 'Find Facelets'
          TabOrder = 2
        end
      end
      object GBPreview: TGroupBox
        Left = 160
        Top = 279
        Width = 161
        Height = 69
        Caption = 'Scan Preview'
        TabOrder = 9
        object prevBox: TPaintBox
          Left = 24
          Top = 15
          Width = 76
          Height = 49
          OnPaint = prevBoxPaint
        end
        object Button2: TButton
          Left = 99
          Top = 39
          Width = 51
          Height = 22
          Caption = 'Clear'
          TabOrder = 0
          OnClick = Button2Click
        end
      end
    end
  end
  object SbVert: TScrollBar
    Left = 488
    Top = -2
    Width = 16
    Height = 467
    Kind = sbVertical
    Max = 1000000
    PageSize = 0
    TabOrder = 1
    TabStop = False
    OnChange = SbVertChange
    OnScroll = SbVertScroll
  end
  object SbHor: TScrollBar
    Left = 21
    Top = 464
    Width = 460
    Height = 16
    PageSize = 0
    TabOrder = 2
    TabStop = False
    OnScroll = SbHorScroll
  end
  object Panel1: TPanel
    Left = 40
    Top = 40
    Width = 417
    Height = 393
    BevelOuter = bvLowered
    Color = clWindow
    TabOrder = 3
    object OutPut: TPaintBox
      Left = 1
      Top = 1
      Width = 415
      Height = 352
      Align = alTop
      PopupMenu = PopupMenu1
      OnMouseDown = OutPutMouseDown
      OnPaint = OutputPaint
    end
  end
  object ColorDialog: TColorDialog
    Ctl3D = True
    Options = [cdFullOpen]
    Left = 9
  end
  object MainMenu1: TMainMenu
    Left = 56
    object File1: TMenuItem
      Caption = '&File'
      HelpContext = 1008
      OnClick = File1Click
      object LoadWorkspace1: TMenuItem
        Caption = '&Load Maneuvers...'
        OnClick = LoadWorkspace1Click
      end
      object SaveWorkspace1: TMenuItem
        Caption = '&Save Maneuvers...'
        OnClick = SaveWorkspace1Click
      end
      object SaveasHtml1: TMenuItem
        Caption = 'Save as HTML..'
        OnClick = SaveasHtml1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object PrinterSetup1: TMenuItem
        Caption = 'Printer Setup...'
        OnClick = PrinterSetup1Click
      end
      object PrintMainWindow: TMenuItem
        Caption = 'Print All Cubes'
        OnClick = PrintMainWindowClick
      end
      object PrintSelectedCubes: TMenuItem
        Caption = 'Print Selected Cubes'
        OnClick = PrintMainWindowClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = 'Exit'
        ShortCut = 32856
        OnClick = Exit1Click
      end
    end
    object Edit1: TMenuItem
      Caption = 'Edit'
      HelpContext = 1008
      OnClick = Edit1Click
      object DeleteselectedCubes2: TMenuItem
        Caption = 'Delete selected Cubes'
        OnClick = DeleteselectedCubes1Click
      end
      object N18: TMenuItem
        Caption = '-'
      end
      object ArrangeSelected: TMenuItem
        Caption = 'Arrange Selected Symmetric Cubes'
        OnClick = ArrangeSelectedClick
      end
      object AddSymmetryInfoforSelected: TMenuItem
        Caption = 'Add Symmetry Info for Selected Cubes'
        OnClick = AddSymmetryInfoforSelectedClick
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object AddRandomCubes1: TMenuItem
        Caption = 'Add Random Cubes...'
        OnClick = AddRandomCubes1Click
      end
      object AddAllInverses: TMenuItem
        Caption = 'Add all Nonisomorphic Inverse Cubes'
        OnClick = AddAllInversesClick
      end
      object N22: TMenuItem
        Caption = '-'
      end
      object WCAscramble: TMenuItem
        Caption = 'Generate WCA Scramble'
        OnClick = WCAscrambleClick
      end
      object N21: TMenuItem
        Caption = '-'
      end
      object SortCubesbyPatternName: TMenuItem
        Caption = 'Sort Cubes by Pattern Name'
        OnClick = SortCubesbyPatternNameClick
      end
      object SortCubesbyManeuverLength: TMenuItem
        Caption = 'Sort Cubes by Maneuver Length'
        OnClick = SortCubesbyPatternNameClick
      end
      object SortCubesbyCubeID: TMenuItem
        Caption = 'Sort Cubes by Cube ID'
        OnClick = SortCubesbyPatternNameClick
      end
      object N12: TMenuItem
        Caption = '-'
      end
      object ClearMainWindow2: TMenuItem
        Caption = 'Clear Main Window'
        OnClick = ClearMainWindow1Click
      end
      object ExpandFirstCube: TMenuItem
        Caption = 'Expand First Cube'
        OnClick = ExpandFirstCubeClick
      end
    end
    object TMenuRun: TMenuItem
      Caption = 'Run'
      OnClick = Edit1Click
      object StartSearchforSelectedCubes: TMenuItem
        Caption = 'Start Search for Selected Cubes...'
        OnClick = StartSearchforSelectedCubesClick
      end
      object StopSearchForSelectedCubes: TMenuItem
        Caption = 'Stop Search for Selected Cubes'
        OnClick = StopSearchforSelectedCubesClick
      end
      object N10: TMenuItem
        Caption = '-'
      end
      object MaximumNumber1: TMenuItem
        Caption = 'Define Maximum Number of Autorun Threads...'
        OnClick = MaximumNumber1Click
      end
      object StartAutorunforTFS: TMenuItem
        Caption = 'Start Autorun for Two-Phase-Solver'
        OnClick = StartAutorunforTFSClick
      end
      object StartAutomodusforOptimalSolver1: TMenuItem
        Caption = 'Start Autorun for Optimal Solver'
        OnClick = StartAutomodusforOptimalSolver1Click
      end
      object N14: TMenuItem
        Caption = '-'
      end
    end
    object Options1: TMenuItem
      Caption = '&Options'
      HelpContext = 1005
      OnClick = Options1Click
      object AllowSliceMoves1: TMenuItem
        Caption = 'Allow Slice Moves'
        OnClick = AllowSliceMoves1Click
      end
      object N23: TMenuItem
        Caption = '-'
      end
      object TwoPhaseAlgorithm1: TMenuItem
        Caption = 'Two-Phase-Algorithm...'
        OnClick = TwoPhaseAlgorithm1Click
      end
      object HugeSolver: TMenuItem
        Caption = 'Huge Optimal Solver...'
        Enabled = False
        OnClick = HugeSolverClick
      end
      object WebServer1: TMenuItem
        Caption = 'Web Server...'
        Enabled = False
        OnClick = WebServer1Click
      end
      object N13: TMenuItem
        Caption = '-'
      end
      object FreeThreadsonTerminate1: TMenuItem
        Caption = 'Free Threads immediately'
        OnClick = FreeThreadsonTerminate1Click
      end
      object N16: TMenuItem
        Caption = '-'
      end
      object IgnoreIsoOnLoad: TMenuItem
        Caption = 'Skip Isomorphics when Loading from File'
        OnClick = IgnoreIsoOnLoadClick
      end
      object IsoInvInclude: TMenuItem
        Caption = 'Isomorphy Includes Inversion'
        OnClick = IgnoreIsoOnLoadClick
      end
      object N20: TMenuItem
        Caption = '-'
      end
      object FixCenterFacelets: TMenuItem
        Caption = 'Use Center Facelet Twists'
        OnClick = FixCenterFaceletsClick
      end
      object EditCenters: TMenuItem
        Caption = 'Edit Center Facelet Twists'
        Enabled = False
        OnClick = EditCentersClick
      end
      object N15: TMenuItem
        Caption = '-'
      end
      object GenerateStatistics1: TMenuItem
        Caption = 'Generate Statistics'
        OnClick = GenerateStatistics1Click
      end
    end
    object Help1: TMenuItem
      Caption = '&Help'
      HelpContext = 1008
      object Contents1: TMenuItem
        Caption = '&Contents'
        OnClick = Contents1Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object About1: TMenuItem
        Caption = '&About...'
        HelpContext = 1007
        OnClick = About1Click
      end
    end
  end
  object SDWorkSpace: TSaveDialog
    DefaultExt = 'txt'
    Filter = 'Maneuver Textfile (*.txt)|*.txt'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 96
  end
  object ODWorkspace: TOpenDialog
    DefaultExt = 'qex'
    Filter = 'Maneuver Textfile (*.txt)|*.txt|All files (*.*)|*.*'
    Left = 136
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 184
    object DeleteselectedCubes1: TMenuItem
      Caption = 'Delete selected Cubes'
      Enabled = False
      OnClick = DeleteselectedCubes1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object StartSearchforSelectedCubes1: TMenuItem
      Caption = 'Start Search for Selected Cubes...'
      Enabled = False
      OnClick = StartSearchforSelectedCubesClick
    end
    object StopSearchforSelectedCubes1: TMenuItem
      Caption = 'Stop Search for Selected Cubes'
      Enabled = False
      OnClick = StopSearchforSelectedCubesClick
    end
    object N19: TMenuItem
      Caption = '-'
    end
    object ArrangeSelected1: TMenuItem
      Caption = 'Arrange Selected Symmetric Cubes'
      OnClick = ArrangeSelectedClick
    end
    object AddSymmetryInfoforSelected1: TMenuItem
      Caption = 'Add Symmetry Info for Selected Cubes'
      OnClick = AddSymmetryInfoforSelectedClick
    end
    object N11: TMenuItem
      Caption = '-'
    end
    object ClearMainWindow1: TMenuItem
      Caption = 'Clear Main Window'
      OnClick = ClearMainWindow1Click
    end
  end
  object CubePopupMenu: TPopupMenu
    OnPopup = CubePopupMenuPopup
    Left = 224
    object rotUD: TMenuItem
      Caption = 'Rotate 1/4 about UD-axis'
      OnClick = rotUDClick
    end
    object RotURF: TMenuItem
      Caption = 'Rotate 1/3 about URF-corner'
      OnClick = RotURFClick
    end
    object RotFB: TMenuItem
      Caption = 'Rotate 1/2 about FB-axis'
      OnClick = RotFBClick
    end
    object RefRL: TMenuItem
      Caption = 'Reflect at RL-plane'
      OnClick = RefRLClick
    end
    object Invert1: TMenuItem
      Caption = 'Invert Permutation'
      OnClick = InvertClick
    end
    object Multiply: TMenuItem
      Caption = 'Multiply with Facelet Editor Cube'
      OnClick = MultiplyClick
    end
    object MultiplyInverse: TMenuItem
      Caption = 'Multiply with Inverse of Facelet Editor Cube'
      OnClick = MultiplyInverseClick
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object CopySolverToClipboard: TMenuItem
      Caption = 'Copy Solver to Clipboard'
      OnClick = CopySolverToClipboardClick
    end
    object CopyGeneratortoClipboard: TMenuItem
      Caption = 'Copy Generator to Clipboard'
      OnClick = CopyGeneratortoClipboardClick
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object RemoveCube1: TMenuItem
      Caption = 'Remove Cube'
      OnClick = RemoveCube1Click
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object TransferCubetoFaceletEditor1: TMenuItem
      Caption = 'Transfer Cube to Facelet Editor'
      OnClick = TransferCubetoFaceletEditor1Click
    end
    object MTransferSym: TMenuItem
      Caption = 'Transfer Symmetry to Symmetry Editor'
      OnClick = MTransferSymClick
    end
  end
  object PrinterSetupDialog: TPrinterSetupDialog
    Left = 272
  end
  object SaveHtml: TSaveDialog
    DefaultExt = 'htm'
    Filter = 'Html File (*.html)|*.html'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 319
    Top = 2
  end
  object TimerBlink: TTimer
    Enabled = False
    Interval = 100
    OnTimer = TimerBlinkTimer
    Left = 360
  end
  object ServerSocket1: TServerSocket
    Active = False
    Port = 8080
    ServerType = stThreadBlocking
    ThreadCacheSize = 40
    OnGetThread = ServerSocket1GetThread
    OnClientError = ServerSocket1ClientError
    Left = 400
  end
  object TimerWatchDog: TTimer
    Enabled = False
    OnTimer = TimerWatchDogTimer
    Left = 440
  end
  object ClientSocket1: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Host = '127.0.0.1'
    Port = 0
    OnError = ClientSocket1Error
    Left = 8
    Top = 48
  end
  object ImageList1: TImageList
    Height = 37
    Width = 37
    Left = 8
    Top = 88
    Bitmap = {
      494C010123002700040025002500FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000094000000720100000100200000000000A057
      0300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      FF0000000000FF00FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF00FF00FF00FF0000000000FF00FF00FF00FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF00FF00FF00
      FF0000000000FF00FF00FF00FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF00FF00FF00FF0000000000FF00FF00FF00FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      FF0000000000FF00FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF00000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000000000000000000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000000000000000FF00FF0000000000FF00FF000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF00000000000000000000000000FF00
      FF00FF00FF0000000000FF00FF00FF00FF000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000000000000000FF00FF00FF00FF0000000000FF00FF00FF00
      FF0000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF0000000000000000000000000000000000000000000000000000000000FF00
      FF00FF00FF0000000000FF00FF00FF00FF000000000000000000000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF0000000000FF00FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FF000000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000FF000000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FF000000FF000000FF
      000000FF000000FF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000FF000000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FF000000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF00000000000000FF000000FF000000FF0000000000000000000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF0000000000000000000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000FF000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000FF000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000FF00000000000000FF000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF0000000000000000000000FF000000
      FF000000000000000000000000000000FF000000FF0000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000000000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000FF000000000000000000FF00FF0000000000FF00FF000000
      0000000000000000FF000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000000000000000000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF00FF0000000000FF00FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000000000000000FF00
      FF00FF00FF0000000000FF00FF00FF00FF0000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF00FF00FF00
      FF0000000000FF00FF00FF00FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000000000000000FF00FF00FF00FF0000000000FF00FF00FF00
      FF0000000000000000000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF0000000000000000000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF0000000000000000000000FF000000FF000000FF00000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      00000000000000000000FF00FF00FF00FF0000000000FF00FF00FF00FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF00000000000000FF000000FF000000FF00000000000000000000000000FF00
      FF00FF00FF0000000000FF00FF00FF00FF000000000000000000000000000000
      FF000000FF000000FF00000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000FF00FF00FF00
      FF0000000000FF00FF00FF00FF00000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF00000000000000000000000000000000000000FF000000
      000000000000000000000000000000000000FF00FF0000000000FF00FF000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000FF00FF0000000000FF00FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000FF000000FF000000FF000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000FF000000FF000000FF000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF00000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF00000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF00000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF00000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF00000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000FF00FF0000000000FF00FF0000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF0000000000000000000000FF000000FF000000
      FF0000000000000000000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      FF0000000000FF00FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF00000000000000000000000000FF00FF00FF00FF0000000000FF00FF00FF00
      FF000000000000000000000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      0000FF00FF00FF00FF0000000000FF00FF00FF00FF0000000000000000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF00FF00FF00FF0000000000FF00FF00FF00FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000000000000000000000000000000000000000FF00
      FF00FF00FF0000000000FF00FF00FF00FF000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF0000000000000000000000FF000000FF000000
      000000000000000000000000000000000000FF00FF00FF00FF0000000000FF00
      FF00FF00FF0000000000000000000000000000000000000000000000FF000000
      FF0000000000000000000000FF000000FF000000FF0000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF00FF00FF00
      FF0000000000FF00FF00FF00FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000FF00FF00FF00FF0000000000FF00FF00FF00
      FF00000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000FF00FF00FF00FF0000000000FF00FF00FF00FF0000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF00FF00FF00FF0000000000FF00FF00FF00FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF00FF0000000000FF00FF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000000000000000000000000000
      00000000000000000000000000000000000000000000FF00FF0000000000FF00
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF000000FF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FF000000FF000000FF000000FF000000FF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FF000000FF
      000000FF000000FF000000FF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FF000000FF000000FF000000FF000000FF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF000000FF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000FFFF0000FFFF0000FFFF0000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF0000FFFF0000FFFF0000FFFF0000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000FF000000FF000000FF000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF0000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF0000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      00000000000000000000000000000000000000FF000000FF000000FF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF000000FF000000FF000000FF00000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      000000000000000000000000000000FF000000FF000000FF000000FF000000FF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF000000FF000000FF000000FF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF000000FF000000FF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF0000000000FF000000FF000000FF000000000000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF000000FF0000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000FF000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF00FF000000FF000000FF000000FF000000FF0000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF000000FF0000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00FF000000FF000000FF000000000000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FF000000FF000000FF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FF000000FF000000FF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FF000000FF000000FF000000FF000000FF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FF000000FF000000FF
      000000FF000000FF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF000000FF000000FF000000FF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000FF000000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FF000000FF000000FF000000FF000000FF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FF000000FF000000FF
      000000FF000000FF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FF000000FF000000FF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FF000000FF000000FF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FF000000FF000000FF0000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000FF000000FF000000FF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FF000000FF000000FF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF000000FF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FF000000FF
      000000FF000000FF000000FF00000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      000000FF000000FF000000FF000000FF000000FF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000FF000000FF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FF000000FF000000FF000000FF000000FF00000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FF000000FF000000FF000000FF000000FF00000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF0000000000000000000000000000FF000000FF000000FF000000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FF000000FF000000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FF000000FF
      000000FF000000FF000000FF0000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FF000000FF
      000000FF000000FF000000FF00000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      000000FF000000FF000000FF000000FF000000FF000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000FF000000FF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FF000000FF000000FF000000FF000000FF00000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FF000000FF000000FF0000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      00000000FF00000000000000FF00000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000FF000000FF000000FF
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FF000000FF000000FF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF000000FF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF00000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF0000000000000000000000FF000000FF000000000000000000000000000000
      FF000000FF0000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      0000000000000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF0000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF00000000000000
      0000FF00FF0000000000FF00FF0000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      FF000000FF000000FF0000000000000000000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000000000000000FF00FF00FF00FF0000000000FF00FF00FF00
      FF0000000000000000000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      FF000000000000000000FF00FF00FF00FF0000000000FF00FF00FF00FF000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000000000000000FF00
      FF00FF00FF0000000000FF00FF00FF00FF0000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      FF000000FF000000FF000000FF000000FF000000000000000000FF00FF00FF00
      FF0000000000FF00FF00FF00FF0000000000000000000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF00000000000000FF000000FF000000
      FF00000000000000000000000000FF00FF00FF00FF0000000000FF00FF00FF00
      FF000000000000000000000000000000FF000000FF000000FF00000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000FF000000FF000000FF000000
      00000000000000000000FF00FF00FF00FF0000000000FF00FF00FF00FF000000
      000000000000000000000000FF000000FF000000FF00000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      000000FF000000FF000000FF0000000000000000000000000000000000000000
      00000000FF00000000000000000000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF0000FF000000FF000000FF
      00000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FF000000FF000000FF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF00000000000000
      0000000000000000FF000000000000000000000000000000000000000000FF00
      FF0000000000FF00FF0000000000000000000000000000000000000000000000
      FF000000000000000000000000000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      000000000000000000000000000000FF000000FF000000FF000000FF000000FF
      0000000000000000000000000000000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FF000000FF000000FF000000FF000000FF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FF000000FF000000FF
      000000FF000000FF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000000000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000000000000000000000000000000000FF
      000000FF000000FF000000FF000000FF00000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF000000FF000000FF000000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000FF000000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      000000000000000000000000000000FF000000FF000000FF000000FF000000FF
      0000000000000000000000000000000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FF000000FF000000FF000000FF000000FF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FF000000FF000000FF
      000000FF000000FF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      000000FF000000FF000000FF0000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FF000000FF000000FF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FF000000FF000000FF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FF000000FF000000FF0000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      00000000FF000000FF000000FF0000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000FF000000FF000000FF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FF000000FF000000FF
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF000000FF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF0000000000FF00
      0000FF000000FF00000000000000000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FF000000FF
      000000FF000000FF000000FF0000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      000000FF000000FF000000FF000000FF000000FF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000FF000000FF000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000FF000000FF000000FF000000FF000000FF00000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF000000FF000000FF000000FF0000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FF000000FF000000FF000000FF000000FF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      00000000000000000000000000000000000000FF000000FF000000FF000000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FF000000FF000000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      000000000000000000000000000000000000000000000000000000FF000000FF
      000000FF000000FF000000FF0000000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF00FF000000FF00
      0000FF000000FF000000FF0000000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FF000000FF
      000000FF000000FF000000FF0000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      000000FF000000FF000000FF000000FF000000FF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000FF000000FF000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000FF000000FF000000FF000000FF000000FF00000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF000000FF000000FF000000FF0000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FF000000FF000000FF0000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      00000000FF000000FF000000FF0000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000FF000000FF000000FF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FF000000FF000000FF
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF000000FF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF00FF00
      0000FF000000FF00000000000000000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FF000000FF000000FF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FF000000FF000000FF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FF000000FF000000FF000000FF000000FF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FF000000FF000000FF
      000000FF000000FF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF000000FF000000FF000000FF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000FF000000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FF000000FF000000FF000000FF000000FF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FF000000FF000000FF
      000000FF000000FF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FF000000FF000000FF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FF000000FF000000FF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF000000FF000000FF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000FF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FF000000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF000000FF000000FF000000FF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF000000FF000000FF000000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000FF000000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FF000000FF000000FF000000FF000000FF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FF000000FF000000FF000000FF000000FF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FF000000FF000000FF
      000000FF000000FF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000000000000000000000000000000000FF
      000000FF000000FF000000FF000000FF00000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000000000000000000000000000000000FF000000FF000000FF000000FF
      000000FF00000000000000000000000000000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000FF000000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      FF000000000000000000000000000000000000FF000000FF000000FF00000000
      FF0000000000000000000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      00000000000000FF000000FF000000FF00000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FF000000FF
      000000FF00000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      FF000000000000000000000000000000FF0000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000000000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF000000FF0000000000000000FF000000FF000000FF000000FF000000
      FF000000000000000000000000000000FF000000000000000000000000000000
      00000000FF00000000000000FF000000FF000000FF000000FF000000FF000000
      00000000000000FF000000FF000000FF00000000000000000000000000000000
      00000000000000000000000000000000000000FF000000FF000000FF00000000
      00000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF00000000000000000000FF000000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000FF00000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      000000000000000000000000000000FF000000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FF000000FF000000FF000000FF000000FF00000000
      00000000FF000000FF000000FF000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      FF000000FF000000FF00000000000000000000FF000000FF000000FF000000FF
      000000FF000000000000000000000000000000000000000000000000000000FF
      000000FF000000FF000000FF000000FF0000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      00000000000000FF000000FF000000FF000000FF000000FF0000000000000000
      00000000000000000000000000000000000000FF000000FF000000FF000000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      00000000FF0000000000000000000000000000000000000000000000FF000000
      000000000000000000000000000000000000000000000000000000FF000000FF
      000000FF000000FF000000FF0000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FF000000FF
      000000FF000000FF000000FF0000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000FF000000FF000000FF000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      000000FF000000FF000000FF000000FF000000FF000000000000000000000000
      000000000000000000000000000000FF000000FF000000FF000000FF000000FF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000FF000000FF000000FF
      000000FF000000FF000000000000000000000000000000000000000000000000
      000000FF000000FF000000FF000000FF000000FF000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000FF000000FF000000FF000000FF000000FF00000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FF000000FF000000FF000000FF000000FF00000000
      000000000000000000000000000000000000000000000000FF00000000000000
      FF000000FF000000FF000000FF000000FF00000000000000FF00000000000000
      00000000000000000000000000000000000000FF000000FF000000FF000000FF
      000000FF000000000000000000000000000000000000000000000000000000FF
      000000FF000000FF000000FF000000FF00000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000FF000000FF000000FF0000000000000000
      00000000000000000000000000000000000000FF000000FF000000FF000000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      FF0000000000000000000000000000000000000000000000000000FF000000FF
      000000FF000000FF000000FF0000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF000000FF00000000FF000000FF000000000000000000000000000000
      00000000FF0000000000000000000000FF000000FF000000FF000000FF000000
      FF0000000000000000000000FF00000000000000000000000000000000000000
      FF000000FF0000FF000000FF000000FF00000000000000000000000000000000
      00000000000000000000000000000000000000FF000000FF000000FF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      000000000000000000000000000000000000000000000000000000FF000000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000FF00000000FF000000FF00000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      0000000000000000FF000000FF0000FF000000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF00FF000000FF000000FF0000000000FF0000000000000000000000
      FF000000FF000000FF000000FF000000FF0000000000000000000000FF00FF00
      0000FF000000FF0000000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF0000000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF00000000000000000000000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF0000FFFF0000FFFF0000FFFF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF0000FFFF0000FFFF0000FFFF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF0000000000000000000000000000000000FF000000FF000000FF000000
      00000000000000000000FF000000FF000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF000000FF000000FF000000000000000000
      0000000000000000FF000000FF000000FF00000000000000000000000000FF00
      0000FF000000FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      0000000000000000000000000000FF00FF0000000000FF00FF00000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000FF000000FF0000000000000000000000FF00
      FF00FF00FF0000000000FF00FF00FF00FF000000000000000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000FF00FF00FF00
      FF0000000000FF00FF00FF00FF000000000000000000000000000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000000000000000FF000000FF000000FF000000FF00
      0000FF0000000000000000000000FF00FF00FF00FF0000000000FF00FF00FF00
      FF000000000000000000FF000000FF000000FF000000FF000000FF0000000000
      0000000000000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      000000000000FF000000FF000000FF000000FF000000FF000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF00000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000000000000000FF00FF00FF00FF0000000000FF00FF00FF00FF000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      000000000000FF000000FF000000FF000000000000000000FF0000000000FF00
      FF00FF00FF0000000000FF00FF00FF00FF00000000000000FF0000000000FF00
      0000FF000000FF00000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000000000000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF0000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000FFFF00000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      FF000000000000FFFF0000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000FF0000000000FF00FF00FF00
      FF0000000000FF00FF00FF00FF00000000000000FF0000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF0000000000000000000000FF00000000000000
      000000000000000000000000FF000000FF0000FF000000FF000000FF00000000
      FF000000FF00000000000000000000000000000000000000FF00000000000000
      00000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000FF00000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000FF000000FF0000FF000000FF
      000000FF00000000FF000000FF00000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000FF000000FF0000FF000000FF000000FF00000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      00000000FF0000000000000000000000000000000000000000000000000000FF
      000000FF000000FF000000FF000000FF00000000000000000000000000000000
      000000000000000000000000FF00000000000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000000000000000000000000000
      00000000000000000000000000000000000000FF000000FF000000FF000000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000000000000000000000000000
      00000000000000FF000000FF000000FF000000FF000000FF0000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF00000000000000
      000000000000000000000000000000000000000000000000000000FF000000FF
      000000FF000000FF000000FF0000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000FF000000FF000000FF000000
      FF0000000000000000000000000000FF000000FF000000FF000000FF000000FF
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      000000FF000000FF000000FF000000FF000000FF000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000FF000000FF000000FF
      000000FF000000FF000000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000FF000000FF000000FF000000FF000000FF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF00000000000000000000FF
      000000FF000000FF000000FF000000FF00000000000000000000000000000000
      FF000000FF000000FF00000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF00000000000000000000FF000000FF000000FF000000FF
      000000FF00000000000000000000000000000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000FF000000FF000000FF0000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FF000000FF
      000000FF000000FF000000FF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF00000000000000FF000000FF000000FF000000
      FF000000FF0000000000000000000000000000FF000000FF000000FF00000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      00000000000000FF000000FF000000FF00000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      000000000000000000000000000000000000000000000000000000FF000000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FF000000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      00000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      0000000000000000FF00000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF000000FF00000000000000000000000000000000FF000000FF000000
      FF0000000000000000000000000000000000FF000000FF000000FF0000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      00000000FF0000FF000000FF000000FF00000000000000000000000000000000
      00000000000000000000000000000000000000FF000000FF000000FF00000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      000000000000FF000000FF000000FF0000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF00000000000000000000FF000000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000FF00000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF0000FF000000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FF000000FF000000FF000000FF000000FF00000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF0000000000000000000000000000000000
      FF000000FF000000FF00000000000000000000FF000000FF000000FF000000FF
      000000FF000000000000000000000000000000000000000000000000000000FF
      000000FF000000FF000000FF000000FF00000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF0000000000000000000000000000000000FF000000FF000000FF000000
      00000000000000FF000000FF000000FF000000FF000000FF0000000000000000
      00000000000000000000000000000000000000FF000000FF000000FF000000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      000000000000000000000000000000000000000000000000000000FF000000FF
      000000FF000000FF000000FF0000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FF000000FF
      000000FF000000FF000000FF00000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00FF000000FF000000FF000000FF000000FF00
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF0000FF000000FF000000FF000000FF000000FF000000000000000000000000
      000000000000000000000000000000FF000000FF000000FF000000FF000000FF
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000FF000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000FF000000FF000000FF
      000000FF000000FF000000000000000000000000000000000000000000000000
      000000FF000000FF000000FF000000FF000000FF00000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0000FF000000FF000000FF000000FF000000FF00000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FF000000FF000000FF000000FF000000FF00000000
      000000000000000000000000FF000000FF000000FF000000000000000000FF00
      0000FF000000FF000000FF000000FF000000000000000000FF000000FF000000
      FF000000000000000000000000000000000000FF000000FF000000FF000000FF
      000000FF000000000000000000000000000000000000000000000000000000FF
      000000FF000000FF000000FF000000FF00000000000000000000000000000000
      FF000000FF000000FF000000000000000000FF000000FF000000FF000000FF00
      0000FF000000000000000000FF000000FF000000FF0000000000000000000000
      00000000000000FF000000FF000000FF000000FF000000FF0000000000000000
      00000000000000000000000000000000000000FF000000FF000000FF000000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      000000000000000000000000000000000000000000000000000000FF000000FF
      000000FF000000FF000000FF0000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000000000000000000000000000
      00000000FF000000000000000000000000000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF000000FF00000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000000000000000FF000000FF000000FF0000000000
      00000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      00000000000000FF000000FF000000FF00000000000000000000000000000000
      00000000000000000000000000000000000000FF000000FF000000FF00000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      000000000000FF000000FF000000FF000000000000000000FF000000FF000000
      FF000000FF000000FF000000000000000000000000000000000000FF000000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000FF00000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FF000000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000FF0000000000000000000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000FF0000000000000000000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      00000000FF0000000000000000000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF00000000000000000000FF000000FF000000FF00000000
      00000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      00000000000000FF000000FF000000FF0000000000000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FF000000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000FF0000000000000000000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF00000000000000000000FF
      000000FF000000FF000000FF000000FF0000000000000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF00000000000000000000FF000000FF000000FF000000FF
      000000FF0000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000FF000000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000000000000000000000000000
      00000000FF000000000000000000000000000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FF000000FF000000FF000000FF000000FF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FF000000FF000000FF000000FF000000FF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FF000000FF000000FF
      000000FF000000FF000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF000000FF000000FF000000FF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF000000FF000000FF000000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000FF000000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF000000FF000000FF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000FF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FF000000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000094000000720100000100010000000000E81C00000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF
      FFFE000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFE000000000000FFFFFFFF
      FFFFFFFFFFFFFFFFFFFE000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFE0000
      00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFE000000000000FFFF1FFFFFFFF8FF
      FFFFFFC7FFFE000000000000FFFCA7FFFFFFE53FFFFFFF29FFFE000000000000
      FFF3B9FFFFFF9DCFFFFFFCEE7FFE000000000000FFCFBE7FFFFE7DF3FFFFF3EF
      9FFE000000000000FF3FBF9FFFF8FDFCFFFFCFEFE7FE000000000000FCFFBFE7
      FFE6FDFF3FFF3FEFF9FE000000000000F3FFBFF9FF9EFDFFCFFCFFEFFE7E0000
      00000000F7FFBFFDFFBEFDFFEFFDFFEFFF7E000000000000F7FFBFFDFFBEFDFF
      EFFDFFEFFF7E000000000000F7FFBFFDFFBEFDFFEFFDFFEFFF7E000000000000
      F7FFBFFDFFBEFDFFEFFDFFEFFF7E000000000000F7FFBFFDFFBEFDFFEFFDFFEF
      FF7E000000000000F7FFBFFDFFBEFDFFEFFDFFEFFF7E000000000000F7FFBFFD
      FFBEFDFFEFFDFFEFFF7E000000000000F7FFBFFDFFBEFDFFEFFDFFEFFF7E0000
      00000000F7FFBFFDFFBEFDFFEFFDFFEFFF7E000000000000F7FF1FFDFFBEF8FF
      EFFDFFC7FF7E000000000000F7FCE7FDFFBEE73FEFFDFF29FF7E000000000000
      F7F3F9FDFFBE9FCFEFFDFCEE7F7E000000000000F7CFFE7DFFBE3FF3EFFDF3EF
      9F7E000000000000F73FFF9DFFB9CFFCEFFDCFEFE77E000000000000F4FFFFE5
      FFA7F3FF2FFD3FEFF97E000000000000F3FFFFF9FF9FFCFFCFFCFFEFFE7E0000
      00000000FCFFFFE7FFE7FF3F3FFF3FEFF9FE000000000000FF3FFF9FFFF9FFCC
      FFFFCFEFE7FE000000000000FFCFFE7FFFFE7FF3FFFFF3EF9FFE000000000000
      FFF3F9FFFFFF9FCFFFFFFCEE7FFE000000000000FFFCE7FFFFFFE73FFFFFFF29
      FFFE000000000000FFFF1FFFFFFFF8FFFFFFFFC7FFFE000000000000FFFFFFFF
      FFFFFFFFFFFFFFFFFFFE000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFE0000
      00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFE000000000000FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFF1FFF
      FFFFF8FFFFFFFFC7FFFFFFFE3FFFF000FFFCA7FFFFFFE53FFFFFFF29FFFFFFF9
      4FFFF000FFF3B9FFFFFF9DCFFFFFFCEE7FFFFFE773FFF000FFCFBE7FFFFE7DF3
      FFFFF3EF9FFFFF9F7CFFF000FF3FBF9FFFF9FDFCFFFFCFEFE7FFFE7F7F3FF000
      FCFFBFE7FFE7FDFF3FFF3FEFF9FFF9FF7FCFF000F3FFBFF9FF9FFDFFCFFCFFEF
      FE7FE7FF7FF3F000F7FFBFFDFFBFFDFFEFFDFFEFFF7FEFFF7FFBF000F7FFBFFD
      FFBFFDFFEFFDFFC7FF7FEFFF7FFBF000F7FFBFFDFFBFFDFFEFFDFF29FF7FEFFF
      7FFBF000F7FFBFFDFFBFFDFFEFFDFCEE7F7FEFFE3FFBF000F7FFBFFDFFBFFDFF
      EFFDF3EF9F7FEFFC1FFBF000E3FFBFF8FFBFFDFFEFFDCFEFE77FEFFC1FFBF000
      C1FFBFF07FBFFDFFEFFD3FEFF97FEFFC1FFBF000C1FFBFF07FBFFDFFEFFCFFEF
      FE7FEFFE3FFBF000C1FFBFF07FBFFDFFEFFDFFEFFF7FEFFF7FFBF000E3FF1FF8
      FFBFF8FFEFFDFFC7FF7FEFFE3FFBF000F7FCE7FDFFBFE73FEFFDFF39FF7FEFF9
      CFFBF000F7F3F9FDFFBF9FCFEFFDFCFE7F7FEFE7F3FBF000F7CFFE7DFFBE7FF3
      EFFDF3FF9F7FEF9FFCFBF000F73FFF9DFFB9F8FCEFFDCFFFE77FEE7FFF3BF000
      F4FFFFE5FFA7F07F2FFD3FFFF97FE9FFFFCBF000F3FFFFF9FF9FF07FCFFCFFFF
      FE7FE7FFFFF3F000FCFFFFE7FFE7F07F3FFF3FFFF9FFF9FFFFCFF000FF3FFF9F
      FFF9F8FCFFFFCFFFE7FFFE7FFF3FF000FFCFFE7FFFFE7FF3FFFFF3FF9FFFFF9F
      FCFFF000FFF3F9FFFFFF9FCFFFFFFCFE7FFFFFE7F3FFF000FFFCE7FFFFFFE73F
      FFFFFF39FFFFFFF9CFFFF000FFFF1FFFFFFFF8FFFFFFFFC7FFFFFFFE3FFFF000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000
      FFFF1FFFFFFFF8FFFFFFFFC7FFFFFFFE3FFFF000FFFCA7FFFFFFE53FFFFFFF29
      FFFFFFF94FFFF000FFF3B9FFFFFF9DCFFFFFFCEE7FFFFFE773FFF000FFCFBE7F
      FFFE7DF3FFFFF3EF9FFFFF9F7CFFF000FF3FBF9FFFF8FDF8FFFFCFEFE7FFFE7F
      7F3FF000FCFFBFE7FFE6FDFB3FFF3FEFF9FFF9FF7FCFF000F3FFBFF9FF9EFDFB
      CFFCFFEFFE7FE7FF7FF3F000F7FFBFFDFFBEFDFBEFFDFFEFFF7FEFFF7FFBF000
      F7FF1FFDFFBEFDFBEFFDFFEFFF7FEFFF7FFBF000F7FCA7FDFFBEFDFBEFFDFFEF
      FF7FEFFF7FFBF000F7F319FDFFBEFDFBEFFDFFEFFF7FEFFF7FFBF000F7CE0E7D
      FFBEFDFBEFFDFFEFFF7FEFFF7FFBF000F73E0F9DFFBEFDFBEFFDFFEFFF7FEFFF
      7FFBF000F4FE0FE5FFBEFDFBEFFDFFEFFF7FEFFF7FFBF000F3FF1FF9FFBEFDFB
      EFFDFFC7FF7FEFFF7FFBF000F7FFBFFDFFBEFDFBEFFDFF83FF7FEFFF7FFBF000
      F7FF1FFDFFBEF8FBEFFDFF83FF7FEFFE3FFBF000F7FCE7FDFFBEE73BEFFDFF01
      FF7FEFF9CFFBF000F7F3F9FDFFBE9FCBEFFDFCC67F7FEFE7F3FBF000F7CFFE7D
      FFBE3FF3EFFDF3FF9F7FEF9FFCFBF000F73F1F9DFFB9C8CCEFFDCFFFE77FEE7F
      FF3BF000F4FE0FE5FFA7F03F2FFD3FFFF97FE9FFFFCBF000F3FE0FF9FF9FF07F
      CFFCFFFFFE7FE0000003F000FCFE0FE7FFE7F03F3FFF3FFFF9FFF9FFFFCFF000
      FF3F1F9FFFF9E0CCFFFFCFFFE7FFFE7FFF3FF000FFCFFE7FFFFE1FF3FFFFF3FF
      9FFFFF9FFCFFF000FFF3F9FFFFFF9FCFFFFFFCFE7FFFFFE7F3FFF000FFFCE7FF
      FFFFE73FFFFFFF39FFFFFFF9CFFFF000FFFF1FFFFFFFF8FFFFFFFFC7FFFFFFFE
      3FFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFF000FFFF1FFFFFFFF8FFFFFFFFC7FFFFFFFE3FFFF000FFFCA7FFFFFFE53F
      FFFFFF29FFFFFFF94FFFF000FFF3B9FFFFFF9DCFFFFFFCEE7FFFFFE773FFF000
      FFCFBE7FFFFE7DF3FFFFF3EF9FFFFF9F7CFFF000FF3FBF9FFFF9FDFCFFFFCFEF
      E7FFFE7F7F3FF000FCFFBFE7FFE7FDFF3FFF3FEFF9FFF9FF7FCFF000F3FF1FF9
      FF9FFDFFCFFCFFEFFE7FE7FF7FF3F000F7FE0FFDFFBFFDFFEFFDFFEFFF7FEFFF
      7FFBF000F7FE0FFDFFBFFDFFEFFDFFEFFF7FEFFF7FFBF000F7FE0FFDFFBFFDFF
      EFFDE3EF8F7FEFFF7FFBF000F7FF1FFDFFBFFDFFEFFDC1EF077FEFFF7FFBF000
      F7FFBFFDFFBFFDFFEFFDC1EF077FEFFF7FFBF000E3FFBFF8FFBFFDFFEFFDC1EF
      077FEFFF7FFBF000C1FFBFF07FBFFDFFEFF5E3EF8F7FEFFF7FFBF000C1FFBFF0
      7FBFFDFFEFF5FFEFFF7FEFFF7FFBF000C1FFBFF07FBFFDFFEFF5FFEFFF7FEFFF
      7FFBF000E3FF1FF8FFBFF8FFEFFDFFC7FF7FEFFE3FFBF000F7FCE7FDFFBFE73F
      EFFDFF39FF7FEFF9CFFBF000F7F3F9FDFFBF9FCFEFFDFCFE7F7FEFE7F3FBF000
      F7CFFE7DFFBE7FF3EFFDF3FF9F7FEF9FFCFBF000F73F1F9DFFB9F8FCEFFDCFC7
      E77FEE7E3F3BF000F4FE0FE5FFA7F07F2FFD3F83F97FE9FC1FCBF000F3FE0FF9
      FF9FF07FCFFCFF83FE7FE7FC1FF3F000FCFE0FE7FFE7F07F3FFF3F83F9FFF9FC
      1FCFF000FF3F1F9FFFF9F8FCFFFFCFC7E7FFFE7E3F3FF000FFCFFE7FFFFE7FF3
      FFFFF3FF9FFFFF9FFCFFF000FFF3F9FFFFFF9FCFFFFFFCFE7FFFFFE7F3FFF000
      FFFCE7FFFFFFE73FFFFFFF39FFFFFFF9CFFFF000FFFF1FFFFFFFF8FFFFFFFFC7
      FFFFFFFE3FFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF000FFFF1FFFFFFFF8FFFFFFFFC7FFFFFFFE3FFFF000FFFCA7FF
      FFFFE53FFFFFFF29FFFFFFF94FFFF000FFF3B9FFFFFF9DCFFFFFFCEE7FFFFFE7
      73FFF000FFCFBE7FFFFE7DF3FFFFF3EF9FFFFF9F7CFFF000FF1FBF1FFFF9FDFC
      FFFFCFEFE7FFFE7F7F3FF000FCDFBF67FFE7FDFF3FFF3FEFF9FFF9FF7FCFF000
      F3DFBF79FF9FFDFFCFFCFFEFFE7FE7FF7FF3F000F7DFBF7DFFBFFDFFEFFDFFEF
      FF7FEFFF7FFBF000F7DF1F7DFFBFFDFFEFFDFFC7FF7FEFFF7FFBF000F78CA63D
      FFBFFDFFEFFDFF29FF7FEFFF7FFBF000F703181DFFBFFDFFEFFDFCEE7F7FEFFE
      3FFBF000F7060C1DFFBFFDFFEFFDF3EF9F7FEFFC1FFBF000F7060C1DFFBFFDFF
      EFF8CFEFE63FC7FC1FF1F000F48E0E25FFBFFDFFEFF03FEFF81F83FC1FE0F000
      F3DF1F79FFBFFDFFEFF07FEFFC1F83FE3FE0F000F7DFBF7DFFBFFDFFEFF07FEF
      FC1F83FF7FE0F000F7DF1F7DFFBFF8FFEFF8FFC7FE3FC7FE3FF1F000F7DCE77D
      FFBFE53FEFFDFF39FF7FEFF94FFBF000F7D3F97DFFBF9DCFEFFDFCFE7F7FEFE7
      73FBF000F7C7FE7DFFBE7DF3EFFDF3FF9F7FEF9F7CFBF000F739199DFFB9F8FC
      EFFDCFFFE77FEE7F7F3BF000F4FE07E5FFA7F07F2FFD3FFFF97FE9FF7FCBF000
      F3FE0FF9FF8000000FFC0000007FE7FF7FF3F000FCFE07E7FFE7F07F3FFF3FFF
      F9FFF9FF7FCFF000FF39199FFFF9F8FCFFFFCFFFE7FFFE7F7F3FF000FFC7FE7F
      FFFE7DF3FFFFF3FF9FFFFF9F7CFFF000FFF3F9FFFFFF9DCFFFFFFCFE7FFFFFE7
      73FFF000FFFCE7FFFFFFE53FFFFFFF39FFFFFFF94FFFF000FFFF1FFFFFFFF8FF
      FFFFFFC7FFFFFFFE3FFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFF000FFFF1FFFFFFFF8FFFFFFFFC7FFFFFFFE3FFFF000
      FFFCA7FFFFFFE53FFFFFFF29FFFFFFF94FFFF000FFF3B9FFFFFF9DCFFFFFFCEE
      7FFFFFE773FFF000FFCFBE7FFFFE7DF3FFFFF3EF9FFFFF9F7CFFF000FF3FBF9F
      FFF9FDFCFFFFC7EFC7FFFE7F7F3FF000FCFFBFE7FFE7FDFF3FFF37EFD9FFF9FF
      7FCFF000F3FFBFF9FF9FF8FFCFFCF7C7DE7FE7FF7FF3F000F7FFBFFDFFBFF07F
      EFFDF783DF7FEFFF7FFBF000F7FF1FFDFFBFF07FEFFDF783DF7FEFFF7FFBF000
      F7FCA7FDFFBFE03FEFFDF783DF7FEFFF7FFBF000F7F319FDFFBF98CFEFFDF7C7
      DF7FEFFE3FFBF000F7CE0E7DFFBE7073EFFDF7EFDF7FEFFC1FFBF000F73E0F9D
      FF19F07CC7F8F7EFDE3FEFFC1FFBF000F4FE0FE5FF07F07F03F077EFDC1FEFFC
      1FFBF000F3FF1FF9FF0FF8FF83F077EFDC1FEFFE3FFBF000F7FFBFFDFF0FFDFF
      83F077EFDC1FEFFC1FFBF000F7FF1FFDFF1FF8FFC7F8F7C7DE3FEFFC1FFBF000
      F7FCE7FDFFBFE53FEFFDF739DF7FEFF80FFBF000F7F3F9FDFFBF9DCFEFFDF4FE
      5F7FEFE633FBF000F7CFFE7DFFBE7DF3EFFDF1FF9F7FEF9FFCFBF000F73F1F9D
      FFB9F8FCEFFDCE46677FEE7FFF3BF000F4FE0FE5FFA7F07F2FFD3F81F97FE9FF
      FFCBF000F3FE0FF9FF8000000FFCFF83FE7FE7FFFFF3F000FCFE0FE7FFE7F07F
      3FFF3F81F9FFF9FFFFCFF000FF3F1F9FFFF9F8FCFFFFCF0667FFFE7FFF3FF000
      FFCFFE7FFFFE7DF3FFFFF0FF9FFFFF9FFCFFF000FFF3F9FFFFFF9DCFFFFFFCFE
      7FFFFFE7F3FFF000FFFCE7FFFFFFE53FFFFFFF39FFFFFFF9CFFFF000FFFF1FFF
      FFFFF8FFFFFFFFC7FFFFFFFE3FFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFF1FFFFFFFF8FFFFFFFFC7FFFFFFFE
      3FFFF000FF1CA63FFFFFE53FFFFFFF29FFFFFFF94FFFF000FE03B81FFFFF9DCF
      FFFFFCEE7FFFFFE773FFF000FE0FBC1FFFFE7DF3FFFFF3EF9FFFFF9F7CFFF000
      FE0FBC1FFFF9FDFCFFFFCFEFE7FFFE3F7E3FF000FC1FBE27FFE7FDFF3FFF3FEF
      F9FFF9BF7ECFF000F3FFBFF9FF9FF8FFCFFCFFEFFE7FE7BF7EF3F000F7FFBFFD
      FFBFF07FEFFDFFEFFF7FEFBF7EFBF000F7FFBFFDFFBFF07FEFFDFFEFFF7FEFBF
      7EFBF000F7FFBFFDFFBC7071EFFDE3EF8F7FEFBF7EFBF000F7FFBFFDFFB838E0
      EFFDC1EF077FEFBF7EFBF000F7FFBFFDFFB83DE0EFFDC1EF077FEFBF7EFBF000
      E3FFBFF8FF183DE0C7FDC1EF077FEFBF7EFBF000C1FFBFF07F0C7DF183FDE3EF
      8F7FEFBF7EFBF000C1FF1FF07F0FFDFF83FDFFEFFF7FEFBF7EFBF000C1FE0FF0
      7F0FFDFF83FDFFEFFF7FEFBF7EFBF000E3FE0FF8FF1FF8FFC7FDFFC7FF7FEFBE
      3EFBF000F7FC07FDFFBFE73FEFFDFF29FF7FEFB94EFBF000F7F319FDFFBF9FCF
      EFFDFCEE7F7FEFA772FBF000F7CFFE7DFFBE7FF3EFFDF3EF9F7FEF8F7CFBF000
      F73FFF9DFFB9F8FCEFFDCFC7E77FEE72333BF000F4FFFFE5FFA7F07F2FFD3F83
      F97FE9FC0FCBF000F3FFFFF9FF9FF07FCFFC0000007FE0000003F000FCC7F8E7
      FFE7F07F3FFF3F83F9FFF9FC0FCFF000FF03F01FFFF9F8FCFFFFCFC7E7FFFE78
      333FF000FF83F07FFFFE7FF3FFFFF3EF9FFFFF877CFFF000FF83F07FFFFF9FCF
      FFFFFCEE7FFFFFE773FFF000FFC4E0FFFFFFE73FFFFFFF29FFFFFFF94FFFF000
      FFFF1FFFFFFFF8FFFFFFFFC7FFFFFFFE3FFFF000FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFF000FFFF1FFFFFFFFFFFFFFFFFC7FFFFFFFFFFFFF000
      FFFE0FFFFFFFFFFFFFFFFF83FFFFFFFFFFFFF000FFFE0FFFFFFFF8FFFFFFFF83
      FFFFFFFE3FFFF000FFFC07FFFFFFE53FFFFFFF01FFFFFFF94FFFF000FFF319FF
      FFFF9DCFFFFFFCC67FFFFFE773FFF000FFCFBE7FFFFE7DF3FFFFF3EF9FFFFF9F
      7CFFF000E31FBF18FFF9FDFCFFF8CFEFE63FFE3F7E3FF000C0DFBF607FE7FDFF
      3FF83FEFF81FB9BF7ECFF000C1DFBF707F9FFDFFCFF87FEFFC1FA7BE3EF3F000
      C1DFBF707F9FFDFFCFF87FEFFC1FAFBC1EFBF000E3DF1F78FFA7FDFF2FF8FFEF
      FE3FEFBC1EFBF000F78CA63DFFBBFDFEEFFDE3EF8F7FEF180C7BF000F703181D
      FFBDFDFDEFFDC1EF077FEE06303BF000F7060C1DFFBE7DF3EFFDC1EF077FEE0C
      183BF000F7060C1DFFBFBDEFEFFDC1EF077FC60C1831F000F48E0E25FFBFDDDF
      EFF5E3EF8F7FC11C1C40F000F3DF1F79FFBFE03FEFF5FFC7FF7FC3BE3EE0F000
      F7DE0F7DFFBFF07FEFF5FF83FF7FC3BF7EE0F000F7DE0F7DFFBFF07FEFFDFF83
      FF7FC7BE3EF1F000F7DC077DFFBFE03FEFFDFF01FF7FEFB94EFBF000F7D3197D
      FFBF98CFEFFDFCC67F7FEFA772FBF000F7C7FE7DFFBE7DF3EFFDF3FF9F7FEF8F
      7CFBF000E3391998FFB9FDFCEFF8CFC7E63FEE72333BF000C0FE07E07FA7FDFF
      2FF83F83F81FA9FC0FCBF000C1FE0FF07F9FFDFFCFF87F83FC1FA0000003F000
      C0FE07E07FE7FDFF3FF83F83F81FB9FC0FCFF000E3391998FFF9FDFCFFF8CFC7
      E63FFE78333FF000FFC7FE7FFFFE7DF3FFFFF3FF9FFFFF877CFFF000FFF319FF
      FFFF9DCFFFFFFCC67FFFFFE773FFF000FFFC07FFFFFFE53FFFFFFF01FFFFFFF9
      4FFFF000FFFE0FFFFFFFF8FFFFFFFF83FFFFFFFE3FFFF000FFFE0FFFFFFFFFFF
      FFFFFF83FFFFFFFFFFFFF000FFFF1FFFFFFFFFFFFFFFFFC7FFFFFFFFFFFFF000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFF1FFFFFFFF8FFFFFFFFC7FFFFFFFF
      FFFFF000FFFE0FFFFFFFF07FFFFFFF83FFFFFFFFFFFFF000FFFE0FFFFFFFF07F
      FFFFFF83FFFFFFFE3FFFF000FF1C063FFFF8E031FFFFFF01FFFFFE394C7FF000
      FE03081FFFF018C0FFFFFCC27FFFFC07703FF000FE0EAC1FFFF07DE0FFFFF3AB
      9FFFFC1F783FF000E20EB418FF107DE0C7F8CFADE63FFC1F783FF000C01DB620
      7E00FDF103F03F6DF81FB83F7C4FF000C1FB1BF07E0FF8FF83F07EEEFC1FA7FF
      7FF3F000C1FA0BF07E0FF07F83F07EEEFC1FA7FF7FF3F000E0F60DE0FF1FF07F
      C7F83DEF783FE9FF7FCBF000F7060C1DFFBC7071EFFDC1EF077FEEFF7FBBF000
      F7071C1DFFB838E0EFFDC1EF077FEF7E3F7BF000F7060C1DFFB83DE0EFFDC1EF
      077FEF9C1CFBF000E3060C18FF183DE0C7FDC1EF077FC7EC1BF1F000C18A0A30
      7F0C7DF183FDE2EE8F7FC3F417E0F000C1BC07B07F0FF8FF83FDEF01EF7FC3F8
      0FE0F000C17E0FD07F0FF07F83FDDF83F77FC3FC1FE0F000E30E0FD8FF1C707F
      C7FDDF83F77FC7FC1FF1F000F604062DFFB82031EFFDBF01FB7FEFF80FFBF000
      F503180DFFB818C0EFFD7CC67B7FEFE633FBF000F507BC15FFB83FE0EFFD73EF
      9D7FEF9F7CFBF000E30F1C10FF1878E0C7F8CFC7E43FEE7F7F3BF000C0FE0E20
      7E07F07103F03F83F81FA9FF7FCBF000C00000007E0FF07F83F00000001FA7FF
      7FF3F000C0C608E07E06304703F03F83F81FB98F71CFF000E3031018FF181880
      C7F8CFC7E63FFE07603FF000FF83B07FFFFC1F83FFFFF3EF9FFFFF0760FFF000
      FF83107FFFFC1883FFFFFCC67FFFFF0760FFF000FFC400FFFFFE2007FFFFFF01
      FFFFFF8941FFF000FFFE0FFFFFFFF07FFFFFFF83FFFFFFFE3FFFF000FFFE0FFF
      FFFFF07FFFFFFF83FFFFFFFFFFFFF000FFFF1FFFFFFFF8FFFFFFFFC7FFFFFFFF
      FFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000
      0000000000000000000000000000}
  end
  object ApplySymPopUp: TPopupMenu
    OnPopup = ApplySymPopUpPopup
    Left = 8
    Top = 128
    object MIApplySymToSel: TMenuItem
      Caption = 'Apply Symmetry to selected Cubes'
      OnClick = MIApplySymToSelClick
    end
    object N9: TMenuItem
      Caption = '-'
    end
    object MIUseAsAntiSymmetry: TMenuItem
      Caption = 'Use as AntiSymmetry'
      OnClick = MIUseAsAntiSymmetryClick
    end
  end
  object BatchTimer: TTimer
    Tag = -1
    Enabled = False
    Interval = 5000
    OnTimer = BatchTimerTimer
    Left = 456
    Top = 56
  end
  object FilterGraph: TFilterGraph
    Mode = gmCapture
    GraphEdit = True
    LinearVolume = True
    Left = 8
    Top = 168
  end
  object SampleGrabber: TSampleGrabber
    OnBuffer = SampleGrabberBuffer
    FilterGraph = FilterGraph
    MediaType.data = {
      7669647300001000800000AA00389B717DEB36E44F52CE119F530020AF0BA770
      FFFFFFFF0000000001000000809F580556C3CE11BF0100AA0055595A00000000
      0000000000000000}
    Left = 8
    Top = 208
  end
  object Filter: TFilter
    BaseFilter.data = {00000000}
    FilterGraph = FilterGraph
    Left = 8
    Top = 248
  end
end
