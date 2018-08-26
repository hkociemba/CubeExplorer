unit RunSetup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TStartManSetupForm = class(TForm)
    Button1: TButton;
    GroupBox1: TGroupBox;
    RBTwoPhase: TRadioButton;
    RBOptimal: TRadioButton;
    BCancel: TButton;
    GBTriggerLength: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Panel1: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure BCancelClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  StartManSetupForm: TStartManSetupForm;

implementation
 uses RubikMain, CubeDefs, OptSearch,TripSearch;

{$R *.dfm}

procedure TStartManSetupForm.Button1Click(Sender: TObject);
var i,k,minStartLength: Integer; j: Face;
begin
 for i:= 0 to fcN-1 do
   if fc[i].running and fc[i].selected then
   begin
     Application.MessageBox(PChar(Err[29]),'Error');
     StartManSetupForm.Hide;
     Exit;
   end;


 if RadioButton1.Checked then minStartLength:=RadioButton1.Tag+1;
 if RadioButton2.Checked then minStartLength:=RadioButton2.Tag+1;
 if RadioButton3.Checked then minStartLength:=RadioButton3.Tag+1;
 if RadioButton4.Checked then minStartLength:=RadioButton4.Tag+1;
 k:=0;
 for i:= 0 to fcN-1 do
   if  not fc[i].running and fc[i].selected  and (Pos('*',fc[i].optManeuver)=0)
   and (fc[i].phase2Length>=minStartLength)   then Inc(k);
   if k>500 then
   begin
     Application.MessageBox(PChar(Err[30]),'Error');
     StartManSetupForm.Hide;
     Exit;
   end;


 for i:= 0 to fcN-1 do
   begin
     if (not fc[i].selected) or fc[i].running then continue; //laufende Berechnungen lassen
     if (Pos('*',fc[i].optManeuver)<>0) then continue;//Maneuver already is optimal
     if fc[i].phase2Length<minStartLength then continue;
     if RBOptimal.Checked then fc[i].runOptimal:=true else fc[i].runOptimal:=false;
     if fc[i].runOptimal then
     begin
       if (fc[i].optSearch=nil) then
       begin
         fc[i].optSearch:=OptimalSearch.Create(fc[i]);
         fc[i].optStartTime:=Now;
       end;
       (fc[i].optSearch as OptimalSearch).NextSolution
     end
     else
     begin
        if fc[i].phase2Length<minStartLength then continue;
       if (fc[i].tripSearch=nil) then
       begin
         for j:=U1 to B9 do fc[i].faceOrig[j]:= fc[i].PFace^[j];
         fc[i].tripSearch:=TripleSearch.Create(fc[i]);
       end;
       if (fc[i].tripSearch as TripleSearch).length=-1 then //no better solution
       begin
//       Application.MessageBox(PChar(Err[5]),'Maneuver Window',MB_ICONWARNING);
         continue;
       end
       else
        begin (fc[i].tripSearch as TripleSearch).NextSolution; end;
     end;
     fc[i].running:=true;
     for k:= 0 to MAXNUM do
     if ButRun[k].Tag=i then ButRun[k].Glyph:=Form1.BMStop;
   end;
   StartManSetupForm.Hide;
end;

procedure TStartManSetupForm.BCancelClick(Sender: TObject);
begin
  StartManSetupForm.Hide;
end;



end.
