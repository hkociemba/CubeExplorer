unit WebCam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DSPack, CubeDefs, Menus;

type
  TCaptureForm = class(TForm)
    VideoWindow: TVideoWindow;
    PopupMenu1: TPopupMenu;
    red1: TMenuItem;
    orange1: TMenuItem;
    procedure FormPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure redClick(Sender: TObject);
    procedure orangeClick(Sender: TObject);

  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  CaptureForm: TCaptureForm;
      faceValue,scanValue,faceHue,scanHue,faceSaturation,scanSaturation,
      faceBlueRel,scanBlueRel:array[U1..B9] of Integer;
    fRed,fGreen,fBlue:Real;



implementation

uses RubikMain;

{$R *.dfm}

procedure TCaptureForm.FormPaint(Sender: TObject);
begin
  Canvas.Draw(0,0,bmap);
end;

procedure TCaptureForm.FormCreate(Sender: TObject);
begin
  doublebuffered:=true
end;

procedure TCaptureForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
Form1.FilterGraph.Stop;
Form1.FilterGraph.Active := false;
Form1.CapDevs.ItemIndex:=-1;
Form1.CapFormat.Enabled:=false;
Form1.CapConfig.Enabled:=false;
Form1.BScan.Enabled:=false;
Form1.RbU.Enabled:=false;Form1.RbR.Enabled:=false;Form1.RbF.Enabled:=false;
Form1.RbD.Enabled:=false;Form1.RbL.Enabled:=false;Form1.RbB.Enabled:=false;
end;

procedure TCaptureForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key=88)  then
   if not (ssCtrl in Shift) then inc(xDist) else dec(Xdist)
 else if (Key=89)  then
   if not (ssCtrl in Shift) then inc(yDist) else dec(yDist);
 if xDist<-9 then xDist:=-9 else if xDist>9 then xDist:=9;
 if yDist<-7 then yDist:=-7 else if yDist>7 then yDist:=7;
end;

procedure TCaptureForm.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 if Button=mbRight then
   begin capXPos:=x; capYPos:=y; end;
end;

procedure TCaptureForm.redClick(Sender: TObject);
begin
  redRequest:=true;
end;


procedure TCaptureForm.orangeClick(Sender: TObject);
begin
  orangeRequest:=true;
end;

end.





