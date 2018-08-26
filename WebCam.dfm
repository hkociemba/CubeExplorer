object CaptureForm: TCaptureForm
  Left = 525
  Top = 579
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Webcam'
  ClientHeight = 228
  ClientWidth = 289
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnMouseDown = FormMouseDown
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object VideoWindow: TVideoWindow
    Left = 992
    Top = 496
    Width = 81
    Height = 81
    FilterGraph = Form1.FilterGraph
    VMROptions.Mode = vmrWindowed
    Color = clBlack
  end
  object PopupMenu1: TPopupMenu
    Left = 104
    Top = 16
    object red1: TMenuItem
      Caption = 'Red Sample'
      OnClick = redClick
    end
    object orange1: TMenuItem
      Caption = 'Orange Sample'
      OnClick = orangeClick
    end
  end
end
