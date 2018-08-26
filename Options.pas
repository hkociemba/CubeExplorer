unit Options;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,CubeDefs, ComCtrls;

type
//++++++++++++++++++++Form for Options/Two-Phase-Algorithm++++++++++++++++++++++
  TOptionForm = class(TForm)
    GroupBox2: TGroupBox;
    RadioButton6: TRadioButton;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    RadioButton9: TRadioButton;
    RadioButton10: TRadioButton;
    Button1: TButton;
    CheckBox1: TCheckBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    procedure Button1Click(Sender: TObject);
    procedure RBStopAtClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
var
  OptionForm: TOptionForm;

implementation

uses RubikMain;

{$R *.DFM}

//++++++++++++++Hit OK-Button+++++++++++++++++++++++++++++++++++++++++++++++++++
procedure TOptionForm.Button1Click(Sender: TObject);
begin
  OptionForm.Hide;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++++++++Enter Stop Lenght++++++++++++++++++++++++++++++++++++++++++++++
procedure TOptionForm.RBStopAtClick(Sender: TObject);
begin
   stopAt:=(Sender as TRadioButton).Tag;
{$IF not QTM}
   iniFile.WriteInteger('Two-Phase-Algorithm','stopAtF',stopAt);
{$ELSE}
   iniFile.WriteInteger('Two-Phase-Algorithm','stopAtQ',stopAt);
{$IFEND}
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++++++++Check Triple Search Checkbox+++++++++++++++++++++++++++++++++++
procedure TOptionForm.CheckBox1Click(Sender: TObject);
begin
  useTriple:=CheckBox1.Checked;
  iniFile.WriteBool('Two-Phase-Algorithm','TripleSearch',useTriple);
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
procedure TOptionForm.FormCreate(Sender: TObject);
begin
  {$IF not QTM}
  stopAt:=20;
  stopAt:=iniFile.ReadInteger('Two-Phase-Algorithm','stopAtF',stopAt);
  {$ELSE}
  stopAt:=26;
  stopAt:=iniFile.ReadInteger('Two-Phase-Algorithm','stopAtQ',stopAt);
  RadioButton2.Tag:=20;
  RadioButton2.Caption:= '20 moves';
  RadioButton3.Tag:=21;
  RadioButton3.Caption:= '21 moves';
  RadioButton10.Tag:=22;
  RadioButton10.Caption:= '22 moves';
  RadioButton6.Tag:=23;
  RadioButton6.Caption:= '23 moves';
  RadioButton7.Tag:=24;
  RadioButton7.Caption:= '24 moves';
  RadioButton8.Tag:=26;
  RadioButton8.Caption:= '26 moves';
  RadioButton9.Tag:=28;
  RadioButton9.Caption:= '28 moves';
  RadioButton1.Tag:=30;
  RadioButton1.Caption:= '30 moves';
  {$IFEND}
  if RadioButton6.Tag <> stopAt then  RadioButton6.Checked:= false
  else RadioButton6.Checked:= true;
  if RadioButton7.Tag <> stopAt then  RadioButton7.Checked:= false
  else RadioButton7.Checked:= true;
  if RadioButton8.Tag <> stopAt then  RadioButton8.Checked:= false
  else RadioButton8.Checked:= true;
  if RadioButton9.Tag <> stopAt then  RadioButton9.Checked:= false
  else RadioButton9.Checked:= true;
  if RadioButton10.Tag <> stopAt then  RadioButton10.Checked:= false
  else RadioButton10.Checked:= true;
  if RadioButton1.Tag <> stopAt then  RadioButton1.Checked:= false
  else RadioButton1.Checked:= true;
  if RadioButton2.Tag <> stopAt then  RadioButton2.Checked:= false
  else RadioButton2.Checked:= true;
  if RadioButton3.Tag <> stopAt then  RadioButton3.Checked:= false
  else RadioButton3.Checked:= true;
  useTriple:=false;
  CheckBox1.Checked:=iniFile.ReadBool('Two-Phase-Algorithm','TripleSearch',useTriple);
  autoTime:=100;
  //autoTime:=iniFile.ReadInteger('Two-Phase-Algorithm','autoTime',autoTime);
  Form1.BatchTimer.Interval:=autoTime;

end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


end.
