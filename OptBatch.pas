unit OptBatch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TOptimalBatch = class(TForm)
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  OptimalBatch: TOptimalBatch;

implementation

{$R *.dfm}

 uses RubikMain;



procedure TOptimalBatch.Button1Click(Sender: TObject);
begin
  Hide;
end;

procedure TOptimalBatch.RadioButton1Click(Sender: TObject);
begin
  maxAutoRunThreads:= (Sender as TRadioButton).Tag;
  iniFile.WriteInteger('Autorun','nThreads',maxAutoRunThreads);
end;

procedure TOptimalBatch.FormCreate(Sender: TObject);
begin
 maxAutoRunThreads:=8;
 maxAutoRunThreads:= iniFile.ReadInteger('Autorun','nThreads',maxAutoRunThreads);
 case  maxAutoRunThreads of
 1:  RadioButton1.Checked:=true;
 2:  RadioButton2.Checked:=true;
 4:  RadioButton3.Checked:=true;
 8:  RadioButton4.Checked:=true;
 16:  RadioButton5.Checked:=true;
 32:  RadioButton6.Checked:=true;
 end;
end;

end.
