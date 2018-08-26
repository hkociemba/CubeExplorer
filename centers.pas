unit centers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TCenterDlg = class(TForm)
    Button1: TButton;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    GroupBox2: TGroupBox;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    GroupBox3: TGroupBox;
    RadioButton9: TRadioButton;
    RadioButton10: TRadioButton;
    RadioButton11: TRadioButton;
    RadioButton12: TRadioButton;
    GroupBox4: TGroupBox;
    RadioButton13: TRadioButton;
    RadioButton14: TRadioButton;
    RadioButton15: TRadioButton;
    RadioButton16: TRadioButton;
    GroupBox5: TGroupBox;
    RadioButton17: TRadioButton;
    RadioButton18: TRadioButton;
    RadioButton19: TRadioButton;
    RadioButton20: TRadioButton;
    GroupBox6: TGroupBox;
    RadioButton21: TRadioButton;
    RadioButton22: TRadioButton;
    RadioButton23: TRadioButton;
    RadioButton24: TRadioButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure UClick(Sender: TObject);
    procedure RClick(Sender: TObject);
    procedure FClick(Sender: TObject);
    procedure DClick(Sender: TObject);
    procedure LClick(Sender: TObject);
    procedure BClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    procedure checkState;
  end;

var
  CenterDlg: TCenterDlg;

implementation

uses RubikMain, CubeDefs, CubiCube;

{$R *.dfm}

procedure TCenterDlg.Button1Click(Sender: TObject);
begin
  with Form1 do
  begin
  ButtonU.Enabled:=true;ButtonR.Enabled:=true;ButtonF.Enabled:=true;
  ButtonD.Enabled:=true;ButtonL.Enabled:=true;ButtonB.Enabled:=true;
  ButtonAddSolve.Enabled:=true; ButtonAddGen.Enabled:=true;
  end;
  Hide;
end;

procedure TCenterDlg.checkState;
var cc: CubieCube;
    allEdges,AllCorners: Boolean;
    i: Corner; k: Edge;
begin
   cc:= CubieCube.Create(fCube);
   allCorners:=true;
   for i:=URF to DRB do if cc.PCorn^[i].c=NNN then begin allCorners:=false;break; end;
   allEdges:=true;
   for k:=UR to BR do if cc.PEdge^[k].e=NN then begin allEdges:=false;break; end;
   if allCorners then
   begin
     if cc.CornParityEven xor cc.CentParityEven
     then Button1.Enabled:=false
     else Button1.enabled:=true;
   end
   else if allEdges then
   begin
     if cc.EdgeParityEven xor cc.CentParityEven
     then Button1.Enabled:=false
     else Button1.Enabled:=true;
   end
   else Button1.Enabled:=true;   //sowohl Ecken als auch Kanten unvollständig
   cc.Free;
end;

procedure TCenterDlg.UClick(Sender: TObject);
begin
   fCube.cenTwist[U]:=(Sender as TRadioButton).Tag;
   checkState;
   Form1.facePaint.Invalidate;
end;

procedure TCenterDlg.RClick(Sender: TObject);
begin
  fCube.cenTwist[R]:=(Sender as TRadioButton).Tag;
  checkState;
  Form1.facePaint.Invalidate;
end;

procedure TCenterDlg.FClick(Sender: TObject);
begin
  fCube.cenTwist[F]:=(Sender as TRadioButton).Tag;
  checkState;
  Form1.facePaint.Invalidate;
end;

procedure TCenterDlg.DClick(Sender: TObject);
begin
  fCube.cenTwist[D]:=(Sender as TRadioButton).Tag;
  checkState;
  Form1.facePaint.Invalidate;
end;

procedure TCenterDlg.LClick(Sender: TObject);
begin
  fCube.cenTwist[L]:=(Sender as TRadioButton).Tag;
  checkState;
  Form1.facePaint.Invalidate;
end;

procedure TCenterDlg.BClick(Sender: TObject);
begin
  fCube.cenTwist[B]:=(Sender as TRadioButton).Tag;
  checkState;
  Form1.facePaint.Invalidate;
end;

end.
