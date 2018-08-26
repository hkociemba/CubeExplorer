program Rubik;

uses
  FastMM4 in 'FastMM4.pas',
  FastMM4Messages in 'FastMM4Messages.pas',
  Forms,
  RubikMain in 'RubikMain.pas' {Form1},
  CubeDefs in 'CubeDefs.pas',
  FaceCube in 'FaceCube.pas',
  CubiCube in 'CubiCube.pas',
  CordCube in 'CordCube.pas',
  Symmetries in 'Symmetries.pas',
  MathFuncs in 'MathFuncs.pas',
  Search in 'Search.pas',
  OptSearch in 'OptSearch.pas',
  TripSearch in 'TripSearch.pas',
  About in 'About.pas' {AboutForm},
  Options in 'Options.pas' {OptionForm},
  PatternSearch in 'PatternSearch.pas',
  hh_funcs in 'hh_funcs.pas',
  hh in 'hh.pas',
  OptOptions in 'OptOptions.pas' {OptOptionForm},
  D6OnHelpFix in 'D6OnHelpFix.pas',
  WebCam in 'WebCam.pas' {CaptureForm},
  ServPort in 'ServPort.pas' {ServSetupForm},
  TcpServer in 'TcpServer.pas',
  SymSearch in 'SymSearch.pas',
  RunSetup in 'RunSetup.pas' {StartManSetupForm},
  Statistics in 'Statistics.pas' {Stats},
  CosetExp in 'CosetExp.pas' {Coset},
  Incomp in 'Incomp.pas' {Incomplete},
  PicRecognition in 'PicRecognition.pas',
  centers in 'centers.pas' {CenterDlg},
  UKeyboardOutput in 'UKeyboardOutput.pas',
  OptBatch in 'OptBatch.pas' {OptimalBatch},
  MTRandom in 'MTRandom.pas';

//Image_File_Large_Address_Aware setzen um bis 3GB Memory zu unterstützen
{$SetPEFlags $0020}
{$R *.RES}
{$R cursors.RES}
begin
  Application.Initialize;
  Application.Title := 'ttt';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TAboutForm, AboutForm);
  Application.CreateForm(TOptionForm, OptionForm);
  Application.CreateForm(TOptOptionForm, OptOptionForm);
  Application.CreateForm(TCaptureForm, CaptureForm);
  Application.CreateForm(TServSetupForm, ServSetupForm);
  Application.CreateForm(TStartManSetupForm, StartManSetupForm);
  Application.CreateForm(TStats, Stats);
  Application.CreateForm(TCoset, Coset);
  Application.CreateForm(TIncomplete, Incomplete);
  Application.CreateForm(TCenterDlg, CenterDlg);
  Application.CreateForm(TOptimalBatch, OptimalBatch);
  Application.Run;
end.
