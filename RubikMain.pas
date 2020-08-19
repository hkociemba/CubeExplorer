unit RubikMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,  FaceCube, ComCtrls, ExtCtrls,CubeDefs, Buttons,syncobjs, Menus,
  hh,hh_funcs,Printers,ClipBrd,
  {$IFDEF VER140}
  D6OnHelpFix,
{$EndIf}
CubiCube,CordCube, Spin, Sockets, ScktComp,IniFiles, ImgList,CosetExp,
  DSPack, DirectShow9,DSUtil,TlHelp32,//TlHelp32 for CountThreads
  MTRandom;//Mersenne Twister Random Generator
const
    WM_NEXTSEARCH=WM_APP+1111;
    WM_NEXTLEVEL=WM_APP+1112;
    WM_CREATETABLES=WM_APP+1113;
    WM_CONNECT=WM_APP+1114;
    WM_WARNING23=WM_APP+1115;
    WM_UPDATELABELS=WM_APP+1116;

type
  TForm1 = class(TForm)
    PageCtrl: TPageControl;
    TabSheet1: TTabSheet;
    ButtonU: TButton;
    ButtonR: TButton;
    ButtonF: TButton;
    ButtonD: TButton;
    ButtonL: TButton;
    ButtonB: TButton;
    FacePaint: TPaintBox;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    ButtonEmpty: TButton;
    ButtonClear: TButton;
    ButtonRandom: TButton;
    ButtonCustomize: TButton;
    GroupBox3: TGroupBox;
    ButtonAddSolve: TButton;
    ButtonAddGen: TButton;
    Bevel1: TBevel;
    ColorDialog: TColorDialog;
    LSelColor: TLabel;
    CheckBoxA1: TCheckBox;
    CheckBoxF1: TCheckBox;
    CheckBoxR1: TCheckBox;
    CheckBoxU1: TCheckBox;
    CheckBoxD1: TCheckBox;
    CheckBoxL1: TCheckBox;
    CheckBoxB1: TCheckBox;
    CheckBoxA2: TCheckBox;
    CheckBoxU2: TCheckBox;
    CheckBoxD2: TCheckBox;
    CheckBoxR2: TCheckBox;
    CheckBoxL2: TCheckBox;
    CheckBoxF2: TCheckBox;
    CheckBoxB2: TCheckBox;
    CheckBoxA3: TCheckBox;
    CheckBoxU3: TCheckBox;
    CheckBoxD3: TCheckBox;
    CheckBoxR3: TCheckBox;
    CheckBoxL3: TCheckBox;
    CheckBoxF3: TCheckBox;
    CheckBoxB3: TCheckBox;
    CheckBoxA4: TCheckBox;
    CheckBoxU4: TCheckBox;
    CheckBoxD4: TCheckBox;
    CheckBoxR4: TCheckBox;
    CheckBoxL4: TCheckBox;
    CheckBoxF4: TCheckBox;
    CheckBoxB4: TCheckBox;
    CheckBoxA5: TCheckBox;
    CheckBoxU5: TCheckBox;
    CheckBoxD5: TCheckBox;
    CheckBoxR5: TCheckBox;
    CheckBoxL5: TCheckBox;
    CheckBoxF5: TCheckBox;
    CheckBoxB5: TCheckBox;
    PatBox1: TGroupBox;
    PatBox2: TGroupBox;
    PatBox3: TGroupBox;
    PatBox4: TGroupBox;
    PatBox5: TGroupBox;
    CheckBoxContinuous: TCheckBox;
    SbVert: TScrollBar;
    SbHor: TScrollBar;
    Panel1: TPanel;
    OutPut: TPaintBox;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Options1: TMenuItem;
    Help1: TMenuItem;
    LoadWorkspace1: TMenuItem;
    SaveWorkspace1: TMenuItem;
    N2: TMenuItem;
    PrinterSetup1: TMenuItem;
    PrintMainWindow: TMenuItem;
    N3: TMenuItem;
    Exit1: TMenuItem;
    TwoPhaseAlgorithm1: TMenuItem;
    Contents1: TMenuItem;
    N4: TMenuItem;
    About1: TMenuItem;
    SDWorkSpace: TSaveDialog;
    ODWorkspace: TOpenDialog;
    ProgressBar: TProgressBar;
    ProgressLabel: TLabel;
    PopupMenu1: TPopupMenu;
    DeleteselectedCubes1: TMenuItem;
    CubePopupMenu: TPopupMenu;
    N1: TMenuItem;
    ClearMainWindow1: TMenuItem;
    rotUD: TMenuItem;
    RotURF: TMenuItem;
    RefRL: TMenuItem;
    N5: TMenuItem;
    RemoveCube1: TMenuItem;
    N6: TMenuItem;
    TransferCubetoFaceletEditor1: TMenuItem;
    RotFB: TMenuItem;
    Bevel2: TBevel;
    GroupBox4: TGroupBox;
    PatShape1: TShape;
    PatShape2: TShape;
    PatShape3: TShape;
    PatShape4: TShape;
    PatShape5: TShape;
    PatShape6: TShape;
    CurShape: TShape;
    Label1: TLabel;
    PatClear: TButton;
    RunPatButton: TButton;
    PrinterSetupDialog: TPrinterSetupDialog;
    FindGenerators: TCheckBox;
    PrintSelectedCubes: TMenuItem;
    Invert1: TMenuItem;
    Edit1: TMenuItem;
    DeleteselectedCubes2: TMenuItem;
    StartSearchforSelectedCubes: TMenuItem;
    ClearMainWindow2: TMenuItem;
    SaveasHtml1: TMenuItem;
    SaveHtml: TSaveDialog;
    HugeSolver: TMenuItem;
    TabVideo: TTabSheet;
    GroupBox5: TGroupBox;
    RbB: TRadioButton;
    RbL: TRadioButton;
    RbF: TRadioButton;
    RbR: TRadioButton;
    RbU: TRadioButton;
    RbD: TRadioButton;
    BScan: TButton;
    DisplayGroupBox: TGroupBox;
    RbHue: TRadioButton;
    RbSat: TRadioButton;
    RbVal: TRadioButton;
    BTransferCam: TButton;
    GroupBox7: TGroupBox;
    Bevel4: TBevel;
    ILeft: TImage;
    IFront: TImage;
    IRight: TImage;
    IUp: TImage;
    IDown: TImage;
    TimerBlink: TTimer;
    Bevel5: TBevel;
    WebServer1: TMenuItem;
    ServerSocket1: TServerSocket;
    TimerWatchDog: TTimer;
    ClientSocket1: TClientSocket;
    TabSym: TTabSheet;
    GBSpeed: TGroupBox;
    GBNumCol: TGroupBox;
    SymFindGenerators: TCheckBox;
    CBContinuous: TCheckBox;
    Bevel6: TBevel;
    SBr2e1: TSpeedButton;
    SBr2e2: TSpeedButton;
    SBr2e3: TSpeedButton;
    SBr2e4: TSpeedButton;
    SBr2e5: TSpeedButton;
    SBr2e6: TSpeedButton;
    SBme1: TSpeedButton;
    SBme2: TSpeedButton;
    SBme3: TSpeedButton;
    SBme4: TSpeedButton;
    SBme5: TSpeedButton;
    SBme6: TSpeedButton;
    SBr2f1: TSpeedButton;
    SBr2f2: TSpeedButton;
    SBr2f3: TSpeedButton;
    SBr41: TSpeedButton;
    SBr42: TSpeedButton;
    SBr43: TSpeedButton;
    SBmf1: TSpeedButton;
    SBmf2: TSpeedButton;
    SBmf3: TSpeedButton;
    SBm41: TSpeedButton;
    SBm42: TSpeedButton;
    SBm43: TSpeedButton;
    SBr31: TSpeedButton;
    SB26: TSpeedButton;
    SB27: TSpeedButton;
    SB28: TSpeedButton;
    SBmc: TSpeedButton;
    BRunSym: TButton;
    GroupBox11: TGroupBox;
    CbSymmetries: TComboBox;
    ImageList1: TImageList;
    GBSymmetry: TGroupBox;
    CBn1: TCheckBox;
    CBn3: TCheckBox;
    CBn2: TCheckBox;
    CBn4: TCheckBox;
    CBn5: TCheckBox;
    CBn6: TCheckBox;
    GBPermutation: TGroupBox;
    RBAll: TRadioButton;
    RBEdgesE: TRadioButton;
    RBCornersE: TRadioButton;
    Bevel7: TBevel;
    Bevel8: TBevel;
    Bevel9: TBevel;
    Bevel10: TBevel;
    MTransferSym: TMenuItem;
    CBIsomorph: TCheckBox;
    RBEdgesO: TRadioButton;
    RBCornersO: TRadioButton;
    GroupBox10: TGroupBox;
    Label8: TLabel;
    LSymSize: TLabel;
    Label9: TLabel;
    LSymN: TLabel;
    GroupBox12: TGroupBox;
    RBSym: TRadioButton;
    RBASym: TRadioButton;
    GBAntiSym: TGroupBox;
    CBASy: TComboBox;
    MemoAntisym: TMemo;
    MIApplySymToSel: TMenuItem;
    ApplySymPopUp: TPopupMenu;
    GroupBox8: TGroupBox;
    EManeuver: TEdit;
    BApplyMan: TButton;
    CopySolverToClipboard: TMenuItem;
    N8: TMenuItem;
    CopyGeneratortoClipboard: TMenuItem;
    Bevel12: TBevel;
    Bevel13: TBevel;
    Bevel14: TBevel;
    N9: TMenuItem;
    MIUseAsAntiSymmetry: TMenuItem;
    CSelfInverse: TCheckBox;
    CBSelfInverse: TCheckBox;
    N7: TMenuItem;
    StartSearchforSelectedCubes1: TMenuItem;
    StopSearchforSelectedCubes1: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    AddRandomCubes1: TMenuItem;
    N13: TMenuItem;
    FreeThreadsonTerminate1: TMenuItem;
    BatchTimer: TTimer;
    StartAutomodusforOptimalSolver1: TMenuItem;
    StartAutorunforTFS: TMenuItem;
    AutoRunIdx: TLabel;
    IgnoreIsoOnLoad: TMenuItem;
    N15: TMenuItem;
    GenerateStatistics1: TMenuItem;
    N16: TMenuItem;
    IsoInvInclude: TMenuItem;
    N18: TMenuItem;
    ArrangeSelected: TMenuItem;
    AddSymmetryInfoforSelected: TMenuItem;
    AddAllInverses: TMenuItem;
    N19: TMenuItem;
    ArrangeSelected1: TMenuItem;
    AddSymmetryInfoforSelected1: TMenuItem;
    N20: TMenuItem;
    FixCenterFacelets: TMenuItem;
    N21: TMenuItem;
    SortCubesbyPatternName: TMenuItem;
    SortCubesbyManeuverLength: TMenuItem;
    ExpandFirstCube: TMenuItem;
    ColorCheck: TCheckBox;
    TMenuRun: TMenuItem;
    N10: TMenuItem;
    N14: TMenuItem;
    StopSearchForSelectedCubes: TMenuItem;
    N22: TMenuItem;
    WCAscramble: TMenuItem;
    FilterGraph: TFilterGraph;
    SampleGrabber: TSampleGrabber;
    Filter: TFilter;
    GroupBox9: TGroupBox;
    CapDevs: TComboBox;
    CapConfig: TButton;
    CapFormat: TButton;
    EditCenters: TMenuItem;
    GroupBox13: TGroupBox;
    LOrange: TLabel;
    ETreshOrange: TEdit;
    LYellow: TLabel;
    ETreshYellow: TEdit;
    LGreen: TLabel;
    ETreshGreen: TEdit;
    LBlue: TLabel;
    ETreshBlue: TEdit;
    BRyanHeise: TButton;
    RODistance: TGroupBox;
    HueSep: TRadioButton;
    ValSep: TRadioButton;
    GroupBox15: TGroupBox;
    RBAutomatic: TRadioButton;
    RBInteractive: TRadioButton;
    SampleNumber: TGroupBox;
    sampleRed: TLabel;
    sampleOrange: TLabel;
    Button1: TButton;
    GBPreview: TGroupBox;
    prevBox: TPaintBox;
    Button2: TButton;
    MaximumNumber1: TMenuItem;
    ButtonEmptyC: TButton;
    ButtonEmptyE: TButton;
    ButtonClearC: TButton;
    ButtonClearE: TButton;
    ButtonE: TButton;
    Buttony: TButton;
    ButtonS: TButton;
    ButtonM: TButton;
    Buttonx: TButton;
    Buttonz: TButton;
    N23: TMenuItem;
    AllowSliceMoves1: TMenuItem;
    ButtonRandomC: TButton;
    ButtonRandomE: TButton;
    Multiply: TMenuItem;
    MultiplyInverse: TMenuItem;
    CBExactSym: TCheckBox;
    CBExactAsym: TCheckBox;
    SortCubesbyCubeID: TMenuItem;
    procedure FormCreate(Sender: TObject);

    procedure FacePaintPaint(Sender: TObject);
    procedure ButtonEmptyClick(Sender: TObject);
    procedure ButtonClearClick(Sender: TObject);
    procedure ButtonCustomizeClick(Sender: TObject);
    procedure FacePaintMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FacePaintMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ButtonRandomClick(Sender: TObject);
    procedure ButtonAddSolveClick(Sender: TObject);
    procedure OutputPaint(Sender: TObject);
    procedure SbVertScroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure FormResize(Sender: TObject);
    procedure RunPatButtonClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure TwoPhaseAlgorithm1Click(Sender: TObject);
    procedure SaveWorkspace1Click(Sender: TObject);
    procedure LoadWorkspace1Click(Sender: TObject);
    procedure OutPutMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SbHorScroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DeleteselectedCubes1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ClearMainWindow1Click(Sender: TObject);
    procedure RemoveCube1Click(Sender: TObject);
    procedure TransferCubetoFaceletEditor1Click(Sender: TObject);
    procedure rotUDClick(Sender: TObject);
    procedure RotURFClick(Sender: TObject);
    procedure RotFBClick(Sender: TObject);
    procedure RefRLClick(Sender: TObject);
    procedure CheckBoxOnClick(Sender: TObject);
    procedure CheckBoxAOnClick(Sender: TObject);
    procedure PatShapeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PatClearClick(Sender: TObject);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure PrintMainWindowClick(Sender: TObject);
    procedure File1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure InvertClick(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure SaveasHtml1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure HugeSolverClick(Sender: TObject);
    procedure ButtonXClick(Sender: TObject);
    procedure ButtonMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ButtonMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);






    procedure RbFaceClick(Sender: TObject);
    procedure BScanClick(Sender: TObject);
    procedure BTransferCamClick(Sender: TObject);
    procedure TBRedChange(Sender: TObject);
    procedure TBBlueChange(Sender: TObject);
    procedure TBGreenChange(Sender: TObject);
    procedure TimerBlinkTimer(Sender: TObject);
    procedure TimerBlinkTimer1(Sender: TObject);//für das two-phase-test modul
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure WebServer1Click(Sender: TObject);
    procedure ServerSocket1ClientError(Sender: TObject;
      Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
      var ErrorCode: Integer);
    procedure ServerSocket1GetThread(Sender: TObject;
      ClientSocket: TServerClientWinSocket;
      var SocketThread: TServerClientThread);
    procedure TimerWatchDogTimer(Sender: TObject);
    procedure ClientSocket1Error(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure BRunSymClick(Sender: TObject);
    procedure CbSymmetriesDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure CbSymmetriesChange(Sender: TObject);
    procedure SBSymmetriesClick(Sender: TObject);
    procedure BClearSymClick(Sender: TObject);
    procedure MTransferSymClick(Sender: TObject);
    procedure CubePopupMenuPopup(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure CBIsomorphClick(Sender: TObject);
    procedure RBEdgesOClick(Sender: TObject);
    procedure RBCornersOClick(Sender: TObject);
    procedure RBSymClick(Sender: TObject);
    procedure RBASymClick(Sender: TObject);
    procedure CBASyDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure CBASyChange(Sender: TObject);
    procedure MIApplySymToSelClick(Sender: TObject);
    procedure SBr2e1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ApplySymPopUpPopup(Sender: TObject);
    procedure BApplyManClick(Sender: TObject);
    procedure CopySolverToClipboardClick(Sender: TObject);
    procedure CopyGeneratortoClipboardClick(Sender: TObject);
    procedure MIUseAsAntiSymmetryClick(Sender: TObject);
    procedure CSelfInverseClick(Sender: TObject);
    procedure EManeuverKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StartSearchforSelectedCubesClick(Sender: TObject);
    procedure AddRandomCubes1Click(Sender: TObject);
    procedure FreeThreadsonTerminate1Click(Sender: TObject);
    procedure Options1Click(Sender: TObject);
    procedure StartAutomodusforOptimalSolver1Click(Sender: TObject);
    procedure BatchTimerTimer(Sender: TObject);
    procedure StartAutorunforTFSClick(Sender: TObject);
    procedure SbVertChange(Sender: TObject);
    procedure IgnoreIsoOnLoadClick(Sender: TObject);
    procedure GenerateStatistics1Click(Sender: TObject);
    procedure ArrangeSelectedClick(
      Sender: TObject);
    procedure AddSymmetryInfoforSelectedClick(Sender: TObject);
    procedure AddAllInversesClick(Sender: TObject);
    procedure FixCenterFaceletsClick(Sender: TObject);
    procedure SortCubesbyPatternNameClick(Sender: TObject);
    procedure ExpandFirstCubeClick(Sender: TObject);
    procedure SkipDuplicatesOnLoadClick(Sender: TObject);
    procedure ColorCheckClick(Sender: TObject);
    procedure StopSearchForSelectedCubesClick(Sender: TObject);
    procedure WCAscrambleClick(Sender: TObject);
    procedure CapDevsChange(Sender: TObject);
    procedure SampleGrabberBuffer(sender: TObject; SampleTime: Double;
      pBuffer: Pointer; BufferLen: Integer);
    procedure CapConfigClick(Sender: TObject);
    procedure CapFormatClick(Sender: TObject);
    procedure BRyanHeiseClick(Sender: TObject);
    procedure EditCentersClick(Sender: TObject);
    procedure ETreshOrangeChange(Sender: TObject);
    procedure ETreshYellowChange(Sender: TObject);
    procedure ETreshGreenChange(Sender: TObject);
    procedure ETreshBlueChange(Sender: TObject);
    procedure RBAutomaticClick(Sender: TObject);
    procedure RBInteractiveClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure prevBoxPaint(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure MaximumNumber1Click(Sender: TObject);
    procedure ButtonEmptyCClick(Sender: TObject);
    procedure ButtonEmptyEClick(Sender: TObject);
    procedure ButtonClearCClick(Sender: TObject);
    procedure ButtonClearEClick(Sender: TObject);
    procedure AllowSliceMoves1Click(Sender: TObject);
    procedure MultiplyClick(Sender: TObject);
    procedure MultiplyInverseClick(Sender: TObject);
    procedure PageCtrlChange(Sender: TObject);

    { Private declarations }
  private

  t: array[0..8] of Integer;//Bildindizes für die CBAsy-Combobox

  procedure DoNextSearch(var Message: TMessage); message WM_NEXTSEARCH;
  procedure ShowNextLevel(var Message: TMessage); message WM_NEXTLEVEL;
  procedure CreateTables(var Message: TMessage); message WM_CREATETABLES;
  procedure Warning23(var Message: TMessage); message WM_WARNING23;
  procedure Connect(var Message: TMessage); message WM_CONNECT;
  procedure UpdateLabels(var Message: TMessage); message WM_UPDATELABELS;
  procedure PatSearchTerminate(Sender: TObject);
  procedure SymSearchTerminate(Sender: TObject);

  public
  BmRun,BmStop: TBitmap;
  lowOLd,highOld:Integer;
  dirty:Boolean;
  curFileName:String;

  procedure AddCube(f:FaceletCube;isSolver,startSearch,askIsomorphics:Boolean;pType:Integer;isOriented: Boolean);
  procedure ButClick(Sender: TObject);
  procedure ButSolveClick(Sender: TObject);
  procedure OptBoxClick(Sender: TObject);
  procedure EdNameChange(Sender: TObject);
  procedure SquareMouseDown(Sender: TObject;Button:TMouseButton;Shift:TShiftState;X,Y:Integer);
  procedure SetUpProgressBar(min,max:Integer;lab:String);
  procedure DeleteSelectedCubes;
  procedure SearchIncomplete;
  procedure ShowCenterDialog;
  procedure saveToDefaultFile;

  end;

  procedure DoManeuverString(fcb:FaceletCube;man:String;var mvs:Integer);

const MAXNUM=15;//maximal number of cubes on visible part of Main Window
      CSIZE=4;//size of cube unit in output window
      UBORD=8;//offset from top
      LBORD=5;//left offset of cubes in main window
      EDMAXLENGTH=30;//maximal length of name for pattern
      HORSIZE=650;//horizontal size of output window

var
  Form1: TForm1;
  fCube,prevCube: FaceletCube;
  curCol:ColorIndex;
  curPatCol:Integer;//current colour in Pattern Editor
  curFace:Integer;//current face to scan with WebCam
  fc: Array of FaceletCube;//for the cubes in the Main Window
  fcN: Integer;//Highest Index for the fcubes used
  xOffset,yOffset: Integer;//offset of the scrollwindow
  h: Integer;//Height of Output-Window
  ButRun,ButSolve: array[0..MAXNUM] of TSpeedButton;
  EdName: array[0..MAXNUM] of TEdit;
  OptBox: array[0..MAXNUM] of TCheckBox;
  CheckBox: array[U..B,1..5] of TCheckBox;
  ACheckBox:array[1..5] of TCheckBox;
  Square: array[1..5,1..9] of TShape;
  PatSelector : array[1..6] of TShape;
  lastSelected: Integer;//index of last selected Cube
  makesTables: Boolean;//during table generation
  var mHHelp: THookHelpSystem;//for html help
  buf: TBitmap;
  scannedFaces: array[0..5] of boolean;//faces already scanned
  iniFile: TIniFile;
  //minTime: Integer;//minimal time to search with webinterface
  //maxCubes: Integer;//maximal number of Cubes in Main Window if WebServer is active
  curSym: array[0..47] of byte;//current Symmetry in Symmetry Editor
  curASym: Int64;//current Symmetry of antisymmtery subgroup
  curSymNormal: Int64;//the symmetry of the largest subgroup of M, in which curSym is normal, d.h. x^-1 cursSym x = cursSym
  counter: Int64;//counter for different purposes, set to 0 at start
  save1,save2,save3: Cardinal;//other multipurpose variables
  escPressed: boolean;//wird gesetzt, wenn ESC gedrückt wird, in Load File verwendet
  bitvecDone: Integer;//Zähler für den Coset Explorer
  cubeCount: array[0..20] of Integer;//Speichert die Anzahl der Wüfel in bestimmeter Tiefe
  coSearch:CosetSearch;
  globalmessage: String;//um Texte zwischen den Modulen zu tauschen
  incoIsRunning: boolean;//flag das anzeigt, ob das Incomplete Search Mdoul läuft
  SysDev: TSysDevEnum;//zum Nummerieren der DirectShow Devices
  bmap: TBitMap;//bitmap zum Zeichnen für das videofenster
  treshOrange,treshYellow,treshGreen,treshBlue: Integer;
  //parameteres for webcam recognition
  ryanCount: Integer; //Zähler für ryans online simulator
  xdist,ydist: Integer;//Parameter für Abstände der Scanfelder bei der Webcam
  redHue,orangeHue,redVal,orangeVal,redSat,orangeSat:
               array [0..8] of Integer;//rot/orange für interaktiven Modus
  capXPos,capYPos: Integer;//Position der rechten Maustaste im Capture Fenster
  redRequest,orangeRequest: Boolean;//signaliere, dass rot bzw orangewert gelesen wird
  nSampleRed,nSampleOrange:Integer;//Nummer der Sample für rot oder orange
  redHueS,redSatS,redValS: Integer;//Standard Abweichung der rot-Samples
  orangeHueS,orangeSatS,orangeValS: Integer;
  maxAutoRunThreads: Integer;//Maximum number of Threads for Autorun
  useSlices: Boolean; //Use slice moves in Incoplete Search
  sliceMode: Boolean;// Use Slice moves in Two-Phase-Algorithm and Optimal Search
  ID: TMTID; //Mersenne Twister Random Generator Id
  RandVec: TRandVector;  //
  MausPos:TPoint;
  manSep: String;//entweder f,q,s,sq
  writeToFile: Boolean;//Antwort des Webservers in file schreiben
  threadN: Integer; //Anzahl der bereits vorhandenen Threads beim Autorun Start

  CS: TRTLCriticalSection;

implementation

uses Math,Symmetries,Search,OptSearch,TripSearch, About,
  Options,PatternSearch, OptOptions,WebCam,MathFuncs,ServPort,
  StrUtils,TcpServer,SymSearch, RunSetup, Statistics, Incomp, centers,UKeyBoardOutput,
  OptBatch;
var  ps:PatSearch;usedRightButton:Boolean;
     ss:SySearch;

{$IF CUBE20STUFF}
//Variablen nur für die Nebenklassenberechnung von Q

  sliceRep: array [0..495*70-1] of Boolean;
  sliceSym: array [0..495*70-1] of Int64;
  eoriRep: array [0..2048-1] of Boolean;
  eoriSym: array [0..2048-1] of Int64;
  tetraRep: array [0..70-1] of Boolean;
  tetraSym: array [0..70-1] of Int64;
  coriRep: array [0..2187-1] of Boolean;
  coriSym: array [0..2187-1] of Int64;
  tcosetBitmap: array [0..70963200 div 8] of Byte;

{$IFEND}

{$R *.DFM}

//++++++++++++++++++++++++++Initialize the Form+++++++++++++++++++++++++++++++++
procedure TForm1.FormCreate(Sender: TObject);
var  i,j: Integer;prnt:TWinControl;
     k: Face;
begin

  InitializeCriticalSection(CS);
  {$If not QTM}
  manSep:='f';
  {$ELSE}
  manSep:='q';
  {$IFEND}
  useSlices:=false;
  messageboxPopup:=false;//Messagebox bei Wechsel des slicemodes

  SysDev:= TSysDevEnum.Create(CLSID_VideoInputDeviceCategory);
  if SysDev.CountFilters > 0 then
    for i := 0 to SysDev.CountFilters - 1 do
   begin
     CapDevs.Items.Add(SysDev.Filters[i].FriendlyName);
    end;
  if SysDev.CountFilters=0 then
  begin
    CapDevs.Text:='No device found - connect device prior to program start!';
    CapDevs.Enabled:=false;
  end;
   bmap:=TBitMap.Create;

  SetCurrentDir(ExtractFilePath(Paramstr(0)));//Cube Explorer directory

{$IF NOT PRIVAT}
  ExpandFirstCube.Visible:=false;
{$IFEND}


  ClientSocket1.Port:=ServerSocket1.Port;

  incoIsRunning:=false;
  for k:=U1 to B9 do faceValue[k]:=Ord(NoCol);//für prevCube
  for i:= 0 to 5 do scannedFaces[i]:=false;
  BScan.Hint:=Hints[5]+Chr(13)+Hints[6]+Chr(13)+Hints[7]+Chr(13)+Hints[8];
  Application.ShowHint:=true;
  Application.Title := curVersion;
  Application.HintHidePause:=30000;//show hint max. 30 seconds
  PostMessage(Handle,WM_CreateTables,0,0);          //build the tables

  buf:=TBitmap.Create;//double buffer the Output
  Output.ControlStyle:=Output.ControlStyle+[csOpaque];//prevent flicker
  usedRightButton:=false;

  fcube := FaceletCube.Create(FacePaint.Canvas);//facelet editor
  prevCube:= FaceletCube.Create(prevBox.Canvas);
  prevCube.size:=2; prevCube.paintType:=4;//Farben direkt zeichnen
  prevCube.Empty;
  prevCube.PFace^[U5]:=NoCol;prevCube.PFace^[R5]:=NoCol;prevCube.PFace^[F5]:=NoCol;
  prevCube.PFace^[D5]:=NoCol;prevCube.PFace^[L5]:=NoCol;prevCube.PFace^[B5]:=NoCol;
  mHHelp := THookHelpSystem.Create('cube.chm', '', htHHAPI);
  curCol:=UCol;
  Screen.Cursors[1]:=LoadCursor(HInstance,'Eimer');//cursor for filling
  Screen.Cursors[2]:=LoadCursor(HInstance,'Pipette');//cursor for colorpicking
  FacePaint.Cursor:=1;
  LSelColor.Cursor:=1;
  Randomize;
  MT_RandInit(ID,RandSeed);//Itialize Mersenne Twister

  Cubedefs.Color[UCol]:=clBlue;
  Cubedefs.Color[RCol]:=clYellow;
  Cubedefs.Color[FCol]:=clRed;
  Cubedefs.Color[DCol]:=clGreen;
  Cubedefs.Color[LCol]:=clWhite;
  Cubedefs.Color[BCol]:=RGB(255,128,0);//orange
  Cubedefs.Color[NoCol]:=clGray;

  iniFile := TIniFile.Create(ExtractFilePath(Paramstr(0))+'cube.ini');

  Cubedefs.Color[UCol]:=iniFile.ReadInteger('Color Scheme','UColor',Cubedefs.Color[UCol]);
  Cubedefs.Color[RCol]:=iniFile.ReadInteger('Color Scheme','RColor',Cubedefs.Color[RCol]);
  Cubedefs.Color[FCol]:=iniFile.ReadInteger('Color Scheme','FColor',Cubedefs.Color[FCol]);
  Cubedefs.Color[DCol]:=iniFile.ReadInteger('Color Scheme','DColor',Cubedefs.Color[DCol]);
  Cubedefs.Color[LCol]:=iniFile.ReadInteger('Color Scheme','LColor',Cubedefs.Color[LCol]);
  Cubedefs.Color[BCol]:=iniFile.ReadInteger('Color Scheme','BColor',Cubedefs.Color[BCol]);
  Cubedefs.Color[NoCol]:=iniFile.ReadInteger('Color Scheme','FreeColor',Cubedefs.Color[NoCol]);

  ColorCheck.Checked:= iniFile.ReadBool('Faclet Editor','AutoFix',true);
  RBAutomatic.Checked:= iniFile.ReadBool('WebCam','autoMode',false);//default ist false

  SetLength(fc,10);fcN:=0;xOffset:=0;yOffset:=0;lowOld:=-1;highOld:=-1;

  BMRun:=TBitmap.Create;
  BMRun.LoadFromResourceName(HInstance,'Run');//load green run bitmap
  BMStop:=TBitmap.Create;
  BMStop.LoadFromResourceName(HInstance,'Stop');//load red stop bitmap
  for i:= 0 to MAXNUM do//create the dynamic objects in the main window
  begin
    ButRun[i]:=TSpeedButton.Create(Form1);
    ButRun[i].Visible:=false;
    ButRun[i].Parent:=Panel1;
    ButRun[i].Width:=23;
    ButRun[i].Height:=22;
    ButRun[i].Caption:='';
    ButRun[i].Flat:=True;
    ButRun[i].Left:=410;
    ButRun[i].OnClick:= ButClick;

    ButSolve[i]:=TSpeedButton.Create(Form1);
    ButSolve[i].Visible:=false;
    ButSolve[i].Parent:=Panel1;
    ButSolve[i].Width:=58;
    ButSolve[i].Height:=22;
    ButSolve[i].Flat:=True;
    ButSolve[i].Left:=220;
    ButSolve[i].OnClick:= ButSolveClick;

    EdName[i]:=TEdit.Create(Form1);
    EdName[i].Parent:=Panel1;
    EdName[i].Width:=150;
    EdName[i].Left:=180;
    EdName[i].Visible:=false;
    EdName[i].MaxLength:=EDMAXLENGTH;
    EdName[i].OnChange:=EdNameChange;

    OptBox[i]:=TCheckBox.Create(Form1);
    OptBox[i].Parent:=Panel1;
    OptBox[i].Width:=60;
    OptBox[i].Left:=350;
    OptBox[i].Visible:=false;
    OptBox[i].OnClick:= OptBoxClick;
    OptBox[i].Caption:='optimal';
  end;
  for i:= 1 to 5 do//create the objects in the pattern-editor
  begin
    prnt:=nil;
    case i of
    1: prnt:=PatBox1;
    2: prnt:=PatBox2;
    3: prnt:=PatBox3;
    4: prnt:=PatBox4;
    5: prnt:=PatBox5;
    end;
    for j:= 1 to 9 do
    begin
      Square[i,j]:= TShape.Create(Form1);
      Square[i,j].Width:=26;
      Square[i,j].Height:=26;
      Square[i,j].Brush.Color:=Cubedefs.Color[NoCol];
      Square[i,j].Tag:=6;//Nr 6 in palette
      Square[i,j].Parent:=prnt;
      Square[i,j].Left:=2+((j-1) mod 3)*25;
      Square[i,j].Top:=7+((j-1) div 3)*25;
      Square[i,j].Cursor:=1;
      Square[i,j].OnMouseDown:=SquareMouseDown;
    end;
  end;

  //initialize the checkboxes in the pattern editor
  CheckBox[U,1]:=CheckBoxU1;CheckBox[R,1]:=CheckBoxR1;CheckBox[F,1]:=CheckBoxF1;
  CheckBox[D,1]:=CheckBoxD1;CheckBox[L,1]:=CheckBoxL1;CheckBox[B,1]:=CheckBoxB1;
  CheckBox[U,2]:=CheckBoxU2;CheckBox[R,2]:=CheckBoxR2;CheckBox[F,2]:=CheckBoxF2;
  CheckBox[D,2]:=CheckBoxD2;CheckBox[L,2]:=CheckBoxL2;CheckBox[B,2]:=CheckBoxB2;
  CheckBox[U,3]:=CheckBoxU3;CheckBox[R,3]:=CheckBoxR3;CheckBox[F,3]:=CheckBoxF3;
  CheckBox[D,3]:=CheckBoxD3;CheckBox[L,3]:=CheckBoxL3;CheckBox[B,3]:=CheckBoxB3;
  CheckBox[U,4]:=CheckBoxU4;CheckBox[R,4]:=CheckBoxR4;CheckBox[F,4]:=CheckBoxF4;
  CheckBox[D,4]:=CheckBoxD4;CheckBox[L,4]:=CheckBoxL4;CheckBox[B,4]:=CheckBoxB4;
  CheckBox[U,5]:=CheckBoxU5;CheckBox[R,5]:=CheckBoxR5;CheckBox[F,5]:=CheckBoxF5;
  CheckBox[D,5]:=CheckBoxD5;CheckBox[L,5]:=CheckBoxL5;CheckBox[B,5]:=CheckBoxB5;
  ACheckBox[1]:=CheckBoxA1;ACheckBox[2]:=CheckBoxA2;ACheckBox[3]:=CheckBoxA3;
  ACheckBox[4]:=CheckBoxA4;ACheckBox[5]:=CheckBoxA5;

  PatShape1.Cursor:=2;PatShape2.Cursor:=2;PatShape3.Cursor:=2;
  PatShape4.Cursor:=2;PatShape5.Cursor:=2;PatShape6.Cursor:=2;
  PatSelector[1]:=PatShape1;PatSelector[2]:=PatShape2;PatSelector[3]:=PatShape3;
  PatSelector[4]:=PatShape4;PatSelector[5]:=PatShape5;PatSelector[6]:=PatShape6;
  lastSelected:=-1;
  makesTables:=false;
  dirty:=false;
  curFileName:='untitled.txt';//name of last loaded or save file
  Caption:=ExtractFileName(curFilename)+' - '+curVersion;
  checkIsomorphics:=true;//check for isomorphic cubes before adding to Main-Window
  curPatCol:=1;//current color in Pattern Editor
  curFace:=5;//current face to scan
  treshOrange:=20;
  treshYellow:=60;
  treshGreen:=125;
  treshBlue:=220;
  xDist:=5;yDist:=5;
  for i:= Low(redHue) to High(RedHue) do
  begin
    redHue[i]:=9999;orangeHue[i]:=9999;
    redVal[i]:=-1;orangeVal[i]:=-1;
    redSat[i]:=-1;orangeSat[i]:=-1;
  end;
  redRequest:=false;orangeRequest:=false;
  nSampleRed:=0;nSampleOrange:=0;




end;
//+++++++++++++++++++++++End initialize the Form++++++++++++++++++++++++++++++++

//+++++++++++++++++++++++Draw the Facelet Editor++++++++++++++++++++++++++++++++
procedure TForm1.FacePaintPaint(Sender: TObject);
begin
  fCube.DrawCube(0,0);
  FacePaint.Canvas.Brush.Color:= CubeDefs.Color[curCol];
  FacePaint.Canvas.Rectangle(228,150,293,215);
 //FacePaint.Canvas.Rectangle(288,150,293,215);
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++Reset to Empty++++++++++++++++++++++++++++++++++++++++
procedure TForm1.ButtonEmptyClick(Sender: TObject);
begin
  fcube.Empty;


  CenterDlg.Button1Click(nil);
  FacePaint.Invalidate;
end;
//++++++++++++++++++++++++Reset to Clean++++++++++++++++++++++++++++++++++++++++
procedure TForm1.ButtonClearClick(Sender: TObject);
begin
  fcube.Clean;//reset to clean
  CenterDlg.Button1Click(nil);
  FacePaint.Invalidate;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++++++Reset to Random+++++++++++++++++++++++++++++++++++
procedure TForm1.ButtonRandomClick(Sender: TObject);
var c: CubieCube; co: Corner;  ed: Edge;
var one: Extended;
var n1,n2,n3,n3h,n3l,n4,n5 : Int64;

begin

  one:=1;//be sure to use Extended precision

  n1:= Trunc(one*MT_RandNext(ID)/$100000000*40320);
  n2:= Trunc(one*MT_RandNext(ID)/$100000000*2187);
  //n3:= Trunc(one*MT_RandNext(ID)/$100000000*479001600);
  n3h:= Trunc(one*MT_RandNext(ID)/$100000000*22275);//22275*21504=12!
  n3l:= Trunc(one*MT_RandNext(ID)/$100000000*21504);
  n3:= n3h*21504+n3l;
  n4:= Trunc(one*MT_RandNext(ID)/$100000000*2048);
  n5:= Trunc(one*MT_RandNext(ID)/$100000000*4096);
  if (Sender<>nil) and((Sender as TButton).Name= 'ButtonRandomC')
  then  begin n3:=0;n4:=0;n5:=0; end
  else if (Sender<>nil) and ((Sender as TButton).Name= 'ButtonRandomE')
  then  begin n1:=0;n2:=0;n5:=0 end ;
  c:=CubieCube.Create(n1,n2,n3,n4,n5);
  //c:=CubieCube.Create(n1,n2,n3,0,n5);//edge orientation 0 cubes

  if c.CornParityEven <> c.CentParityEven  then
  begin  co:=c.PCorn^[URF].c; c.PCorn^[URF].c:=c.PCorn^[UFL].c; c.PCorn^[UFL].c:=co; end;
  if   c.EdgeParityEven <> c.CornParityEven then
  begin ed:=c.PEdge^[UR].e; c.PEdge^[UR].e:=c.PEdge^[UF].e; c.PEdge^[UF].e:=ed; end;

  fCube.SetFacelets(c);
  FacePaint.Invalidate;
  c.Free;
  CenterDlg.Button1Click(nil);
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++++++++++++++++++Customize Selected Color+++++++++++++++++++++++++++++
procedure TForm1.ButtonCustomizeClick(Sender: TObject);
//var fs: TFileStream;
//const filename = 'colors.cust';//user defined colors are stored here
begin
 ColorDialog.Color:=Cubedefs.Color[curCol];
 if ColorDialog.Execute= true then
 begin
   Cubedefs.Color[curCol]:=ColorDialog.Color;
   case curCol of
     UCol: iniFile.WriteInteger('Color Scheme','UColor',Cubedefs.Color[CurCol]);
     RCol: iniFile.WriteInteger('Color Scheme','RColor',Cubedefs.Color[CurCol]);
     FCol: iniFile.WriteInteger('Color Scheme','FColor',Cubedefs.Color[CurCol]);
     DCol: iniFile.WriteInteger('Color Scheme','DColor',Cubedefs.Color[CurCol]);
     LCol: iniFile.WriteInteger('Color Scheme','LColor',Cubedefs.Color[CurCol]);
     BCol: iniFile.WriteInteger('Color Scheme','BColor',Cubedefs.Color[CurCol]);
     NoCol: iniFile.WriteInteger('Color Scheme','FreeColor',Cubedefs.Color[CurCol]);
   end;

   FacePaint.Invalidate;Output.Invalidate;
 end;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++Change cursor according position on Cube in Pattern Editor+++++++++++
procedure TForm1.FacePaintMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var xr,yr,a,b: Real; s: Integer;
begin
  s:=fCube.size;
  if (x>3*s) and (x<6*s) and (y>9*s) and (y<12*s) then FacePaint.Cursor:=2
  else if (x>12*s) and (x<15*s) and (y>9*s) and (y<12*s) then FacePaint.Cursor:=2
  else if (x>27*s) and (x<30*s) and (y>3*s) and (y<6*s) then FacePaint.Cursor:=2
  else if (x>12*s) and (x<15*s) and (y>18*s) and (y<21*s) then FacePaint.Cursor:=2
  else
  begin
    xr:=x-16*s;
    yr:=y-2*s;
    b:=yr/2;a:=(xr+yr)/3;
    if (a>0) and (a<s)and (b>0) and (b<s) then FacePaint.Cursor:=2
    else
    begin
      xr:=x-20*s;
      yr:=y-7*s;
       b:=(xr+yr)/3;a:=xr/2;
      if (a>0) and (a<s)and (b>0) and (b<s) then FacePaint.Cursor:=2
      else  FacePaint.Cursor:=1;
    end
  end
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

procedure TForm1.ShowCenterDialog;
begin
      //aktuelle Orientierungen übertragen

      case fCube.cenTwist[U] of
        0:CenterDlg.RadioButton1.Checked:=true;
        1:CenterDlg.RadioButton2.Checked:=true;
        2:CenterDlg.RadioButton3.Checked:=true;
        3:CenterDlg.RadioButton4.Checked:=true;
      end;
      case fCube.cenTwist[R] of
        0:CenterDlg.RadioButton5.Checked:=true;
        1:CenterDlg.RadioButton6.Checked:=true;
        2:CenterDlg.RadioButton7.Checked:=true;
        3:CenterDlg.RadioButton8.Checked:=true;
      end;
      case fCube.cenTwist[F] of
        0:CenterDlg.RadioButton9.Checked:=true;
        1:CenterDlg.RadioButton10.Checked:=true;
        2:CenterDlg.RadioButton11.Checked:=true;
        3:CenterDlg.RadioButton12.Checked:=true;
      end;
      case fCube.cenTwist[D] of
        0:CenterDlg.RadioButton13.Checked:=true;
        1:CenterDlg.RadioButton14.Checked:=true;
        2:CenterDlg.RadioButton15.Checked:=true;
        3:CenterDlg.RadioButton16.Checked:=true;
      end;
      case fCube.cenTwist[L] of
        0:CenterDlg.RadioButton17.Checked:=true;
        1:CenterDlg.RadioButton18.Checked:=true;
        2:CenterDlg.RadioButton19.Checked:=true;
        3:CenterDlg.RadioButton20.Checked:=true;
      end;
      case fCube.cenTwist[cubedefs.B] of
        0:CenterDlg.RadioButton21.Checked:=true;
        1:CenterDlg.RadioButton22.Checked:=true;
        2:CenterDlg.RadioButton23.Checked:=true;
        3:CenterDlg.RadioButton24.Checked:=true;
      end;
      ButtonU.Enabled:=false;ButtonR.Enabled:=false;ButtonF.Enabled:=false;
      ButtonD.Enabled:=false;ButtonL.Enabled:=false;ButtonB.Enabled:=false;
      ButtonAddSolve.Enabled:=false; ButtonAddGen.Enabled:=false;
      CenterDlg.Show;
end;


//+++++++++++++Change the color of the facelets in the Facelet Editor+++++++++++
procedure TForm1.FacePaintMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
label ende,noChange;
var xr,yr,a,b: Real;fc: Face;
begin
  xr:=x/fCube.size-15;
  yr:=y/fCube.size;
  b:=yr/2;a:=(xr+yr)/3;
  if (a>0) and (a<3) and (b>0) and (b<3) then
  begin
    fc:=Face(3*Floor(b)+Floor(a)); //U-face facelet
    goto ende;
  end;
  xr:=x/fCube.size-18;
  yr:=y/fCube.size-6;
  b:=(xr+yr)/3;a:=xr/2;
  if (a>0) and (a<3) and (b>0) and (b<3) then
  begin
      fc:=Face(3*Floor(b)+Floor(a)+9); //R-face facelet
      goto ende;
  end;
  xr:=x/fCube.size;
  yr:=y/fCube.size-6;
  b:=yr/3;a:=xr/3;
  if (a>0) and (a<3) and (b>0) and (b<3) then
  begin
      fc:=Face(3*Floor(b)+Floor(a)+36);//L-face facelet
      goto ende;
  end;
  xr:=x/fCube.size-9;
  yr:=y/fCube.size-6;
  b:=yr/3;a:=xr/3;
  if (a>0) and (a<3) and (b>0) and (b<3) then
  begin
      fc:=Face(3*Floor(b)+Floor(a)+18);//F-face facelet
      goto ende;
  end;
  xr:=x/fCube.size-9;
  yr:=y/fCube.size-15;
  b:=yr/3;a:=xr/3;
  if (a>0) and (a<3) and (b>0) and (b<3) then
  begin
      fc:=Face(3*Floor(b)+Floor(a)+27);//D-face  facelet
      goto ende;
  end;
  xr:=x/fCube.size-24;
  yr:=y/fCube.size;
  b:=yr/3;a:=xr/3;
  if (a>0) and (a<3) and (b>0) and (b<3) then
  begin
      fc:=Face(3*Floor(b)+Floor(a)+45);//B-face
      goto ende;
  end;
  goto noChange;
ende:
  if (fc<>U5) and  (fc<>R5) and (fc<>F5) and (fc<>D5) and (fc<>L5) and (fc<>B5)then
  begin
    if Button=mbLeft then//set a color
    begin
      if (ssShift in Shift) then //markiere dass Orientierung unwichtig
      begin
       fCube.PFace^[fc]:= ColorIndex(Ord(curCol)+7);
      end
      else if (ssCtrl in Shift) then
      begin
       fCube.PFace^[fc]:= oriCol;
      end
      else
      begin
        fCube.PFace^[fc]:= curCol;

      end;
      if ColorCheck.Checked then
       fCube.Check(fc,false);   //manueller Modus
      fCube.DrawCube(0,0);
      FacePaint.Invalidate;
    end
    else//clear a color
    begin
      fCube.PFace^[fc]:= noCol;
      fCube.DrawCube(0,0);
      FacePaint.Invalidate;
    end;
  end
  else
    if Button=mbleft then
    begin
      curCol:= fCube.PFace^[fc];
      FacePaint.Invalidate;
    end
    else if fCube.isOriented then ShowCenterDialog;

noChange:
end;
//++++++++++End Change the color of the facelets in the Facelet Editor++++++++++


//+++++++++++++++++++++++++++++Add and Solve++++++++++++++++++++++++++++++++++++
procedure TForm1.ButtonAddSolveClick(Sender: TObject);
var isSolver:Boolean;i:Face;
    k: Corner; k1: Edge; n,m,t: Integer;
    checkOK: Boolean;
begin

 checkOK:=true;
 for i:= U1 to B9 do
 begin
   if (i=U5) or  (i=R5) or(i=F5) or(i=D5) or(i=L5) or(i=B5) then continue;
   if not fCube.Check(i,true) then checkOK:= false;
 end;
 fCube.DrawCube(0,0);
 FacePaint.Invalidate;
 if not checkOK then
 begin
   Application.MessageBox(PChar(Err[32]),'Facelet Editor',MB_ICONWARNING);
   exit;
 end;
//diesen code verfeinern, um auch unvollständige Würfel zu behandeln
 for k:= URF to DRB do
 begin
   m:=0;t:=0;
   for n:=0 to 2 do
   begin
     if (fCube.PFace^[CF[k,n]]=NoCol) then Inc(m)
     else if (fCube.PFace^[CF[k,n]]<>OriCol) then Inc(t)   //echte Farbe
   end;
   if (t>0) and (m>0) then
   begin
     Application.MessageBox(PChar(Err[13]),'Facelet Editor',MB_ICONWARNING);
     exit;
   end;
 end;
 for k1:= UR to BR do
 begin
   m:=0;t:=0;
   for n:=0 to 1 do
   begin
     if (fCube.PFace^[EF[k1,n]]=NoCol) then Inc(m)
     else if (fCube.PFace^[EF[k1,n]]<>OriCol) then Inc(t)   //echte Farbe
   end;
   if (t>0) and (m>0) then
   begin
     Application.MessageBox(PChar(Err[13]),'Facelet Editor',MB_ICONWARNING);
     exit;
   end;
 end;


 for i:= U1 to B9 do
 if fCube.PFace^[i]>=NoCol then //Suche nach unvollständigen Würfeln
 begin
   SearchIncomplete;
   exit;
 end;
 if Sender=ButtonAddSolve then isSolver:=true
 else isSolver:=false;
 AddCube(fCube,isSolver,true,true,0,fCube.isOriented);
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

procedure TForm1.SearchIncomplete;
var cCube: CubieCube; i: Corner; k: Edge;
    cornerComplete: Boolean;
    hasCorners, hasEdges, hasDFace: Boolean;
    n: Integer;  s: String;
    t: TurnAxis;
begin
  if incoIsRunning then
  begin
    Application.MessageBox('Stop the running search first!','Facelet Editor',MB_ICONWARNING);
    exit;
  end;

  cCube:= CubieCube.Create(fCube);
  cornerComplete:= true;
  for i:=URF to DRB do if (cCube.PCorn^[i].c=NNN) or (cCube.PCorn^[i].o=6) then cornerComplete:= false;

  hasCorners:=false; hasEdges:=false;
  n:=0;
  for i:=URF to DRB do
  begin
    if (cCube.PCorn^[i].c=DFR) then Inc(n);
    if (cCube.PCorn^[i].c=DLF) then Inc(n);
    if (cCube.PCorn^[i].c=DBL) then Inc(n);
    if (cCube.PCorn^[i].c=DRB) then Inc(n);
  end;
  if n=4 then hasCorners:=true;
  n:=0;
  for k:=UR to BR do
  begin
    if (cCube.PEdge^[k].e=DR) and (cCube.PEdge^[k].o<>6) then Inc(n);
    if (cCube.PEdge^[k].e=DF) and (cCube.PEdge^[k].o<>6) then Inc(n);
    if (cCube.PEdge^[k].e=DL) and (cCube.PEdge^[k].o<>6) then Inc(n);
    if (cCube.PEdge^[k].e=DB) and (cCube.PEdge^[k].o<>6) then Inc(n);
  end;
  if n=4 then hasEdges:=true;
  hasDFace:= hasCorners and HasEdges;

  if cCube.isOriented then
  begin
    Incomplete.UTwist.Enabled:=true;
    Incomplete.RTwist.Enabled:=true;
    Incomplete.FTwist.Enabled:=true;
    Incomplete.DTwist.Enabled:=true;
    Incomplete.LTwist.Enabled:=true;
    Incomplete.BTwist.Enabled:=true;
  end
  else
  begin
    Incomplete.UTwist.Enabled:=false;
    Incomplete.RTwist.Enabled:=false;
    Incomplete.FTwist.Enabled:=false;
    Incomplete.DTwist.Enabled:=false;
    Incomplete.LTwist.Enabled:=false;
    Incomplete.BTwist.Enabled:=false;
  end;
  cCube.Free;
  Incomplete.Show;

  if cornerComplete and hasDFace then inco:=IncompSearch.Create(BOTHACCELS,SearchMode)
  else if cornerComplete then inco:=IncompSearch.Create(EIGHTCORN,SearchMode)
  else if hasDFace then inco:=IncompSearch.Create(DFACE,SearchMode)
  else inco:=IncompSearch.Create(DEFAULT,SearchMode);
    //set the filter variables
  with Incomplete do
  begin
  // if FFilter.Checked or DFilter.Checked or LFilter.Checked or  BFilter.Checked
  // then inco.filter:=true else inco.filter:= false;
  end;
  for t:= U to Fs do
  begin
    inco.excludeAxis[t]:=false;
    //inco.excludeAxisRot[t]:=false;
  end;
  with Incomplete do
  begin
    //if FFilter.Checked then  inco.excludeAxisRot[F]:=true;//für den Fall dass
    //if DFilter.Checked then  inco.excludeAxisRot[D]:=true;//Rotationen
    //if LFilter.Checked then  inco.excludeAxisRot[L]:=true;//erlaubt sind
    //if BFilter.Checked then  inco.excludeAxisRot[B]:=true;
  end;
  with Incomplete do
  begin
    if FFilter.Checked then  inco.excludeAxis[F]:=true;
    if DFilter.Checked then  inco.excludeAxis[D]:=true;
    if LFilter.Checked then  inco.excludeAxis[L]:=true;
    if BFilter.Checked then  inco.excludeAxis[B]:=true;
  end;
  inco.ignoreTwists:=0;
  with Incomplete do
  begin
    if UTwist.Checked then  inco.ignoreTwists:=inco.ignoreTwists or $C00;
    if RTwist.Checked then  inco.ignoreTwists:=inco.ignoreTwists or $300;
    if FTwist.Checked then  inco.ignoreTwists:=inco.ignoreTwists or $C0;
    if DTwist.Checked then  inco.ignoreTwists:=inco.ignoreTwists or $30;
    if LTwist.Checked then  inco.ignoreTwists:=inco.ignoreTwists or $C;
    if BTwist.Checked then  inco.ignoreTwists:=inco.ignoreTwists or $3;
  end;
  inco.ignoreTwists:= (not inco.ignoreTwists) and $fff;//Maske mit Wert 0 für zu
  //ignorierende Twists


  incoIsRunning:=true;
  Incomplete.BClear.Enabled:= false;
  Incomplete.BStop.Enabled:=true;
  case inco.iCase of
  DFACE: s:= 'Using D-Face accelerator table.';
  EIGHTCORN:  s:= 'Using 8-corner accelerator table.';
  BOTHACCELS:  s:= 'Using 8-corner and D-Face accelerator tables.';
  DEFAULT: s:= 'Cannot use any accelerator table.';
  end;
  Incomplete.ManInfo.Lines.Add(s);
  Incomplete.ManInfo.Lines.Add('computation started...');
  Incomplete.ManInfo.Lines.Add('');
  inco.Resume;
end;
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


//++++++++++++++++++++Add the Cube to the Main Window+++++++++++++++++++++++++++
procedure TForm1.AddCube(f: FaceletCube;isSolver,startSearch,askIsomorphics:Boolean;pType:Integer;isOriented:Boolean);
//isSolver true: generate Solver
//startSearch true: Automatically start search after adding
//askIsomorphics true: Ask if an isomorphic cube should be added
//checkisomorphics: global definiert!
var hi,j:Integer;i:Face;
begin

{$IF QTM}
 if slicemode then startsearch:=false;  //QTM unterstützt den two phase alg nicht für stm
{$IFEND}

 if checkIsomorphics and askIsomorphics then
 for j:= 0 to fcN-1 do
   if f.IsIsomorphic(fc[j],false,false,IsoInvInclude.Checked) then
   if Application.MessageBox(PChar('Cube '+IntToStr(j+1)+' is isomorphic to the Cube you want to add. Proceed?'),'Maneuver Window',MB_ICONWARNING or MB_YESNO)
   <>IDYES then exit else break;
 {
 if (Serversocket1.Active) and (fcN>maxCubes)
 and (RunPatButton.Caption='Start Search') and (BrunSym.Caption='Start Search')


  then  //this code may be instable!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 begin
   ButtonAddSolve.Enabled:=false;
   sleep((minTime+2)*1000);//should finish other jobs im most times
   for j:= 0 to fcN-1 do fc[j].selected:=true;
   DeleteSelectedCubes;
   sleep(2000);
   ButtonAddSolve.Enabled:=true;
 end;
 }
 if checkIsomorphics and not askIsomorphics then
 for j:= 0 to fcN-1 do
 begin
   if j mod 1000 = 999 then Application.ProcessMessages;
   if f.IsIsomorphic(fc[j],false,false,IsoInvInclude.Checked) then exit;
 end;
 if  not isOriented then
 fc[fcN]:= FaceletCube.Create(f,buf.Canvas,LBORD,fcN*CSIZE*27+UBORD,CSIZE,pType)
 else
 fc[fcN]:= FaceletCube.Create(f,buf.Canvas,LBORD,fcN*CSIZE*27+UBORD,CSIZE,pType,f.cenTwist);

 if startSearch then fc[fcN].running:=true else fc[fcN].running:=false;
 if isSolver then fc[fcN].solver:=true
 else fc[fcN].solver:=false;
 dirty:=true;
 Inc(fcN);
 h:=Max(Output.Height+yOffset,CSIZE*27*fcN+2*UBORD);
 SbVert.Position:= Round(yOffset/Max(1,(h-OutPut.Height))*SbVert.Max);
 if (h-OutPut.Height>0)then
   begin
   SbVert.SmallChange:=Max(Min(32767,Round(27.0*CSIZE*SbVert.Max/(h-OutPut.Height)/10)),1);
   SbVert.LargeChange:= Max(Min(32767,Round(0.95*Output.Height*SbVert.Max/(h-OutPut.Height))),1);
 end
 else begin SbVert.SmallChange:=1; SbVert.LargeChange:=1;end;
 hi:=High(fc);
 if fcN>High(fc) then SetLength(fc,hi+10);
 Output.Invalidate;
 if startSearch then  
 begin
   for i:=U1 to B9 do //need a copy if we want to restore
   fc[fcN-1].faceOrig[i]:= f.PFace^[i];
   fc[fcN-1].tripSearch:=TripleSearch.Create(fc[fcN-1]);
   (fc[fcN-1].tripSearch as TripleSearch).NextSolution;
 end;
end;
//++++++++++++++++++End Add the Cube to the Main Window+++++++++++++++++++++++++

//++++++++++++++++++++++++++Paint the Main Windows++++++++++++++++++++++++++++++
procedure TForm1.OutputPaint(Sender: TObject);
var i,low,high,diff,outX,outy: Integer;s:String;
begin
  outX:=Output.ClientWidth;//write on Tbitmap buf and copy to Output
  outY:=Output.ClientHeight;
  buf.Width:=outX;
  buf.Height:=outY;
  buf.Canvas.FillRect(Rect(0,0,outX,outY));
  if fcN=0 then
  begin
    for i:= 0 to MAXNUM do
    begin
      ButRun[i].visible:=false;
      ButSolve[i].visible:=false;
      EdName[i].visible:=false;
      OptBox[i].visible:=false;
    end;
    Output.Canvas.CopyRect(Rect(0,0,outX,outY),buf.Canvas,Rect(0,0,outX,outY));
    exit;
  end;
  low:=Min(Max((yOffset-UBORD) div (27*CSIZE),0),fcN-1);
  high:=Min(Max((yOffset-UBORD+buf.Height) div (27*CSIZE),0),fcN-1);

  for i:=low to high do
  begin
    fc[i].DrawCube(xOffset,yOffset);
    buf.Canvas.Brush.Color:=clWindow;
    buf.Canvas.TextOut(3-xOffset,i*CSIZE*27+UBORD-yOffset,IntToStr(i+1)+'.');
    buf.Canvas.TextOut(103-xOffset,i*CSIZE*27+UBORD-yOffset+60,'Pattern Name:');

    if fc[i].selected then
    with buf.Canvas do
    begin
      MoveTo(-xOffset+LBORD-2,i*CSIZE*27+UBORD-yOffset-2);
      LineTo(-xOffset+33*CSIZE+LBORD+2,i*CSIZE*27+UBORD-yOffset-2);
      LineTo(-xOffset+33*CSIZE+LBORD+2,i*CSIZE*27+CSIZE*24+UBORD-yOffset+2);
      LineTo(-xOffset+LBORD-2,i*CSIZE*27+CSIZE*24+UBORD-yOffset+2);
      LineTo(-xOffset+LBORD-2,i*CSIZE*27+UBORD-yOffset-2);
    end;

    if fc[i].runOptimal then
    begin
      if fc[i].solver  then s:=fc[i].optManeuver else s:=fc[i].InverseOptManeuver;
        buf.Canvas.TextOut(160-xOffset,i*CSIZE*27+UBORD-yOffset+24,s)
    end
    else
    begin
      if fc[i].solver then s:=fc[i].maneuver else s:=fc[i].InverseManeuver;
        buf.Canvas.TextOut(160-xOffset,i*CSIZE*27+UBORD-yOffset+24,s)
    end;
    diff:=i-low;
    ButRun[diff].Top:= i*CSIZE*27+UBORD+60-yOffset-2;
    ButRun[diff].Visible:=true;
    ButRun[diff].Tag:=i;
    ButRun[diff].Left:=410-xOffset;

    ButSolve[diff].Top:= i*CSIZE*27+UBORD-yOffset;
    ButSolve[diff].Tag:=i;
    ButSolve[diff].Left:=220-xOffset;

    EdName[diff].Top:= i*CSIZE*27+UBORD+60-yOffset;
    EdName[diff].Tag:=i;
    EdName[diff].Text:=fc[i].patName;
    EdName[diff].Left:=180-xOffset;
    ButSolve[diff].Visible:=true;
    EdName[diff].Visible:=true;
    OptBox[diff].Top:= i*CSIZE*27+UBORD+60-yOffset;
    OptBox[diff].Visible:=true;
    OptBox[diff].Tag:=i;
    OptBox[diff].Checked:=fc[i].runOptimal;
    OptBox[diff].Left:=350-xOffset;
    If fc[i].runOptimal then
    begin
      OptBox[diff].ShowHint:=true;
      OptBox[diff].Hint:=fc[i].hintInfo;
    end
    else
    begin
      OptBox[diff].ShowHint:=false;
    //  OptBox[diff].ShowHint:=true;
    //  OptBox[diff].Hint:=fc[i].addInfo;
    end;

   if (lowOld<>low) or (highOld<>high) then
   begin
   if fc[i].running then ButRun[diff].Glyph:=BMStop
      else
      ButRun[diff].Glyph:=BMRun;

   end;
    if fc[i].solver then ButSolve[i-low].Caption:= 'Solver:'
      else ButSolve[diff].Caption:= 'Generator:'
  end;
  lowOld:=low;highOld:=high;

  for i:= high-low+1 to MAXNUM do
  begin
    ButRun[i].Visible:=false;
    ButRun[i].Tag:=-1;
    ButSolve[i].Visible:=false;
    EdName[i].Visible:=false;
    OptBox[i].Visible:=false;
  end;
  Output.Canvas.CopyRect(Rect(0,0,outX,outY),buf.Canvas,Rect(0,0,outX,outY));
end;
//++++++++++++++++++++++End Paint the Main Windows++++++++++++++++++++++++++++++

//++++++++++++++++Scroll Main Window horizontally+++++++++++++++++++++++++++++++
procedure TForm1.SbHorScroll(Sender: TObject; ScrollCode: TScrollCode;
  var ScrollPos: Integer);
var hdiff:Integer;
begin
  hdiff:=HORSIZE-Output.Width;
  if hdiff>0 then
  begin
    xOffset:= Round(SbHor.Position/SbHor.Max*(HORSIZE-Output.Width));
    Output.Invalidate;
  end
   else begin xOffset:=0;SbHor.Position:=0;end;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++++++++++++++Scroll Main Window vertically++++++++++++++++++++++++++++
procedure TForm1.SbVertScroll(Sender: TObject; ScrollCode: TScrollCode;
  var ScrollPos: Integer);
begin
  if (h-Output.Height>0)  then
  begin
    yOffset:= Round(ScrollPos/SbVert.Max*(h-Output.Height));
    Output.Invalidate;
    SbHor.Invalidate;//some strange effects else
  end
   else begin yOffset:=0;SbVert.Position:=0;end;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++++++++++++++++++++Resize Main Form+++++++++++++++++++++++++++++++++++
procedure TForm1.FormResize(Sender: TObject);
begin
  SbVert.Left:=PageCtrl.Left-17;
  SbVert.Top:= PageCtrl.Top;
  SbVert.Height:=ClientHeight-17;
  SbHor.Left:=0;
  SbHor.Top:= ClientHeight-17;
  SbHor.Width:=PageCtrl.Left-17;
  Panel1.Left:=0;
  Panel1.Top:=SbVert.Top;;
  Panel1.Height:=ClientHeight-17;
  Panel1.Width:=SbHor.Width;
  OutPut.Height:=Panel1.Height-1;

  h:=Max(Output.Height+yOffset,CSIZE*27*fcN+2*UBORD);
  SbVert.Position:= Round(yOffset/Max(1,(h-OutPut.Height))*SbVert.Max);

 if (h-OutPut.Height>0)then
   begin
   SbVert.SmallChange:=Max(Min(32767,Round(27.0*CSIZE*SbVert.Max/(h-OutPut.Height)/10)),1);
   SbVert.LargeChange:= Max(Min(32767,Round(0.95*Output.Height*SbVert.Max/(h-OutPut.Height))),1);
 end
 else begin SbVert.SmallChange:=1; SbVert.LargeChange:=1;end;


end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++++++Handler for clicking on Run Button im Main Window++++++++++++++++
procedure TForm1.ButClick(Sender: TObject);
var i:Face; freeCol:Integer;
  tg:Integer;
begin
 tg:= TSpeedButton(Sender).Tag;
 {$If QTM}
   if slicemode and  not fc[tg].runOptimal then begin  Application.MessageBox('Use the optimal solver for QTM with slice turns allowed!','Maneuver Window'); exit; end;
{$IFEND}
 freeCol:=0;//check how many facelets of the corner are free
 for i:=U1 to B9 do if fc[tg].PFace^[i]=NoCol then Inc(freeCol);
 if freeCol>0 then begin Application.MessageBox(PChar(Err[28]),'Maneuver Window'); exit; end;

 if fc[tg].running then
 begin
   if fc[tg].runOptimal then
   begin
     OptimalSearch(fc[tg].optSearch).Kill;
     fc[tg].optStopTime:=Now;
   end
   else TripleSearch(fc[tg].tripSearch).Kill;
   TSpeedButton(Sender).Glyph:=BMRun;
 end
 else
 begin
   if (fc[tg].runOptimal)
     and (Pos('*',fc[tg].optManeuver)<>0) then//Maneuver already is optimal
     if Application.MessageBox(PChar(Err[4]),'Maneuver Window',MB_YESNO)=IDNO then exit;
   if fc[tg].runOptimal then
   begin
     if (fc[tg].optSearch=nil) then
     begin
       fc[tg].optSearch:=OptimalSearch.Create(fc[tg]);
       fc[tg].optStartTime:=Now;
       fc[tg].optIdleTime:=0;
     end
     else fc[tg].optIdleTime:= fc[tg].optIdleTime + (now-fc[tg].optStopTime);
     (fc[tg].optSearch as OptimalSearch).NextSolution
   end
   else
   begin
     if (fc[tg].tripSearch=nil) then
     begin
       for i:=U1 to B9 do fc[tg].faceOrig[i]:= fc[tg].PFace^[i];
       fc[tg].tripSearch:=TripleSearch.Create(fc[tg]);
     end;
     if (fc[tg].tripSearch as TripleSearch).length=-1 then //no better solution
     begin
       Application.MessageBox(PChar(Err[5]),'Maneuver Window',MB_ICONWARNING);
       exit;
     end
     else
       (fc[tg].tripSearch as TripleSearch).NextSolution;
   end;
   fc[tg].running:=true;
   TSpeedButton(Sender).Glyph:=BMStop;
 end;
end;
//+++++++++++End Handler for clicking on Run Button im Main Window++++++++++++++

//+++++++++++++++++++++Toggle between Solver and Generator++++++++++++++++++++++
procedure TForm1.ButSolveClick(Sender: TObject);
begin
 with Sender as TSpeedButton do
 begin
   if fc[Tag].solver=true then fc[Tag].solver:=false
   else fc[Tag].solver:=true;
   Output.Invalidate;
 end;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++++Edit the patternname++++++++++++++++++++++++++++++++
procedure TForm1.EdnameChange(Sender: TObject);
begin
  if fc[(Sender as TEdit).Tag]<>nil then fc[(Sender as TEdit).Tag].patName:=(Sender as TEdit).Text;
//  with Sender as TEdit do fc[Tag].patName:=Text;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++Find next Two-Phase-Solution++++++++++++++++++++++++++++
procedure TForm1.DoNextSearch(var Message: TMessage);
begin
  TripleSearch(Message.LParam).NextSolution;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++Start Search in the Pattern Editor++++++++++++++++++++++++
procedure TForm1.RunPatButtonClick(Sender: TObject);
var i:TurnAxis;j:Integer;
begin
   if RunPatButton.Caption='Start Search' then
   begin
     RunPatButton.Caption:='Stop Search';
     CheckBoxContinuous.Enabled:=false;
     PatClear.Enabled:=false;
     for i:= U to B do
     for j:= 1 to 5 do
       CheckBox[i,j].Enabled:=false;
     for j:= 1 to 5 do ACheckBox[j].Enabled:=false;

     ps:=PatSearch.Create;
 //    ps.FreeOnTerminate:=true;
     ps.OnTerminate:= PatSearchTerminate;
//     ps.Priority := tpLower;//increase responsibility
     ps.Resume;
   end
   else ps.Terminate;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++Click the Optimal Box in the Main Window++++++++++++++++++
procedure TForm1.OptBoxClick(Sender: TObject);
begin
   with Sender as TCheckBox do
   begin
     fc[Tag].runOptimal:=Checked;
     if not Checked and (fc[Tag].optSearch<>nil) then OptimalSearch(fc[Tag].optSearch).Kill
     else if checked and  (fc[Tag].tripSearch<>nil) then TripleSearch(fc[Tag].tripSearch).Kill;
     if not Checked and (Pos('*)',fc[Tag].optManeuver)>0) then
        begin Checked:=True; fc[Tag].runOptimal:=Checked;end;
  end;
  Output.Invalidate;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++++Called when Optimal Solver enters next searching depth+++++++++++++++
procedure TForm1.ShowNextLevel(var Message: TMessage);
var ia:Ida;d,i,x1,x2,k:Integer; d1,s,ret:String;

tt:TDateTime;

begin
  ia:=Ida(Message.wParam);
  d:=Message.lParam;
  x1:=d; if x1>=100 then x1:=x1-98;//Sonderfall
  for i:=0 to fcN-1 do
  if fc[i].optSearch<>nil
  then
  if (OptimalSearch(fc[i].optSearch).idaU=ia)
     and (Pos('Status:',fc[i].optManeuver)<>0) and (d>8)
  then
  begin
    ret:=Chr(13);
    if d>99 then d1:= Format('depth %2.2d: ',[d-99])else  //solution found
      d1:= Format('depth %2.2d: ',[d-1]);
    if (Pos(d1,fc[i].hintInfo)=0)  then //prevent duplicates
    begin
      if fc[i].hintInfo='' then// ret:='' else ret:=Chr(13);
      begin
        if not USES_BIG then
          fc[i].hintInfo:='Pruning Table Start Values: '
          +IntToStr(ia.n[0].UDPrun)+' '+IntToStr(ia.n[0].RLPrun)+' '+IntToStr(ia.n[0].FBPrun)
        else
          fc[i].hintInfo:='Pruning Table Start Values: '
          +IntToStr(ia.n[0].UDPrunBig)+' '+IntToStr(ia.n[0].RLPrunBig)+' '+IntToStr(ia.n[0].FBPrunBig);
      end;
      tt:=Now-fc[i].optStartTime-fc[i].optIdleTime;
      fc[i].hintInfo:=fc[i].hintInfo+ret+ d1+Format('%3.1f s ',[tt*24*60*60])
                 +' nodes: ' + IntToStr(ia.n[x1-1].nodenum);
     end;                                  

    if d>99 then exit; 

    s:= fc[i].maneuver;
    x1:=Pos('(',s);//extract maneuver length
    x2:=Pos(')',s);
    if (x1<>0) and (x2<>0) and (Pos(manSep+')',s)<>0) then
    begin
      d1:=Copy(s,x1+1,x2-x1-2);//-2 because of s/f/q/sq
      k:=StrToIntDef(d1,-1);
      if k=-1 then//am Schluss dann ein s von sq
       d1:=Copy(s,x1+1,x2-x1-3);
      if StrToInt(d1)<=d then    //use 2 phase solution if shorter
      begin
        s:=trim(s);
        Insert('*',s,Length(s));
        fc[i].optManeuver:=s;
        OptimalSearch(fc[i].optSearch).Kill;
        exit;
      end
    end;

    fc[i].optManeuver:='Status: Searching depth ' + IntToStr(d) + '...';
    Output.Invalidate;
  end;//if
end;
//+++++++++End Called when Optimal Solver enters next searching depth+++++++++++

//++++++++++++++++Click on About Menu Item++++++++++++++++++++++++++++++++++++++
procedure TForm1.About1Click(Sender: TObject);
begin
  AboutForm.Show;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++++Click on Two-Phase Algorithm Options+++++++++++++++++++++++++++++++
procedure TForm1.TwoPhaseAlgorithm1Click(Sender: TObject);
begin
  OptionForm.Show;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++++++++++++++++Click on Save Maneuvers++++++++++++++++++++++++++++++++
procedure TForm1.SaveWorkspace1Click(Sender: TObject);
var i,j:Integer; fs: TFileStream; s,delim:String;
begin
  if curFileName<>'' then SDWorkSpace.FileName:=curFileName;
  if SDWorkspace.Execute= true then
  begin
    fs := TFileStream.Create(SDWorkSpace.FileName, fmCreate);
    curFileName:= SDWorkSpace.FileName;
    for i:= 0 to fcN-1 do
    begin
      with fc[i] do
      begin
        if (Length(optManeuver)>0) and (Pos('Status',optManeuver)=0)
        and (Pos('flow',optManeuver)=0) then
        begin
          if Length(patName)>0 then delim:='   //' else delim:=' ';
          s:=InverseOptManeuver+delim+patName+''#13#10'';
           {$IF SPECIAL4}  //für den 4x4x4 solver
               s:=OptManeuver+delim+patName+''#13#10'';
               s:= StringReplace(s,'M','m',[rfReplaceAll]);
               s:= StringReplace(s,'E','e',[rfReplaceAll]);
               s:= StringReplace(s,'S','s',[rfReplaceAll]);
           {$IFEND}
          fs.WriteBuffer(PChar(s)^,Length(s));
        end
        else
        if (Length(maneuver)>0) then
        begin
          if Length(patName)>0 then delim:='   //' else delim:=' ';
          s:=InverseManeuver+delim+patName+''#13#10''; //Generator speichern
          {$IF SPECIAL4}  //für den 4x4x4 solver
               s:=maneuver+delim+patName+''#13#10'';
               s:= StringReplace(s,'M','m',[rfReplaceAll]);
               s:= StringReplace(s,'E','e',[rfReplaceAll]);
               s:= StringReplace(s,'S','s',[rfReplaceAll]);
           {$IFEND}
          fs.WriteBuffer(PChar(s)^,Length(s));
        end
        else
        if (Length(maneuver)=0) then //save in Singmaster notation
        begin
          s:='';
          for j:=0 to 47 do
          begin
            case PFace^[SingmasterToFace[j]] of
              UCol: s:=s+'U';
              RCol: s:=s+'R';
              FCol: s:=s+'F';
              DCol: s:=s+'D';
              LCol: s:=s+'L';
              BCol: s:=s+'B';
              NoCol: s:=s+'N';
            end;
            if (j<24) and odd(j) then s:=s+' ';
            if  (j>24) and (j mod 3=2) then s:=s+' ';
          end;
          if Length(patName)>0 then delim:='   //' else delim:=' ';
         // s:=s+''#13#10'';
          s:=s+delim+patName+''#13#10'';
          fs.WriteBuffer(PChar(s)^,Length(s));
        end
      end
    end;
    fs.Free;
  end;
  dirty:=false;
  Caption:=ExtractFileName(curFilename)+' - '+curVersion;
end;
//++++++++++++++++++++End click on Save Maneuvers+++++++++++++++++++++++++++++++

//++++++++++++++++++++Click on Load Maneuvers++++++++++++++++++++++++++++++++++
procedure TForm1.LoadWorkspace1Click(Sender: TObject);
var i,j,ret,todoChars,addCount,mvs:Integer; fs: TFileStream; buf,cubeMan,s: String;
    f:FaceletCube;
    chktemp: boolean;
label load;
begin
  if curFileName<>'' then ODWorkSpace.FileName:=curFileName;
  if ODWorkspace.Execute= true then//Load File Dialog executed
  begin
    fs := TFileStream.Create(ODWorkSpace.FileName, fmOpenRead);
    curFileName:= ODWorkSpace.FileName;
    if fcN>0 then//at least one cube in Main Window
    begin
      ret:=Application.MessageBox(PChar(Err[12]),'',MB_ICONWARNING or MB_YESNOCANCEL);
      if ret=IDCANCEL then begin fs.free; exit; end;
      if ret = IDNO then goto load;
    end;
    addCount:=0;
    for i:=0 to fcN-1 do
    with fc[i] do
    begin
      if (Length(maneuver)=0) and (Length(optManeuver)=0) then
      begin
        if Application.MessageBox(PChar(Err[6]),'Maneuver Window',MB_ICONWARNING or MB_YESNO)
         <>IDYES then begin fs.free;exit;end;
      end;
    end;
    for i:=0 to fcN-1 do
    with fc[i] do
    begin
      if optSearch<>nil then (optSearch as OptimalSearch).Kill;
      if tripSearch<>nil then (tripSearch as TripleSearch).Kill;
    end;
    for j:= 0 to 1000 do //app might crash if we free before killing thread
      Application.ProcessMessages;//allow the notify procedures to work
    for i:=0 to fcN-1 do
    with fc[i] do
    begin
      if optSearch<>nil then (optSearch as OptimalSearch).idaU.Free;
      if tripSearch<>nil then
      begin
        (tripSearch as TripleSearch).idaU.Free;
        (tripSearch as TripleSearch).idaR.Free;
        (tripSearch as TripleSearch).idaF.Free;
      end;
    end;
    for i:= 0 to fcN-1 do fc[i].Free;
    fcN:=0;
    lowOld:=-1;
    lastSelected:=-1;
    dirty:=false;
    for i:= 0 to MAXNUM do
    begin
      ButRun[i].Visible:=false;
      ButRun[i].Tag:=-1;
      ButSolve[i].Visible:=false;
      EdName[i].Visible:=false;
      OptBox[i].Visible:=false;
    end;
    OutPut.Invalidate;
load:
    Caption:='loading, press ESC to cancel... '+ExtractFileName(curFilename)+' - '+curVersion;
    escPressed:=false;
    todoChars:= fs.Size;
    i:=1;
    SetLength(buf,300);//sollte für ein Maneuver reichen
    while todoChars>0 do
    begin
      if i=300 then
      begin
        Application.MessageBox(PChar('No valid Input. Loading aborted.'),'');
        fs.Free;
        Caption:=ExtractFileName(curFilename)+' - '+curVersion;
        Exit;
      end;
      fs.ReadBuffer(buf[i],1); //unix endzeichen #10, windows #13#10
      Dec(todoChars);
      if buf[i]=#13 then continue;
      if (buf[i]=#10) or (todoChars=0) then
      begin
        if (i=1) and (buf[i]=#10) then continue;//neu
        if (buf[i]=#10) then cubeMan:= Copy(buf,0,i-1)
          else cubeMan:= Copy(buf,0,i);
      f:=FaceletCube.Create(Output.Canvas);//nur default Konstruktor
      s:= cubeMan;
      if Pos('//',s)>0 then
        begin
           f.patName:=Trim(Copy(s,Pos('//',s)+2,Length(s)));//all after '   ' is patName
           s:= Trim(Copy(s,1,Pos('//',s)-1));
        end;
      if Pos('*)',s)>0 then //optimales Maneuver
      begin
        f.optManeuver:=Copy(s,1,Pos('*)',s)+1);  //Dies ist erstmal ein Generator
        DoManeuverstring(f,f.OptManeuver,mvs); //Diese Routine sollte immer benutzt werden!!!!
        f.optManeuver:=f.InverseOptManeuver;//jetzt einen Solver draus machen
        if (Length(mansep)=1) and (s[Pos('*)',s)-1]=manSep)
         or (Length(mansep)=2){also sq} and (s[Pos('*)',s)-2]=manSep[1]) //
         then//die gleiche Metrik?
        begin
          f.runOptimal:=true;
          f.optLength:=mvs;
          f.phase2Length:=MAXNODES;//we have no 2-phase maneuver yet
        end
        else
        begin //kein optimales Maneuver in dieser Metrik da falscher manSep
          f.optManeuver:='Status: Not running';//nicht optimal in dieser Metrik
          f.maneuver:=s;//kann auch Singmaster Notation sein!
          //DoManeuverstring(f,f.Maneuver,mvs);
          if (mvs>0) then
          begin
            f.maneuver:=f.InverseManeuver; //echtes Maneuver, Solver erzeugen
            {$IF not QTM}
            if manSep='f' then
              f.phase2Length:=mvs+10//auch wenn die Metrik falsch ist dies zum sortieren sinnvoll
            else f.phase2Length:=mvs; //dann wollen wir wirklich nur kürzere in der Slice Metrik
            {$ELSE}
            if manSep='q' then
              f.phase2Length:=mvs+10//auch wenn die Metrik falsch ist dies zum sortieren sinnvoll
            else f.phase2Length:=mvs; //dann wollen wir wirklich nur kürzere in der Slice Metrik
            {$IFEND}
          end
          else f.maneuver:='';
          //evtl noch falschen manSep entfernen
         // if Pos('(',f.maneuver)>1 then f.maneuver:=Trim(Copy(f.maneuver,1,Pos('(',f.maneuver)-1));

        end
      end
      else
      begin//kein optimales Maneuver
        f.maneuver:=s;//kann auch Singmaster Notation sein!
        DoManeuverstring(f,f.Maneuver,mvs);
        if (mvs>0) then
        begin
          f.maneuver:=f.InverseManeuver; //echtes Maneuver, Solver erzeugen
          f.phase2Length:=mvs;
        end
        else f.maneuver:=''
      end;

     //   f:=FaceletCube.Create(cubeMan,Output.Canvas);
        chktemp:=checkisomorphics;
        checkisomorphics:= IgnoreIsoOnLoad.Checked;
        AddCube(f,false,false,false,0,FixCenterFacelets.Checked);
        Inc(addCount);
        Caption:='loading cube '+ IntToStr(addCount)+', press ESC to cancel... '+ExtractFileName(curFilename)+' - '+curVersion;
        f.Free;
        checkisomorphics:=chktemp;
        i:=0;
        Application.ProcessMessages;
      end;
      Inc(i);
      if escPressed then break;
    end;
    fs.Free;
  end;
  Caption:=ExtractFileName(curFilename)+' - '+curVersion;
  FacePaint.Invalidate;
end;
//+++++++++++++++++++++End Click on Load Maneuvers++++++++++++++++++++++++++++++


//++++++++++++++++++Create the Move and Pruning Tables++++++++++++++++++++++++++
procedure TForm1.CreateTables(var Message: TMessage);
begin
  Application.ProcessMessages;//to paint the Main Window
  if not FileExists('RawFlipSlice') then
  begin
    if Application.MessageBox(PChar(Err[7]),'',MB_ICONWARNING or MB_YESNO)<>IDYES
    then
    begin
      SendMessage(Handle,WM_CLOSE,0,0);
      exit;
    end;
  end;


  If (DiskFree(0)<70000000) and (not FileExists('phase1PF.prun')) then

  begin
    Application.MessageBox(PChar(Err[8]),'',MB_ICONSTOP);
    SendMessage(Handle,WM_CLOSE,0,0);
    exit;
  end;
//  mem.dwLength:=SizeOf(MemoryStatus);
//  GlobalMemoryStatus(mem);
//  msize:=Round((mem.dwTotalPhys+598016)/(1024*1024));
//  if msize<90 then
//  begin
//    Application.MessageBox(PChar(Err[15]+IntToStr(msize)+Err[16]),'',MB_ICONSTOP);
//    SendMessage(Handle,WM_CLOSE,0,0);
//    exit;
//  end;
  makesTables:=true;
  RunPatButton.Enabled:=false;//disable parts of User-Interface
  BRunSym.Enabled:=false;
  ButtonAddSolve.Enabled:=false;
  ButtonAddGen.Enabled:=false;
  FixCenterFacelets.Enabled:=false;
  File1.Enabled:=false;
  ProgressLabel.Caption:='Loading...';
  Application.ProcessMessages;
  CreateSymmetryTables;
  CreateGetPackedTable;

  CreateClassIndexToRepresentantTables;
  CreateMoveTables;
  CreateConjugateTables;
  CreatePruningTables;

  CreateGetPruningLengthTable;
  CreateGetEdge8PermTable;

  CreateIncompleteTables;

  Form1.ProgressBar.Position:=0;
  Form1.ProgressBar.Visible:= false;
  Form1.ProgressLabel.Visible:=false;
  ButtonAddSolve.Enabled:=true;
  ButtonAddGen.Enabled:=true;
  FixCenterFacelets.Enabled:=true;
  File1.Enabled:=true;
  HugeSolver.Enabled:=true;
  RunPatButton.Enabled:=true;
  BRunSym.Enabled:=true;
  WebServer1.Enabled:=true;
  makesTables:=false;
  USES_BIG:=false;//small optimal solver by default
  Application.ProcessMessages;
end;
//++++++++++++++End Create the Move and Pruning Tables++++++++++++++++++++++++++



//+++++++++++Initialize the Progress Bar for Table Generation+++++++++++++++++++
procedure TForm1.SetUpProgressBar(min, max: Integer; lab: String);
begin
  ProgressBar.Min:=min;
  ProgressBar.Max:=max;
  ProgressBar.Position:=Min;
  ProgressLabel.Caption:=lab;
  ProgressLabel.Update;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


//+++++++++++++++Handle Mouseclicks in the Main Window++++++++++++++++++++++++++
procedure TForm1.OutPutMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var i,j: Integer; PopupPos: TPoint;en:Boolean;
begin

   Panel1.SetFocus; //Sonst gibt beim deleten von cubes Probleme  mit Ednametext

   PopupPos.x:=x; PopupPos.y:=y;
   i:=(y+yOffset-UBORD) div (27*CSIZE);//index of cube eventually clicked on
   if ((y+yOffset-UBORD) mod (27*CSIZE) > 24*CSIZE)
   or ((x+xOffset<LBORD) or (x+xOffset>LBORD+33*CSIZE) or (i>fcN-1))then
   begin//click outside of a cube in the Main Window
     if Button=mbLeft then
     begin
       for j:=0 to fcN-1 do fc[j].selected:= false;
       lastSelected:=-1;
       OutPut.Invalidate;
       DeleteSelectedCubes1.Enabled:=false;
       StartSearchForSelectedCubes1.Enabled:=False;
       StopSearchForSelectedCubes1.Enabled:=False;
//       StopSearchForSelectedCubes.Enabled:=False;
       ArrangeSelected1.Enabled:=false;
       AddSymmetryInfoforSelected1.Enabled:=false;
       exit
     end;
   end;
   if (x+xOffset<LBORD) or (x+xOffset>LBORD+33*CSIZE) then exit;
   if (i>=0) and (i<fcN) then
   begin//click on cube in the Main Windows

     CubePopUpMenu.Tag:=i;//save the choosen cube in tag property
     if (PageCtrl.ActivePage=Tabsym) and (BRunSym.Caption='Start Search')  then MTransferSymClick(nil);
     if Button=mbRight then
     begin
       PopUpPos:=Output.ClientToScreen(PopupPos);
       en:=true;
       RotUD.Enabled:=en;
       RotURF.Enabled:=en;
       RotFB.Enabled:=en;
       RefRL.Enabled:=en;
       Invert1.Enabled:=en;
       MIApplySymToSel.Enabled:=en;
       CubePopUpMenu.Popup(PopupPos.x,PopupPos.y);
       exit;
     end;

     //implement some windows explorer like features to select or deselect cubes
     DeleteSelectedCubes1.Enabled:=true;
     StartSearchForSelectedCubes1.Enabled:=true;
     StopSearchForSelectedCubes1.Enabled:=true;
//     StopSearchForSelectedCubes.Enabled:=true;
     ArrangeSelected1.Enabled:=true;
     AddSymmetryInfoforSelected1.Enabled:=true;
     if lastSelected=-1 then
     begin
       if fc[i].selected=true then fc[i].selected:=false
       else
       begin
         fc[i].selected:=true;
         lastSelected:=i;
       end;
       Output.Invalidate;
       exit;
     end;
     if (ssCtrl in Shift) and (ssShift in Shift) then
     begin
       for j:=lastSelected to i do fc[j].selected:=true;
       for j:=i to lastSelected do fc[j].selected:=true;
     end
     else
     if ssCtrl in Shift then
       if fc[i].selected then
       begin fc[i].selected:=false; lastSelected:=-1; end
       else begin fc[i].selected:=true; lastSelected:=i; end
     else
     if ssShift in Shift then
     begin
       for j:= 0 to fcN-1 do fc[j].selected:=false;
       for j:=lastSelected to i do fc[j].selected:=true;
       for j:=i to lastSelected do fc[j].selected:=true;
       lastSelected:=i;
     end
     else //just plain click
     begin
       for j:= 0 to fcN-1 do fc[j].selected:=false;
       fc[i].selected:=true; lastSelected:=i;
     end;
   end;
   Output.Invalidate;
end;
//+++++++++++End Handle Mouseclicks in the Main Window++++++++++++++++++++++++++

//+++++++++++++++Delete the selected cubes in the Main Window+++++++++++++++++++
procedure TForm1.DeleteSelectedCubes;
var i,j: Integer;
begin
for i:=0 to fcN-1 do
  with fc[i] do
  begin
    if fc[i].selected=false then continue;
    if optSearch<>nil then (optSearch as OptimalSearch).Kill;
    if tripSearch<>nil then (tripSearch as TripleSearch).Kill;
  end;
  for j:=0 to 1000 do //app might crash if we free before killing thread
    Application.ProcessMessages;//allow the notify procedures to work
  for i:=0 to fcN-1 do
  with fc[i] do
  begin
    if fc[i].selected=false then continue;
    if optSearch<>nil then
    begin
      (optSearch as OptimalSearch).idaU.Free;
       if (optSearch as OptimalSearch).coU<>nil then (optSearch as OptimalSearch).coU.Free;
    end;
    if tripSearch<>nil then
    begin
      (tripSearch as TripleSearch).idaU.Free;
      (tripSearch as TripleSearch).idaR.Free;
      (tripSearch as TripleSearch).idaF.Free;
      if (tripSearch as TripleSearch).coU<>nil then (tripSearch as TripleSearch).coU.Free;
      if (tripSearch as TripleSearch).coR<>nil then (tripSearch as TripleSearch).coR.Free;
      if (tripSearch as TripleSearch).coF<>nil then (tripSearch as TripleSearch).coF.Free;
      tripsearch.Free;
    end;
  end;

{  i:=0;
  while i<=fcN-1 do
  begin
    if fc[i].selected then
    begin
      fc[i].Free;
      for j:= i+1 to fcN-1 do begin fc[j-1]:=fc[j]; fc[j-1].y:=fc[j-1].y-27*CSIZE; end;
      fc[fcN-1]:=nil;
      Dec(fcN);
      lowOld:=-1;
      lastSelected:=-1;
      Dec(i);
      if fcN mod 1000 = 0 then begin OutPut.Invalidate; Application.ProcessMessages; end;
    end;
    Inc(i);
  end; }

 i:=fcN-1;
  while i>=0 do
  begin
    while (fc[i]<>nil) and (fc[i].selected) do
    begin
      fc[i].Free;
      for j:= i+1 to fcN-1 do begin fc[j-1]:=fc[j]; fc[j-1].y:=fc[j-1].y-27*CSIZE; end;
      fc[fcN-1]:=nil;
      Dec(fcN);
      lowOld:=-1;
      lastSelected:=-1;
     // Dec(i);
      if fcN mod 1000 = 0 then begin OutPut.Invalidate; Application.ProcessMessages; end;
    end;
    Dec(i);
  end;

  DeleteSelectedCubes1.Enabled:=false;
  StartSearchForSelectedCubes1.Enabled:=False;
  StopSearchForSelectedCubes1.Enabled:=False;
//  StopSearchForSelectedCubes.Enabled:=False;
  ArrangeSelected1.Enabled:=false;
  AddSymmetryInfoforSelected1.Enabled:=false;
  if fcN=0 then begin
    dirty:=false;
    Caption:=ExtractFileName(curFilename)+' - '+curVersion;
    SbVert.Position:=0;
    yOffset:=0;
    end;

  FormResize(nil);

  Output.Invalidate;
end;
//+++++++++++End Delete the selected cubes in the Main Window+++++++++++++++++++

//+++++++++++Delete Key also deletes the selected Cubes+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var i: Integer;
begin
  If Key=Windows.VK_DELETE then
  begin
     for i:= 0 to fcN-1 do
       if fc[i].selected then begin Key:= 0; DeleteSelectedCubes; break; end; //sonst wird delete weitergereicht
  end;
  If Key=Windows.VK_ESCAPE then escPressed:=true
    else if (ssAlt in Shift) and (ssCtrl in Shift)and (Key=82)
    then BRyanHeise.Visible:=true //Kleines ctrl-alt-r drücken
    else if (ssAlt in Shift) and (Key=83) and BScan.Enabled then BScanClick(nil) //alt-s
    else if  (ssAlt in Shift) and (Key=86) and BTransferCam.Enabled then //alt-v
        BTransferCamClick(nil)
    else if (ssCtrl in Shift) and (Key=70) then saveTodefaultFile; //ctrl-f
end;
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++Delete selected cubes from popup menu+++++++++++++++++++++++++
procedure TForm1.DeleteselectedCubes1Click(Sender: TObject);
begin
  DeleteSelectedCubes;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++++++++++++++++++++Clear the Main Window++++++++++++++++++++++++++++++
procedure TForm1.ClearMainWindow1Click(Sender: TObject);
var i,ret: Integer;
begin
  ret:=IDYES;
  if dirty then
   if Sender <> nil then ret:=Application.MessageBox(PChar(Err[11]),'',MB_ICONWARNING or MB_YESNO)
   else ret:=IDYES;
  if ret=IDYES then
  begin
    for i:=0 to fcN-1 do fc[i].selected:=true;
    SbVert.Position:=0;
    DeleteSelectedCubes;
  end;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++++++Remove rightclicked cube from the Popup Menu+++++++++++++++++++++
procedure TForm1.RemoveCube1Click(Sender: TObject);
var i,j: Integer;
begin
  i:= CubePopUpMenu.Tag;
  with fc[i] do//tag holds cube
  begin
    if optSearch<>nil then (optSearch as OptimalSearch).Kill;
    if tripSearch<>nil then (tripSearch as TripleSearch).Kill;
    for j:=0 to 1000 do //app might crash if we free before killing thread
      Application.ProcessMessages;//allow the notify procedures to work
    if optSearch<>nil then
    begin
      (optSearch as OptimalSearch).idaU.Free;
       if (optSearch as OptimalSearch).coU<>nil then (optSearch as OptimalSearch).coU.Free;
    end;
    if tripSearch<>nil then
    begin
      (tripSearch as TripleSearch).idaU.Free;
      (tripSearch as TripleSearch).idaR.Free;
      (tripSearch as TripleSearch).idaF.Free;
      if (tripSearch as TripleSearch).coU<>nil then (tripSearch as TripleSearch).coU.Free;
      if (tripSearch as TripleSearch).coR<>nil then (tripSearch as TripleSearch).coR.Free;
      if (tripSearch as TripleSearch).coF<>nil then (tripSearch as TripleSearch).coF.Free;

      tripsearch.Free;

    end;
  end;

  fc[i].Free;
  for j:= i+1 to fcN-1 do begin fc[j-1]:=fc[j]; fc[j-1].y:=fc[j-1].y-27*CSIZE; end;
  fc[fcN-1]:=nil;
  Dec(fcN);
  lowOld:=-1;
  lastSelected:=-1;
  if fcN=0 then
  begin
    dirty:=false;
    Caption:=ExtractFileName(curFilename)+' - '+curVersion;
  end;
  DeleteSelectedCubes1.Enabled:=false;
  StartSearchForSelectedCubes1.Enabled:=False;
  StopSearchForSelectedCubes1.Enabled:=False;
//  StopSearchForSelectedCubes.Enabled:=False;
  ArrangeSelected1.Enabled:=false;
  AddSymmetryInfoforSelected1.Enabled:=false;
  for i:=0 to fcN-1 do
     if fc[i].selected= true then
     begin
       DeleteSelectedCubes1.Enabled:=true;
       StartSearchForSelectedCubes1.Enabled:=true;
       StopSearchForSelectedCubes1.Enabled:=true;
//       StopSearchForSelectedCubes.Enabled:=true;
       ArrangeSelected1.Enabled:=true;
       AddSymmetryInfoforSelected1.Enabled:=true;
       break;
     end;

  FormResize(nil);

  Output.Invalidate;
end;
//+++++++++++End Remove rightclicked cube(Popup Menu)+++++++++++++++++++++++++++

//++++++++Transfer rightlicked cube(Popup Menu)+++++++++++++++++++++++++++++++++
procedure TForm1.TransferCubetoFaceletEditor1Click(Sender: TObject);
var i: Face; var j: TurnAxis;
begin
  for i:= U1 to B9 do
    fCube.PFace^[i]:= fc[CubePopUpMenu.Tag].PFace^[i];
  for j:= U to B do
    fCube.cenTwist[j]:=  fc[CubePopUpMenu.Tag].cenTwist[j];
    PageCtrl.ActivePage:= TabSheet1;
    FacePaint.Invalidate;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++++++++++Rotate rightclicked cube about UD-Axis+++++++++++++++++++++++
procedure TForm1.rotUDClick(Sender: TObject);
begin
  with fc[CubePopUpMenu.Tag] do
  begin
    Conjugate(S_U4);
    maneuver:=MT(maneuver,S_U4);
    if Pos('Status',optManeuver)=0 then
    optManeuver:=MT(optManeuver,S_U4);
  end;
  Output.Invalidate;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
procedure TForm1.RotURFClick(Sender: TObject);
begin
  with fc[CubePopUpMenu.Tag] do
  begin
    Conjugate(S_URF3);
    maneuver:=MT(maneuver,S_URF3);
    if Pos('Status',optManeuver)=0 then
    optManeuver:=MT(optManeuver,S_URF3);
  end;
  Output.Invalidate;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
procedure TForm1.RotFBClick(Sender: TObject);
begin
  with fc[CubePopUpMenu.Tag] do
  begin
    Conjugate(S_F2);
    maneuver:=MT(maneuver,S_F2);
    if Pos('Status',optManeuver)=0 then
    optManeuver:=MT(optManeuver,S_F2);
  end;
  Output.Invalidate;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
procedure TForm1.RefRLClick(Sender: TObject);
begin
  with fc[CubePopUpMenu.Tag] do
  begin
    Conjugate(S_LR2);
    maneuver:=MT(maneuver,S_LR2);
    if Pos('Status',optManeuver)=0 then
    optManeuver:=MT(optManeuver,S_LR2);
  end;
  Output.Invalidate;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++Invert rightclicked Cube (Popup Menu)+++++++++++++++++++++++++
procedure TForm1.InvertClick(Sender: TObject);
var c: CubieCube; fcube:FaceletCube; j: Integer;
label ende;
begin
  c:=CubieCube.Create(fc[CubePopUpMenu.Tag]);
  fcube:=FaceletCube.Create(nil);
  with fc[CubePopUpMenu.Tag] do
  begin
    CornInv(c.PCorn^,c.PCornTemp^);
    EdgeInv(c.PEdge^,c.PEdgeTemp^);
    CentInv(c.PCent^,c.PCentTemp^);
    c.cSwap:=c.PCorn;c.PCorn:=c.PCornTemp;c.PCornTemp:=c.cSwap;
    c.eSwap:=c.PEdge;c.PEdge:=c.PEdgeTemp;c.PEdgeTemp:=c.eSwap;
    c.cnSwap:=c.PCent;c.PCent:=c.PCentTemp;c.PCentTemp:=c.cnSwap;
    fcube.SetFacelets(c);
    fcube.isOriented:=c.isOriented;
    for j:= 0 to fcN-1 do
    if fcube.IsIsomorphic(fc[j],false,false,IsoInvInclude.Checked) and (CubePopUpMenu.Tag<>j) then
    if Application.MessageBox(PChar('Cube '+IntToStr(j+1)+' is isomorphic to the inverted cube. Proceed?'),'Maneuver Window',MB_ICONWARNING or MB_YESNO)
    <>IDYES then goto ende;
    SetFacelets(c);
    fc[CubePopUpMenu.Tag].maneuver:=fc[CubePopUpMenu.Tag].InverseManeuver;
    if Pos('Status',optManeuver)=0 then
    optManeuver:=InverseOptManeuver;
    Output.Invalidate;
  end;
ende:
  fcube.Free;
  c.Free;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++++++++++Click checkbox U,R,... in Pattern Editor+++++++++++++++++++++
procedure TForm1.CheckBoxOnClick(Sender: TObject);
var i:TurnAxis; j, count: Integer;
label found;
begin
  for i:= U to B do
  for j:= 1 to 5 do//5 different patterns
    if CheckBox[i,j]= Sender then goto found;
found:
  count:=0;
  for i:= U to B do if CheckBox[i,j].Checked then Inc(Count);
  case count of
    0: ACheckBox[j].State:= cbUnchecked;
    6: ACheckBox[j].State:= cbChecked;
  else
    ACheckBox[j].State:= cbGrayed;
  end;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++press "All" checkbox in Pattern Editor++++++++++++++++++++++++++++
procedure TForm1.CheckBoxAOnClick(Sender: TObject);
var i: TurnAxis; j,count: Integer;
begin
for j:= 1 to 5 do
  if Sender=ACheckBox[j] then
  begin
    case  ACheckBox[j].State of
    cbChecked: for i:=U to B do CheckBox[i,j].Checked:=true;//calls CheckBoxOnClick!
    cbGrayed:
    begin
      count:=0;
      for i:= U to B do if CheckBox[i,j].Checked then Inc(Count);
      if count=0 then ACheckBox[j].State:=cbChecked;//callsCheckBoxAOnClick again!

    end;
    cbUnchecked:  for i:=U to B do CheckBox[i,j].Checked:=false;
    end;
  end;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++Select a new color in the Pattern Editor++++++++++++++++++++++
procedure TForm1.PatShapeMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  curPatCol:= (Sender as TShape).Tag;
  curShape.Brush.Color:= patSelector[curPatCol].Brush.Color;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++Color a square in the Pattern Editor++++++++++++++++++++++++++
procedure TForm1.SquareMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  with Sender as TShape do
  begin
    Brush.Color:=curShape.Brush.Color;
    tag:=curPatCol;
  end;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++Clear all patterns in the Pattern Editor++++++++++++++++++
procedure TForm1.PatClearClick(Sender: TObject);
var i,j: Integer;
begin
  for i:=1 to 5 do
  for j:=1 to 9 do
  begin
    Square[i,j].Tag:=6;
    Square[i,j].Brush.Color:=patSelector[6].Brush.Color;
  end;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++Cancel the search in the Pattern Editor+++++++++++++++++++++++
procedure TForm1.PatSearchTerminate(Sender: TObject);
var i:TurnAxis;j:Integer;
begin

//  (Sender as
  RunPatButton.Caption:='Start Search';
  CheckBoxContinuous.Enabled:=true;
   for i:= U to B do
   for j:= 1 to 5 do
     CheckBox[i,j].Enabled:=true;
   for j:= 1 to 5 do ACheckBox[j].Enabled:=true;
   PatClear.Enabled:=true;
   (PatternSearch.fcc).Free;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++Select Printer Setup from File menu++++++++++++++++++++++++++++++++++
procedure TForm1.PrinterSetup1Click(Sender: TObject);
begin
 PrinterSetupDialog.Execute;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



//+++++++++++++++++++++Print the Main Window++++++++++++++++++++++++++++++++++++
procedure TForm1.PrintMainWindowClick(Sender: TObject);
var i,j,ph,sSave,xSave,ySave,dpCmV,size: Integer; cSave:TCanvas;s:String;
    isSelection: Boolean;
begin
  isSelection:=false;
  if Sender=PrintSelectedCubes then isSelection:=true;
  Printer.BeginDoc;
  dpCmV:=Round(GetDeviceCaps(Printer.Handle,LOGPIXELSY)/2.54);
  ph:=Printer.PageHeight-2*dpCmV;
  size:=ph div(30*6-6);//6 cubes, 24 units for one cube + 6 units space

  j:=0;
  for i:= 0 to fcN-1 do
  begin
    if isSelection and (fc[i].selected=false) then continue;
    cSave:=fc[i].cv;
    sSave:=fc[i].size;
    xSave:=fc[i].x;
    ySave:=fc[i].y;

    Application.ProcessMessages;//else undesired output could
    //be generated on printer canvas 

    fc[i].cv:= Printer.Canvas;
    fc[i].size:=size;
    fc[i].x:=0;fc[i].y:=0;
    if (j<>0) and (j mod 6=0) then Printer.NewPage;

    Printer.Canvas.Font.Height:=-Round(size*2*3*2/4);
    Printer.Canvas.Font.Color:=clBlack;
    Printer.Canvas.TextOut(2*dpCmV,(j mod 6)*30*size+dpCmV,IntToStr(j+1)+'.');
    if fc[i].runOptimal then s:=fc[i].InverseOptManeuver else s:=fc[i].InverseManeuver;

    Printer.Canvas.TextOut(2*dpCmV+21*size+4*size,(j mod 6)*30*size+dpCmV+16*size-5*size,fc[i].patName);
    Printer.Canvas.TextOut(2*dpCmV+21*size,(j mod 6)*30*size+dpCmV+16*size,s);
    fc[i].DrawCube(-2*dpCmV,-dpCmV-(j mod 6)*30*size);//left border 2cm
    fc[i].cv:=cSave;
    fc[i].size:=sSave;
    fc[i].x:=xSave;
    fc[i].y:=ySave;
    Inc(j);
  end;
  Printer.EndDoc;
end;
//++++++++++++++++++++++++++End Print the Main Window+++++++++++++++++++++++++++





{

//+++++++++++++++++++++Print the Main Window++++++++++++++++++++++++++++++++++++
procedure TForm1.PrintMainWindowClick(Sender: TObject);
var i,j,ph,sSave,xSave,ySave,dpCmV,size: Integer; cSave:TCanvas;s:String;
    isSelection: Boolean;
begin
  isSelection:=false;
  if Sender=PrintSelectedCubes then isSelection:=true;
  Printer.BeginDoc;
  dpCmV:=Round(GetDeviceCaps(Printer.Handle,LOGPIXELSY)/2.54);
  ph:=Printer.PageHeight-2*dpCmV;
  size:=ph div(30*6-6);//6 cubes, 24 units for one cube + 6 units space
 // Printer.Canvas.Font.Height:=-Round(size*3*3/4);//-6 because no space for last cube
  j:=0;
  for i:= 0 to fcN-1 do
  begin
    if isSelection and (fc[i].selected=false) then continue;
    cSave:=fc[i].cv;
    sSave:=fc[i].size;
    xSave:=fc[i].x;
    ySave:=fc[i].y;
    fc[i].cv:= Printer.Canvas;
    fc[i].size:=size;
    fc[i].x:=0;fc[i].y:=0;
    if (j<>0) and (j mod 6=0) then Printer.NewPage;

    Printer.Canvas.Font.Height:=-Round(size*2*3*2/4);

    Printer.Canvas.TextOut(2*dpCmV,(j mod 6)*30*size+dpCmV,IntToStr(j+1)+'.');
    if fc[i].runOptimal then s:=fc[i].InverseOptManeuver else s:=fc[i].InverseManeuver;
    Printer.Canvas.TextOut(2*dpCmV+21*size+4*size,(j mod 6)*30*size+dpCmV+16*size-5*size,fc[i].patName);
    Printer.Canvas.TextOut(2*dpCmV+21*size,(j mod 6)*30*size+dpCmV+16*size,s);
    fc[i].DrawCube(-2*dpCmV,-dpCmV-(j mod 6)*30*size);//left border 2cm
    fc[i].cv:=cSave;
    fc[i].size:=sSave;
    fc[i].x:=xSave;
    fc[i].y:=ySave;
    Inc(j);
  end;
  Printer.EndDoc;
end;
//++++++++++++++++++++++++++End Print the Main Window+++++++++++++++++++++++++++
}
//+++++++++++++++++++++++++++++Open the File Menu+++++++++++++++++++++++++++++++
procedure TForm1.File1Click(Sender: TObject);
var i: Integer;
begin
 if fcN=0 then
 begin
   PrintMainWindow.Enabled:=false;
   SaveWorkspace1.Enabled:=false;
   SaveasHtml1.Enabled:=false;
   end
 else
 begin
   PrintMainWindow.Enabled:=true;
   SaveWorkspace1.Enabled:=true;
   SaveasHtml1.Enabled:=true;
   end;
 PrintSelectedCubes.Enabled:=false;
 for i:= 0 to fcN-1 do
 if fc[i].selected=true then begin  PrintSelectedCubes.Enabled:=true;Break;end;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++Close Help System before shutdown+++++++++++++++++++++++++++++++
procedure TForm1.FormDestroy(Sender: TObject);
begin
  mHHelp.Free;
  HHCloseAll;     //Close help before shutdown or big trouble
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++++++++++++++++++Select Contents from Help Menu+++++++++++++++++++++++
procedure TForm1.Contents1Click(Sender: TObject);
begin
HtmlHelp(0, 'cube.chm', HH_DISPLAY_TOPIC, 0);
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++Select Edit from Main Menu++++++++++++++++++++++++++++
procedure TForm1.Edit1Click(Sender: TObject);
var i: Integer;
begin
 if (fcN=0) or (BRunSym.Caption='Stop Search') or  (RunPatButton.Caption='Stop Search')
 then ClearMainWindow2.Enabled:=false
 else ClearMainWindow2.Enabled:=true;
 DeleteSelectedCubes2.Enabled:=false;
 StartSearchForSelectedCubes.Enabled:=false;
 StopSearchForSelectedCubes.Enabled:=false;
 ArrangeSelected.Enabled:=false;
 AddSymmetryInfoforSelected.Enabled:=false;
 for i:= 0 to fcN-1 do
 if fc[i].selected=true then
 begin
   DeleteSelectedCubes2.Enabled:=true;
   StartSearchForSelectedCubes.Enabled:=true;
   StopSearchForSelectedCubes.Enabled:=true;
   ArrangeSelected.Enabled:=true;
   AddSymmetryInfoforSelected.Enabled:=true;
   Break;
 end;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

function TClToRGB(c: Integer):String;
var r,b,g: Integer;
begin
r:= c mod 256; c:= c div 256;
g:= c mod 256; c:= c div 256;
b:= c mod 256;
Result:= InttoHex(r,2)+InttoHex(g,2)+InttoHex(b,2);
end;


//+++++++++++++Select  File/Save as HTML from Main Menu+++++++++++++++++++++++++
procedure TForm1.SaveasHtml1Click(Sender: TObject);
var ss:TStringStream;fs:TFilestream;s,sinv,colors,patGroup: String; i:Integer;
begin
  if SaveHtml.Execute= true then
  begin
    s:=ExtractFileName(SaveHtml.FileName);
    patGroup:= Copy(s,1,Pos('.',s)-1);
    ss := TStringStream.Create('');
    ss.WriteString('<html>'+#13#10+'<head><title>'+patGroup+'</title></head>'
       +#13#10+'<body><div align ="center"><h1>'+patGroup+'</h1>'+#13#10
       +'<p>&nbsp;</p></div>'+#13#10+'<table width="75%" border="1" align="center">'+#13#10);


    colors:=TClToRGB(Cubedefs.Color[UCol])+TClToRGB(Cubedefs.Color[DCol])+
    TClToRGB(Cubedefs.Color[FCol])+TClToRGB(Cubedefs.Color[BCol])+
    TClToRGB(Cubedefs.Color[LCol])+TClToRGB(Cubedefs.Color[RCol]);
    for i:= 0 to fcN-1 do
    begin
      ss.WriteString('<tr><td width="120">'+#13#10+
       '<applet code="AnimCube.class" archive="AnimCube.jar" width="120" height="140">'+#13#10+
      '<param name="move" value="');

      with fc[i] do
      begin
        if (Length(optManeuver)=0) and (Length(Maneuver)=0) then continue;
        if (Length(optManeuver)>0) and (Pos('Status',optManeuver)=0) then
        begin
          s:=OptManeuver;
          sinv:= InverseOptManeuver;
        end
        else
        begin
          s:=Maneuver;
          sinv:= InverseManeuver;
        end;
        s:=LeftStr(s,pos('(',s)-1);
        sinv:=LeftStr(sinv,pos('(',sinv)-1);
        ss.WriteString(s+'">'+#13#10+
          '<param name="bgcolor" value="FFFFFF">'+#13#10+
          '<param name="colorscheme" value="012345">'+#13#10+
          '<param name="colors" value="'+colors+'">'+#13#10+
          '<param name="butbgcolor" value="99AACC">'+#13#10+
          '<param name="initrevmove" value="#">'+#13#10+
          '<param name="movetext" value="0">'+#13#10+
          '<param name="metric" value="2">'+#13#10+
          '<param name="fonttype" value="2">'+#13#10+
          '</applet></td>'+#13#10+
          '<td width="89%">'+#13#10+

           '<table width="100%" border="1">'+#13#10+
           '<tr>'+#13#10+
           '<td width="13%"><div align="center">Name</div></td>'+#13#10+
           '<td width="87%">'+'&nbsp;'+patName+'</td>'+#13#10+
           '</tr>'+#13#10+
           '<tr>'+#13#10+
           '<td><div align="center">Generator</div></td>'+#13#10+
           '<td>'+'&nbsp;'+sinv+ '</td>'+#13#10+
           '</tr>'+#13#10+
           '</table>'+#13#10+
           '</td>'+#13#10+
           '</tr>'+#13#10);
      end
    end;
    ss.WriteString('</table><p>&nbsp;</p></body>'+#13#10+'</HTML>');
    fs := TFileStream.Create(SaveHtml.FileName, fmCreate);
    fs.WriteBuffer(PChar(ss.DataString)^,ss.Size);
    fs.Free;
    ss.Free;
  end;
end;
//+++++++++++++++++End Select File/Save as HTML from Main Menu++++++++++++++++++


//++++++++++++++++Select File/Exit from Main Menu+++++++++++++++++++++++++++++++
procedure TForm1.Exit1Click(Sender: TObject);
begin
  Close;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++++++++++Click on Options/Huge Optimal Solver+++++++++++++++++++++++++
procedure TForm1.HugeSolverClick(Sender: TObject);
var mem:MemoryStatus;
begin
  mem.dwLength:=SizeOf(MemoryStatus);

  SetCurrentDir(ExtractFilePath(Paramstr(0)));//Cube Explorer directory

  if {(msize>=1000) and} (fcN=0) {and (diskfree(0)>need)}
  then OptOptionForm.CheckUseHuge.Enabled:=true
   else OptOptionForm.CheckUseHuge.Enabled:=false;
  OptOptionForm.Show;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


//++++++++++++++++Click one of the six Apply Move Buttons+++++++++++++++++++++++
procedure TForm1.ButtonXClick(Sender: TObject);

//var cu: CubieCube;


begin
   if not usedRightButton then
  begin
    if Sender=ButtonU then fCube.Move(U);
    if Sender=ButtonR then fCube.Move(R);
    if Sender=ButtonF then fCube.Move(F);
    if Sender=ButtonD then fCube.Move(D);
    if Sender=ButtonL then fCube.Move(L);
    if Sender=ButtonB then fCube.Move(B);
    if Sender=ButtonE then begin fCube.Move(E); Output.Invalidate end;
    if Sender=ButtonM then begin fCube.Move(M); Output.Invalidate end;
    if Sender=ButtonS then begin fCube.Move(S); Output.Invalidate end;
    if Sender=Buttonx then begin fCube.Move(Us); Output.Invalidate end;
    if Sender=Buttony then begin fCube.Move(Rs); Output.Invalidate end;
    if Sender=Buttonz then begin fCube.Move(Fs); Output.Invalidate end;
  end;

  FacePaint.Invalidate;
  usedRightButton:=false;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++++++++++Click one of the six Apply Move Buttons++++++++++++++++++++++
procedure TForm1.ButtonMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  If Button=mbRight then
  begin
    PostMessage((Sender as TWinControl).Handle,WM_LBUTTONDOWN,MK_LBUTTON,0);
    (Sender as TButton).Caption:=(Sender as TButton).Caption+'''';
  end;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++Transform mouse message in WM.LBUTTONUP message+++++++++++++++++
procedure TForm1.ButtonMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  If Button=mbRight then
  begin
  PostMessage((Sender as TWinControl).Handle,WM_LBUTTONUP,MK_LBUTTON,0);
  if Sender=ButtonU then
    Begin fCube.Move(U);fCube.Move(U);fCube.Move(U);FacePaint.Invalidate;end;
  if Sender=ButtonR then
    Begin fCube.Move(R);fCube.Move(R);fCube.Move(R);FacePaint.Invalidate;end;
  if Sender=ButtonF then
    Begin fCube.Move(F);fCube.Move(F);fCube.Move(F);FacePaint.Invalidate;end;
  if Sender=ButtonD then
    Begin fCube.Move(D);fCube.Move(D);fCube.Move(D);FacePaint.Invalidate;end;
  if Sender=ButtonL then
    Begin fCube.Move(L);fCube.Move(L);fCube.Move(L);FacePaint.Invalidate;end;
  if Sender=ButtonB then
    Begin fCube.Move(B);fCube.Move(B);fCube.Move(B);FacePaint.Invalidate;end;

  if Sender=ButtonE then
    Begin fCube.Move(E);fCube.Move(E);fCube.Move(E);FacePaint.Invalidate;Output.Invalidate;end;
  if Sender=ButtonM then
    Begin fCube.Move(M);fCube.Move(M);fCube.Move(M);FacePaint.Invalidate;Output.Invalidate;end;
  if Sender=ButtonS then
    Begin fCube.Move(S);fCube.Move(S);fCube.Move(S);FacePaint.Invalidate;Output.Invalidate;end;
  if Sender=Buttonx then
    Begin fCube.Move(Us);fCube.Move(Us);fCube.Move(Us);FacePaint.Invalidate;Output.Invalidate;end;
  if Sender=Buttony then
    Begin fCube.Move(Rs);fCube.Move(Rs);fCube.Move(Rs);FacePaint.Invalidate;Output.Invalidate;end;
  if Sender=Buttonz then
    Begin fCube.Move(Fs);fCube.Move(Fs);fCube.Move(Fs);FacePaint.Invalidate;Output.Invalidate;end;

  usedRightButton:=true;
  (Sender as TButton).Caption:=Copy((Sender as TButton).Caption,0,1);
  end;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++Prevent closing of program when the tables are generated+++++++++++++
procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var b: Integer; s:String;
label ende;
begin
  if makesTables then
  begin
    Application.MessageBox(PChar(Err[9]),'',MB_ICONWARNING);
    CanClose:=false; goto ende;
  end;
  if CaptureForm.Visible and FilterGraph.Active then
  begin
    s:='Please close the '+Captureform.Caption+ ' Window before closing Cube Explorer.';
    Application.MessageBox(PChar(s),'',MB_ICONWARNING);
    CanClose:=false; goto ende;
  end;

  if not dirty then
  begin
    if Application.MessageBox(PChar(Err[25]),'',MB_ICONWARNING or MB_YESNO)=IDNO then CanClose:=false
  end
  else //dirty
  begin
    b:= Application.MessageBox(PChar(Err[10]),'',MB_ICONWARNING or MB_YESNOCANCEL);
    if b=IDYES then SaveWorkspace1Click(nil)
    else if b=IDCANCEL then CanClose:=false;
  end;
ende:
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++Free resources on closing+++++++++++++++++++++++++++++++++++
procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var i: Integer; b:boolean;
begin
 HH.HtmlHelp(0, nil, HH_CLOSE_ALL, 0);
// for i:=0 to fcN-1 do if fc[fcN-1].tripSearch<>nil then (fc[fcN-1].tripSearch).Free;  geht nicht
 for i:=0 to fcN-1 do fc[i].Selected:=true;
 DeleteSelectedCubes;

 ServerSocket1.Close;
 SetLength(PruningP,0);
 {$IF QTM}
  //SetLength(PruningPhase2Q,0); ergibt einen internen Fehler
 {$ELSE}
 SetLength(PruningPhase2P,0);
 {$IFEND}
 SetLength(FlipSliceMove,0);
 SetLength(FlipConjugate,0);


 inifile.Free;
 fcube.Free;
 buf.Free;
 BMRun.Free;
 BMStop.Free;
 bmap.Free;
 SysDev.Free;

 if CaptureForm.Visible then
  CaptureForm.FormCloseQuery(nil,b); //close window

  DeleteCriticalSection(CS);
 //FilterGraph.Stop;
 //FilterGraph.ClearGraph;
 //FilterGraph.Active := false;



 //SetLength(PruningBigP,0); //Internal compiler error L594 with Delphi 6.0
 //Finalize(PruningBigP);    //the same problem
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++









//+++++++++++++++Event Handler for radio buttons for scanned face+++++++++++++++
procedure TForm1.RbFaceClick(Sender: TObject);
begin
  curFace:=(Sender as TRadioButton).Tag;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++++++Scan a cube face++++++++++++++++++++++++++++++++++
procedure TForm1.BScanClick(Sender: TObject);
var i,j,cf:Integer;allScanned:boolean;
    k: Face;
begin
sleep(100);
   timerBlink.Enabled:=true; timerBlink.Tag:=8;
   if RbB.Checked then
     begin cf:= RbB.Tag;scannedFaces[RbB.Tag]:=true;RbL.Checked:=true end
   else if RbL.Checked then
     begin cf:= RbL.Tag;scannedFaces[RbL.Tag]:=true;RbF.Checked:=true end
   else if RbF.Checked then
     begin cf:= RbF.Tag;scannedFaces[RbF.Tag]:=true;RbR.Checked:=true end
   else if RbR.Checked then
     begin cf:= RbR.Tag;scannedFaces[RbR.Tag]:=true;RbU.Checked:=true end
   else if RbU.Checked then
     begin cf:= RbU.Tag;scannedFaces[RbU.Tag]:=true;RbD.Checked:=true end
   else if RbD.Checked then
     begin cf:= RbD.Tag;scannedFaces[RbD.Tag]:=true;RbB.Checked:=true end;
   //scannedfaces löschen, wenn reset
   allScanned:=true;
   for i:=0 to 5 do allScanned:= allScanned and scannedFaces[i];
   if allScanned then BTransferCam.Enabled:= true else BTransferCam.Enabled:= false;

   if RBInteractive.Checked then BTransferCam.Enabled:= true;//always enable
   for j:=0 to 8 do
   begin
     scanHue[Face(9*cf+j)]:=faceHue[Face(9*cf+j)];
     scanSaturation[Face(9*cf+j)]:=faceSaturation[Face(9*cf+j)];
     scanValue[Face(9*cf+j)]:=faceValue[Face(9*cf+j)];
     scanBlueRel[Face(9*cf+j)]:=faceBlueRel[Face(9*cf+j)];
   end;
   //special Handling for U,D-faces

   if cf=0 then//U-face
   begin
   scanHue[Face(0)]:=faceHue[Face(2)];scanHue[Face(1)]:=faceHue[Face(5)];
   scanHue[Face(2)]:=faceHue[Face(8)];scanHue[Face(3)]:=faceHue[Face(1)];
   scanHue[Face(5)]:=faceHue[Face(7)];scanHue[Face(6)]:=faceHue[Face(0)];
   scanHue[Face(7)]:=faceHue[Face(3)];scanHue[Face(8)]:=faceHue[Face(6)];

   scanSaturation[Face(0)]:=faceSaturation[Face(2)];scanSaturation[Face(1)]:=faceSaturation[Face(5)];
   scanSaturation[Face(2)]:=faceSaturation[Face(8)];scanSaturation[Face(3)]:=faceSaturation[Face(1)];
   scanSaturation[Face(5)]:=faceSaturation[Face(7)];scanSaturation[Face(6)]:=faceSaturation[Face(0)];
   scanSaturation[Face(7)]:=faceSaturation[Face(3)];scanSaturation[Face(8)]:=faceSaturation[Face(6)];

   scanValue[Face(0)]:=faceValue[Face(2)];scanValue[Face(1)]:=faceValue[Face(5)];
   scanValue[Face(2)]:=faceValue[Face(8)];scanValue[Face(3)]:=faceValue[Face(1)];
   scanValue[Face(5)]:=faceValue[Face(7)];scanValue[Face(6)]:=faceValue[Face(0)];
   scanValue[Face(7)]:=faceValue[Face(3)];scanValue[Face(8)]:=faceValue[Face(6)];

   scanBlueRel[Face(0)]:=faceBlueRel[Face(2)];scanBlueRel[Face(1)]:=faceBlueRel[Face(5)];
   scanBlueRel[Face(2)]:=faceBlueRel[Face(8)];scanBlueRel[Face(3)]:=faceBlueRel[Face(1)];
   scanBlueRel[Face(5)]:=faceBlueRel[Face(7)];scanBlueRel[Face(6)]:=faceBlueRel[Face(0)];
   scanBlueRel[Face(7)]:=faceBlueRel[Face(3)];scanBlueRel[Face(8)]:=faceBlueRel[Face(6)];
   end
   else if cf=3 then//D-face then
   begin
   scanHue[Face(27)]:=faceHue[Face(33)];scanHue[Face(28)]:=faceHue[Face(30)];
   scanHue[Face(29)]:=faceHue[Face(27)];scanHue[Face(30)]:=faceHue[Face(34)];
   scanHue[Face(32)]:=faceHue[Face(28)];scanHue[Face(33)]:=faceHue[Face(35)];
   scanHue[Face(34)]:=faceHue[Face(32)];scanHue[Face(35)]:=faceHue[Face(29)];

   scanSaturation[Face(27)]:=faceSaturation[Face(33)];scanSaturation[Face(28)]:=faceSaturation[Face(30)];
   scanSaturation[Face(29)]:=faceSaturation[Face(27)];scanSaturation[Face(30)]:=faceSaturation[Face(34)];
   scanSaturation[Face(32)]:=faceSaturation[Face(28)];scanSaturation[Face(33)]:=faceSaturation[Face(35)];
   scanSaturation[Face(34)]:=faceSaturation[Face(32)];scanSaturation[Face(35)]:=faceSaturation[Face(29)];

   scanValue[Face(27)]:=faceValue[Face(33)];scanValue[Face(28)]:=faceValue[Face(30)];
   scanValue[Face(29)]:=faceValue[Face(27)];scanValue[Face(30)]:=faceValue[Face(34)];
   scanValue[Face(32)]:=faceValue[Face(28)];scanValue[Face(33)]:=faceValue[Face(35)];
   scanValue[Face(34)]:=faceValue[Face(32)];scanValue[Face(35)]:=faceValue[Face(29)];

   scanBlueRel[Face(27)]:=faceBlueRel[Face(33)];scanBlueRel[Face(28)]:=faceBlueRel[Face(30)];
   scanBlueRel[Face(29)]:=faceBlueRel[Face(27)];scanBlueRel[Face(30)]:=faceBlueRel[Face(34)];
   scanBlueRel[Face(32)]:=faceBlueRel[Face(28)];scanBlueRel[Face(33)]:=faceBlueRel[Face(35)];
   scanBlueRel[Face(34)]:=faceBlueRel[Face(32)];scanBlueRel[Face(35)]:=faceBlueRel[Face(29)];
   end;

   if RBInteractive.Checked then

   for k:=Face(9*cf) to Face(9*cf+8) do
   if (scanValue[k]>=Ord(UCol)) and (scanValue[k]<=Ord(BCol))
      then prevCube.PFace^[k]:= ColorIndex(scanValue[k]);
   prevBox.Invalidate;
   //-1 ist rot oder orange


end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++Analyze scanned faces and transfer to Facelet Editor++++++++++++
procedure TForm1.BTransferCamClick(Sender: TObject);
var i,i1:Face;j,k,s,d0,d1,index,cntRed,cntOrange,cntRedOrange,cntWhite,cntYellow,cntBlue,cntGreen,cnt,idxWhite:Integer;
   cntHue:array[0..239] of Byte; medHue,medVal:array[0..4] of Integer;
   redOrangeVal:array[0..17] of Integer;
   redOrangeHue:array[0..17] of Integer;
   redVal,orangeVal,redHue,orangeHue: Integer;
   blueRel: array[0..17] of Integer;
   whiteRel,yellowRel: Integer;
   maxRedOrange:Integer;
   whArr: array[0..26] of Integer;
   t:array[0..5] of ColorIndex;
   ci: ColorIndex;
   count:array[UCol..BCol] of Byte;
   capWhite9,capWhite18: Real; wh:array[U1..B9] of Real;
   cubeOK:Boolean;
   label setColors;
begin
  if RBInteractive.Checked then
  begin
    for i:= U1 to B9 do
    begin wh[i]:=100 + scanValue[i];end;
    goto setColors;
  end;



  fCube.Empty;
//find the white colours first!
  for i:= U1 to B9 do
  wh[i]:= scanSaturation[i]/Math.Max(1,scanValue[i]);
  if scanValue[i]=0 then //????was soll diesr Code???
  begin
    if Sender<> nil then Application.MessageBox(PChar(Err[22]),'Web Cam',MB_ICONWARNING)
    else globalmessage:= Err[22];
    exit; //no message when triggered by webinterface
  end;


 //Bis zu 27 Werten mit Hue >TreshBlue und <treshOrange bestimmen.
 //Mehr dürfen es nicht sein. Diese dann nach wh[i] sortieren und die
 //18 mit dem höchsten wh rausnehmen. Von diesen die Hues sortieren und auch
 //die values

//rot-orange
//we define all facelets redorange which are between treshBlue and treshOrange
  cntRedORange:=0; for j:= 0 to 26 do whArr[j]:=9999999;
  for i:=U1 to B9 do
    if (ScanHue[i]>=treshBlue) or (ScanHue[i]<treshOrange) then
    begin
       if cntRedORange>26 then
       begin
         if Sender<> nil then Application.MessageBox(PChar(Err[46]),'Web Cam',MB_ICONWARNING)
         else globalmessage:= Err[46];
         exit;
       end;
       whArr[cntRedOrange]:=Round(wh[i]*10000);Inc(cntRedORange)
    end;

  bubblesort(whArr);
  cnt:=26;
  while (whArr[cnt]=9999999) and (cnt>0) do Dec(cnt); //cnt sitzt auf höchstem gültigen Wert
  index:=cnt-17;//index auf niedrigsten gültigen Wert
  if index<0 then
  begin
    if Sender<> nil then Application.MessageBox(PChar(Err[49]),'Web Cam',MB_ICONWARNING)
    else globalmessage:= Err[49];
    exit;
  end;
  j:=0;
  for i:= U1 to B9 do
    if ((ScanHue[i]>=treshBlue) or (ScanHue[i]<treshOrange)) and (Round(wh[i]*10000)< whArr[index]) then
    begin wh[i]:=0; Dec(cntRedORange); end //aussortieren als weiss
    else if ((ScanHue[i]>=treshBlue) or (ScanHue[i]<treshOrange)) and (Round(wh[i]*10000)<= whArr[cnt]) then
    begin
      wh[i]:=100;redOrangeVal[j]:= scanValue[i];
      redOrangeHue[j]:= scanHue[i];
      if redOrangeHue[j]>=treshBlue then redOrangeHue[j]:= redOrangeHue[j]-240; //zum Sortieren
      Inc(j);
    end; //akzeptieren
    Assert(j=18);
    bubblesort(redOrangeHue);bubblesort(redOrangeVal);
    //unteren 9 Werte rot bwz. auch die values von rot.
    redVal:=0;orangeVal:=0;
    for j:= 0 to 8 do redVal:=redVal+ redOrangeVal[j];
    for j:= 9 to 17 do orangeVal:=orangeVal+ redOrangeVal[j];
    redVal:=Round(redVal/9);orangeVal:=Round(orangeVal/9);
    redHue:=0;orangeHue:=0;
    for j:= 0 to 8 do redHue:=redHue+ redOrangeHue[j];
    for j:= 9 to 17 do orangeHue:=orangeHue+ redOrangeHue[j];
    redHue:=Round(redHue/9);orangeHue:=Round(orangeHue/9);
    if redHue<0 then redHue:=redHue+240;

  cntRed:=0;cntOrange:=0; cnt:=0;

  if ValSep.Checked then
    begin //dann Unterscheidung rot /orange auf value basieren lassen
    for i:=U1 to B9 do
    if (Round(wh[i])=100) then //rot oder orange
    begin
      if dist(redVal,ScanValue[i])<dist(orangeVal,ScanValue[i])
      then Inc(cntRed)//wh[i] bleibt 100
      else begin wh[i]:=101;Inc(cntOrange)end;
    end;
    if cntRed>9 then //zuviel rote, versuche anhand hue zu korrigieren
    for i:=U1 to B9 do
    if (Round(wh[i])=100) and (dist(redHue,ScanHue[i])>dist(orangeHue,ScanHue[i]))
    then begin wh[i]:=101; Dec(cntRed); Inc(cntOrange); end;
    if cntRed<9 then //zuwenig
    for i:=U1 to B9 do
    if (Round(wh[i])=101) and (dist(redHue,ScanHue[i])<dist(orangeHue,ScanHue[i]))
    then begin wh[i]:=100; Inc(cntRed); Dec(cntOrange); end;
  end
  else
  begin //base decion on hues
    for i:=U1 to B9 do
    if (Round(wh[i])=100) then //rot oder orange
    begin
      if (dist(redHue,ScanHue[i])<dist(orangeHue,ScanHue[i]))
      then Inc(cntRed) //wh[i] bleibt 100
      else if (dist(redHue,ScanHue[i])>dist(orangeHue,ScanHue[i]))
      then begin wh[i]:=101;Inc(cntOrange)end
      else//Abstände gleich
      begin
        if dist(redVal,ScanValue[i])<dist(orangeVal,ScanValue[i])
        then begin wh[i]:=100;Inc(cntRed); end
        else begin wh[i]:=101;Inc(cntOrange)end;
      end;
    end;
    if cntRed>9 then //zuviel rote
    for i:=U1 to B9 do
    if (Round(wh[i])=100) and (dist(redVal,ScanValue[i])>dist(orangeVal,ScanValue[i]))
    then begin wh[i]:=101; Dec(cntRed); Inc(cntOrange); end;
    if cntRed<9 then //zuwenig rote
    for i:=U1 to B9 do
    if (Round(wh[i])=101) and (dist(redVal,ScanValue[i])<dist(orangeVal,ScanValue[i]))
    then begin wh[i]:=100; Dec(cntOrange); Inc(cntRed); end;
  end;
  if (cntRed<>9) or (cntOrange<>9) then
  begin
    if Sender<> nil then Application.MessageBox(PChar(Err[40]),'Web Cam',MB_ICONWARNING)
    else globalmessage:= Err[40];
    exit;
  end;

//blue
//we define all facelets blue which are between treshGreen and treshBlue
  cntBlue:=0;
  for i:=U1 to B9 do
    if (ScanHue[i]>=treshGreen) and (ScanHue[i]<treshBlue) then Inc(cntBlue);

  if cntBlue>18 then
  begin
    if Sender<> nil then Application.MessageBox(PChar(Err[44]),'Web Cam',MB_ICONWARNING)
    else globalmessage:= Err[44];
    exit;
  end;
  if cntBlue<9 then
  begin
    if Sender<> nil then Application.MessageBox(PChar(Err[47]),'Web Cam',MB_ICONWARNING)
    else globalmessage:= Err[47];
    exit;
  end;


  //cntBlue>9 das kann passieren, wenn weiße facelets einen Blaustich haben.
  // Wir sortieren also die überschüssigen
  //facelets aus, bei denen wh[i] am kleinsten ist und ordnen ihnen die Farbe
  //weiss zu (d.h. wir setzen wh[i] auf 0) . Den anderen ordnen wir wh[i]=100 zu

  for j:= 0 to 26 do whArr[j]:=9999999;//oberen 9 werden hier nicht benötigt
  cnt:=0;
  for i:= U1 to B9 do
    if (ScanHue[i]>=treshGreen) and (ScanHue[i]<treshBlue)
    then begin whArr[cnt]:=Round(wh[i]*10000); Inc(cnt);end;
  bubblesort(whArr);
  cnt:=17;
  while (whArr[cnt]=9999999)  and (cnt>0) do Dec(cnt); //cnt sitzt auf höchstem gültigen Wert
  index:=cnt-8;//index auf niedrigsten gültigen Wert
  for i:= U1 to B9 do
    if (ScanHue[i]>=treshGreen) and (ScanHue[i]<treshBlue) and (Round(wh[i]*10000)< whArr[index]) then
    begin wh[i]:=0; Dec(cntBlue); end //als weiss aussortieren
    else if (ScanHue[i]>=treshGreen) and (ScanHue[i]<treshBlue) and (Round(wh[i]*10000)<= whArr[cnt]) then
    begin  wh[i]:=102;end; //akzeptieren

  if cntBlue<>9 then
  begin
    if Sender<> nil then Application.MessageBox(PChar(Err[41]),'Web Cam',MB_ICONWARNING)
    else globalmessage:= Err[41];
    exit;
  end;

//the same game for green
//we define all facelets green which are between 60 and 125
  cntGreen:=0;
  for i:=U1 to B9 do
    if (ScanHue[i]>=treshYellow) and (ScanHue[i]<treshGreen) then Inc(cntGreen);

  if cntGreen>18 then
  begin
    if Sender<> nil then Application.MessageBox(PChar(Err[45]),'Web Cam',MB_ICONWARNING)
    else globalmessage:= Err[45];
    exit;
  end;
  if cntGreen<9 then
  begin
    if Sender<> nil then Application.MessageBox(PChar(Err[48]),'Web Cam',MB_ICONWARNING)
    else globalmessage:= Err[48];
    exit;
  end;

  for j:= 0 to 26 do whArr[j]:=9999999;
  cnt:=0;
  for i:= U1 to B9 do
    if (ScanHue[i]>=treshYellow) and (ScanHue[i]<treshGreen)
      then begin whArr[cnt]:=Round(wh[i]*10000); Inc(cnt);end;
  bubblesort(whArr);
  cnt:=17;
  while (whArr[cnt]=9999999) and (cnt>0) do Dec(cnt);
  index:=cnt-8;
  for i:= U1 to B9 do
    if (ScanHue[i]>=treshYellow) and (ScanHue[i]<treshGreen) and (Round(wh[i]*10000)< whArr[index]) then
    begin wh[i]:=0; Dec(cntGreen); end //als weiss aussortieren
    else if (ScanHue[i]>=treshYellow) and (ScanHue[i]<treshGreen) and (Round(wh[i]*10000)<= whArr[cnt]) then
    begin  wh[i]:=103;end; //akzeptieren

  if cntGreen<>9 then
  begin
    if Sender<> nil then Application.MessageBox(PChar(Err[42]),'Web Cam',MB_ICONWARNING)
    else globalmessage:= Err[42];
    exit;
  end;

//Der Rest ist gelb oder weiss.
  cnt:=0;for j:=0 to 17 do blueRel[j]:=9999999;//nach dem Sortieren sicher oben,
  //wenn nicht alle Einträge belegt sind (was nicht vorkommen sollte)
  for i:=U1 to B9 do
  if Round(wh[i])<100 then begin blueRel[cnt]:=scanBlueRel[i]; Inc(cnt); end;
  BubbleSort(blueRel);
  whiteRel:=0;yellowRel:=0;
  for j:= 0 to 8 do yellowRel:=yellowRel+ blueRel[j];
  for j:= 9 to 17 do whiteRel:=whiteRel+ blueRel[j];
  yellowRel:=Round(yellowRel/9);whiteRel:=Round(whiteRel/9);

//yellow

  cntWhite:=0; cntYellow:=0;
  for i:=U1 to B9 do
    if (Round(wh[i])<100) then
    begin
      if ScanBlueRel[i]<blueRel[9] then
      begin wh[i]:=104;Inc(cntYellow); end
      else begin wh[i]:=105;Inc(cntWhite); end;
    end;
  if (cntWhite<>9) or (cntYellow<>9) then
  begin
    if Sender<> nil then Application.MessageBox(PChar(Err[43]),'Web Cam',MB_ICONWARNING)
    else globalmessage:= Err[43];
    exit;
  end;

setColors:
  //wenn kein Zentrum weiss, setze das Zentrum gegenüber von Gelb auf weiss
  //dies verhindert Probleme, wenn der Original weisse Sticker bedruckt ist.
  cnt:=0;
  for j:= 0 to 5 do if  Round(wh[Face(9*j+4)])=105 then inc(cnt);
  if cnt=0 then for j:= 0 to 5 do if  Round(wh[Face(9*j+4)])=104 then
  case j of
    0,1,2: begin wh[Face(9*(j+3)+4)]:=105;break; end;
    3,4,5: begin wh[Face(9*(j-3)+4)]:=105;break; end;
  end;

  for j:= 0 to 5 do
  case Round(wh[Face(9*j+4)]) of
    100: begin t[0]:=ColorIndex(j);Cubedefs.Color[ColorIndex(j)]:=clRed; end;
    101: begin t[1]:=ColorIndex(j);Cubedefs.Color[ColorIndex(j)]:=RGB(255,128,0);end;
    102: begin t[2]:=ColorIndex(j);Cubedefs.Color[ColorIndex(j)]:=clBlue;end;
    103: begin t[3]:=ColorIndex(j);Cubedefs.Color[ColorIndex(j)]:=clGreen; end;
    104: begin t[4]:=ColorIndex(j);Cubedefs.Color[ColorIndex(j)]:=clYellow;end;
    105: begin t[5]:=ColorIndex(j);Cubedefs.Color[ColorIndex(j)]:=clWhite; end;
  end;

  for i:= U1 to B9 do
      if (Round(wh[i]-100)>=0) and (Round(wh[i]-100)<=5) then
        fCube.PFace^[i]:= t[Round(wh[i]-100)]
        else fCube.PFace^[i]:=NoCol;


//now check all again
  for i:=U1 to B9 do
   if (i<>U5) and (i<>R5) and (i<>F5) and (i<>D5) and (i<>L5) and (i<>B5) then
    fCube.Check(i,true); //auto modus

  BTransferCam.Enabled:=false;//AUSKOMMENTIEREN, WENN DEBUGGT WERDEN SOLL
  for j:=0 to 5 do scannedFaces[j]:=false;
  PageCtrl.ActivePage:=TabSheet1;//facelet editor

  cubeOk:=true;
  for i:= U1 to B9 do
  if fCube.PFace^[i]=NoCol then cubeOK:=false;
  if cubeOK then begin AddCube(fCube,true,true,true,0,false);globalMessage:='Done!' end
     else globalmessage:= Err[22];
  FacePaint.Invalidate;
  OutPut.Invalidate;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++Temperature Correction red++++++++++++++++++++++++++++++++++++
procedure TForm1.TBRedChange(Sender: TObject);
begin
  RBSat.Checked:=true;
  fRed:=(Sender as TTrackBar).Position/100;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++Temperature Correction green++++++++++++++++++++++++++++++++++
procedure TForm1.TBGreenChange(Sender: TObject);
begin
  RBSat.Checked:=true;
  fGreen:=(Sender as TTrackBar).Position/100;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++Temperature Correction blue+++++++++++++++++++++++++++++++++++
procedure TForm1.TBBlueChange(Sender: TObject);
begin
  RBSat.Checked:=true;
  fBlue:=(Sender as TTrackBar).Position/100;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


//++++++++++++++++Bitmaps on Webcam PageControl+++++++++++++++++++++++++++++++++
procedure TForm1.TimerBlinkTimer(Sender: TObject);
var t:TTimer;
begin
  t:= Sender as TTimer;
  if not RbL.Checked then ILeft.Visible:=true;
  if not RbF.Checked then IFront.Visible:=true;
  if not RbR.Checked then IRight.Visible:=true;
  if not RbU.Checked then IUp.Visible:=true;
  if not RbD.Checked then IDown.Visible:=true;
  if RbL.Checked and (t.Tag>0) then ILeft.Visible:= not ILeft.Visible else
  if RbF.Checked and (t.Tag>0) then IFront.Visible:= not IFront.Visible else
  if RbR.Checked and (t.Tag>0) then IRight.Visible:= not IRight.Visible else
  if RbU.Checked and (t.Tag>0) then IUp.Visible:= not IUp.Visible else
  if RbD.Checked and (t.Tag>0) then IDown.Visible:= not IDown.Visible;

  t.Tag:= t.Tag-1;
  if t.tag=0 then
  begin
    t.Enabled:=false;
    ILeft.Visible:=true;IFront.Visible:=true;IRight.Visible:=true;
    IUp.Visible:=true;IDown.Visible:=true;
  end;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



//++++++++++++++++Called by non-VCL-Thread in Unit Video++++++++++++++++++++++++
procedure TForm1.Warning23(var Message: TMessage);
begin
  Application.MessageBox(PChar(Err[23]),'Web Cam',MB_ICONWARNING);
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++Called by non-VCL-Thread in Unit TcpServer++++++++++++++++++++++++
procedure TForm1.Connect(var Message: TMessage);
begin
  Capdevs.ItemIndex:= Message.WParam;//Index of Interface
  CapDevsChange(CapDevs);
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




//+++++++++++++++++++++Wheel Scrolling of Main Window+++++++++++++++++++++++++++
procedure TForm1.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  if h-Output.Height>0 then
  begin
    if WheelDelta>0 then
      SbVert.Position:= SbVert.Position - Max(1,400000*WheelDelta div (h-Output.Height))
    else
      SbVert.Position:= SbVert.Position + Max(1,-400000*WheelDelta div (h-Output.Height));

    yOffset:= Round(SbVert.Position/SbVert.Max*(h-Output.Height));
    Output.Invalidate;
    SbHor.Invalidate;//some strange effects else
  end
   else begin yOffset:=0;SbVert.Position:=0;end;
   Handled:=True;
end;

//+++++++++++++++++++Show Webserver Configuration Window++++++++++++++++++++++++
 procedure TForm1.WebServer1Click(Sender: TObject);
begin
  ServSetupForm.Show;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


//++++++++++++++++++++++Webserver returns a gif image+++++++++++++++++++++++++++
function getGif(request:String):String;
var gif:String; ms: TMemoryStream;
begin
  ms:=TMemoryStream.Create;
  ms.LoadFromFile(request);
  SetLength(gif,ms.Size);
  ms.Read(gif[1],Length(gif));
  Result:='HTTP/1.0 200 OK'#13#10#13#10+gif;
  ms.Free;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++++++++++++++++Error Handling for Socket Errors+++++++++++++++++++++++
procedure TForm1.ServerSocket1ClientError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
 Socket.Close;
 ErrorCode:=0;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++++++++++++Create a new Thread for the TcpServer++++++++++++++++++++++
procedure TForm1.ServerSocket1GetThread(Sender: TObject;
  ClientSocket: TServerClientWinSocket;
  var SocketThread: TServerClientThread);
begin
begin
  // Create a new thread for connection
  SocketThread := TTcpServerThread.Create(False, ClientSocket);
end;
//+++++++++++++++++++Create a new Thread for the TcpServer++++++++++++++++++++++

end;

procedure TForm1.TimerWatchDogTimer(Sender: TObject);
var s: String;
begin
{  if  ServSetupForm.CBEnable.Checked and ButtonAddSolve.Enabled
      then ClientSocket1.Open; //Check if Server is Running    }//im Augenblick uninteressant
      //Intervall 600000 ist default
  case ryanCount of
  0:  begin BScanClick(nil); TypeText('aaa',1);TimerWatchdog.Interval:=600;end;
  1:  begin BScanClick(nil);TypeText('aaa',1);end;
  2:  begin BScanClick(nil);TypeText('aaa',1); end;
  3:  begin BScanClick(nil);TypeText('yyy',1); end;
  4:  begin BScanClick(nil);TypeText('yy',1);end;
  5:  begin BScanClick(nil);TypeText('yyya',1);TimerWatchdog.Interval:=100; end;
  6:  Begin BTransferCamClick(nil);Application.ProcessMessages;TimerWatchdog.Interval:=2400;end;
  7:  begin TimerWatchdog.Enabled:=false; if fcN>0 then begin s:=ToRyanHeise(fc[fcN-1].maneuver); TypeText(s,2);end; end;
  end;
  inc(ryanCount);
end;

//++++++++++++++++++++++++Test if Server still is running+++++++++++++++++++++++
procedure TForm1.ClientSocket1Error(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
  if (ErrorCode<>10053) and  ServSetupForm.CBEnable.Checked then //10053: Server works
  if ClientSocket1.Port<>ServerSocket1.Port then
     ClientSocket1.Port:=ServerSocket1.Port
  else
  begin
    ServerSocket1.Close ; //Server neu starten
    ServerSocket1.Open;
 //   Application.MessageBox(PChar('ErrorCode'+ IntToStr(ErrorCode)+'. Server restarted.'),'');
  end;
  ErrorCode:=0;//suppress Exception
  ClientSocket1.Close;
end;

procedure TForm1.BRunSymClick(Sender: TObject);
var j,c:Integer; hasSym: Boolean;
begin
   counter:=0;  //nur für Abzählzwecke, nicht relevant

   if BRunSym.Caption='Start Search' then
   begin
      if  RBSym.Checked then //Symmetry Buttons sichtbar
      begin
        hasSym:=false;
        for j:= 0 to 47 do
          if curSym[j]=1 then begin hasSym:=true; break; end;
        if not hasSym then exit
      end
      else if CBAsy.ItemIndex<0 then exit; //RBASym checked

      BRunSym.Caption:='Stop Search';
      CBContinuous.Enabled:=false;
      CBSymmetries.Enabled:=false;
      c:= Form1.ComponentCount;
      for j:= 0 to c-1 do
        if (Form1.Components[j] is TSpeedButton)
        and  (TSpeedButton(Form1.Components[j]).Parent.Name = 'GBSpeed')
        then TSpeedButton(Form1.Components[j]).Enabled:=false;//während Suche deaktivieren
      ss:=SySearch.Create;
//    ss.FreeOnTerminate:=true;
      ss.OnTerminate:= SymSearchTerminate;
 //   ss.Priority:= tpLower;
      ss.Resume;
   end
   else ss.Terminate;
end;

procedure TForm1.CbSymmetriesDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var x,y:Integer;
begin
  x:= Rect.Left; y:= Rect.Top;
  ImageList1.Draw(CbSymmetries.Canvas,x,y,Index);
  CbSymmetries.Canvas.TextOut(x+50,y+10,CbSymmetries.Items[Index]);
end;

procedure TForm1.CbSymmetriesChange(Sender: TObject);
var n,i,idxsave: Integer;
begin
  if CBSymmetries.ItemIndex<0 then exit;//kann durch Aufruf von BRunSymClick passieren
  idxsave:= CBASy.ItemIndex;//wegen Aufruf von BRunSymClick, darf dann nicht gelöscht werden

  n:=CBSymmetries.ItemIndex;//Vertauscht

  BClearSymClick(nil);

  CBAsy.Clear;
  case n of
     0: begin
          SBmc.Down:=true;SBr31.Down:=true;SBr41.Down:=true;
          CBASy.Items.Append(CBSymmetries.Items[1]);
          CBASy.Items.Append(CBSymmetries.Items[2]);
          CBASy.Items.Append(CBSymmetries.Items[4]);
        end;
     1: begin SBr2e2.Down:=true;SBr31.Down:=true;SBr41.Down:=true;
          CBASy.Items.Append(CBSymmetries.Items[6]);
        end;
     2: begin SBr31.Down:=true;SBme1.Down:=true;
          CBASy.Items.Append(CBSymmetries.Items[6]);
        end;
     3: begin SBmc.Down:=true;SBr31.Down:=true;SBr2e2.Down:=true;
          CBASy.Items.Append(CBSymmetries.Items[5]);
          CBASy.Items.Append(CBSymmetries.Items[8]);
          CBASy.Items.Append(CBSymmetries.Items[15]);
        end;
     4: begin SBr31.Down:=true;SBmf1.Down:=true;
          CBASy.Items.Append(CBSymmetries.Items[6]);
        end;
     5: begin SBr31.Down:=true;SBme2.Down:=true;
          CBASy.Items.Append(CBSymmetries.Items[26]);
        end;
     6: begin SBr31.Down:=true;SBr2f1.Down:=true;CBASy.ItemIndex:=-1;end;
     7: begin SBmc.Down:=true;SBr41.Down:=true;SBr2e2.Down:=true;
          CBASy.Items.Append(CBSymmetries.Items[9]);
          CBASy.Items.Append(CBSymmetries.Items[10]);
          CBASy.Items.Append(CBSymmetries.Items[11]);
          CBASy.Items.Append(CBSymmetries.Items[12]);
          CBASy.Items.Append(CBSymmetries.Items[13]);
          CBASy.Items.Append(CBSymmetries.Items[14]);
          CBASy.Items.Append(CBSymmetries.Items[16]);
        end;
     8: begin SBr31.Down:=true;SBr2e2.Down:=true;
          CBASy.Items.Append(CBSymmetries.Items[26]);
        end;
     9: begin SBr41.Down:=true;SBr2f2.Down:=true;
          CBASy.Items.Append(CBSymmetries.Items[20]);
          CBASy.Items.Append(CBSymmetries.Items[21]);
          CBASy.Items.Append(CBSymmetries.Items[22]);
        end;
    10: begin SBm41.Down:=true;SBr2f2.Down:=true;
          CBASy.Items.Append(CBSymmetries.Items[17]);
          CBASy.Items.Append(CBSymmetries.Items[22]);
          CBASy.Items.Append(CBSymmetries.Items[23]);
        end;
    11: begin SBr41.Down:=true;SBme1.Down:=true;
          CBASy.Items.Append(CBSymmetries.Items[17]);
          CBASy.Items.Append(CBSymmetries.Items[21]);
          CBASy.Items.Append(CBSymmetries.Items[25]);
        end;
    12: begin SBmc.Down:=true;SBr41.Down:=true;
          CBASy.Items.Append(CBSymmetries.Items[21]);
          CBASy.Items.Append(CBSymmetries.Items[23]);
          CBASy.Items.Append(CBSymmetries.Items[24]);
        end;
    13: begin SBmc.Down:=true;SBr2e1.Down:=true;SBr2e2.Down:=true;
          CBASy.Items.Append(CBSymmetries.Items[17]);
          CBASy.Items.Append(CBSymmetries.Items[18]);
          CBASy.Items.Append(CBSymmetries.Items[19]);
          CBASy.Items.Append(CBSymmetries.Items[20]);
          CBASy.Items.Append(CBSymmetries.Items[24]);
        end;
    14: begin SBm41.Down:=true;SBr2e2.Down:=true;
          CBASy.Items.Append(CBSymmetries.Items[20]);
          CBASy.Items.Append(CBSymmetries.Items[23]);
          CBASy.Items.Append(CBSymmetries.Items[25]);
        end;
    15: begin SBmc.Down:=true;SBr31.Down:=true;
          CBASy.Items.Append(CBSymmetries.Items[26]);
        end;
    16: begin SBmc.Down:=true;SBr2f1.Down:=true;SBr2f2.Down:=true;
          CBASy.Items.Append(CBSymmetries.Items[22]);
          CBASy.Items.Append(CBSymmetries.Items[24]);
          CBASy.Items.Append(CBSymmetries.Items[25]);
        end;
    17: begin SBme1.Down:=true;SBr2f1.Down:=true;
          CBASy.Items.Append(CBSymmetries.Items[27]);
          CBASy.Items.Append(CBSymmetries.Items[29]);
        end;
    18: begin SBmf1.Down:=true;SBr2e2.Down:=true;
          CBASy.Items.Append(CBSymmetries.Items[27]);
          CBASy.Items.Append(CBSymmetries.Items[28]);
          CBASy.Items.Append(CBSymmetries.Items[30]);
        end;
    19: begin SBmc.Down:=true;SBr2e2.Down:=true;
          CBASy.Items.Append(CBSymmetries.Items[27]); //gedreht, bild 34
          CBASy.Items.Append(CBSymmetries.Items[28]);
          CBASy.Items.Append(CBSymmetries.Items[31]);
        end;
    20: begin SBr2e1.Down:=true;SBr2e2.Down:=true;
          CBASy.Items.Append(CBSymmetries.Items[28]);
          CBASy.Items.Append(CBSymmetries.Items[29]);
        end;
    21: begin SBr41.Down:=true;
          CBASy.Items.Append(CBSymmetries.Items[29]);
        end;
    22: begin SBr2f1.Down:=true;SBr2f2.Down:=true;
          CBASy.Items.Append(CBSymmetries.Items[29]);
        end;
    23: begin SBm41.Down:=true;
          CBASy.Items.Append(CBSymmetries.Items[29]);
        end;
    24: begin SBmc.Down:=true;SBr2f1.Down:=true;
          CBASy.Items.Append(CBSymmetries.Items[29]);
          CBASy.Items.Append(CBSymmetries.Items[30]);
          CBASy.Items.Append(CBSymmetries.Items[31]);
        end;
    25: begin SBmf2.Down:=true;SBr2f1.Down:=true;
          CBASy.Items.Append(CBSymmetries.Items[29]);
          CBASy.Items.Append(CBSymmetries.Items[30]);//gedreht Bild 33
        end;
    26: begin SBr31.Down:=true;CBASy.ItemIndex:=-1;end;
    27: begin SBme1.Down:=true;
          CBASy.Items.Append(CBSymmetries.Items[32]);
        end;
    28: begin SBr2e2.Down:=true;
          CBASy.Items.Append(CBSymmetries.Items[32]);
        end;
    29: begin SBr2f1.Down:=true;
          CBASy.Items.Append(CBSymmetries.Items[32]);
        end;
    30: begin SBmf1.Down:=true;
          CBASy.Items.Append(CBSymmetries.Items[32]);
        end;
    31: begin SBmc.Down:=true;
          CBASy.Items.Append(CBSymmetries.Items[32]);
        end;
  end;
    If Assigned(Sender) then CBASy.ItemIndex:=0 //Aufruf eventuell auch von BRunSymClick mit nil
    else CBASy.ItemIndex:= IdxSave;
  for i:= 0 to 8 do t[i]:=-1;
  case n of
    0: begin t[0]:=1;t[1]:=2;t[2]:=4;end;//Bildindices der Untergruppen der AntiSymmetrien
    1,2: begin t[0]:=6; end;
    3: begin t[0]:=5;t[1]:=8;t[2]:=15;end;
    4: begin t[0]:=6; end;
    5: begin t[0]:=26; end;
    7: begin t[0]:=9;t[1]:=10;t[2]:=11;t[3]:=12;t[4]:=13;t[5]:=14;t[6]:=16;end;
    8: begin t[0]:=26;end;
    9: begin t[0]:=20;t[1]:=21;t[2]:=22;end;
   10: begin t[0]:=17;t[1]:=22;t[2]:=23;end;
   11: begin t[0]:=17;t[1]:=21;t[2]:=25;end;
   12: begin t[0]:=21;t[1]:=23;t[2]:=24;end;
   13: begin t[0]:=17;t[1]:=18;t[2]:=19;t[3]:=20;t[4]:=24;end;
   14: begin t[0]:=20;t[1]:=23;t[2]:=25;end;
   15: begin t[0]:=26;end;
   16: begin t[0]:=22;t[1]:=24;t[2]:=25;end;
   17: begin t[0]:=27;t[1]:=29;end;
   18: begin t[0]:=27;t[1]:=28;t[2]:=30;end;
   19: begin t[0]:=34;t[1]:=28;t[2]:=31;end;//Vorsicht mit 34, Symmetrie = 3 !!
   20: begin t[0]:=28;t[1]:=29;end;
   21: begin t[0]:=29;end;
   22: begin t[0]:=29;end;
   23: begin t[0]:=29;end;
   24: begin t[0]:=29;t[1]:=30;t[2]:=31;end;
   25: begin t[0]:=29;t[1]:=33;end;//Vorsicht mit 33, Symmetrie = 1 !!
   27..31: begin t[0]:=32;end;
  end;
  Assert(n>=0,IntToStr(n));
  LSymSize.Caption:=SymInfo1[n];
  LSymN.Caption:=SymInfo2[n];
  SBSymmetriesClick(nil);//does not matter which button
  CBASyChange(nil);
  CBAsy.Repaint;
end;

//+++++++++++Erzeuge alle abhängigen Symmetrien und AntiSymmetrien
//und aktualisiere curSym und curAsym

procedure TForm1.SBSymmetriesClick(Sender: TObject);
var i,j,c,sk: Integer; b:TSpeedButton;  newSymFound,isinCurSymNormal:Boolean;
begin
  sk:=-1;
  if (Sender<>nil) then //dann kein Aufruf von CBSymmetryChange obendrüber,
  //sondern von Buttons oder CSelfInverse und die Boxen ungültig machen
  begin
    CBSymmetries.Itemindex:=-1;{CBAsy.ItemIndex:=-1;}CBAsy.Clear;//AsyBox Ungültig machen
    for i:= 0 to 8 do t[i]:=-1;
    if TSpeedButton(Sender).Down=false then sk:=TSpeedButton(Sender).Tag;//clear this symmetry
  end;
  for i:= 0 to 47 do curSym[i]:=0;
  curSym[0]:=1;//hat immer die Identität als Symmetrie
  if CSelfinverse.Checked then curAsym:=1 else curAsym:=0;//curAsym=1 bedeutet selbstinvers!
  c:= Form1.ComponentCount;
  for i:= 0 to c-1 do if (Form1.Components[i] is TSpeedButton) and
    (TSpeedButton(Form1.Components[i]).Parent.Name = 'GBSpeed') then
    begin
      b:= TSpeedButton(Form1.Components[i]);
      if b.Down then
      curSym[b.Tag]:=1; //initialize symmetry vector
      if not b.Flat then curASym:= curASym or ( Int64(1) shl b.Tag);//initialize Asym-Vector
    end;
   repeat
    newSymFound:=false;
    for i:= 0 to 47 do
    for j:= 0 to 47 do
    begin
      if (curSym[i]=1) and (curSym[j]=1) then
        if curSym[SymMult[i,j]]=0 then begin curSym[SymMult[i,j]]:=1; newSymFound:=true; end;

      if Odd(curAsym shr i)  and Odd(curAsym shr j) then
          if curSym[SymMult[i,j]]=0 then begin curSym[SymMult[i,j]]:=1; newSymFound:=true; end;

       if Odd(curAsym shr i)  and (curSym[j]=1) then
           if not Odd(curAsym shr SymMult[i,j]) then
            begin curASym:= curASym or ( Int64(1) shl SymMult[i,j]); newSymFound:=true; end;

      if Odd(curAsym shr j)  and (curSym[i]=1) then
           if not Odd(curAsym shr SymMult[i,j]) then
            begin curASym:= curASym or ( Int64(1) shl SymMult[i,j]); newSymFound:=true; end;
     end;
  until not newSymFound;
  c:= Form1.ComponentCount;
  if ((sk<>-1) and (curSym[sk]=1)) then BClearSymClick(nil) else //die deaktivierte
  //Symmetrie wird von den anderen Symmetrien wieder neu erzeugt->alles löschen!
    for i:= 0 to c-1 do if (Form1.Components[i] is TSpeedButton) and
     (TSpeedButton(Form1.Components[i]).Parent.Name = 'GBSpeed') then
    begin
      b:= TSpeedButton(Form1.Components[i]);
      if curSym[b.Tag]=1 then b.Down:=true;
      if Odd(curAsym shr b.Tag) then b.Flat:=false;
    end;
  if Odd(curAsym) then CSelfinverse.Checked:=true;

  curSymNormal:=0; //die größte Untergruppe von M, die curSym bei Konjugation invariant lässt
  for i:= 0 to 47 do
  begin
    isinCurSymNormal:=true;
    for j:= 0 to 47 do
    if (curSym[j]=1) then
    begin
      if curSym[SymMult[SymMult[InvIdx[i],j],i]]=0 then   //x^-1hx in H  für alle h in H prüfen, H ist Symmetriegruppe
      begin
        isinCurSymNormal:=false;
        break;
      end;
    end ;
    if isinCurSymNormal then curSymNormal:= curSymNormal or ( Int64(1) shl i);
  end;





//nur zur Bestimmung der Symmetrien die dann in cubedef.pas abgelegt werden!
//    curASym:=0;
//    for i:= 0 to 47 do
//      if curSym[i]=1 then curASym:= curASym or ( Int64(1) shl i);
//   edit2.Text:=IntToStr(Int64(curASym));
end;

procedure TForm1.BClearSymClick(Sender: TObject);
var c,i:Integer;
begin
  c:= Form1.ComponentCount;
  for i:= 0 to c-1 do if (Form1.Components[i] is TSpeedButton) and
    (TSpeedButton(Form1.Components[i]).Parent.Name = 'GBSpeed') then
      begin
      TSpeedButton(Form1.Components[i]).Flat:=true;//Antisymmetrie löschen
      TSpeedButton(Form1.Components[i]).Down:=false;//Symmetrie löschen
      TSpeedButton(Form1.Components[i]).Enabled:=false;
      TSpeedButton(Form1.Components[i]).Enabled:=true;//sonst Probleme
      end;
  CSelfinverse.Checked:=false;
end;

Procedure TForm1.SymSearchTerminate(Sender: TObject);
var j,c:Integer;
begin
  BRunSym.Caption:='Start Search';
  c:= Form1.ComponentCount;
  CBContinuous.Enabled:=true;
  for j:= 0 to c-1 do
  if (Form1.Components[j] is TSpeedButton)
  and  (TSpeedButton(Form1.Components[j]).Parent.Name = 'GBSpeed')
       then TSpeedButton(Form1.Components[j]).enabled:=true;
  CBSymmetries.Enabled:=true;
  (SymSearch.fc).Free;
end;

//++++++++++++++Symmetrien des Würfels auf die Buttons übertragen+++++++++++++++++++++++++++
procedure TForm1.MTransferSymClick(Sender: TObject);
var s,c,j: Integer;
    cu: CubieCube;
    hasSym, hasAntiSym:Boolean;
    csave:CornerCubie;
    esave:EdgeCubie;
    cnsave:CenterCubie;
    c1:Corner;
    e1:Edge;
    cn1: TurnAxis;
    paintType: Integer;
begin
  CBSymmetries.ItemIndex:=-1;
  CBASy.Clear;
  for j:= 0 to 8 do t[j]:=-1;
  c:= Form1.ComponentCount;
  for j:= 0 to c-1 do
    if (Form1.Components[j] is TSpeedButton)
      and  (TSpeedButton(Form1.Components[j]).Parent.Name = 'GBSpeed')
    then
    begin
      TSpeedButton(Form1.Components[j]).Down:=false;//Symmetrie und Antisymmetrie löschen
      TSpeedButton(Form1.Components[j]).Flat:=true;
    end;
    CSelfinverse.Checked:=false;//Selbsinversflag löschen


  if CubePopUpMenu.Tag = -1 then exit;
  paintType:= fc[CubePopUpMenu.Tag].paintType;//0: all, 1: onlyCorners, 2: onlyEdges

  cu:=CubieCube.Create(fc[CubePopUpMenu.Tag]);
  for s:= 0 to 47 do
  begin
    hasSym:=true; //dies muss jetzt widerlegt werden!
    CornMult(CornSym[s],cu.PCorn^,cu.PCornTemp^);
    CornMult(cu.PCornTemp^,CornSym[InvIdx[s]],csave);
    EdgeMult(EdgeSym[s],cu.PEdge^,cu.PEdgeTemp^);
    EdgeMult(cu.PEdgeTemp^,EdgeSym[InvIdx[s]],esave);
    if cu.isOriented then
    begin
      CentMult(CentSym[s],cu.PCent^,cu.PCentTemp^);
      CentMult(cu.PCentTemp^,CentSym[InvIdx[s]],cnsave);
    end;

    if paintType<>2 then //nicht nur die Kanten
    begin
      for c1:= URF to DRB do
        if (csave[c1].c<>cu.PCorn^[c1].c) or (csave[c1].o<>cu.PCorn^[c1].o) then
        begin
          hasSym:=false;
          break;
        end;
    end;
    if paintType<>1 then //nicht nur die Ecken
    begin
      for e1:= UR to BR do
      begin
        if not hasSym then break;
        if (esave[e1].e<>cu.PEdge^[e1].e) or (esave[e1].o<>cu.PEdge^[e1].o) then
        begin
          hasSym:=false;
          break;
        end;
      end;
    end;
    if cu.isOriented then
    for cn1:= U to B do//nur wenn
    begin
      if not hasSym then break;
      if (cnsave[cn1].c<>cu.PCent^[cn1].c) or (cnsave[cn1].o<>cu.PCent^[cn1].o) then
      begin
        hasSym:=false;
        break;
      end;
    end;

    if hasSym then
    begin
      c:= Form1.ComponentCount;
      for j:= 0 to c-1 do
        if (Form1.Components[j] is TSpeedButton)
          and  (TSpeedButton(Form1.Components[j]).Parent.Name = 'GBSpeed')
          and  (TSpeedButton(Form1.Components[j]).Tag=s)
        then TSpeedButton(Form1.Components[j]).Down:=true;
    end;
  end;
  SBSymmetriesClick(nil);
//  hasAntiSym widerlegen
  for s:= 0 to 47 do
  begin
    hasAntiSym:=true;
    CornMult(CornSym[s],cu.PCorn^,cu.PCornTemp^);
    CornMult(cu.PCornTemp^,CornSym[InvIdx[s]],csave);
    EdgeMult(EdgeSym[s],cu.PEdge^,cu.PEdgeTemp^);
    EdgeMult(cu.PEdgeTemp^,EdgeSym[InvIdx[s]],esave);
    if cu.isOriented then
    begin
      CentMult(CentSym[s],cu.PCent^,cu.PCentTemp^);
      CentMult(cu.PCentTemp^,CentSym[InvIdx[s]],cnsave);
    end;


    CornMult(csave,cu.PCorn^,cu.PCornTemp^); //Produkt muss Id sein
    EdgeMult(esave,cu.PEdge^,cu.PEdgeTemp^);
    if cu.isOriented then CentMult(cnsave,cu.PCent^,cu.PCentTemp^);

    if paintType<>2 then //nicht nur die Kanten
    begin
      for c1:= URF to DRB do
        if (cu.PCornTemp^[c1].c<>c1) or (cu.PCornTemp^[c1].o<>0) then
        begin
          hasAntiSym:=false;
          break;
        end;
    end;

    if paintType<>1 then  //nicht nur die Ecken
    begin
    for e1:= UR to BR do
      begin
        if not hasAntiSym then break;
        if (cu.PEdgeTemp^[e1].e<>e1) or (cu.PEdgeTemp^[e1].o<>0) then
        begin
          hasAntiSym:=false;
          break;
        end;
      end;
    end;

    if cu.isOriented then
    for cn1:= U to B do//nur wenn
    begin
      if not hasAntiSym then break;
      if (cu.PCentTemp^[cn1].c<>cn1) or (cu.PCentTemp^[cn1].o<>0) then
      begin
        hasAntiSym:=false;
        break;
      end;
    end;



    if hasAntiSym then
    begin
      if s=0 then CSelfinverse.Checked:=true;
      c:= Form1.ComponentCount;
      for j:= 0 to c-1 do
        if (Form1.Components[j] is TSpeedButton)
          and  (TSpeedButton(Form1.Components[j]).Parent.Name = 'GBSpeed')
          and  (TSpeedButton(Form1.Components[j]).Tag=s)
        then TSpeedButton(Form1.Components[j]).Flat:=false;
    end;
  end;
  SBSymmetriesClick(nil);
  PageCtrl.ActivePage:= TabSym;
   ////////////////////////////


end;

procedure TForm1.CubePopupMenuPopup(Sender: TObject);
begin
  if BRunSym.Caption='Stop Search' then MTransferSym.Enabled:=false
  else  MTRansferSym.Enabled:=true;


  if (length(fc[CubePopUpMenu.Tag].maneuver) =0)
     and ( (Pos('Status',fc[CubePopUpMenu.Tag].optManeuver)<>0) or
           (length(fc[CubePopUpMenu.Tag].optmaneuver) =0) )
  then begin CopySolverToClipboard.Enabled:=false;CopyGeneratorToClipboard.Enabled:=false;end
  else  begin CopySolverToClipboard.Enabled:=true;CopyGeneratorToClipboard.Enabled:=true;end

end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
 if (fcN=0) or (BRunSym.Caption='Stop Search') or  (RunPatButton.Caption='Stop Search')
 then ClearMainWindow1.Enabled:=false
 else ClearMainWindow1.Enabled:=true;

end;

procedure TForm1.CBIsomorphClick(Sender: TObject);
begin
//  if RBEdgesO.Checked or RBCornersO.Checked then CBIsomorph.Checked:=true;
end;

procedure TForm1.RBEdgesOClick(Sender: TObject);
begin
//  CBIsomorph.Checked:=true;
end;

procedure TForm1.RBCornersOClick(Sender: TObject);
begin
//  CBIsomorph.Checked:=true;
end;

procedure TForm1.RBSymClick(Sender: TObject);
begin
  GBSpeed.Visible:=true;
  GBAntiSym.Visible:=false;
  MemoAntisym.Visible:=false;
  CBASyChange(nil);
end;

procedure TForm1.RBASymClick(Sender: TObject);
begin
  GBSpeed.Visible:=false;
  GBAntiSym.Visible:=true;
  MemoAntisym.Visible:=true;
  CBAsyChange(nil);//Buttons setzen!
end;


procedure TForm1.CBASyDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var x,y: Integer;
begin
  x:= Rect.Left; y:= Rect.Top;
  ImageList1.Draw(CbASy.Canvas,x,y,t[Index]);
  CbASy.Canvas.TextOut(x+50,y+10,CbASy.Items[Index]);
end;


procedure TForm1.CBASyChange(Sender: TObject);
var i,c:Integer;tmp,tmp1:Int64;b:TSpeedButton;
begin

  if (CBAsy.Itemindex>=0) and (RBAsym.Checked) then//die Buttons für
  //die Antisymmetrie setzen! Auch beim Umschalten auf CBAsy aufrufen.
 begin
   CSelfInverse.checked:=false;
   tmp:=ImageSym[t[CBAsy.ItemIndex]];
   tmp1:=ImageSym[CBSymmetries.ItemIndex];

   c:= Form1.ComponentCount;
   for i:= 0 to c-1 do if (Form1.Components[i] is TSpeedButton) and
     (TSpeedButton(Form1.Components[i]).Parent.Name = 'GBSpeed') then
     begin
       b:= TSpeedButton(Form1.Components[i]);
       b.Down:=false;b.Flat:=true;
       if Odd(tmp1 shr b.Tag) then
        if Odd(tmp shr b.Tag) then b.Down:=true else b.flat:=false;
     end;
     SBSymmetriesClick(nil)//Symmetrien aktualisieren
  end
  else
  if (CBSymmetries.Itemindex>=0) and (RBSym.Checked) then//die Buttons für
 begin
   CSelfInverse.checked:=false;
   tmp1:=ImageSym[CBSymmetries.ItemIndex];
   c:= Form1.ComponentCount;
   for i:= 0 to c-1 do if (Form1.Components[i] is TSpeedButton) and
     (TSpeedButton(Form1.Components[i]).Parent.Name = 'GBSpeed') then
     begin
       b:= TSpeedButton(Form1.Components[i]);
       b.Down:=false;b.Flat:=true;
       if Odd(tmp1 shr b.Tag) then b.Down:=true;
     end;
     SBSymmetriesClick(nil)//Symmetrien aktualisieren
  end
  else
end;

{*
procedure TForm1.RBExactClick(Sender: TObject);
begin
 // CBSelfInverse.Enabled:=false;
end;

procedure TForm1.RBHigherClick(Sender: TObject);
begin
  CBSelfInverse.Enabled:=true;
end;
*}

procedure TForm1.MIApplySymToSelClick(Sender: TObject);
var j,n,x4,x3,x2,x1: Integer;
begin
 // n:= (Sender as TMenuItem)..Tag;
 n:=  (Sender as TMenuItem).GetParentComponent.Tag;// ApplySymPopUp Menue
  case n of
    11,20,28,34,39: n:=InvIdx[n];//Rotation immer om Uhrzeigersinn von URF aus
  end;
  x4:= n mod 2;n:=n div 2;
  x3:= n mod 4;n:=n div 4;
  x2:= n mod 2;x1:=n div 2;
  for j:=0 to fcN-1 do
    if fc[j].selected  then
    begin
      with fc[j] do
      begin
        for n:=0 to x1-1 do
        begin
          Conjugate(S_URF3);
          maneuver:=MT(maneuver,S_URF3);
          if Pos('Status',optManeuver)=0 then
          optManeuver:=MT(optManeuver,S_URF3);
        end;
        for n:=0 to x2-1 do
        begin
          Conjugate(S_F2);
          maneuver:=MT(maneuver,S_F2);
          if Pos('Status',optManeuver)=0 then
          optManeuver:=MT(optManeuver,S_F2);
        end;
        for n:=0 to x3-1 do
        begin
          Conjugate(S_U4);
          maneuver:=MT(maneuver,S_U4);
          if Pos('Status',optManeuver)=0 then
          optManeuver:=MT(optManeuver,S_U4);
        end;
        for n:=0 to x4-1 do
        begin
          Conjugate(S_LR2);
          maneuver:=MT(maneuver,S_LR2);
          if Pos('Status',optManeuver)=0 then
          optManeuver:=MT(optManeuver,S_LR2);
        end;
      end;
      Output.Invalidate;
    end;

end;

procedure TForm1.SBr2e1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

end;

//+++++PopupMenu über den Symmetriebuttons initialisieren++++++++++++++++++++++
procedure TForm1.ApplySymPopUpPopup(Sender: TObject);
begin
  if lastSelected=-1 then  MIApplySymToSel.Enabled:=false
  else MIApplySymToSel.Enabled:=true;
 With (Sender As TPopupMenu) Do //Patch, damit Button wieder flat wird.
    begin
      (Popupcomponent As TControl).Perform( CM_MOUSELEAVE, 0, 0 );
      (Sender As TPopupMenu).Tag:= (Popupcomponent As TControl).Tag;//Symmetrie im Menü speichern
    end
end;

procedure DoManeuverString(fcb:FaceletCube;man:String; var mvs: Integer);
var i,j,n,pow,pp:Integer; t,t1:TurnAxis;
fcount: array[0..5] of Integer;
begin
  mvs:=0;
  for i:=0 to 5 do fcount[i]:=0;

  n:= Pos('//',man);//Kommentar entfernen
  if n>0 then man:=Trim(Copy(man,1,n-1));

  n:= Length(man);//Auch Singmaster Notation verarbeiten!
  for i:=1 to n do
  begin
    case man[i] of
      'U','u': inc(fcount[0]);
      'R','r': inc(fcount[1]);
      'F','f': inc(fcount[2]);
      'D','d': inc(fcount[3]);
      'L','l': inc(fcount[4]);
      'B','b': inc(fcount[5]);
     end;
  end;
  if (fcount[0]=8) and  (fcount[1]=8) and  (fcount[2]=8) and  (fcount[3]=8)
     and  (fcount[4]=8)and  (fcount[5]=8) then //Singmaster notation for maneuvers
  begin
    n:= Length(man);
    j:=0;
    for i:=1 to n do
    begin
      case man[i] of
        'U','u': begin fcb.PFace^[SingmasterToFace[j]]:=UCol;inc(j); end;
        'R','r': begin fcb.PFace^[SingmasterToFace[j]]:=RCol;inc(j); end;
        'F','f': begin fcb.PFace^[SingmasterToFace[j]]:=FCol;inc(j); end;
        'D','d': begin fcb.PFace^[SingmasterToFace[j]]:=DCol;inc(j); end;
        'L','l': begin fcb.PFace^[SingmasterToFace[j]]:=LCol;inc(j); end;
        'B','b': begin fcb.PFace^[SingmasterToFace[j]]:=BCol;inc(j); end;
      end;
    end;
    fcb.phase2Length:=MAXNODES;
    exit;
  end;

  man:= man + ' ';
  n:=Length(man);
  t:=U;
  for i:= 1 to n do
  begin
    case man[i] of
      'U': t:=U;
      'R': t:=R;
      'F': t:=F;
      'D': t:=D;
      'L': t:=L;
      'B': t:=B;
      'E': t:=E;
      'M': t:=M;
      'S': t:=S;
      'x': t:=Us;
      'y': t:=RS;
      'z': t:=Fs;
    else
      continue;
    end;

    case man[i+1] of
      '3','''': pow:=3;
      '2': pow:=2;
      's': begin pow:=4;pp:=1; end;//nicht sehr eleganter Patch
      'a': begin pow:=4;pp:=2; end;
    else
      pow:=1;
    end;
    if (pow<4)then
    begin for j:= 1 to pow do fcb.Move(t); if not((t=Us) or (t=Rs) or (t=Fs))then Inc(mvs); end
    else //Xs oder Xa
    begin
      if t<=F then t1:= TurnAxis(Ord(t)+3) else t1:= TurnAxis(Ord(t)-3);
      case man[i+2] of //mit Sicherheit noch nicht Stringende erreicht
         '3','''': pow:=3;   //!!!!!!!!!!!!!!!!!!!!!ergänzt
         '2': pow:=2;
      else
        pow:=1;
      end;
      if pp=1 then//Slice move
      begin
        for j:= 1 to pow do fcb.Move(t);
        for j:= 1 to 4-pow do  fcb.Move(t1);
        Inc(mvs);
      end
      else //antislice move
      begin
        for j:= 1 to pow do fcb.Move(t);
        for j:= 1 to pow do fcb.Move(t1);
        Inc(mvs);
      end;
    end;
  end;
end;

function ManeuverStringLength(man:String):Integer;
var i,n,l:Integer;
begin
  n:=Length(man);
  l:=0;
  for i:= 1 to n do
  begin
    case man[i] of
      'U','R','F','D','L','B','E','M','S': inc(l);
      '/':break;
    else
      continue;
    end;
    if i=n then break;
    case man[i+1] of
      'a','s': inc(l);
    end;
  end;
  result:= l;
end;

procedure TForm1.BApplyManClick(Sender: TObject);
var  man: String; n,n1,n2,i,j,mvs:Integer; nomorebrackets: Boolean; csv:char;
begin
  man:= EManeuver.Text;
  man:=Trim(man);
  man:=man+'  ';//was anhängen
  n:=Length(man);
//Xa', Xa3 und Xs',Xs3 wird erkannt, aber noch nicht X'a, X'b, X3b, X3a, wird des
//halb in erstere Schreibweise umgewandelt.
  for i := 2 to n-1  do
    if ((man[i]='a')  or (man[i]='s') )
        and ((man[i-1]='''') or(man[i-1]='3') or (man[i-1]='2') or (man[i-1]='²'))
        then begin csv:= man[i-1];man[i-1]:=man[i]; man[i]:=csv; end;

//-1 wird in ' umgewandelt
  repeat
    j:=pos('-1',man);
    if j>0 then begin Delete(man,j,2); Insert('''',man,j); end;
  until j=0;
//  '²' wird in 2 verwandelt
  repeat
    j:=pos( '²',man);
    if j>0 then man[j]:='2';
  until j=0;
//  ' wird in 3 verwandelt
  repeat
    j:=pos( '''',man);
    if j>0 then man[j]:='3';
  until j=0;
//  - wird in 3 verwandelt
  repeat
    j:=pos('-',man);
    if j>0 then man[j]:='3';
  until j=0;

  repeat
    nomorebrackets:=true;
    n1:=pos('(',man);
    if n1>0 then
    begin
      nomorebrackets:=false;
      DoManeuverString(fCube,Copy(man,1,n1-1),mvs);
      man:=Copy(man,n1+1,500);
      n2:=pos(')',man);
      if n2>0 then
      begin
        j:=n2+1;
        while (man[j]>='0') and (man[j]<='9') do Inc(j);
        if j=n2+1 then DoManeuverString(fCube,Copy(man,1,n2-1),mvs)
        else
        begin
          i:= StrToInt(Copy(man,n2+1,j-n2-1));
          for j:=1 to i do DoManeuverString(fCube,Copy(man,1,n2-1),mvs)
        end;
        man:=Copy(man,n2+2,Length(man));
      end;
    end;
  until nomorebrackets;

  DoManeuverString(fCube,man,mvs);
  FacePaint.Invalidate;
  Output.Invalidate;
end;

procedure TForm1.CopySolverToClipboardClick(Sender: TObject);

begin
  with fc[CubePopUpMenu.Tag] do
  begin
  if (Pos('Status',optManeuver)=0) and (Length(optManeuver)>0) then
    Clipboard.AsText  :=  optmaneuver
  else   Clipboard.AsText  :=  maneuver;
  end;
end;


procedure TForm1.CopyGeneratortoClipboardClick(Sender: TObject);
begin
  with fc[CubePopUpMenu.Tag] do
  begin
  if (Pos('Status',optManeuver)=0) and (Length(optManeuver)>0) then
    Clipboard.AsText  :=  InverseOptManeuver
  else   Clipboard.AsText  :=  InverseManeuver;
  end;
end;


procedure TForm1.MIUseAsAntiSymmetryClick(Sender: TObject);
var n,c,j: Integer;
begin
 n:=  (Sender as TMenuItem).GetParentComponent.Tag;// ApplySymPopUp Menue speichert Symmetrie
  c:= Form1.ComponentCount;
  for j:= 0 to c-1 do
    if (Form1.Components[j] is TSpeedButton)
      and  (TSpeedButton(Form1.Components[j]).Parent.Name = 'GBSpeed')
      and  (TSpeedButton(Form1.Components[j]).Tag=n)
    then TSpeedButton(Form1.Components[j]).Flat:=false;
  SBSymmetriesClick(nil);
end;

procedure TForm1.CSelfInverseClick(Sender: TObject);
begin
  SBSymmetriesClick(nil);
  if CSelfInverse.Checked then cbSelfInverse.checked:=false;
end;

//maximal maneuverlength und stopautomatic muss auf 20, sonst exceptions!!!
procedure TForm1.EManeuverKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=13 then   BApplyManClick(nil)
end;

{
//periphärer Teil, wieder löschen!!!
procedure TForm1.ExtClick(Sender: TObject);
var i,j,y,n,s:integer;   c: cubiecube;
    x,x0,x1,x2: TurnAxis;
    h: array[0..12] of Integer;
    e: Edge;
begin

Randomize;
for i:= 0 to 12 do h[i]:=0;
for i:= 1 to 20480000 do
begin

  repeat
   c:=CubieCube.Create(Random(40320),Random(2187),Random(479001600),Random(2048),Random(4096));
    if ((c.CornParityEven <> c.EdgeParityEven) or (c.CornParityEven <> c.CentParityEven))
  until assigned(c);
{
  c:= CubieCube.Create;
  for j:= 0 to 40 do
  begin

    if j=0 then
    begin
      x:= TurnAxis(Random(6));
      x0:=x;
    end;
    if j=1 then
    begin
      repeat x:= TurnAxis(Random(6)) until x<>x0;
      x1:=x;
    end;
    if j>1 then
    begin
      if (Ord(x0)-Ord(x1)=3) or (Ord(x1)-Ord(x0)=3) then
      repeat x:= TurnAxis(Random(6)) until (x<>x0) and (x<>x1)
      else  repeat x:= TurnAxis(Random(6)) until x<>x1;
      x0:=x1;x1:=x;
    end;
    y:=Random(3);
    for n:= 0 to y do c.Move(x);
  end;
}
{  s:=0;
  for e:= UR to BR do s:= s+ c.PEdge^[e].o;
  Inc(h[s]);
  c.Free;
end;
end;
}
procedure TForm1.TimerBlinkTimer1(Sender: TObject);
var s: String; t1,dt: Cardinal;
begin
  s:=fc[fcN-1].maneuver;
  if length(s)>3 then
  begin
    t1:= GetTickCount;
    dt:= t1-save3;
    save3:=t1;
    if dt> save1 then begin save1:= dt;  save2:=fcN; end;
        buttonrandomclick(nil); buttonaddsolveclick(nil);
  end;
  if fcN=10000 then
  begin
    (Sender as TTimer).Enabled:=false;
    Application.MessageBox(PChar('MaxTime(ms): '+IntToSTr(save1)+ ' Nr.: '+IntToStr(save2)),'');
  end;
end;



procedure TForm1.StartSearchforSelectedCubesClick(Sender: TObject);
begin
 StartManSetupForm.Show;
end;

procedure TForm1.StopSearchForSelectedCubesClick(Sender: TObject);
var i,k: Integer;
begin
  for i:= 0 to fcN-1 do
  begin
    if fc[i].running and fc[i].selected then
    begin
      if fc[i].runOptimal then OptimalSearch(fc[i].optSearch).Kill
      else TripleSearch(fc[i].tripSearch).Kill;
      for k:= 0 to MAXNUM do
      if ButRun[k].Tag=i then ButRun[k].Glyph:=Form1.BMRun;
     end;
  end;
end;



procedure TForm1.AddRandomCubes1Click(Sender: TObject);
var value: String; i,n: Integer;
 tmp: Boolean;
begin
  value:='10';
  if InputQuery('','Number of Random Cubes to add: ',value) then
  begin
    try
      n:=StrToInt(value);
    except
      Application.MessageBox('No valid number.','');
      n:=0;
    end;
    if n>100000 then
    begin
      Application.MessageBox('Number too big. Only 100000 Random Cubes will be added.','');
      n:=100000;
    end;
    for i:= 1 to n do
    begin
      ButtonRandomClick(nil);
      tmp:=checkisomorphics;
      checkisomorphics:=false;
      AddCube(fCube,true,false,false,0,FixCenterFacelets.Checked);
      checkisomorphics:=tmp;
    end;
  end;
end;


function CountThreads(ProcID: DWORD): Integer;
var
  hSnapShot         : THandle;
  pe32              : TProcessEntry32;
begin
  result := 0;

  hSnapShot := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, ProcID);
  if hSnapShot <> INVALID_HANDLE_VALUE then
  begin
    ZeroMemory(@pe32, sizeof(TProcessEntry32));
    pe32.dwSize := sizeof(TProcessEntry32);
    Process32First(hSnapShot, pe32);
    if pe32.th32ProcessID = ProcID then
    begin
      result := pe32.cntThreads;
    end
    else
    begin
      repeat
        if pe32.th32ProcessID = ProcID then
        begin
          result := pe32.cntThreads;
          break;
        end;
      until Process32Next(hSnapShot, pe32) = False;
    end;
  end;
end;



procedure TForm1.FreeThreadsonTerminate1Click(Sender: TObject);
begin
 FreeThreadsonTerminate1.Checked:=  not FreeThreadsonTerminate1.Checked;
end;

procedure TForm1.Options1Click(Sender: TObject);
begin
  if fcN=0 then FreeThreadsonTerminate1.Enabled:=true else
   FreeThreadsonTerminate1.Enabled:=false;
end;

procedure TForm1.StartAutomodusforOptimalSolver1Click(Sender: TObject);
var i:Integer;
begin
  if StartAutomodusforOptimalSolver1.Caption='Sta&rt Autorun for Optimal Solver'
  then
  begin
    StartAutomodusforOptimalSolver1.Caption:='Stop Autorun for Optimal Solver';
    BatchTimer.Interval:=BatchTimeInverval;
       {$IF SPECIAL4}
       BatchTimer.Interval:=1;
    {$IFEND}
    threadN := CountThreads(GetCurrentProcessId);
    BatchTimer.Tag:=0;
    for i:= 0 to fcN-1 do
     if fc[i].selected then begin BatchTimer.Tag:= i; break; end;
    StartAutorunforTFS.Enabled:=false;
    AutoRunIdx.Visible:=true;
    BatchTimer.Enabled:=true;
    BatchTimerTimer(nil);
  end
  else
  begin
    StartAutomodusforOptimalSolver1.Caption:='Sta&rt Autorun for Optimal Solver';
    BatchTimer.Enabled:=false;
    BatchTimer.Tag:=0;
    StartAutorunforTFS.Enabled:=true;
    AutoRunIdx.Visible:=false;
  end;
end;

procedure TForm1.BatchTimerTimer(Sender: TObject);
var i,k,tg,cs: Integer; j: Face;
begin
  cs:= CountThreads(GetCurrentProcessId);
  If maxAutoRunThreads <= cs-threadN then exit; //
  if StartAutoModusforOptimalSolver1.Enabled then
  begin
    tg:= BatchTimer.Tag;
    if tg>fcN-1 then begin tg:=0;BatchTimer.Tag:=0 end; //wieder vorne starten
//    if false then exit//(tg<=fcN-1) and fc[tg].running then exit
//    else
    for i:= tg to fcN-1 do
    if not fc[i].running and (Pos('*',fc[i].optManeuver)=0) and (Pos('flow',fc[i].optManeuver)=0) //also noch nicht gelöst
    then
    begin
      fc[i].runOptimal:=true;
      if (fc[i].optSearch=nil) then
      begin
        fc[i].optSearch:=OptimalSearch.Create(fc[i]);
        fc[i].optStartTime:=Now;
      end;
      (fc[i].optSearch as OptimalSearch).NextSolution;
      fc[i].running:=true;
      for k:= 0 to MAXNUM do
        if ButRun[k].Tag=i then ButRun[k].Glyph:=Form1.BMStop;
        BatchTimer.Tag:=i;
        AutoRunIdx.Caption:='Autorun Cube: '+ IntToStr(i+1);
        exit;
    end
  end
  else //two phase solver autorun
  begin
    tg:= BatchTimer.Tag;
    if tg>fcN-1 then begin tg:=0;BatchTimer.Tag:=0 end;

//two phase suche anwerfen
    if tg+1>fcN-1 then tg:=-1;
    for i:= tg+1 to fcN-1 do //schleife wird vorzeitig mit exit verlassen
    if not fc[i].running and (Pos('*',fc[i].optManeuver)=0) and (fc[i].phase2Length>stopAt) then
    begin
      if (fc[i].tripSearch=nil) then
      begin
        for j:=U1 to B9 do fc[i].faceOrig[j]:= fc[i].PFace^[j];
        fc[i].tripSearch:=TripleSearch.Create(fc[i]);
      end;
      if (fc[i].tripSearch as TripleSearch).length=-1 then //no better solution
      begin
    //   Application.MessageBox(PChar(Err[5]),'Maneuver Window',MB_ICONWARNING);
         continue;
      end
      else begin (fc[i].tripSearch as TripleSearch).NextSolution; end;
      fc[i].running:=true;
      for k:= 0 to MAXNUM do
        if ButRun[k].Tag=i then ButRun[k].Glyph:=Form1.BMStop;
      BatchTimer.Tag:=i;
      AutoRunIdx.Caption:='Autorun Cube: '+ IntToStr(i+1);
      exit;
    end;
  end;

end;

procedure TForm1.StartAutorunforTFSClick(Sender: TObject);
var i: Integer;
begin
  if StartAutorunforTFS.Caption='St&art Autorun for Two-Phase-Solver'
  then
  begin
    StartAutorunforTFS.Caption:='St&op Autorun for Two-Phase-Solver';
    BatchTimer.Interval:=autoTime;
    BatchTimer.Enabled:=true;
    BatchTimer.Tag:=-1;
    for i:= 0 to fcN-1 do
     if fc[i].selected then begin BatchTimer.Tag:= i-1; break; end;
    StartAutomodusforOptimalSolver1.Enabled:=false;
    AutoRunIdx.Visible:=true;
    threadN := CountThreads(GetCurrentProcessId);
    BatchTimerTimer(nil);
  end
  else
  begin
    StartAutorunforTFS.Caption:='St&art Autorun for Two-Phase-Solver';
    BatchTimer.Enabled:=false;
    BatchTimer.Tag:=-1;
    StartAutomodusforOptimalSolver1.Enabled:=true;
    AutoRunIdx.Visible:=false;
  end;
end;

procedure TForm1.SbVertChange(Sender: TObject);
begin
 output.repaint;
end;

procedure TForm1.IgnoreIsoOnLoadClick(Sender: TObject);
begin
 (Sender as TMenuItem).Checked := not (Sender as TMenuItem).Checked
end;

procedure TForm1.SkipDuplicatesOnLoadClick(Sender: TObject);
begin
  (Sender as TMenuItem).Checked := not (Sender as TMenuItem).Checked
end;

procedure TForm1.GenerateStatistics1Click(Sender: TObject);
var i,n: Integer;
    optLen,len:Array[0..30] of Integer;

    cu:CubieCube; s: Integer;
    hasAntiSym: Boolean;
    csave:CornerCubie;
    esave:EdgeCubie;
    cnSave: CenterCubie;
    paintType:Integer;
    c1:Corner;
    e1:Edge;
    cn1: TurnAxis;
begin
  Stats.Show;Stats.StatMemo.Clear;
  for i:= 0 to 30 do begin optLen[i]:=0;len[i]:=0; end;
  Stats.StatMemo.Lines.Add('Number of Cubes: '+IntToStr(fcN));
  for i:= 0 to fcN-1 do
  begin
    if Pos('*)',fc[i].optManeuver)>0 then inc(optLen[ManeuverStringLength(fc[i].optManeuver)])
      else inc(len[ManeuverStringLength(fc[i].maneuver)])
   // Stats.StatMemo.Lines.Add(IntToStr(ManeuverStringLength(fc[i].maneuver)));
  end;
  Stats.StatMemo.Lines.Add('Cubes not solved yet: '+ IntToStr(len[0]));
  Stats.StatMemo.Lines.Add('---------------------------------------------------------------');
  n:=0; for i:=0 to 30 do n:=n+optLen[i];
  Stats.StatMemo.Lines.Add('Cubes solved optimally: '+ IntToStr(n));
  Stats.StatMemo.Lines.Add('');
  for i:= 0 to 30 do
    //if optLen[i]>0 then Stats.StatMemo.Lines.Add(Format('%2df*: %6d',[i,optLen[i]]));
    if optLen[i]>0 then Stats.StatMemo.Lines.Add(Format('%2d'+manSep+'*: %6d',[i,optLen[i]]));
  Stats.StatMemo.Lines.Add('---------------------------------------------------------------');
  n:=0; for i:=1 to 30 do n:=n+len[i];
  Stats.StatMemo.Lines.Add('Cubes solved with Two-Phase-Algorithm: '+ IntToStr(n));
  Stats.StatMemo.Lines.Add('');
  for i:= 1 to 30 do
    //if len[i]>0 then Stats.StatMemo.Lines.Add(Format('%2df: %6d',[i,Len[i]]));
    if len[i]>0 then Stats.StatMemo.Lines.Add(Format('%2d'+manSep+': %6d',[i,Len[i]]));
  Stats.StatMemo.Lines.Add('---------------------------------------------------------------');

  n:=0;
  for i:= 0 to fcN-1 do  //jetzt schauen, ob Antisymmetrie vorliegt
  begin
     paintType:=fc[i].paintType;
     cu:=CubieCube.Create(fc[i]);

     for s:= 0 to 47 do
     begin
       hasAntiSym:=true;
       CornMult(CornSym[s],cu.PCorn^,cu.PCornTemp^);
       CornMult(cu.PCornTemp^,CornSym[InvIdx[s]],csave);
       EdgeMult(EdgeSym[s],cu.PEdge^,cu.PEdgeTemp^);
       EdgeMult(cu.PEdgeTemp^,EdgeSym[InvIdx[s]],esave);
       if cu.isOriented then
       begin
         CentMult(CentSym[s],cu.PCent^,cu.PCentTemp^);
         CentMult(cu.PCentTemp^,CentSym[InvIdx[s]],cnsave);
       end;

       CornMult(csave,cu.PCorn^,cu.PCornTemp^); //Produkt muss Id sein
       EdgeMult(esave,cu.PEdge^,cu.PEdgeTemp^);
       if cu.isOriented then CentMult(cnsave,cu.PCent^,cu.PCentTemp^);

       if paintType<>2 then //nicht nur die Kanten
       begin
         for c1:= URF to DRB do
           if (cu.PCornTemp^[c1].c<>c1) or (cu.PCornTemp^[c1].o<>0) then
           begin
             hasAntiSym:=false;
             break;
           end;
       end;
       if paintType<>1 then  //nicht nur die Ecken
       begin
         for e1:= UR to BR do
         begin
           if not hasAntiSym then break;
           if (cu.PEdgeTemp^[e1].e<>e1) or (cu.PEdgeTemp^[e1].o<>0) then
           begin
             hasAntiSym:=false;
             break;
           end;
         end;
       end;

       if cu.isOriented then
       for cn1:= U to B do//nur wenn
       begin
         if not hasAntiSym then break;
         if (cu.PCentTemp^[cn1].c<>cn1) or (cu.PCentTemp^[cn1].o<>0) then
         begin
           hasAntiSym:=false;
           break;
         end;
       end;
       if hasAntiSym then break;//uns reicht, dass überhaupt Antisym vorliegt.
     end;//s
     if hasAntiSym then inc(n);
     cu.Free;
  end;
   Stats.StatMemo.Lines.Add('Cubes with antisymmetry: '+ IntToStr(n));
  Stats.StatMemo.Lines.Add('---------------------------------------------------------------');
end;



procedure TForm1.ArrangeSelectedClick(
  Sender: TObject);
var i,j,r1,r2,s: Integer;cu: CubieCube; esave: EdgeCubie; csave: CornerCubie;
    cnsave:CenterCubie; cn1: TurnAxis;
    hasSym,hasAsym,sfound,asfound: Boolean; c1: Corner; e1: Edge; curSym: Int64;
begin
  for i:=0 to fcN-1 do
  begin
    if fc[i].selected=false then continue;
    for r2:= 0 to 3 do
    begin
      for r1:= 0 to 2 do
      begin
        cu:=CubieCube.Create(fc[i]);
        curSym:=0;  //Symmetrie ermitteln
        for s:= 0 to 47 do
        begin
          hasSym:=true; //dies muss jetzt widerlegt werden!
          CornMult(CornSym[s],cu.PCorn^,cu.PCornTemp^);
          CornMult(cu.PCornTemp^,CornSym[InvIdx[s]],csave);
          EdgeMult(EdgeSym[s],cu.PEdge^,cu.PEdgeTemp^);
          EdgeMult(cu.PEdgeTemp^,EdgeSym[InvIdx[s]],esave);
          if cu.isOriented then
          begin
            CentMult(CentSym[s],cu.PCent^,cu.PCentTemp^);
            CentMult(cu.PCentTemp^,CentSym[InvIdx[s]],cnsave);
          end;
          for c1:= URF to DRB do
            if (csave[c1].c<>cu.PCorn^[c1].c) or (csave[c1].o<>cu.PCorn^[c1].o) then
            begin
              hasSym:=false;
              break;
            end;
          for e1:= UR to BR do
          begin
            if not hasSym then break;
            if (esave[e1].e<>cu.PEdge^[e1].e) or (esave[e1].o<>cu.PEdge^[e1].o) then
            begin
              hasSym:=false;
              break;
            end;
          end;
          if cu.isOriented then
          for cn1:= U to B do//nur wenn
          begin
            if not hasSym then break;
            if (cnsave[cn1].c<>cu.PCent^[cn1].c) or (cnsave[cn1].o<>cu.PCent^[cn1].o) then
            begin
              hasSym:=false;
              break;
            end;
          end;
          if hasSym then curSym:=curSym or (Int64(1) shl s);
        end;

        curASym:=0;//jetzt AntiSymmetrie ermittlen
        for s:= 0 to 47 do
        begin
          hasASym:=true; //dies muss jetzt widerlegt werden!
          CornMult(CornSym[s],cu.PCorn^,cu.PCornTemp^);
          CornMult(cu.PCornTemp^,CornSym[InvIdx[s]],csave);
          EdgeMult(EdgeSym[s],cu.PEdge^,cu.PEdgeTemp^);
          EdgeMult(cu.PEdgeTemp^,EdgeSym[InvIdx[s]],esave);
          if cu.isOriented then
          begin
            CentMult(CentSym[s],cu.PCent^,cu.PCentTemp^);
            CentMult(cu.PCentTemp^,CentSym[InvIdx[s]],cnsave);
          end;


          CornMult(csave,cu.PCorn^,cu.PCornTemp^); //Produkt muss Id sein
          EdgeMult(esave,cu.PEdge^,cu.PEdgeTemp^);
          if cu.isOriented then CentMult(cnsave,cu.PCent^,cu.PCentTemp^);


          for c1:= URF to DRB do
            if (cu.PCornTemp^[c1].c<>c1) or (cu.PCornTemp^[c1].o<>0) then
            begin
              hasASym:=false;
              break;
            end;
          for e1:= UR to BR do
          begin
            if not hasASym then break;
            if (cu.PEdgeTemp^[e1].e<>e1) or (cu.PEdgeTemp^[e1].o<>0) then
            begin
              hasASym:=false;
              break;
            end;
          end;

          if cu.isOriented then
          for cn1:= U to B do//nur wenn
          begin
            if not hasASym then break;
            if (cu.PCentTemp^[cn1].c<>cn1) or (cu.PCentTemp^[cn1].o<>0) then
            begin
              hasASym:=false;
              break;
            end;
          end;

          if hasASym then curASym:=curASym or (Int64(1) shl s);
        end;
        cu.Free;
        sFound:= false;asFound:=false;
        for j:= 0 to 34 do if curSym=ImageSym[j] then
          begin sFound:= true; break; end;
        for j:= 0 to 34 {nicht 32!!!} do if (curSym or curAsym)=ImageSym[j] then
          begin asFound:= true;  break; end;
        if sFound and asFound then break;
        fc[i].Conjugate(S_URF3);
        fc[i].maneuver:=MT(fc[i].maneuver,S_URF3);
        if Pos('Status',fc[i].optManeuver)=0 then
        fc[i].optManeuver:=MT(fc[i].optManeuver,S_URF3);
      end;//for r1
      if sFound and asFound then break;
      fc[i].Conjugate(S_U4);
      fc[i].maneuver:=MT(fc[i].maneuver,S_U4);
      if Pos('Status',fc[i].optManeuver)=0 then
      fc[i].optManeuver:=MT(fc[i].optManeuver,S_U4);
    end;//for r2
    Assert(sfound and asfound);
  end;//for i
  Output.Invalidate;
end;

procedure TForm1.AddSymmetryInfoforSelectedClick(Sender: TObject);
 var i,j,r1,r2,s,sIdx,asIdx: Integer;cu: CubieCube; esave: EdgeCubie; csave: CornerCubie;
    cnsave: CenterCubie; cn1: TurnAxis;
    hasSym,hasASym,sFound,asFound: Boolean; c1: Corner; e1: Edge; curSym,curASym: Int64;
    fl: FaceletCube;
begin
  for i:=0 to fcN-1 do
  begin
    if fc[i].selected=false then continue;
    fl:= FaceletCube.Create(fc[i],nil,5,5,5,5);

    for r2:= 0 to 3 do
    begin
      for r1:= 0 to 2 do
      begin
        cu:=CubieCube.Create(fl);

        curSym:=0;//erst Symmetrie ermittlen
        for s:= 0 to 47 do
        begin
          hasSym:=true; //dies muss jetzt widerlegt werden!
          CornMult(CornSym[s],cu.PCorn^,cu.PCornTemp^);
          CornMult(cu.PCornTemp^,CornSym[InvIdx[s]],csave);
          EdgeMult(EdgeSym[s],cu.PEdge^,cu.PEdgeTemp^);
          EdgeMult(cu.PEdgeTemp^,EdgeSym[InvIdx[s]],esave);
          if cu.isOriented then
          begin
            CentMult(CentSym[s],cu.PCent^,cu.PCentTemp^);
            CentMult(cu.PCentTemp^,CentSym[InvIdx[s]],cnsave);
          end;

          for c1:= URF to DRB do
            if (csave[c1].c<>cu.PCorn^[c1].c) or (csave[c1].o<>cu.PCorn^[c1].o) then
            begin
              hasSym:=false;
              break;
            end;
          for e1:= UR to BR do
          begin
            if not hasSym then break;
            if (esave[e1].e<>cu.PEdge^[e1].e) or (esave[e1].o<>cu.PEdge^[e1].o) then
            begin
              hasSym:=false;
              break;
            end;
          end;
          if cu.isOriented then
          for cn1:= U to B do//nur wenn
          begin
            if not hasSym then break;
            if (cnsave[cn1].c<>cu.PCent^[cn1].c) or (cnsave[cn1].o<>cu.PCent^[cn1].o) then
            begin
              hasSym:=false;
              break;
            end;
          end;
          if hasSym
          then curSym:=curSym or (Int64(1) shl s);
        end;

        curASym:=0;//jetzt AntiSymmetrie ermittlen
        for s:= 0 to 47 do
        begin
          hasASym:=true; //dies muss jetzt widerlegt werden!
          CornMult(CornSym[s],cu.PCorn^,cu.PCornTemp^);
          CornMult(cu.PCornTemp^,CornSym[InvIdx[s]],csave);
          EdgeMult(EdgeSym[s],cu.PEdge^,cu.PEdgeTemp^);
          EdgeMult(cu.PEdgeTemp^,EdgeSym[InvIdx[s]],esave);
          if cu.isOriented then
          begin
            CentMult(CentSym[s],cu.PCent^,cu.PCentTemp^);
            CentMult(cu.PCentTemp^,CentSym[InvIdx[s]],cnsave);
          end;

          CornMult(csave,cu.PCorn^,cu.PCornTemp^); //Produkt muss Id sein
          EdgeMult(esave,cu.PEdge^,cu.PEdgeTemp^);
          if cu.isOriented then CentMult(cnsave,cu.PCent^,cu.PCentTemp^);
          for c1:= URF to DRB do
            if (cu.PCornTemp^[c1].c<>c1) or (cu.PCornTemp^[c1].o<>0) then
            begin
              hasASym:=false;
              break;
            end;
          for e1:= UR to BR do
          begin
            if not hasASym then break;
            if (cu.PEdgeTemp^[e1].e<>e1) or (cu.PEdgeTemp^[e1].o<>0) then
            begin
              hasASym:=false;
              break;
            end;
          end;
          if cu.isOriented then
          for cn1:= U to B do//nur wenn
          begin
            if not hasASym then break;
            if (cu.PCentTemp^[cn1].c<>cn1) or (cu.PCentTemp^[cn1].o<>0) then
            begin
              hasASym:=false;
              break;
            end;
          end;

          if hasASym then curASym:=curASym or (Int64(1) shl s);
        end;
        cu.Free;
        sFound:= false;asFound:=false;
        for j:= 0 to 34 do if curSym=ImageSym[j] then
          begin sFound:= true; sIdx:=j; break; end;
        for j:= 0 to 34 {nicht 32!!!} do if (curSym or curAsym)=ImageSym[j] then
          begin asFound:= true; asIdx:=j; break; end;
        if sFound and asFound then break;
        fl.Conjugate(S_URF3);
      end;//for r1
      if sFound and asFound then break;
      fl.Conjugate(S_U4);
    end;//for r2
    Assert(sFound and asFound);
    if (Length(fc[i].patName)>0) then fc[i].patName:= fc[i].patName+', ';
    if sFound and asFound then
    begin
      fc[i].patName:= fc[i].patName+ImageSymNames[sIdx];
      if odd(curAsym) then fc[i].patName:= fc[i].patName+'{I}'//selbstinvers
      else if curAsym>0 then fc[i].patName:= fc[i].patName+'{'+ImageSymNames[asIdx]+'}';
    end;
    fl.Free;
  end;//for i
  Output.Invalidate;
end;

procedure TForm1.AddAllInversesClick(Sender: TObject);
var c: CubieCube; fcube:FaceletCube; i,maxN,fcNOld: Integer;
begin
  Caption:='Adding inverse cubes, press ESC to cancel... '+ExtractFileName(curFilename)+' - '+curVersion;
  escPressed:=false;
  maxN:=fcN;
  fcube:=FaceletCube.Create(nil);
  for i:= 0 to maxN-1 do
  begin
    if i mod 1000 = 0 then Application.ProcessMessages;
    c:=CubieCube.Create(fc[i]);
    CornInv(c.PCorn^,c.PCornTemp^);
    EdgeInv(c.PEdge^,c.PEdgeTemp^);
    CentInv(c.PCent^,c.PCentTemp^);

    c.cSwap:=c.PCorn;c.PCorn:=c.PCornTemp;c.PCornTemp:=c.cSwap;
    c.eSwap:=c.PEdge;c.PEdge:=c.PEdgeTemp;c.PEdgeTemp:=c.eSwap;
    c.cnSwap:=c.PCent;c.PCent:=c.PCentTemp;c.PCentTemp:=c.cnSwap;

    fcube.SetFacelets(c);
    fcube.isOriented:=c.isOriented;
    fcNOld:=fcN;
    AddCube(fcube,false,false,false,0,fc[i].isOriented);
    if fcNOld<fcN then//cube added
    begin
      fc[fcN-1].maneuver:=fc[i].InverseManeuver;
      fc[fcN-1].optManeuver:=fc[i].InverseOptManeuver;
    end;
    if Pos('Status',fc[fcN-1].optManeuver)=0 then fc[fcN-1].runOptimal:=true;
    c.Free;
    if escPressed then break;
  end;
  fcube.Free;
  Caption:=ExtractFileName(curFilename)+' - '+curVersion;
end;

procedure TForm1.FixCenterFaceletsClick(Sender: TObject);
label ende;
begin
 fixCenterFacelets.Checked := not fixCenterFacelets.Checked;

 if not fixCenterFacelets.Checked then
 begin
   SetLength(PruningCentP,0);
   SetLength(PruningCenTwistUDSliceSorted,0);
 end;

 if fixCenterFacelets.Checked then //Tabelle muss geladen werden
 begin
   if Application.MessageBox(PChar(Err[39]),'',MB_ICONWARNING or MB_YESNO)=IDYES then
   begin
    FixCenterfacelets.Enabled:=false;
    makesTables:=true;
    RunPatButton.Enabled:=false;//disable parts of User-Interface
    BRunSym.Enabled:=false;
    ButtonAddSolve.Enabled:=false;
    ButtonAddGen.Enabled:=false;
    File1.Enabled:=false;

    try
      //phase 1 with centers
      CreateFlipUDSliceCentPruningTable;//may reset fixCenterFacelets.Checked on error
      CreateCenTwistUDSliceSortedPruningTable;
    finally
      makesTables:=false;
      RunPatButton.Enabled:=true;//disable parts of User-Interface
      BRunSym.Enabled:=true;
      ButtonAddSolve.Enabled:=true;
      ButtonAddGen.Enabled:=true;
      File1.Enabled:=true;
      FixCenterfacelets.Enabled:=true;
    end;
   end
   else fixCenterFacelets.Checked:=false;
 end;
ende:
 fCube.isOriented:= fixCenterFacelets.Checked;
 EditCenters.Enabled:=fixCenterFacelets.Checked;
 if not EditCenters.Enabled then CenterDlg.Button1Click(nil);
 FacePaint.Invalidate;
end;

procedure TForm1.SortCubesbyPatternNameClick(Sender: TObject);
var tempList: TSTringList;
    i,p,index: Integer;s: String;
    f:array of FaceletCube;
    yPos:array of Integer;
    cc: CubieCube;
    oid,pid: Int64;

begin
   SetLength(f,fcN);
   SetLength(yPos,fcN);
   tempList:= TSTringList.Create;
   tempList.Sorted:=false;
   try
     for i:= 0 to fcN-1 do
     begin
       s:= IntToStr(fc[i].phase2Length); //ohne Maneuver=MAXNODES
       if (Pos('*)',fc[i].optManeuver)>0) and (fc[i].optLength< fc[i].phase2Length)
         then s:= IntToStr(fc[i].optLength);
       if Length(s)=1 then s:='0'+s;
       if Sender=SortCubesbyPatternName
       then
         s:= fc[i].patName+s+'*%35786%*'+IntToStr(i)//Hänge vorm sortieren den Index an
       else if Sender=SortCubesbyManeuverLength then
         s:= s+fc[i].patName+'*%35786%*'+IntToStr(i)
       else //sort by cubeID
       begin
         cc:= CubieCube.Create(fc[i]);
         oid:= cc.EdgeOriCoord+2048*cc.CornOriCoord;
         pid:= cc.EdgePermCoord + 40320*cc.CornPermCoord;
         s:= Format('%.*d',[14, pid])+ Format('%.*d',[7, oid]) +'*%35786%*'+IntToStr(i);
         cc.Free;
       end;
       tempList.Add(s);
     end;
     tempList.Sort;
     for i:= 0 to fcN-1 do
     begin
       p:=Pos('*%35786%*',tempList.Strings[i]);
       s:=Copy(tempList.Strings[i],p+9,10);
       index:=StrToInt(s);
       f[i]:=fc[index];
       yPos[i]:=fc[i].y;//!!!!
     end;
     for i:= 0 to fcN-1 do begin fc[i]:=f[i]; fc[i].y:=yPos[i];end;

   finally
     tempList.Free;
     SetLength(f, 0);
     SetLength(yPos,0);
   end;
   OutPut.Repaint;
end;


procedure TForm1.ExpandFirstCubeClick(Sender: TObject);

var urf3,fx2,ux4,lr2:Integer; i:Face;
   checkisoSave:Boolean;
begin
  checkisoSave:= checkIsomorphics;
  checkIsomorphics:=false;
   for i:=U1 to B9 do fc[0].FaceOrig[i]:= fc[0].PFace^[i];
   for urf3:= 0 to 2 do //generate all 48 symmetries
   begin
     for fx2:= 0 to 1 do
     begin
       for ux4:= 0 to 3 do
       begin
         for lr2:= 0 to 1 do
         begin
          AddCube(fc[0],false,false,false,0,false);
           fc[0].Conjugate(S_LR2);
         end;
          fc[0].Conjugate(S_U4);
       end;
       fc[0].Conjugate(S_F2);
     end;
     fc[0].Conjugate(S_URF3);
   end;
  for i:=U1 to B9 do fc[0].PFace^[i]:=fc[0].FaceOrig[i];//restore
  checkIsomorphics:=checkisoSave;
end;

procedure TForm1.ColorCheckClick(Sender: TObject);
begin
  iniFile.WriteBool('Faclet Editor','AutoFix',(Sender as TCheckBox).Checked);
end;


procedure TForm1.WCAscrambleClick(Sender: TObject);
var i: Integer; tmp: Boolean;
begin
    Cubedefs.Color[UCol]:=16777215;
    Cubedefs.Color[RCol]:=255;
    Cubedefs.Color[FCol]:=32768;
    Cubedefs.Color[DCol]:=65535;
    Cubedefs.Color[LCol]:=33023;
    Cubedefs.Color[BCol]:=16711680;
    FacePaint.Invalidate;Output.Invalidate;
    stopAt:=21;
    ClearMainWindow1Click(nil);
    for i:= 1 to 5 do
    begin
      ButtonRandomClick(nil);
      tmp:=checkisomorphics;
      checkisomorphics:=false;
      AddCube(fCube,false,true,false,0,false);
      checkisomorphics:=tmp;
    end;
end;

procedure TForm1.CapDevsChange(Sender: TObject);
var n: Integer;
//  hr: HRESULT;
begin
  n:=TComboBox(Sender).ItemIndex;
  bmap.Canvas.Brush.Color:=clWhite;
  bmap.Canvas.FillRect(bmap.Canvas.ClipRect);
  CaptureForm.Invalidate;
  if (n>=0) and (CapDevs.Items.count>0) then
  begin
    FilterGraph.ClearGraph;
    FilterGraph.Active := false;
    Filter.BaseFilter.Moniker := SysDev.GetMoniker(n);
    CaptureForm.Caption:=TComboBox(Sender).Items.Strings[n];
    FilterGraph.Active := true;
    Filtergraph.Stop;
    try
    with FilterGraph as ICaptureGraphBuilder2 do
       RenderStream(@PIN_CATEGORY_CAPTURE , nil, Filter as IBaseFilter,SampleGrabber as IBaseFilter,CaptureForm.VideoWindow as IBaseFilter);
    CaptureForm.Show;
    FilterGraph.Play;
    CaptureForm.Videowindow.visible:=false;
    CapConfig.Enabled:=true;
    CapFormat.Enabled:=true;
    BScan.Enabled:=true;
    RbU.Enabled:=true;RbR.Enabled:=true;RbF.Enabled:=true;
    RbD.Enabled:=true;RbL.Enabled:=true;RbB.Enabled:=true;
    except
    Application.MessageBox(PChar(Err[34]),'',MB_ICONWARNING);
    Filtergraph.Active:=false;
    FilterGraph.ClearGraph;
    CaptureForm.Hide;
    end;
  end;
end;


procedure getBmapPixel(x,y:Integer;var h,s,v: Integer);
var tcl,red,green,blue:Integer;
begin
  tcl:= bmap.Canvas.Pixels[x,y];
  red:= tcl mod 256; tcl:= tcl div 256;
  green:= tcl mod 256; tcl:= tcl div 256;
  blue:= tcl mod 256;
  RGBToHSV(red,green,blue,h,s,v);
end;

function redDistance(h,s,v:Integer):Real;
var i,sHigh: Integer; dmin,d0,x: Real;
begin
  dmin:=999999;
  sHigh:= High(redHue);
  for i:= 0 to Min(nSampleRed,sHigh) do
  begin
    x:= dist(redHue[i],h)/redHueS;
    d0:=x*x;
    x:=dist(redSat[i],s)/redSatS;
    d0:=d0+x*x;
    x:= dist(redVal[i],v)/redValS;
    d0:=d0+x*x;
    if dmin>d0 then dmin:=d0;
  end;
  result:=dmin;
end;

function orangeDistance(h,s,v:Integer):Real;
var i,sHigh: Integer; dmin,d0,x: Real;
begin
  dmin:=999999;
  sHigh:= High(orangeHue);
  for i:= 0 to Min(nSampleOrange,sHigh) do
  begin
    x:= dist(orangeHue[i],h)/orangeHueS;
    d0:=x*x;
    x:=dist(orangeSat[i],s)/orangeSatS;
    d0:=d0+x*x;
    x:= dist(orangeVal[i],v)/orangeValS;
    d0:=d0+x*x;
    if dmin>d0 then dmin:=d0;
  end;
  result:=dmin;
end;

procedure TForm1.SampleGrabberBuffer(sender: TObject; SampleTime: Double;
  pBuffer: Pointer; BufferLen: Integer);

  TYPE  TRGBTripleArray = ARRAY[WORD] OF TRGBTriple;
      pRGBTripleArray = ^TRGBTripleArray;
  var sx,sy,mx,my,d,i,j,k,k1,k2,q,x1,x2,y1,y2,s: Integer;
  var hue,sat,val,red,blue,green,t:Integer;
  var mhue,msat,mval,mred,mgreen,mblue: Integer;
  var sampHigh,sampIdx:Integer;
  var m:Integer;//für den Mittelwert
  var tcl: Integer;
  var x0,y0,b: Integer;

  row: pRGBTripleArray;
  hue1,sat1,val1:Integer;
  count: Integer;
  bl: array [0..2,0..2] of boolean;                        
  cs:String;
begin
  try
    bmap.Canvas.Lock; //locken wichtig, da nicht reentrant
    SampleGrabber.GetBitmap(bmap);
    bmap.PixelFormat:= pf24Bit;//scheint auch der Defaultwert zu sein


    mx:=bmap.Width div 2; //Mittelpunkt x
    my:=bmap.Height div 2; //Mittelpunkt y
    d:= my div 8;

//+++++++++++++++do some processing+++++++++++++++++++++++++++++++++++++++++++++

      sx:= mx -6*d-(xDist-5)*d;
      sy:= my - 6*d-(yDist-5)*d;
      for i:= 0 to 2 do
      for j:= 0 to 2 do
      begin
        x1:=sx+xDist*i*d+1; x2:=x1+2*d-2; //5
        y1:=sy+yDist*j*d+1; y2:=y1+2*d-2; //5
        bmap.Canvas.FrameRect(Rect(x1-1,y1-1,x2+2,y2+2));

        red:=0;blue:=0;green:=0;
        for k2:= y1 to y2 do
        begin
          Row := bmap.Scanline[k2];
          for k1:= x1 to x2 do
          begin
            red:= red + row[k1].rgbtRed;
            blue:= blue + row[k1].rgbtBlue;
            green:= green + row[k1].rgbtGreen;
          end;
        end;
        q:=(2*d-1)*(2*d-1);
        red:= red div q; green:= green div q; blue:= blue div q;
        if (red>250) or (green>250) or (blue>250) then
        bmap.Canvas.TextOut(0,0,'Decrease exposure or gain for optimal results!');

        RGBToHSV(red,green,blue,hue,sat,val);
        if Form1.RbHue.Checked then q:=hue
        else if Form1.RbSat.Checked then q:=sat
        else if Form1.RbVal.Checked then q:=val;

        if not RBInteractive.Checked then
           bmap.Canvas.TextOut(x1+d div 2,y1+d div 2,IntToStr(q));
        faceHue[Face(3*j+i+9*curFace)]:=hue;
        faceSaturation[Face(3*j+i+9*curFace)]:=sat;
        faceValue[Face(3*j+i+9*curFace)]:=val;
        faceBlueRel[Face(3*j+i+9*curFace)]:=Round(100*blue/(red+green+1));
        if RBInteractive.Checked then
        begin
          if (sat/val<0.3)//das ist dann nur noch gelb oder weiss
          and (blue/(green+blue)>=0.9*green/(green+blue))
          then begin cs:= 'wh';faceValue[Face(3*j+i+9*curFace)]:=5;end//das ist dann weiss
          else if (hue>=treshGreen) and (hue<treshBlue)
          then begin cs:= 'bl';faceValue[Face(3*j+i+9*curFace)]:=2 end
          else if (hue>=treshYellow) and (hue<treshGreen)
          then begin cs:= 'gr';faceValue[Face(3*j+i+9*curFace)]:=3 end
          else if (hue>=treshOrange) and (hue<treshYellow)
          then begin cs:= 'ye';faceValue[Face(3*j+i+9*curFace)]:=4 end
          else if hue>=treshBlue
          then begin cs:='re';faceValue[Face(3*j+i+9*curFace)]:=0 end//das ist immer rot
          else if (orangeHue[0]=9999) or (redHue[0]=9999)
            or (orangeHue[1]=9999) or (redHue[1]=9999)
          then begin cs:= '??';faceValue[Face(3*j+i+9*curFace)]:=-1;end
          else if redDistance(hue,sat,val)< orangeDistance(hue,sat,val)
          then begin cs:= 're';faceValue[Face(3*j+i+9*curFace)]:=0; end  //rot-orange
          else begin cs:= 'or';faceValue[Face(3*j+i+9*curFace)]:=1 ;end;

          if cs='re' then bmap.Canvas.Pen.Color:= clRed
          else if cs='or' then  bmap.Canvas.Pen.Color:= RGB(255,128,0)
          else if cs='bl' then bmap.Canvas.Pen.Color:= clBlue
          else if cs='gr' then bmap.Canvas.Pen.Color:= clGreen
          else if cs='ye' then bmap.Canvas.Pen.Color:= clYellow
          else if cs='wh' then bmap.Canvas.Pen.Color:= clBlack
          else if cs='??' then  bmap.Canvas.Pen.Color:= clGray;
          bmap.Canvas.Pen.Width:=7;
          bmap.Canvas.Rectangle(Rect(x1+3,y1+3,x2-2,y2-2));
          bmap.Canvas.TextOut(x1+1+d div 2,y1+d div 2,cs);
        end;//interactive
        if redRequest and (capXPos>x1) and (capXPos<x2)//neues Sample für rot
            and (capYPos>y1) and (capYPos<y2) then
        begin
          sampHigh:=High(redHue);//Highest Index of Samples
          sampIdx:= nSampleRed mod (SampHigh+1);//Index to use
          //threadsicher machen
          PostMessage(Form1.Handle,WM_UPDATELABELS,Min(nSampleRed,sampHigh)+1,0);

          redHue[sampIdx] :=hue;redSat[sampIdx]:=sat;redVal[sampIdx]:=val;
          k1:= Min(nSampleRed,sampHigh);

          m:=0;
          for k:= 0 to k1 do m:= m+redHue[k];
          m:=Round(m/(k1+1));//Mittelwert der Hues
          redHueS:=0;
          for k:= 0 to k1 do redHueS:=redHueS +(redHue[k]-m)*(redHue[k]-m);
          redHueS:=Round(Sqrt(redHueS/Max(1,k1)));//Division durch 0 verhindern
          redHueS:= Max(1,redHueS);//Std.Abweichung 0 verhindern


          m:=0;
          for k:= 0 to k1 do m:= m+redSat[k];
          m:=Round(m/(k1+1));//Mittelwert der Saturations
          redSatS:=0;
          for k:= 0 to k1 do redSatS:=redSatS +(redSat[k]-m)*(redSat[k]-m);
          redSatS:=Round(Sqrt(redSatS/Max(1,k1)));//Division durch 0 verhindern
          redSatS:= Max(1,redSatS);//Std.Abweichung 0 verhindern

          m:=0;
          for k:= 0 to k1 do m:= m+redVal[k];
          m:=Round(m/(k1+1));//Mittelwert der Values
          redValS:=0;
          for k:= 0 to k1 do redValS:=redValS +(redVal[k]-m)*(redVal[k]-m);
          redValS:=Round(Sqrt(redValS/Max(1,k1)));//Division durch 0 verhindern
          redValS:= Max(1,redValS);//Std.Abweichung 0 verhindern

          inc(nSampleRed);
        end
        else if orangeRequest and (capXPos>x1) and (capXPos<x2)
            and (capYPos>y1) and (capYPos<y2) then
        begin
          sampHigh:=High(redHue);
          sampIdx:= nSampleOrange mod (sampHigh+1);//Index to use

          PostMessage(Form1.Handle,WM_UPDATELABELS,Min(nSampleOrange,sampHigh)+1,1);

          orangeHue[sampIdx] :=hue;orangeSat[sampIdx]:=sat;orangeVal[sampIdx]:=val;
          k1:= Min(nSampleOrange,sampHigh);

          m:=0;
          for k:= 0 to k1 do m:= m+orangeHue[k];
          m:=Round(m/(k1+1));//Mittelwert der Hues
          orangeHueS:=0;
          for k:= 0 to k1 do orangeHueS:=orangeHueS +(orangeHue[k]-m)*(orangeHue[k]-m);
          orangeHueS:=Round(Sqrt(orangeHueS/Max(1,k1)));//Division durch 0 verhindern
          orangeHueS:= Max(1,orangeHueS);//Std.Abweichung 0 verhindern


          m:=0;
          for k:= 0 to k1 do m:= m+orangeSat[k];
          m:=Round(m/(k1+1));//Mittelwert der Saturations
          orangeSatS:=0;
          for k:= 0 to k1 do orangeSatS:=orangeSatS +(orangeSat[k]-m)*(orangeSat[k]-m);
          orangeSatS:=Round(Sqrt(orangeSatS/Max(1,k1)));//Division durch 0 verhindern
          orangeSatS:= Max(1,orangeSatS);//Std.Abweichung 0 verhindern

          m:=0;
          for k:= 0 to k1 do m:= m+orangeVal[k];
          m:=Round(m/(k1+1));//Mittelwert der Values
          orangeValS:=0;
          for k:= 0 to k1 do orangeValS:=orangeValS +(orangeVal[k]-m)*(orangeVal[k]-m);
          orangeValS:=Round(Sqrt(orangeValS/Max(1,k1)));//Division durch 0 verhindern
          orangeValS:= Max(1,orangeValS);//Std.Abweichung 0 verhindern

          inc(nSampleOrange);
        end
      end;//for i,j
      redRequest:=false;OrangeRequest:=false;//am Schluss immer löschen
      if ((nSampleRed<2) or (nSampleOrange<2)) and RBInteractive.Checked then
      bmap.Canvas.TextOut(0,bmap.Height+bmap.Canvas.Font.Height-3,
      'Rightclick squares to enter at least 2 red and 2 orange samples');

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


    bmap.Canvas.UnLock;


    CaptureForm.ClientWidth:= bmap.Width;
    CaptureForm.ClientHeight:= bmap.Height;
    CaptureForm.Invalidate;
  finally
  end;
end;

procedure TForm1.CapConfigClick(Sender: TObject);
begin
 with FilterGraph as ICaptureGraphBuilder2 do
   ShowFilterPropertyPage(Self.Handle, Filter as IBaseFilter);
end;

procedure TForm1.CapFormatClick(Sender: TObject);
var i: Integer;pinInfo:TPinInfo;pinList:TPinlist;
begin
  Filtergraph.Stop;
  FilterGraph.Active:= False   ;
  CaptureForm.VideoWindow.FilterGraph   :=   nil   ;
  FilterGraph.Active:= True;   ;
  pinList:=TPinList.Create(Filter as IBaseFilter);
  pinInfo:=pinList.PinInfo[0];
  for i:= 0 to pinList.Count-1 do
  ShowPinPropertyPage(self.Handle,pinList.Items[i]);
  CaptureForm.VideoWindow.FilterGraph:= FilterGraph;
  with FilterGraph as ICaptureGraphBuilder2 do
    CheckDSError(RenderStream(@PIN_CATEGORY_CAPTURE , nil, Filter as IBaseFilter, SampleGrabber as IBaseFilter, CaptureForm.VideoWindow as IbaseFilter));
  FilterGraph.Play;
  CaptureForm.Videowindow.visible:=false;

end;


procedure TForm1.BRyanHeiseClick(Sender: TObject);
begin
RbB.Checked:=true;
ryanCount:=0;
TimerWatchdog.Interval:=2000;
TimerWatchdog.Enabled:=true;
end;

procedure TForm1.EditCentersClick(Sender: TObject);
begin
 ShowCenterDialog;
end;


procedure TForm1.ETreshOrangeChange(Sender: TObject);
begin
  treshOrange:=StrToIntDef((Sender as TEdit).Text,0);
end;

procedure TForm1.ETreshYellowChange(Sender: TObject);
begin
  treshYellow:=StrToIntDef((Sender as TEdit).Text,0);
end;

procedure TForm1.ETreshGreenChange(Sender: TObject);
begin
  treshGreen:=StrToIntDef((Sender as TEdit).Text,0);
end;

procedure TForm1.ETreshBlueChange(Sender: TObject);
begin
   treshBlue:=StrToIntDef((Sender as TEdit).Text,0);
end;

procedure TForm1.RBAutomaticClick(Sender: TObject);
begin
  if (Sender as TRadioButton).Checked then
  begin RODistance.Visible:=true;
  GBPreview.Visible:=false; SampleNumber.Visible:=false;
  RBHue.Enabled:= true; RBSat.Enabled:= true;RBVal.Enabled:= true;
  ETreshOrange.Enabled:=true;  ETreshYellow.Enabled:=true;
  ETreshGreen.Enabled:=true;  ETreshBlue.Enabled:=true;
  LOrange.Enabled:=true; LYellow.Enabled:=true;
  LGreen.Enabled:=true;LBLue.Enabled:=true;
  iniFile.WriteBool('WebCam','autoMode',true); end
  else
  begin RODistance.Visible:=false;
  GBPreview.Visible:=true; SampleNumber.Visible:=true;
   RBHue.Enabled:= false; RBSat.Enabled:= false;RBVal.Enabled:= false;
   ETreshOrange.Enabled:=false;  ETreshYellow.Enabled:=false;
   ETreshGreen.Enabled:=false;  ETreshBlue.Enabled:=false;
   LOrange.Enabled:=false; LYellow.Enabled:=false;
   LGreen.Enabled:=false;LBLue.Enabled:=false;
   iniFile.WriteBool('WebCam','autoMode',false); end
end;

procedure TForm1.RBInteractiveClick(Sender: TObject);
begin
  if (Sender as TRadioButton).Checked then
  begin RODistance.Visible:=false;
  GBPreview.Visible:=true; SampleNumber.Visible:=true;
  RBHue.Enabled:= false; RBSat.Enabled:= false;RBVal.Enabled:= false;
  ETreshOrange.Enabled:=false;  ETreshYellow.Enabled:=false;
  ETreshGreen.Enabled:=false;  ETreshBlue.Enabled:=false;
  LOrange.Enabled:=false; LYellow.Enabled:=false;
  LGreen.Enabled:=false;LBLue.Enabled:=false;
  iniFile.WriteBool('WebCam','autoMode',false); end
  else
  begin RODistance.Visible:=true;
  GBPreview.Visible:=false; SampleNumber.Visible:=false;
   RBHue.Enabled:= true; RBSat.Enabled:= true;RBVal.Enabled:= true;
   ETreshOrange.Enabled:=true;  ETreshYellow.Enabled:=true;
   ETreshGreen.Enabled:=true;  ETreshBlue.Enabled:=true;
   LOrange.Enabled:=true; LYellow.Enabled:=true;
   LGreen.Enabled:=true;LBLue.Enabled:=true;
   iniFile.WriteBool('WebCam','autoMode',true); end
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  nSampleRed:=0;
  nSampleOrange:=0;
  sampleOrange.Caption:= 'Orange: ';
  sampleRed.Caption:= 'Red: ';
  orangeHue[0]:=9999;redHue[0]:=9999;orangeHue[1]:=9999;redHue[1]:=9999;
end;

procedure TForm1.UpdateLabels(var Message: TMessage);
begin
 if Message.LParam=0 then sampleRed.Caption:= 'Red: '+IntToStr(Message.WParam)
 else sampleOrange.Caption:= 'Orange: '+IntToStr(Message.WParam);
end;


procedure TForm1.prevBoxPaint(Sender: TObject);
begin
 prevCube.DrawCube(0,0);
end;

procedure TForm1.Button2Click(Sender: TObject);
var i:Face;
begin
  for i:= U1 to B9 do
  begin prevCube.PFace^[i]:=noCol; scanValue[i]:=-1;end;
  prevBox.Invalidate;
  RbB.Checked:=true;
end;

procedure TForm1.MaximumNumber1Click(Sender: TObject);
begin
   OptimalBatch.Show;
end;



procedure TForm1.ButtonEmptyCClick(Sender: TObject);
var i: Face;j: TurnAxis;
begin

  for i:=U1 to B9 do
  begin
    case i of
    U1,U3,U7,U9,R1,R3,R7,R9,F1,F3,F7,F9,
    D1,D3,D7,D9,L1,L3,L7,L9,B1,B3,B7,B9: fcube.PFace^[i]:=NoCol;
    end;
  end;
  for j:=U to B do fcube.cenTwist[j]:=0;
  FacePaint.Invalidate;
end;


procedure TForm1.ButtonEmptyEClick(Sender: TObject);
var i: Face;j: TurnAxis;
begin
  for i:=U1 to B9 do
  begin
    case i of
    U2,U4,U6,U8,R2,R4,R6,R8,F2,F4,F6,F8,
    D2,D4,D6,D8,L2,L4,L6,L8,B2,B4,B6,B8: fcube.PFace^[i]:=NoCol;
    end;
  end;
  for j:=U to B do fcube.cenTwist[j]:=0;
  FacePaint.Invalidate;
end;

procedure TForm1.ButtonClearCClick(Sender: TObject);
var i: Face;j: TurnAxis;
begin
  for i:=U1 to B9 do
  begin
    case i of
    U1,U3,U7,U9: fcube.PFace^[i]:=UCol;
    R1,R3,R7,R9: fcube.PFace^[i]:=RCol;
    F1,F3,F7,F9: fcube.PFace^[i]:=FCol;
    D1,D3,D7,D9: fcube.PFace^[i]:=DCol;
    L1,L3,L7,L9: fcube.PFace^[i]:=LCol;
    B1,B3,B7,B9: fcube.PFace^[i]:=BCol;
    end;
  end;
  for j:=U to B do fcube.cenTwist[j]:=0;
  FacePaint.Invalidate;
end;


procedure TForm1.ButtonClearEClick(Sender: TObject);
var i: Face;j: TurnAxis;
begin
  for i:=U1 to B9 do
  begin
    case i of
    U2,U4,U6,U8: fcube.PFace^[i]:=UCol;
    R2,R4,R6,R8: fcube.PFace^[i]:=RCol;
    F2,F4,F6,F8: fcube.PFace^[i]:=FCol;
    D2,D4,D6,D8: fcube.PFace^[i]:=DCol;
    L2,L4,L6,L8: fcube.PFace^[i]:=LCol;
    B2,B4,B6,B8: fcube.PFace^[i]:=BCol;
    end;
  end;
  for j:=U to B do fcube.cenTwist[j]:=0;
  FacePaint.Invalidate;
end;


procedure TForm1.AllowSliceMoves1Click(Sender: TObject);
var saveDir: String;
label ende;
begin

  if fcn>0 then
  begin
    Application.MessageBox('Empty the Main Window before switching search mode!','Options Menu');
    goto ende;
  end;
  saveDir:=GetCurrentDir();
  SetCurrentDir(ExtractFilePath(Paramstr(0)));//Cube Explorer directory
  (Sender as TMenuItem).Checked:= not (Sender as TMenuItem).Checked;
  sliceMode:= (Sender as TMenuItem).Checked;
  {$IF not QTM}
  if (sliceMode) then manSep:='s' else manSep:='f';
  {$ELSE}
  if (sliceMode) then manSep:='sq' else manSep:='q';
  {$IFEND}

  ProgressBar.Visible:=true;
  ProgressLabel.Visible:=true;
  makesTables:=true;
  RunPatButton.Enabled:=false;//disable parts of User-Interface
  BRunSym.Enabled:=false;
  ButtonAddSolve.Enabled:=false;
  ButtonAddGen.Enabled:=false;
  FixCenterFacelets.Enabled:=false;
  File1.Enabled:=false;
  HugeSolver.Enabled:=false;
  WebServer1.Enabled:=false;

  CreatePruningTables;

  ProgressBar.Visible:=false;
  ProgressBar.Position:=0;
  ProgressLabel.Visible:=false;
  ButtonAddSolve.Enabled:=true;
  ButtonAddGen.Enabled:=true;
  FixCenterFacelets.Enabled:=true;
  File1.Enabled:=true;
  HugeSolver.Enabled:=true;
  RunPatButton.Enabled:=true;
  BRunSym.Enabled:=true;
  WebServer1.Enabled:=true;
  makesTables:=false;

  if FixCenterfacelets.Checked then
  begin
    ProgressBar.Visible:=true;
    ProgressLabel.Visible:=true;
    makesTables:=true;
    RunPatButton.Enabled:=false;//disable parts of User-Interface
    BRunSym.Enabled:=false;
    ButtonAddSolve.Enabled:=false;
    ButtonAddGen.Enabled:=false;
    FixCenterFacelets.Enabled:=false;
    File1.Enabled:=false;
    HugeSolver.Enabled:=false;
    WebServer1.Enabled:=false;

    try
      CreateFlipUDSliceCentPruningTable;//may reset fixCenterFacelets.Checked on error
      CreateCenTwistUDSliceSortedPruningTable;
    finally
      ProgressBar.Visible:=false;
      ProgressBar.Position:=0;
      ProgressLabel.Visible:=false;
      ButtonAddSolve.Enabled:=true;
      ButtonAddGen.Enabled:=true;
      FixCenterFacelets.Enabled:=true;
      File1.Enabled:=true;
      HugeSolver.Enabled:=true;
      RunPatButton.Enabled:=true;
      BRunSym.Enabled:=true;
      WebServer1.Enabled:=true;
      makesTables:=false;
    end;
  end;
  SetCurrentDir(saveDir);
 ende:
end;


{*
procedure initTetraTables(sym: Int64);
var i,s: Integer; c,d: CubieCube; isRep: Boolean;
begin
  c:=CubieCube.Create;
  d:=CubieCube.Create;
  for i:=0 to 70-1 do begin tetraRep[i]:=false; tetraSym[i]:=0;end;
  for i:=0 to 70-1 do
  begin
    c.InvCube20TetraCoord(i);
    isRep:=true;
    for s:= 0 to 47 do
    begin
      if  (sym and ( Int64(1) shl s))=0 then Continue;
      CornMult(CornSym[s],c.PCorn^,c.PCornTemp^);
      CornMult(c.PCornTemp^,CornSym[InvIdx[s]],d.PCorn^);
      if d.cube20TetraCoord < i then begin isRep:= false; break; end;
      if d.cube20TetraCoord = i then tetraSym[i] := tetraSym[i] or ( Int64(1) shl s);
    end;
    if isRep then tetraRep[i]:=true;
  end;
end;

procedure initCoriTables(sym: Int64; tetra: Word);
var i,s: Integer; c,d: CubieCube; isRep: Boolean;

begin
  c:=CubieCube.Create;
  c.InvCube20TetraCoord(tetra);
  d:=CubieCube.Create;
  for i:=0 to 2187-1 do begin coriRep[i]:=false; coriSym[i]:=0;end;
  for i:=0 to 2187-1 do
  begin
    c.InvCornOriCoord(i);
    isRep:=true;
    for s:= 0 to 47 do
    begin
      if  (sym and ( Int64(1) shl s))=0 then Continue;
      CornMult(CornSym[s],c.PCorn^,c.PCornTemp^);
      CornMult(c.PCornTemp^,CornSym[InvIdx[s]],d.PCorn^);
      if d.CornOriCoord < i then begin isRep:= false; break; end;
      if d.CornOriCoord = i then coriSym[i] := coriSym[i] or ( Int64(1) shl s);
    end;
    if isRep then coriRep[i]:=true;
  end;
end;


procedure initSliceTables(sym: Int64);
var i,s: Integer; c,d: CubieCube; isRep: Boolean;
begin
  c:=CubieCube.Create;
  d:=CubieCube.Create;
  for i:=0 to 495*70-1 do begin sliceRep[i]:=false; sliceSym[i]:=0;end;
  for i:=0 to 495*70-1 do
  begin
    c.InvCube20SliceCoord(i);
    isRep:=true;
    for s:= 0 to 47 do
    begin
      if  (sym and ( Int64(1) shl s))=0 then Continue;
      EdgeMult(EdgeSym[s],c.PEdge^,c.PEdgeTemp^);
      EdgeMult(c.PEdgeTemp^,EdgeSym[InvIdx[s]],d.PEdge^);
      if d.cube20SliceCoord < i then begin isRep:= false; break; end;
      if d.cube20SliceCoord = i then sliceSym[i] := SliceSym[i] or ( Int64(1) shl s);
    end;
    if isRep then sliceRep[i]:=true;
  end;
end;


procedure initEoriTables(sym: Int64; slice: Word);
var i,s: Integer; c,d: CubieCube; isRep: Boolean;

begin
  c:=CubieCube.Create;
  c.InvCube20SliceCoord(slice);
  d:=CubieCube.Create;
  for i:=0 to 2048-1 do begin eoriRep[i]:=false; eoriSym[i]:=0;end;
  for i:=0 to 2048-1 do
  begin
    c.InvEdgeOriCoord(i);
    isRep:=true;
    for s:= 0 to 47 do
    begin
      if  (sym and ( Int64(1) shl s))=0 then Continue;
      EdgeMult(EdgeSym[s],c.PEdge^,c.PEdgeTemp^);
      EdgeMult(c.PEdgeTemp^,EdgeSym[InvIdx[s]],d.PEdge^);  //das kann man vereinfachen!!!!!
      if d.EdgeOriCoord < i then begin isRep:= false; break; end;
      if d.EdgeOriCoord = i then eoriSym[i] := eoriSym[i] or ( Int64(1) shl s);
    end;
    if isRep then eoriRep[i]:=true;
  end;
end;




procedure TForm1.Button3Click(Sender: TObject);
var c,d: CubieCube;
    i,j,k,m,s,n: Integer;
    isRep:Boolean;
    csave:CornerCubie;
    esave:EdgeCubie;
    sym: Int64;  // curASym:= curASym or ( Int64(1) shl i);
    count: Int64;
begin
  c:=CubieCube.Create;
  d:=CubieCube.Create;


   initSliceTables($FFFFFFFFFFFF);
   initTetraTables($FFFFFFFFFFFF);
   count:=0;
   for i:=0 to  495*70-1 do if sliceRep[i]=true then Inc(count);

   count:=0;
   for i:=0 to  70-1 do if tetraRep[i]=true then Inc(count);


   count:=0;
   for i:=0 to 495*70-1 do
   begin
     if sliceRep[i] and (sliceSym[i]=1)then begin count:= count+2048;continue end;
     if sliceRep[i] then
     begin
       initEoriTables(sliceSym[i],i);
       for j:=0 to 2048-1 do if eoriRep[j]=true then Inc(count);
     end;
   end;


   count:=0;
   for i:=0 to 70-1 do
   begin
     if tetraRep[i] and (tetraSym[i]=1)then begin count:= count+2187;continue end;
     if tetraRep[i] then
     begin
       initCoriTables(tetraSym[i],i);
       for j:=0 to 2187-1 do if coriRep[j]=true then Inc(count);
     end;
   end;




   count:=0;
   for i:=0 to 495*70-1 do
   begin
     if sliceRep[i] and (sliceSym[i]=1)then begin count:= count+2048*70*2187;continue end;
     if sliceRep[i] then
     begin
       initEoriTables(sliceSym[i],i);
       for j:=0 to 2048-1 do
       begin
         if eoriRep[j] and (eoriSym[j]=1)then begin count:= count+70*2187;continue end;
         if eoriRep[j] then
         begin
           initTetraTables(eoriSym[j]);
           for k:=0 to 70-1 do
           begin
              if tetraRep[k] and (tetraSym[k]=1)then begin count:= count+2187;continue end;
              if tetraRep[k] then
              begin
                initCoriTables(tetraSym[k],k);
                for m:=0 to 2187-1 do if  coriRep[m]=true then Inc(count);

              end;


           end;
         end

       end;
     end;
   end;
    Application.MessageBox(PChar(IntToStr(count)),'');
end;
*}

{*
//coset cover Test, die Repräsentanten müssen geladen sein
procedure TForm1.Button3Click(Sender: TObject);
var c,d: CubieCube;
    n,k,s,i,j,t: Integer;
begin
    d:=CubieCube.Create;
    for i:= 0 to fcN-1 do
    begin
      c:=CubieCube.Create(fc[i]);//ist jetzt korrekter k-coset
      //jetzt alle 70 möglichen T-cosets erzeugen:

      n:=c.cube20SliceCoord div 70;//der normale slicecoord-Anteil
      for j:= 0 to 69 do
      begin
        c.InvCube20SliceCoord(n*70+j);//orientierungen bleiben
        for s:= 0 to 47 do
        begin
          EdgeMult(EdgeSym[s],c.PEdge^,c.PEdgeTemp^);
          EdgeMult(c.PEdgeTemp^,EdgeSym[InvIdx[s]],d.PEdge^);
          t:= d.cube20SliceCoord*2048+d.EdgeOriCoord;
          tcosetbitmap[t div 8] := tcosetbitmap[t div 8] or (1 shl (t mod 8));
        end;
      end;
      c.Free;
    end;

    n:=0;
    for i:= 0 to 70963200 div 8 -1  do
    begin
      if tcosetbitmap[i]<>255 then
      begin
        for j:=0 to 7 do
        if (tcosetbitmap[i] and (1 shl j))=0 then Inc(n);
      end
    end;
     application.MessageBox(PChar(IntToStr(n)),'');

end;


*}
{
//Polya-Burnside Lemma Berechnungen
procedure TForm1.Button3Click(Sender: TObject);
var c,d: cubiecube;
    j,k,s,n: Integer;
begin
  c:= CubieCube.Create;
  d:= CubieCube.Create;
  n:=0;
  for j:=0 to 69 do
  begin
    c.InvCube20TetraCoord(j);
    for k:= 0 to 2186 do
    begin
      c.InvCornOriCoord(k);
      s:=32;
      CornMult(CornSym[s],c.PCorn^,c.PCornTemp^);
      CornMult(c.PCornTemp^,CornSym[InvIdx[s]],d.PCorn^);
      if (d.CornOriCoord=k) and (d.cube20TetraCoord=j) then Inc(n);
    end
  end;
  c.Free;
  d.Free;
end;
}
{
//Die Anzahl 55882296 für die zu berechnendne Zahl von H-cosets überprüfen
procedure TForm1.Button3Click(Sender: TObject);
var c,d: CubieCube;
    n,k,s,i,j,t: Integer;
    sK: Int64;
    count: Array[0..26000] of Integer;
    eori: Array[0..2186] of Integer;

begin
    d:=CubieCube.Create;
    for i:= 0 to fcN-1 do
    begin
      c:=CubieCube.Create(fc[i]);//ist jetzt korrekter k-coset
      k:= c.FlipUDSliceCoord;//gibt die Klasse 0<=k<64430 an
      //Symmetrien von K ermitteln
      sK:=0;
      for s:=0 to 15 do
      begin
        EdgeMult(EdgeSym[s],c.PEdge^,c.PEdgeTemp^);
        EdgeMult(c.PEdgeTemp^,EdgeSym[InvIdx[s]],d.PEdge^);
        t:=  d.FlipUDSliceCoord;
        if t = k then sK:= sK or (Int64(1) shl s);
      end;
      if sK=1 then begin count[i]:=2187; continue; end;//Keine Symmetrie
      //jetzt alle 2187 möglichen H-cosets erzeugen:
      count[i]:=0;
      for j:= 0 to 2186 do eori[j]:=0;
      for j:= 0 to 2186 do
      begin
        if eori[j]=0 then //neue Klasse
        begin
          Inc(count[i]);
          c.InvCornOriCoord(j);
          for s:= 0 to 15 do
          begin
            if sK and (Int64(1) shl s)=0 then continue;//keine Symmetrie
            CornMult(CornSym[s],c.PCorn^,c.PCornTemp^);
            CornMult(c.PCornTemp^,CornSym[InvIdx[s]],d.PCorn^);
            eori[d.CornOriCoord]:=1;
          end;
        end;
      end;
      c.Free;
    end;
    s:=0;
    for i:=0 to fcN-1 do s:=s+count[i];
end;
}

procedure TForm1.saveToDefaultFile;
var fs: TFileStream;
    s: String;
    label ende;
begin

  if fcN=0 then goto ende;
  with fc[fcN-1] do
  begin
    fs := TFileStream.Create('ctrlFsave.txt', fmCreate);
    if (Length(optManeuver)>0) and (Pos('Status',optManeuver)=0) then
    begin
      s:=OptManeuver;
      Delete(s,Pos(' (',s)-1,10);
      fs.WriteBuffer(PChar(s)^,Length(s));
    end
    else
    if (Length(maneuver)>0) then
    begin
      s:=Maneuver;
      Delete(s,Pos(' (',s)-1,10);
      fs.WriteBuffer(PChar(s)^,Length(s));
    end
  end;
  fs.Free;
ende:
end;

procedure TForm1.MultiplyClick(Sender: TObject);
var c1,c2: CubieCube; fc1:FaceletCube; j: Integer;
i: Face; checkOk: Boolean;
label ende;
begin
  c1:=CubieCube.Create(fc[CubePopUpMenu.Tag]);
  c2:=CubieCube.Create(fCube);
  fc1:=FaceletCube.Create(nil);

   checkOK:=true;
   for i:= U1 to B9 do
   begin
     if (i=U5) or  (i=R5) or(i=F5) or(i=D5) or(i=L5) or(i=B5) then continue;
     if not fCube.Check(i,true) then checkOK:= false;
   end;
   fCube.DrawCube(0,0);
   FacePaint.Invalidate;
   if not checkOK then
   begin
     Application.MessageBox(PChar(Err[32]),'Facelet Editor',MB_ICONWARNING);
     goto ende;
   end;
   for i:= U1 to B9 do
   if fCube.PFace^[i]>=NoCol then //Suche nach unvollständigen Würfeln
   begin
     Application.MessageBox(PChar(Err[13]),'Facelet Editor',MB_ICONWARNING);
     goto ende;
   end;

  //Problem mit orientierten Cubes betrachten

  with fc[CubePopUpMenu.Tag] do
  begin

    if optSearch<>nil then (optSearch as OptimalSearch).Kill;
    if tripSearch<>nil then (tripSearch as TripleSearch).Kill;
    for j:=0 to 1000 do //app might crash if we free before killing thread
      Application.ProcessMessages;//allow the notify procedures to work
    if optSearch<>nil then
    begin
      (optSearch as OptimalSearch).idaU.Free;
       if (optSearch as OptimalSearch).coU<>nil then (optSearch as OptimalSearch).coU.Free;
       optSearch:=nil;
    end;
    if tripSearch<>nil then
    begin
      (tripSearch as TripleSearch).idaU.Free;
      (tripSearch as TripleSearch).idaR.Free;
      (tripSearch as TripleSearch).idaF.Free;
      if (tripSearch as TripleSearch).coU<>nil then (tripSearch as TripleSearch).coU.Free;
      if (tripSearch as TripleSearch).coR<>nil then (tripSearch as TripleSearch).coR.Free;
      if (tripSearch as TripleSearch).coF<>nil then (tripSearch as TripleSearch).coF.Free;

      tripsearch.Free;
      tripSearch:=nil;

    end;
    CornMult(c1.PCorn^,c2.PCorn^,c1.PCornTemp^);
    EdgeMult(c1.PEdge^,c2.PEdge^,c1.PEdgeTemp^);
    CentMult(c1.PCent^,c2.PCent^,c1.PCentTemp^);

    c1.cSwap:=c1.PCorn;c1.PCorn:=c1.PCornTemp;c1.PCornTemp:=c1.cSwap;
    c1.eSwap:=c1.PEdge;c1.PEdge:=c1.PEdgeTemp;c1.PEdgeTemp:=c1.eSwap;
    c1.cnSwap:=c1.PCent;c1.PCent:=c1.PCentTemp;c1.PCentTemp:=c1.cnSwap;

    fc1.SetFacelets(c1);
    fc1.isOriented:=c1.isOriented;
    for j:= 0 to fcN-1 do
    if fc1.IsIsomorphic(fc[j],false,false,IsoInvInclude.Checked) and (CubePopUpMenu.Tag<>j) then
    if Application.MessageBox(PChar('Cube '+IntToStr(j+1)+' is isomorphic to the result. Proceed?'),'Maneuver Window',MB_ICONWARNING or MB_YESNO)
    <>IDYES then goto ende;
    SetFacelets(c1);
    runOptimal:=false;
    selected:=false;
    phase2Length:=MAXNODES;
    optManeuver:='Status: Not Running';
    optLength:= 30;//will allways be shorter
    maneuver:='';
    Output.Invalidate;
  end;

ende:
  c1.Free;
  c2.Free;
  fc1.Free;
end;

procedure TForm1.MultiplyInverseClick(Sender: TObject);
var c1,c2: CubieCube; fc1:FaceletCube; j: Integer;
i: Face; checkOk: Boolean;
label ende;
begin
  c1:=CubieCube.Create(fc[CubePopUpMenu.Tag]);
  c2:=CubieCube.Create(fCube);
  fc1:=FaceletCube.Create(nil);

   checkOK:=true;
   for i:= U1 to B9 do
   begin
     if (i=U5) or  (i=R5) or(i=F5) or(i=D5) or(i=L5) or(i=B5) then continue;
     if not fCube.Check(i,true) then checkOK:= false;
   end;
   fCube.DrawCube(0,0);
   FacePaint.Invalidate;
   if not checkOK then
   begin
     Application.MessageBox(PChar(Err[32]),'Facelet Editor',MB_ICONWARNING);
     goto ende;
   end;
   for i:= U1 to B9 do
   if fCube.PFace^[i]>=NoCol then //Suche nach unvollständigen Würfeln
   begin
     Application.MessageBox(PChar(Err[13]),'Facelet Editor',MB_ICONWARNING);
     goto ende;
   end;

  //Problem mit orientierten Cubes betrachten

  with fc[CubePopUpMenu.Tag] do
  begin

    if optSearch<>nil then (optSearch as OptimalSearch).Kill;
    if tripSearch<>nil then (tripSearch as TripleSearch).Kill;
    for j:=0 to 1000 do //app might crash if we free before killing thread
      Application.ProcessMessages;//allow the notify procedures to work
    if optSearch<>nil then
    begin
      (optSearch as OptimalSearch).idaU.Free;
       if (optSearch as OptimalSearch).coU<>nil then (optSearch as OptimalSearch).coU.Free;
       optSearch:=nil;
    end;
    if tripSearch<>nil then
    begin
      (tripSearch as TripleSearch).idaU.Free;
      (tripSearch as TripleSearch).idaR.Free;
      (tripSearch as TripleSearch).idaF.Free;
      if (tripSearch as TripleSearch).coU<>nil then (tripSearch as TripleSearch).coU.Free;
      if (tripSearch as TripleSearch).coR<>nil then (tripSearch as TripleSearch).coR.Free;
      if (tripSearch as TripleSearch).coF<>nil then (tripSearch as TripleSearch).coF.Free;

      tripsearch.Free;
      tripSearch:=nil;
    end;

    CornInv(c2.PCorn^,c2.PCornTemp^);
    EdgeInv(c2.PEdge^,c2.PEdgeTemp^);
    CentInv(c2.PCent^,c2.PCentTemp^);
    c2.cSwap:=c2.PCorn;c2.PCorn:=c2.PCornTemp;c2.PCornTemp:=c2.cSwap;
    c2.eSwap:=c2.PEdge;c2.PEdge:=c2.PEdgeTemp;c2.PEdgeTemp:=c2.eSwap;
    c2.cnSwap:=c2.PCent;c2.PCent:=c2.PCentTemp;c2.PCentTemp:=c2.cnSwap;

    CornMult(c1.PCorn^,c2.PCorn^,c1.PCornTemp^);
    EdgeMult(c1.PEdge^,c2.PEdge^,c1.PEdgeTemp^);
    CentMult(c1.PCent^,c2.PCent^,c1.PCentTemp^);

    c1.cSwap:=c1.PCorn;c1.PCorn:=c1.PCornTemp;c1.PCornTemp:=c1.cSwap;
    c1.eSwap:=c1.PEdge;c1.PEdge:=c1.PEdgeTemp;c1.PEdgeTemp:=c1.eSwap;
    c1.cnSwap:=c1.PCent;c1.PCent:=c1.PCentTemp;c1.PCentTemp:=c1.cnSwap;

    fc1.SetFacelets(c1);
    fc1.isOriented:=c1.isOriented;
    for j:= 0 to fcN-1 do
    if fc1.IsIsomorphic(fc[j],false,false,IsoInvInclude.Checked) and (CubePopUpMenu.Tag<>j) then
    if Application.MessageBox(PChar('Cube '+IntToStr(j+1)+' is isomorphic to the result. Proceed?'),'Maneuver Window',MB_ICONWARNING or MB_YESNO)
    <>IDYES then goto ende;
    SetFacelets(c1);
    runOptimal:=false;
    selected:=false;
    phase2Length:=MAXNODES;
    optManeuver:='Status: Not Running';
    optLength:= 30;//will allways be shorter
    maneuver:='';
    Output.Invalidate;
  end;

ende:
  c1.Free;
  c2.Free;
  fc1.Free;
end;

procedure TForm1.PageCtrlChange(Sender: TObject);
var i: Integer;
begin
  if ((Sender as TPageControl).ActivePage = TabSym) and (BRunSym.Caption='Start Search')  then
  begin
    CubePopUpMenu.Tag := -1;
    for i:= 0 to fcN-1 do
    begin
        if fc[i].selected then
        CubePopUpMenu.Tag := i;
    end;
    MTransferSymClick(nil);
  end;
end;

end.

 {
procedure TForm1.InvertClick(Sender: TObject);
var c: CubieCube; fcube:FaceletCube; j: Integer;
label ende;
begin
  c:=CubieCube.Create(fc[CubePopUpMenu.Tag]);
  fcube:=FaceletCube.Create(nil);
  with fc[CubePopUpMenu.Tag] do
  begin
    CornInv(c.PCorn^,c.PCornTemp^);
    EdgeInv(c.PEdge^,c.PEdgeTemp^);
    CentInv(c.PCent^,c.PCentTemp^);
    c.cSwap:=c.PCorn;c.PCorn:=c.PCornTemp;c.PCornTemp:=c.cSwap;
    c.eSwap:=c.PEdge;c.PEdge:=c.PEdgeTemp;c.PEdgeTemp:=c.eSwap;
    c.cnSwap:=c.PCent;c.PCent:=c.PCentTemp;c.PCentTemp:=c.cnSwap;
    fcube.SetFacelets(c);
    fcube.isOriented:=c.isOriented;
    for j:= 0 to fcN-1 do
    if fcube.IsIsomorphic(fc[j],false,false,IsoInvInclude.Checked) and (CubePopUpMenu.Tag<>j) then
    if Application.MessageBox(PChar('Cube '+IntToStr(j+1)+' is isomorphic to the inverted cube. Proceed?'),'Maneuver Window',MB_ICONWARNING or MB_YESNO)
    <>IDYES then goto ende;
    SetFacelets(c);
    fc[CubePopUpMenu.Tag].maneuver:=fc[CubePopUpMenu.Tag].InverseManeuver;
    if Pos('Status',optManeuver)=0 then
    optManeuver:=InverseOptManeuver;
    Output.Invalidate;
  end;
ende:
  fcube.Free;
  c.Free;
end;   }
