unit ServPort;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TServSetupForm = class(TForm)
    CBEnable: TCheckBox;
    Label2: TLabel;
    EPort: TEdit;
    Button1: TButton;
    CBWebSrvOut: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CBEnableClick(Sender: TObject);
    procedure CBWebSrvOutClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  ServSetupForm: TServSetupForm;

implementation

uses RubikMain;

{$R *.dfm}

procedure TServSetupForm.Button1Click(Sender: TObject);
var canHide:boolean;
begin
  canHide:=true;
  if Form1.Serversocket1.Active then Form1.Serversocket1.Close;
  try
    Form1.ServerSocket1.Port:=StrToInt(EPort.Text);
    if  (Form1.ServerSocket1.Port<100) or (Form1.ServerSocket1.Port>64000) then
    raise EConvertError.Create('Range Error');
  except
    EPort.Text:=IntToStr(8080);
    Form1.ServerSocket1.Port:=8080;
    Application.MessageBox('Use Port Numbers from 100 to 64000','' MB_ICONWARNING);
    canHide:=false;
  end;
 { try
    minTime:=StrToInt(EMinTime.Text);
    if (minTime<1) or (minTime>60) then raise EConvertError.Create('Range Error');
  except
    EMinTime.Text:='5';
    minTime:=5;
    Application.MessageBox('Use a Time between 1 and 60 seconds','' MB_ICONWARNING);
    canHide:=false;
  end;  }
 { try
    maxCubes:=StrToInt(EMaxCubes.Text);
    if (maxCubes<100) or (maxCubes>5000) then raise EConvertError.Create('Range Error');
  except
    EMaxCubes.Text:='100';
    maxCubes:=100;
    Application.MessageBox('Use a Number between 100 and 5000','' MB_ICONWARNING);
    canHide:=false;
  end;     }

  If CBEnable.Checked=true then Form1.ServerSocket1.Open;
  if canHide then ServSetupForm.Hide;
  iniFile.WriteInteger('WebServer','port',Form1.ServerSocket1.Port);
  iniFile.WriteBool('WebServer','enabled',ServSetupForm.CBEnable.Checked);
  //iniFile.WriteInteger('WebServer','minTime',minTime);
  //iniFile.WriteInteger('WebServer','maxCubes',maxCubes);
end;

procedure TServSetupForm.FormCreate(Sender: TObject);
var i: Integer;
begin
  Form1.serverSocket1.Port:=8080;
  Form1.serverSocket1.Port:=iniFile.ReadInteger('WebServer','port',Form1.serverSocket1.Port);
  EPort.Text:=IntToStr(Form1.serverSocket1.Port);
  CBWebSrvOut.Checked:=false;
  writeToFile:=false;
  i:=0;
  i:=iniFile.ReadInteger('WebServer','writeToFile',i);
  if i=1 then begin CBWebSrvOut.Checked:=true;writeToFile:=true;end;
  //minTime:=5;//5 seconds default for search
  //minTime:= iniFile.ReadInteger('WebServer','minTime',minTime);
  //EMinTime.Text:=IntToStr(minTime);
  //maxCubes:=100;//100 cubes default in MainWindow
  //maxCubes:= iniFile.ReadInteger('WebServer','maxCubes',maxCubes);
  //EMaxCubes.Text:=IntToStr(maxCubes);
  CBEnable.Checked:=false;
  CBEnable.Checked:=iniFile.ReadBool('WebServer','enabled',ServSetupForm.CBEnable.Checked);
  If CBEnable.Checked=true then Form1.ServerSocket1.Open;  //closed by default
end;

procedure TServSetupForm.CBEnableClick(Sender: TObject);
begin
  if CBEnable.Checked and Form1.ButtonAddSolve.Enabled //not on startup
     then Application.MessageBox('Enable the Web Server only if you really use this feature.'#13#10+
             'Please read the documentation in the Help File.','Web Server Setup',MB_ICONWARNING)
end;

procedure TServSetupForm.CBWebSrvOutClick(Sender: TObject);
begin
   writeToFile:= (sender as TCheckBox).Checked;
   if (writeToFile) then
     iniFile.WriteInteger('WebServer','writeToFile',1)
   else  iniFile.WriteInteger('WebServer','writeToFile',0);
end;

end.
