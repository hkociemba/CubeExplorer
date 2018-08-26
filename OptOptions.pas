unit OptOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
//+++++++++++++Delphi Form for the Huge Optimal Solver++++++++++++++++++++++++++
  TOptOptionForm = class(TForm)
    Button1: TButton;
    CheckUseHuge: TCheckBox;
    Panel1: TPanel;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckUseHugeClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

var
  OptOptionForm: TOptOptionForm;

implementation

uses CordCube, CubeDefs, RubikMain;

{$R *.DFM}

//+++++++++++++++++++++++++++++Click OK on Form+++++++++++++++++++++++++++++++++
procedure TOptOptionForm.Button1Click(Sender: TObject);
begin
  if (CheckUseHuge.Checked=true) and
{$IF UHUGE}
   (Length(PruningUBigP[0])<28181682) then
{$ELSE}
   (Length(PruningBigP)<705886618) then
{$IFEND}

  begin
    OptOptionForm.Hide;
    Form1.HugeSolver.Enabled:=false;

    makesTables:=true;//for TForm1.OnCloseQuery
    Form1.File1.Enabled:=false;
    Form1.RunPatButton.Enabled:=false;
    Form1.BRunSym.Enabled:=false;
    Form1.ButtonAddSolve.Enabled:=false;
    Form1.ButtonAddGen.Enabled:=false;
    Form1.ProgressLabel.Visible:=true;
    Form1.Progressbar.Visible:=true;
    {$IF NOT UHUGE}
    CreateFlipConjugateTable;
    {$IFEND}
    {$IF UHUGE}
    CreateUltraBigPruningTable;
 //   CreateCenTwistUDSliceSortedPruningTable;
    {$ELSE}
    CreateBigPruningTable;
//    CreateCenTwistUDSliceSortedPruningTable;
    {$IFEND}
    Form1.ProgressLabel.Visible:=false;
    Form1.Progressbar.Visible:=false;
    Form1.ButtonAddSolve.Enabled:=true;
    Form1.ButtonAddGen.Enabled:=true;
    Form1.RunPatButton.Enabled:=true;
    Form1.BRunSym.Enabled:=true;
    makesTables:=false;
    Form1.HugeSolver.Enabled:=true;
    Form1.File1.Enabled:=true;
    Exit;
  end;
  if CheckUseHuge.Checked=false then USES_BIG:=false else USES_BIG:=true;
  OptOptionForm.Hide;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
procedure TOptOptionForm.FormCreate(Sender: TObject);
begin
  Label1.Caption:=
 {$IF UHUGE}
   #13+'To use the Huge Optimal Solver you need:'+#13+#13+
       '-> 3 GB of free RAM and 2GB disk space.'+#13+
       '-> An empty Main Window.'+#13+#13+
       'If extensive file swapping occurs, you should run'+#13+
       'Cube Explorer with a fresh (rebooted) system.'+#13#13+
       'Unless you solve cubes with twisted centers the'+#13+
       'solving speed will increase considerably.'

 {$ELSE}
   #13+'To use the Huge Optimal Solver you need:'+#13+#13+
       '-> 1 GB of free RAM and 700 MB disk space.'+#13+
       '-> An empty Main Window.'+#13+#13+
        'If extensive file swapping occurs, you should run'+#13+
       'Cube Explorer with a fresh (rebooted) system.'+#13+#13+
       'Unless you solve cubes with twisted centers the'+#13+
       'solving speed will increase considerably.'
 {$IFEND}

end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++++++++++Click CheckBox on Form+++++++++++++++++++++++++++++++++++++++
procedure TOptOptionForm.CheckUseHugeClick(Sender: TObject);
begin
  If CheckUseHuge.Checked=true then USES_BIG:=true
  else USES_BIG:=false
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

end.
