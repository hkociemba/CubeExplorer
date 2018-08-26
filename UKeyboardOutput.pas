{ You must retain all authors in any redistributed and modified versions**
Author: Ambriel www.ambriels.net (Ambriel's Network)

This project is NOT a conversion, but a complete rewrite. 

While some ideas of Robert N. and DoDocTrung have been used in this
project, several changes and features to the project have been made,
including the use of arrays, rewriting of functions, and serveal other
functions and features. This version superceeds the original Visual Basic idea.

If you would like to see how much this differs from the exact VB projects
that inspired this project, please see the included code
to see the original code of these authors. See how this project has come
a long way.


THANK YOU TO:
- Robert N. and DoDocTrung for your contribute that made this project possible.
- Jesper Dam, for correcting a problem in the SendKey function that would cause random errors.
- Mark Gascoyne, for being first to show appreciation for the efforts of this code :)
- All of those who voted for this code, and helped to make it code of the month!
- You: ~Your appreciation is my motivation~
- To Borland: Long Live Borland Delphi! Long live Borland!

Hey folks, I know there is a lot of functions here, but the TypeText function alone is good for most uses.
}


{
     From a programmer converting from VB to Delphi!

    This single purpose of this Unit is to emulate keystrokes.

     FYI:
     This unit will emulate whatever key you send, where ever you send it,
     just as though you were pressing the keys at your actual keyboard.
     Therefore, just like using a keyboard, whatever window is active is
     the window that will receive the input. Global command combinations,
     like Alt + Tab, just like using a real keyboard, will also be
     treated no different than had you actually keyed them, with the
     exception of the Alt + Ctrl + Delete combination.

     ***For purity of purpose, Windows API calls used for bringing
     another program's window to focus were not included in this unit,
     however, this units predefined Alt + Tab combination procedure,
     you may in some cases find equally sufficient ***

// Change Log:
    Revision 2006-July-26
      * Several optimizations
      * TO DO: Implement the pause. If you would
        like to help me do this and be credited,
        please email me! You can email me through
        Planet Source Code. Do not try to use the
        Pause function because it just doesn't work!
    Revision 2005-Mar-22;
        * Included an example project
        * Added a StopTyping Function
        * Fixed SendKey initialization problem generating
			  random errors; pointed out by Jesper Dam
    Revision 2005-Feb-11; Updated TypeText procedure;
                          Small Document additions/fixes
    Revision 2005-Jan-16; Small fixes and additions, and Alt+Tab Combo
}

{================================================================================================}





unit UKeyboardOutput;

interface

const
  DEF_SPEED = 5; // = 50/1000 seconds  Default Delay Speed. Change to 1 for faster speed.
  DEF_PAUSE = 10;

  CKCtrl = 1;
  CKAlt = 2;
  CKShift = 4;
  CKCaps = 8;
  CKWin = 16;
  CKPrintScr = 32;
  CKContext = 64;
  CKNumLock = 128;
  CKScrollLk = 256;
  CKBreak = 512;

type

  enumKBButton = (
    VK_LBUTTON = $1,      //Dec 1; The left mouse button
    VK_RBUTTON = $2,      //Dec 2; The right mouse button
    VK_CANCEL = $3,       //Dec 3; The Cancel virtual key, used for control-break processing
    VK_MBUTTON = $4,      //Dec 4; The middle mouse button
    VK_BACK = $8,         //Dec 8; Backspace
    VK_TAB = $9,          //Dec 9; Tab
    VK_CLEAR = $C,        //Dec 12; 5 (keypad without Num Lock)
    VK_RETURN = $D,       //Dec 13; Enter
    VK_SHIFT = $10,       //Dec 16; Shift (either one)
    VK_CONTROL = $11,     //Dec 17; Ctrl (either one)
    VK_MENU = $12,        //Dec 18; Alt (either one)
    VK_PAUSE = $13,       //Dec 19; Pause Break
    VK_CAPITAL = $14,     //Dec 20; Caps Lock
    VK_ESCAPE = $1B,      //Dec 27; Esc
    VK_SPACE = $20,       //Dec 32; Spacebar
    VK_PRIOR = $21,       //Dec 33; Page Up
    VK_NEXT = $22,        //Dec 34; Page Down
    VK_END = $23,         //Dec 35; End
    VK_HOME = $24,        //Dec 36; Home
    VK_LEFT = $25,        //Dec 37; Left Arrow
    VK_UP = $26,          //Dec 38; Up Arrow
    VK_RIGHT = $27,       //Dec 39; Right Arrow
    VK_DOWN = $28,        //Dec 40; Down Arrow
    VK_SELECT = $29,      //Dec 41; Select
    VK_PRINT = $2A,       //Dec 42; Print (only used by Nokia keyboards)
    VK_EXECUTE = $2B,     //Dec 43; Execute (not used)
    VK_SNAPSHOT = $2C,    //Dec 44; Print Screen
    VK_INSERT = $2D,      //Dec 45; Insert
    VK_DELETE = $2E,      //Dec 46; Delete
    VK_HELP = $2F,        //Dec 47; Help
    VK_0 = $30,           //Dec 48; 0
    VK_1 = $31,           //Dec 49; 1
    VK_2 = $32,           //Dec 50; 2
    VK_3 = $33,           //Dec 51; 3
    VK_4 = $34,           //Dec 52; 4
    VK_5 = $35,           //Dec 53; 5
    VK_6 = $36,           //Dec 54; 6
    VK_7 = $37,           //Dec 55; 7
    VK_8 = $38,           //Dec 56; 8
    VK_9 = $39,           //Dec 57; 9
    VK_A = $41,           //Dec 65; A
    VK_B = $42,           //Dec 66; B
    VK_C = $43,           //Dec 67; C
    VK_D = $44,           //Dec 68; D
    VK_E = $45,           //Dec 69; E
    VK_F = $46,           //Dec 70; F
    VK_G = $47,           //Dec 71; G
    VK_H = $48,           //Dec 72; H
    VK_I = $49,           //Dec 73; I
    VK_J = $4A,           //Dec 74; J
    VK_K = $4B,           //Dec 75; K
    VK_L = $4C,           //Dec 76; L
    VK_M = $4D,           //Dec 77; M
    VK_N = $4E,           //Dec 78; N
    VK_O = $4F,           //Dec 79; O
    VK_P = $50,           //Dec 80; P
    VK_Q = $51,           //Dec 81; Q
    VK_R = $52,           //Dec 82; R
    VK_S = $53,           //Dec 83; S
    VK_T = $54,           //Dec 84; T
    VK_U = $55,           //Dec 85; U
    VK_V = $56,           //Dec 86; V
    VK_W = $57,           //Dec 87; W
    VK_X = $58,           //Dec 88; X
    VK_Y = $59,           //Dec 89; Y
    VK_Z = $5A,           //Dec 90; Z
    VK_STARTKEY = $5B,    //Dec 91; Start Menu key
    VK_CONTEXTKEY = $5D,  //Dec 93; Context Menu key
    VK_NUMPAD0 = $60,     //Dec 96; 0 (keypad with Num Lock)
    VK_NUMPAD1 = $61,     //Dec 97; 1 (keypad with Num Lock)
    VK_NUMPAD2 = $62,     //Dec 98; 2 (keypad with Num Lock)
    VK_NUMPAD3 = $63,     //Dec 99; 3 (keypad with Num Lock)
    VK_NUMPAD4 = $64,     //Dec 100; 4 (keypad with Num Lock)
    VK_NUMPAD5 = $65,     //Dec 101; 5 (keypad with Num Lock)
    VK_NUMPAD6 = $66,     //Dec 102; 6 (keypad with Num Lock)
    VK_NUMPAD7 = $67,     //Dec 103; 7 (keypad with Num Lock)
    VK_NUMPAD8 = $68,     //Dec 104; 8 (keypad with Num Lock)
    VK_NUMPAD9 = $69,     //Dec 105; 9 (keypad with Num Lock)
    VK_MULTIPLY = $6A,    //Dec 106; * (keypad)
    VK_ADD = $6B,         //Dec 107; + (keypad)
    VK_SEPARATOR = $6C,   //Dec 108; Separator (never generated by the keyboard)
    VK_SUBTRACT = $6D,    //Dec 109; - (keypad)
    VK_DECIMAL = $6E,     //Dec 110; . (keypad with Num Lock)
    VK_DIVIDE = $6F,      //Dec 111; / (keypad)
    VK_F1 = $70,          //Dec 112; F1
    VK_F2 = $71,          //Dec 113; F2
    VK_F3 = $72,          //Dec 114; F3
    VK_F4 = $73,          //Dec 115; F4
    VK_F5 = $74,          //Dec 116; F5
    VK_F6 = $75,          //Dec 117; F6
    VK_F7 = $76,          //Dec 118; F7
    VK_F8 = $77,          //Dec 119; F8
    VK_F9 = $78,          //Dec 120; F9
    VK_F10 = $79,         //Dec 121; F10
    VK_F11 = $7A,         //Dec 122; F11
    VK_F12 = $7B,         //Dec 123; F12
    VK_F13 = $7C,         //Dec 124; F13
    VK_F14 = $7D,         //Dec 125; F14
    VK_F15 = $7E,         //Dec 126; F15
    VK_F16 = $7F,         //Dec 127; F16
    VK_F17 = $80,         //Dec 128; F17
    VK_F18 = $81,         //Dec 129; F18
    VK_F19 = $82,         //Dec 130; F19
    VK_F20 = $83,         //Dec 131; F20
    VK_F21 = $84,         //Dec 132; F21
    VK_F22 = $85,         //Dec 133; F22
    VK_F23 = $86,         //Dec 134; F23
    VK_F24 = $87,         //Dec 135; F24
    VK_NUMLOCK = $90,     //Dec 144; Num Lock
    VK_OEM_SCROLL = $91,  //Dec 145; Scroll Lock
    VK_OEM_1 = $BA,       //Dec 186; ;
    VK_OEM_PLUS = $BB,    //Dec 187; =
    VK_OEM_COMMA = $BC,   //Dec 188;,
    VK_OEM_MINUS = $BD,   //Dec 189; -
    VK_OEM_PERIOD = $BE,  //Dec 190; .
    VK_OEM_2 = $BF,       //Dec 191; /
    VK_OEM_3 = $C0,       //Dec 192; `
    VK_OEM_4 = $DB,       //Dec 219; [
    VK_OEM_5 = $DC,       //Dec 220; \
    VK_OEM_6 = $DD,       //Dec 221; ]
    VK_OEM_7 = $DE,       //Dec 222; '
    VK_OEM_8 = $DF,       //Dec 223; (unknown)
    VK_ICO_F17 = $E0,     //Dec 224; F17 on Olivetti extended keyboard (internal use only)
    VK_ICO_F18 = $E1,     //Dec 225; F18 on Olivetti extended keyboard (internal use only)
    VK_OEM_102 = $E2,     //Dec 226; < or | on IBM-compatible 102 enhanced non-U.S. keyboard
    VK_ICO_HELP = $E3,    //Dec 227; Help on Olivetti extended keyboard (internal use only)
    VK_ICO_00 = $E4,      //Dec 228; 00 on Olivetti extended keyboard (internal use only)
    VK_ICO_CLEAR = $E6,   //Dec 230; Clear on Olivette extended keyboard (internal use only)
    VK_OEM_RESET = $E9,   //Dec 233; Reset (Nokia keyboards only)
    VK_OEM_JUMP = $EA,    //Dec 234; Jump (Nokia keyboards only)
    VK_OEM_PA1 = $EB,     //Dec 235; PA1 (Nokia keyboards only)
    VK_OEM_PA2 = $EC,     //Dec 236; PA2 (Nokia keyboards only)
    VK_OEM_PA3 = $ED,     //Dec 237; PA3 (Nokia keyboards only)
    VK_OEM_WSCTRL = $EE,  //Dec 238; WSCTRL (Nokia keyboards only)
    VK_OEM_CUSEL = $EF,   //Dec 239; CUSEL (Nokia keyboards only)
    VK_OEM_ATTN = $F0,    //Dec 240; ATTN (Nokia keyboards only)
    VK_OEM_FINNISH = $F1, //Dec 241; FINNISH (Nokia keyboards only)
    VK_OEM_COPY = $F2,    //Dec 242; COPY (Nokia keyboards only)
    VK_OEM_AUTO = $F3,    //Dec 243; AUTO (Nokia keyboards only)
    VK_OEM_ENLW = $F4,    //Dec 244; ENLW (Nokia keyboards only)
    VK_OEM_BACKTAB = $F5, //Dec 245; BACKTAB (Nokia keyboards only)
    VK_ATTN = $F6,        //Dec 246; ATTN
    VK_CRSEL = $F7,       //Dec 247; CRSEL
    VK_EXSEL = $F8,       //Dec 248; EXSEL
    VK_EREOF = $F9,       //Dec 249; EREOF
    VK_PLAY = $FA,        //Dec 250; PLAY
    VK_ZOOM = $FB,        //Dec 251; ZOOM
    VK_NONAME = $FC,      //Dec 252; NONAME
    VK_PA1 = $FD,         //Dec 253; PA1
    VK_OEM_CLEAR = $FE    //Dec 254; CLEAR
    );
{================================================================================================}

{-----------------------------------------------------------------------------}
procedure TypingOff(); //Turns typing off and ignores input
procedure TypingOn(); //Turns typing on and receives input
procedure PauseBreak();
procedure Pause();
function IsTypingOn(): boolean;
function IsPaused(): boolean;
procedure Wait(WaitTime: Integer); //Based on 1-100; 1 = 1/100 second 100 = 1 second
procedure FillArray();
function GetAKey(KeyPressed: byte): boolean;
function GetAscVirtualKey(AKey: byte): ShortInt;
function GetVirtualKeyAsc(VKey: byte): ShortInt;
function TypeText(const inTxt: string; const Delay: Smallint = DEF_SPEED): boolean;
function TypeNum(ZerosToNines: string; const Delay: Smallint): boolean;
{-----------------------------------------------------------------------------}
procedure SendKey(vKey: SmallInt; booDown: boolean);
procedure SendKeyEnum(eVK: enumKBButton; booDown: boolean);
procedure SendKeyAsc(AsciiKey: SmallInt; booDown: boolean);
procedure SendControl(CtrlKey: byte; booDown: boolean; const Delay: Smallint = 1); //10/1000 of a second
procedure PressVKA(VKey: SmallInt; booShift: boolean);
{-----------------------------------------------------------------------------}
procedure PressVKey(vKey: SmallInt; PressShift: boolean; Times: Smallint; const Delay: Smallint = DEF_SPEED); overload;
procedure PressVKey(vKey: SmallInt; PressShift: boolean); overload;
function PressAscii(AsciiKey: SmallInt; Times: SmallInt; const Delay: Smallint = DEF_SPEED): boolean; overload;
function PressAscii(AsciiKey: SmallInt): boolean; overload;
procedure PressEVkey(eVK: enumKBButton; Times: SmallInt; const Delay: Smallint = DEF_SPEED); overload;
procedure PressEVkey(eVK: enumKBButton); overload;
function PressFunctionKey(OneToTwentyFour: SmallInt; Times: SmallInt; const Delay: Smallint): boolean; overload;
function PressFunctionKey(OneToTwentyFour: SmallInt): boolean; overload;
{-----------------------------------------------------------------------------}
procedure DoComboAltTab(Times: SmallInt; const Delay: Smallint = DEF_SPEED); overload;
procedure DoComboAltTab(); overload;
{-----------------------------------------------------------------------------}
procedure DoReturn(Times: SmallInt; const Delay: Smallint = DEF_SPEED); overload;
procedure DoReturn(); overload;
procedure DoTab(Times: SmallInt; const Delay: Smallint = DEF_SPEED); overload;
procedure DoTab(); overload;
procedure DoBackSpace(Times: SmallInt; const Delay: Smallint = DEF_SPEED); overload;
procedure DoBackSpace(); overload;
procedure DoEsc(Times: SmallInt; const Delay: Smallint = DEF_SPEED); overload;
procedure DoEsc(); overload;
procedure DoSpace(Times: SmallInt; const Delay: Smallint = DEF_SPEED); overload;
procedure DoSpace(); overload;
procedure DoPgUp(Times: SmallInt; const Delay: Smallint = DEF_SPEED); overload;
procedure DoPgUp(); overload;
procedure DoPgDown(Times: SmallInt; const Delay: Smallint = DEF_SPEED); overload;
procedure DoPgDown(); overload;
procedure DoEnd(Times: SmallInt; const Delay: Smallint = DEF_SPEED); overload;
procedure DoEnd(); overload;
procedure DoHome(Times: SmallInt; const Delay: Smallint = DEF_SPEED); overload;
procedure DoHome(); overload;
procedure DoLeft(Times: SmallInt; const Delay: Smallint = DEF_SPEED); overload;
procedure DoLeft(); overload;
procedure DoUp(Times: SmallInt; const Delay: Smallint = DEF_SPEED); overload;
procedure DoUp(); overload;
procedure DoRight(Times: SmallInt; const Delay: Smallint = DEF_SPEED); overload;
procedure DoRight(); overload;
procedure DoDown(Times: SmallInt; const Delay: Smallint = DEF_SPEED); overload;
procedure DoDown(); overload;
procedure DoDelete(Times: SmallInt; const Delay: Smallint = DEF_SPEED); overload;
procedure DoDelete(); overload;
procedure DoInsert(Times: SmallInt; const Delay: Smallint = DEF_SPEED); overload;
procedure DoInsert(); overload;
procedure DoPrintScreen(Times: SmallInt; const Delay: Smallint = DEF_SPEED); overload;
procedure DoPrintScreen(); overload;
procedure DoScroll(Times: SmallInt; const Delay: Smallint = DEF_SPEED); overload;
procedure DoScroll(); overload;
procedure DoNumLock(Times: SmallInt; const Delay: Smallint = DEF_SPEED); overload;
procedure DoNumLock(); overload;
procedure DoPauseBreak(Times: SmallInt; const Delay: Smallint = DEF_SPEED); overload;
procedure DoPauseBreak(); overload;
procedure DoStarMenu(Times: SmallInt; const Delay: Smallint = DEF_SPEED); overload;
procedure DoStarMenu(); overload;
procedure DoContextMenu(Times: SmallInt; const Delay: Smallint = DEF_SPEED); overload;
procedure DoContextMenu(); overload;
procedure DoCaps(Times: SmallInt; const Delay: Smallint = DEF_SPEED); overload;
procedure DoCaps(); overload;
procedure DoMouseLeftBtn(Times: SmallInt; const Delay: Smallint = DEF_SPEED); overload;
procedure DoMouseLeftBtn(); overload;
procedure DoMouseRightBtn(Times: SmallInt; const Delay: Smallint = DEF_SPEED); overload;
procedure DoMouseRightBtn(); overload;
procedure DoMouseMidBtn(Times: SmallInt; const Delay: Smallint = DEF_SPEED); overload;
procedure DoMouseMidBtn(); overload;
procedure DoCancel(Times: SmallInt; const Delay: Smallint = DEF_SPEED); overload;
procedure DoCancel(); overload;
{================================================================================================}


{=================================================================================================
  Implementation
 =================================================================================================}
implementation
uses Windows, Forms; // Windows for Windows API; Forms for 'Application.ProcessMessages'
const
  KEYEVENTF_KEYUP = $2;
  INPUT_KEYBOARD = $1;
//-------------------------------------------
var
  mToVKey: array[32..126] of byte;
  mbShift: array[32..126] of boolean;
//Well...Let's Keep around some re-useables
  bTmp: byte; iTmp: shortint; lTmp: longint; bStop: boolean; bPause: boolean;


{=================================================================================================
  Implemented Overloads
 =================================================================================================}
procedure PressVKey(vKey: SmallInt; PressShift: boolean); begin PressVKey(vKey, PressShift, 1, DEF_SPEED); end;
function PressAscii(AsciiKey: SmallInt): boolean; begin Result := PressAscii(AsciiKey, 1); end;
procedure PressEVkey(eVK: enumKBButton); begin PressEVkey(eVK, 1, DEF_SPEED); end;
function PressFunctionKey(OneToTwentyFour: SmallInt): boolean; begin Result := PressFunctionKey(OneToTwentyFour, 1, DEF_SPEED); end;
procedure DoReturn(); begin DoReturn(1, DEF_SPEED); end;
procedure DoTab(); begin DoTab(1, DEF_SPEED); end;
procedure DoBackSpace(); begin DoBackSpace(1, DEF_SPEED); end;
procedure DoEsc(); begin DoEsc(1, DEF_SPEED); end;
procedure DoSpace(); begin DoSpace(1, DEF_SPEED); end;
procedure DoPgUp(); begin DoPgUp(1, DEF_SPEED); end;
procedure DoPgDown(); begin DoPgDown(1, DEF_SPEED); end;
procedure DoEnd(); begin DoEnd(1, DEF_SPEED); end;
procedure DoHome(); begin DoHome(1, DEF_SPEED); end;
procedure DoLeft(); begin DoLeft(1, DEF_SPEED); end;
procedure DoUp(); begin DoUp(1, DEF_SPEED); end;
procedure DoRight(); begin DoRight(1, DEF_SPEED); end;
procedure DoDown(); begin DoDown(1, DEF_SPEED); end;
procedure DoDelete(); begin DoDelete(1, DEF_SPEED); end;
procedure DoInsert(); begin DoInsert(1, DEF_SPEED); end;
procedure DoPrintScreen(); begin DoPrintScreen(1, DEF_SPEED); end;
procedure DoScroll(); begin DoScroll(1, DEF_SPEED); end;
procedure DoNumLock(); begin DoNumLock(1, DEF_SPEED); end;
procedure DoPauseBreak(); begin DoPauseBreak(1, DEF_SPEED); end;
procedure DoStarMenu(); begin DoStarMenu(1, DEF_SPEED); end;
procedure DoContextMenu(); begin DoContextMenu(1, DEF_SPEED); end;
procedure DoCaps(); begin DoCaps(1, DEF_SPEED); end;
procedure DoMouseLeftBtn(); begin DoMouseLeftBtn(1, DEF_SPEED); end;
procedure DoMouseRightBtn(); begin DoMouseRightBtn(1, DEF_SPEED); end;
procedure DoMouseMidBtn(); begin DoMouseMidBtn(1, DEF_SPEED); end;
procedure DoCancel(); begin DoCancel(1, DEF_SPEED); end;
procedure DoComboAltTab(); begin DoComboAltTab(DEF_SPEED); end;
{================================================================================================}

{=================================================================================================
  Procedures
 =================================================================================================}

procedure TypingOff();
begin
  bStop := true;
end;

procedure TypingOn();
begin
  bStop := false;
end;

function IsTypingOn(): boolean;
begin
  IsTypingOn := not bStop;
end;


function IsPaused(): boolean;
begin
  IsPaused := bPause;
end;

procedure Pause();
begin
  bPause := true;
  while (bPause = true) do begin
    if bStop then break;
    Wait(DEF_PAUSE);
  end;

end;

procedure PauseBreak();
begin
  bPause := false;
end;



{=================================================================================================
  Send Procedures
 =================================================================================================}

{-----------------------------------------------------------------------------
  Function: SendKey
  Desc:   Output a single down or release Virtual Keystroke using a virtual
          key code with the Windows API SendInput Function.
 -----------------------------------------------------------------------------}

 {|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 | SendKey
 | Desc:  Output a single down or release Virtual Keystroke using a virtual
 |        key code with the Windows API SendInput Function.
 |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}

procedure SendKey(vKey: SmallInt; booDown: boolean);
var
  GInput: array[0..0] of tagINPUT; //GENERALINPUT;
  // doesn't have to be array :)
begin
  GInput[0].Itype := INPUT_KEYBOARD;
  GInput[0].ki.wVk := vKey;
  GInput[0].ki.wScan := 0;
  GInput[0].ki.time := 0;
  GInput[0].ki.dwExtraInfo := 0;

  if not booDown then
    GInput[0].ki.dwFlags := KEYEVENTF_KEYUP
  else
    GInput[0].ki.dwFlags := 0;

  SendInput(1, GInput[0], SizeOf(GInput));
end;

{|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 | SendKeyEnum
 | Desc:  Output a single down or release Virtual Keystroke using the
 |        enumeration set defined in this unit, with the Windows API SendInput
 |        function
 |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}
 procedure SendKeyEnum(eVK: enumKBButton; booDown: boolean);
begin
  SendKey(SmallInt(eVK), booDown);
end; { procedure }

{|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 | SendKeyAsc
 | Desc:  Output a single down or release Virtual Keystroke using an ascii
 |        code equivilent, with the Windows API SendInput function:
 |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}
procedure SendKeyAsc(AsciiKey: SmallInt; booDown: boolean);
begin
  if ((AsciiKey >= 32) and (AsciiKey <= 126)) then begin SendKey(mToVKey[AsciiKey], booDown);
  end;
end; { procedure }

{|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 | SendControl
 | Desc:  Output either down or release Virtual Control/Function Keystrokes
 |        at once, using the CK bitset constants defined in this unit, with
 |        the Windows API SendInput function
 |        i.e SendControl(CKAlt + CKShift, true; 1)   <- Holds down Alt and Shift
 |            SendControl(CKAlt + CKShift, false; 1)  <- Release Alt and Shift
 |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}
procedure SendControl(CtrlKey: byte; booDown: boolean; const Delay: Smallint);
begin

  if Delay > 0 then Wait(Delay);

  if (CtrlKey and CKAlt) = CKAlt then begin SendKey($12, booDown) end;
  if (CtrlKey and CKCtrl) = CKCtrl then begin SendKey($11, booDown) end;
  if (CtrlKey and CKShift) = CKShift then begin SendKey($10, booDown) end;
  if (CtrlKey and CKContext) = CKContext then begin SendKey($5D, booDown) end;
  if (CtrlKey and CKWin) = CKWin then begin SendKey($5B, booDown) end;

  if (CtrlKey and CKScrollLk) = CKPrintScr then begin SendKey($91, booDown) end;
  if (CtrlKey and CKBreak) = CKPrintScr then begin SendKey($13, booDown) end;
  if (CtrlKey and CKCaps) = CKCaps then begin SendKey($14, booDown) end;
  if (CtrlKey and CKNumLock) = CKNumLock then begin SendKey($90, booDown) end;
  if (CtrlKey and CKPrintScr) = CKPrintScr then begin SendKey($2C, booDown) end;

end; { procedure }
{================================================================================================}


{|=================================================================================================
 | Press Procedures
 |=================================================================================================}

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\
| PressVKey
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|   Desc: Stimulate a single keystroke with a virtual keycode
\~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}
 procedure PressVKey(vKey: SmallInt; PressShift: boolean; Times: SmallInt; const Delay: Smallint);
begin
  iTmp := 1;

//  DbgPrint(vKey);
//  DbgPrintLn('--Press This Key');
                //For iTmp:= 1 To Times do begin
  while not (iTmp > Times) do
  begin
    if bStop = true then exit;
    if bPause = true then Pause;
    if Delay > 0 then Wait(Delay);
    PressVKA(vKey, PressShift);
    iTmp := iTmp + 1;
  end;
//  DbgPrintLn('--END Press This Key');
end; { procedure }

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\
| PressEVkey
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|   Desc: Stimulate a single keystroke with a defined enumeration
\~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}
procedure PressEVkey(eVK: enumKBButton; Times: SmallInt; const Delay: Smallint);
begin
  PressVKey(SmallInt(eVK), false, Times, Delay);
end; { procedure }

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\
| PressAscii
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|   Desc: Stimulate a single keystroke with an Ascii key code
\~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}
function PressAscii(AsciiKey: SmallInt; Times: SmallInt; const Delay: Smallint): boolean;
//Updated 2006-0430 (You may want to use the TypeText procedure instead)
//Presses a single key by ascii code)
begin
  PressAscii := true;

  if ((AsciiKey >= 32) and (AsciiKey <= 126)) then begin
    PressVKey(mToVKey[AsciiKey], mbShift[AsciiKey], Times, Delay);
  end
  else if AsciiKey = 9 then begin // Tab
    PressVKey($9, false, Times, Delay);
  end
  else if ((AsciiKey = 13) or (AsciiKey = 10)) then begin // Return
    // Note, 10 and 13 both generate RETURN, use the TypeText procedure if you are working with strings
    PressVKey($D, false, Times, Delay);
  end
  else if (AsciiKey = 8) then begin //Backspace
    PressVKey($8, false, Times, Delay);
  end
  else begin
    PressAscii := false;
  end; { if (AsciiKey >= 32) And (AsciiKey <= 126)) }

end; { procedure }

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\
| PressFunctionKey
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|   Desc: Stimulate a single function key with a number 1 - 24, for function
|          keys F1-F24
\~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}
function PressFunctionKey(OneToTwentyFour: SmallInt; Times: SmallInt; const Delay: Smallint): boolean;
begin
  PressFunctionKey := true;
  if ((OneToTwentyFour >= 1) and (OneToTwentyFour <= 24)) then begin
    PressVKey(OneToTwentyFour + 111, false, Times, Delay);
  end
  else begin PressFunctionKey := false;
  end;
end;
{================================================================================================}


{=================================================================================================
  DoCombo Procedures  - Stimulates specific combination keystrokes
 =================================================================================================}

{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\
| DoComboAltTab
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|   Desc: Stimulates Alt+Tab combination key
\~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}
procedure DoComboAltTab(Times: SmallInt; const Delay: Smallint);
begin
  SendControl(CKAlt, True, Delay);
  PressVKey(SmallInt($9), false, Times, Delay);
  SendControl(CKAlt, False, Delay);
end;

{================================================================================================}


{=================================================================================================
  'Do' Procedures - Stimulates the specific keystroke
 =================================================================================================}

procedure DoReturn(Times: SmallInt; const Delay: Smallint);
    //VK_RETURN = $D             //Dec 13; Enter
begin
  PressVKey($D, false, Times, Delay);
end; { procedure }

procedure DoTab(Times: SmallInt; const Delay: Smallint);
    //VK_TAB = $9                //Dec 9; Tab
begin
  PressVKey($9, false, Times, Delay);
end; { procedure }

procedure DoBackSpace(Times: SmallInt; const Delay: Smallint);
    //VK_BACK = $8
begin
  PressVKey($8, false, Times, Delay);
end; { procedure }

procedure DoEsc(Times: SmallInt; const Delay: Smallint);
    //VK_ESCAPE = $1B            //Dec 27; Esc
begin
  PressVKey($1B, false, Times, Delay);
end; { procedure }

procedure DoSpace(Times: SmallInt; const Delay: Smallint);
    //VK_SPACE = $20             //Dec 32; Spacebar
begin
  PressVKey($20, false, Times, Delay);
end; { procedure }

procedure DoPgUp(Times: SmallInt; const Delay: Smallint);
    //VK_PRIOR = $21             //Dec 33; Page Up
begin
  PressVKey($21, false, Times, Delay);
end; { procedure }

procedure DoPgDown(Times: SmallInt; const Delay: Smallint);
    //VK_NEXT = $22              //Dec 34; Page Down
begin
  PressVKey($22, false, Times, Delay);
end; { procedure }

procedure DoEnd(Times: SmallInt; const Delay: Smallint);
    //VK_END = $23               //Dec 35; End
begin

  PressVKey($23, false, Times, Delay);
end; { procedure }

procedure DoHome(Times: SmallInt; const Delay: Smallint);
    //VK_HOME = $24              //Dec 36; Home
begin
  PressVKey($24, false, Times, Delay);
end; { procedure }

procedure DoInsert(Times: SmallInt; const Delay: Smallint);
    //    VK_INSERT = $2D            //Dec 45; Insert
begin
  PressVKey($2D, false, Times, Delay);
end;

procedure DoDelete(Times: SmallInt; const Delay: Smallint);
    //VK_DELETE = $2E,           //Dec 46; Delete
begin
  PressVKey($2E, false, Times, Delay);
end;

procedure DoLeft(Times: SmallInt; const Delay: Smallint);
    //VK_LEFT = $25              //Dec 37; Left Arrow
begin
  PressVKey($25, false, Times, Delay);
end; { procedure }

procedure DoUp(Times: SmallInt; const Delay: Smallint);
    //VK_UP = $26                //Dec 38; Up Arrow
begin
  PressVKey($26, false, Times, Delay);
end; { procedure }

procedure DoRight(Times: SmallInt; const Delay: Smallint);
    //VK_RIGHT = $27             //Dec 39; Right Arrow
begin
  PressVKey($27, false, Times, Delay);
end; { procedure }

procedure DoDown(Times: SmallInt; const Delay: Smallint);
    //VK_DOWN = $28              //Dec 40; Down Arrow
begin
  PressVKey($28, false, Times, Delay);
end; { procedure }

procedure DoPrintScreen(Times: SmallInt; const Delay: Smallint);
    //VK_SNAPSHOT = $2C,         //Dec 44; Print Screen
begin
  PressVKey($2C, false, Times, Delay);
end; { procedure }

procedure DoScroll(Times: SmallInt; const Delay: Smallint);
    //VK_OEM_SCROLL = $91,       //Dec 145; Scroll Lock
begin
  PressVKey($91, false, Times, Delay);
end; { procedure }

procedure DoNumLock(Times: SmallInt; const Delay: Smallint);
    //VK_NUMLOCK = $90,          //Dec 144; Num Lock
begin
  PressVKey($90, false, Times, Delay);
end; { procedure }

procedure DoPauseBreak(Times: SmallInt; const Delay: Smallint);
    //VK_PAUSE = $13,            //Dec 19; Pause Break
begin
  PressVKey($13, false, Times, Delay);
end; { procedure }

procedure DoStarMenu(Times: SmallInt; const Delay: Smallint);
    //VK_STARTKEY = $5B,         //Dec 91; Start Menu key
begin
  PressVKey($5B, false, Times, Delay);
end; { procedure }

procedure DoContextMenu(Times: SmallInt; const Delay: Smallint);
    //VK_CONTEXTKEY = $5D,       //Dec 93; Context Menu key
begin
  PressVKey($5D, false, Times, Delay);
end; { procedure }

procedure DoCaps(Times: SmallInt; const Delay: Smallint);
    //VK_CAPITAL = $14,          //Dec 20; Caps Lock
begin
  PressVKey($14, false, Times, Delay);
end; { procedure }

procedure DoMouseLeftBtn(Times: SmallInt; const Delay: Smallint);
    //VK_LBUTTON = $1,           //Dec 1; The left mouse button
begin
  PressVKey($1, false, Times, Delay);
end;

procedure DoMouseRightBtn(Times: SmallInt; const Delay: Smallint);
    //VK_RBUTTON = $2,           //Dec 2; The right mouse button
begin
  PressVKey($2, false, Times, Delay);
end;

procedure DoMouseMidBtn(Times: SmallInt; const Delay: Smallint);
    //VK_MBUTTON = $4,           //Dec 4; The middle mouse button
begin
  PressVKey($4, false, Times, Delay);
end;

procedure DoCancel(Times: SmallInt; const Delay: Smallint);
    //VK_CANCEL = $3,            //Dec 3; The Cancel virtual key, used for control-break processing
begin
  PressVKey($3, false, Times, Delay);
end;
{================================================================================================}


//======================================================================
// TypeText Procedure
// Sends a string of text                                  |
//======================================================================
procedure PressVKA(VKey: SmallInt; booShift: boolean);
begin

  if not booShift then begin
    SendKey(VKey, True); //Down
    SendKey(VKey, False); //Up
  end
  else begin
    SendKey($10, True);
    SendKey(VKey, True); //Down
    SendKey(VKey, False); //Up
    SendKey($10, False);
  end; { if }

end;

// ex: TypeText('Hello, you all!', 2)

function TypeText(const inTxt: string; const Delay: Smallint): boolean; //Delay x 10ms
var i: integer;
begin
  if bStop = true then exit;
  TypeText := true;

  for i := 1 to Length(inTxt) do begin

    if bStop = true then exit;
    if bPause = true then Pause;
        //while (bPause = true) do Wait(DEF_PAUSE);

    bTmp := byte(inTxt[i]);

    if not bStop and ((bTmp >= 32) and (bTmp <= 126)) then begin //Data validation
      if Delay > 0 then Wait(Delay); // so it won't be too fast to output all keys
      PressVKA(mToVKey[bTmp], mbShift[bTmp]);
    end
    else if bTmp = 9 then begin // Tab
      DoTab(1, Delay);
    end
    else if (bTmp = 13) then begin // Return
      DoReturn(1, Delay);
    end
    else if (bTmp = 10) then begin // Return
      if ((i = 1) or (byte(inTxt[i - 1]) <> 13)) then begin
        DoReturn(1, Delay);
      end;
    end
    else if (bTmp = 8) then begin // Backspace Key
      DoBackSpace(1, Delay);
    end
    else begin
      TypeText := false;
    end; { if }
  end; {For}
end; { procedure }

//For numberpad specific numbers. Will ignore all non-keypad

function TypeNum(ZerosToNines: string; const Delay: Smallint): boolean;
var i: integer;
begin
  TypeNum := true;

  for i := 1 to Length(ZerosToNines) do begin
    if bStop = true then exit;
    if bPause = true then Pause;

    bTmp := Byte(ZerosToNines[i]); //byte(char(Mid(ZerosToNines, i, 1)));

    if (not bStop) and ((bTmp >= 48) and (bTmp <= 57)) then begin
      if Delay > 0 then Wait(Delay);
      SendKey(bTmp + 48, True); //Down
      SendKey(bTmp + 48, False); //Up
    end
    else if (bTmp = SmallInt('+')) then begin // +
      PressVKA($6B, false);
    end
    else if (bTmp = SmallInt('-')) then begin // -
      PressVKA($6D, false);
    end
    else if (bTmp = SmallInt('.')) then begin // .
      PressVKA($6E, false);
    end
    else if (bTmp = SmallInt('*')) then begin // *
      PressVKA($6A, false);
    end
    else if (bTmp = SmallInt('/')) then begin // /
      PressVKA($6F, false);
    end
    else if (bTmp = SmallInt('S')) then begin // S
      PressVKA($6C, false); //Separator (never generated by keyboard)
    end
    else if (bTmp = SmallInt('N')) then begin // N
      PressVKA($90, false); // Numberlock
    end
    else begin
      TypeNum := false;
    end; { if }
  end;

end; { procedure }


//----------------------------------------------------------------------
// END TypeText Procedure
//----------------------------------------------------------------------


//======================================================================
// Misc/Other Procedure                                                |
//======================================================================

procedure Wait(WaitTime: Integer); //1 = 10/1000 seconds.
var
  CMin: byte;
begin
  CMin := 10; //Value *10* makes 1 = *10*/1000 seconds.

  lTmp := GetTickCount + (WaitTime * CMin);

  while (GetTickCount < lTmp) do begin
    Application.ProcessMessages; // ...Omit this, and you'll be wondering why you can't press the cancel button on your form, amongst other things

    Sleep(CMin); (*  <-- Hey, a quick flash for you, but this gives the CPU a significant break!
                            Omit this, and you're sure to waist CPU power. Guaranteed!
                            Keep this between 5 and 50. 5 faster, 50 slower.
                            Even though you're *still* saving CPU even with 1, it's an overkill for keyboard output *)

  end;
end; { procedure }

//Check to see if a Virtual Key is pressed down

function GetAKey(KeyPressed: byte): boolean;
begin
  GetAKey := GetAsyncKeyState(KeyPressed) <> 0;
end; { function }

// enumerated version of Virtual Key check

function GetAEKey(var KeyPressed: enumKBButton): boolean;
begin
  GetAEKey := GetAsyncKeyState(Integer(KeyPressed)) <> 0;
end; { function }

// Return the Virual Key Equivalent for a ASCII Key

function GetAscVirtualKey(AKey: byte): ShortInt;
begin
  if ((AKey >= 32) and (AKey <= 126)) then begin
    GetAscVirtualKey := mToVKey[AKey];
  end
  else begin
    GetAscVirtualKey := -1; //Not found
  end;
end; { function }

// Return the ASCII Equivalent for a Virtual Key

function GetVirtualKeyAsc(VKey: byte): ShortInt;
begin
  iTmp := 32;
  while iTmp < 127 do
    //For iTmp:= 32 To 126 do   // Begin Search for VKey
  begin
    if (mToVKey[iTmp] = VKey) then begin
      GetVirtualKeyAsc := iTmp;
      Exit;
    end;
  end;
  GetVirtualKeyAsc := -1; //Not Found
end; { function }

procedure FillArray();
begin
// Aren't arrays a beautiful invention?
// For the standard US Keyboard...

  mToVKey[32] := 32; mbShift[32] := False; // <space>
  mToVKey[33] := 49; mbShift[33] := True; // !
  mToVKey[34] := 222; mbShift[34] := True; // "
  mToVKey[35] := 51; mbShift[35] := True; // #
  mToVKey[36] := 52; mbShift[36] := True; // $
  mToVKey[37] := 53; mbShift[37] := True; // %
  mToVKey[38] := 55; mbShift[38] := True; // &
  mToVKey[39] := 222; mbShift[39] := False; // '
  mToVKey[40] := 57; mbShift[40] := True; // [
  mToVKey[41] := 48; mbShift[41] := True; // ]
  mToVKey[42] := 56; mbShift[42] := True; // *
  mToVKey[43] := 187; mbShift[43] := True; // +
  mToVKey[44] := 188; mbShift[44] := False; // ,
  mToVKey[45] := 189; mbShift[45] := False; // -
  mToVKey[46] := 190; mbShift[46] := False; // .
  mToVKey[47] := 191; mbShift[47] := False; // /
  mToVKey[48] := 48; mbShift[48] := False; // 0
  mToVKey[49] := 49; mbShift[49] := False; // 1
  mToVKey[50] := 50; mbShift[50] := False; // 2
  mToVKey[51] := 51; mbShift[51] := False; // 3
  mToVKey[52] := 52; mbShift[52] := False; // 4
  mToVKey[53] := 53; mbShift[53] := False; // 5
  mToVKey[54] := 54; mbShift[54] := False; // 6
  mToVKey[55] := 55; mbShift[55] := False; // 7
  mToVKey[56] := 56; mbShift[56] := False; // 8
  mToVKey[57] := 57; mbShift[57] := False; // 9
  mToVKey[58] := 186; mbShift[58] := True; // ;
  mToVKey[59] := 186; mbShift[59] := False; // ;
  mToVKey[60] := 188; mbShift[60] := True; // <
  mToVKey[61] := 187; mbShift[61] := False; // =
  mToVKey[62] := 190; mbShift[62] := True; // >
  mToVKey[63] := 191; mbShift[63] := True; // ?
  mToVKey[64] := 50; mbShift[64] := True; // @
  mToVKey[65] := 65; mbShift[65] := True; // A
  mToVKey[66] := 66; mbShift[66] := True; // B
  mToVKey[67] := 67; mbShift[67] := True; // C
  mToVKey[68] := 68; mbShift[68] := True; // D
  mToVKey[69] := 69; mbShift[69] := True; // E
  mToVKey[70] := 70; mbShift[70] := True; // F
  mToVKey[71] := 71; mbShift[71] := True; // G
  mToVKey[72] := 72; mbShift[72] := True; // H
  mToVKey[73] := 73; mbShift[73] := True; // I
  mToVKey[74] := 74; mbShift[74] := True; // J
  mToVKey[75] := 75; mbShift[75] := True; // K
  mToVKey[76] := 76; mbShift[76] := True; // L
  mToVKey[77] := 77; mbShift[77] := True; // M
  mToVKey[78] := 78; mbShift[78] := True; // N
  mToVKey[79] := 79; mbShift[79] := True; // O
  mToVKey[80] := 80; mbShift[80] := True; // P
  mToVKey[81] := 81; mbShift[81] := True; // Q
  mToVKey[82] := 82; mbShift[82] := True; // R
  mToVKey[83] := 83; mbShift[83] := True; // S
  mToVKey[84] := 84; mbShift[84] := True; // T
  mToVKey[85] := 85; mbShift[85] := True; // U
  mToVKey[86] := 86; mbShift[86] := True; // V
  mToVKey[87] := 87; mbShift[87] := True; // W
  mToVKey[88] := 88; mbShift[88] := True; // X
  mToVKey[89] := 89; mbShift[89] := True; // Y
  mToVKey[90] := 90; mbShift[90] := True; // Z
  mToVKey[91] := 219; mbShift[91] := False; // [
  mToVKey[92] := 220; mbShift[92] := False; // \
  mToVKey[93] := 221; mbShift[93] := False; // ]
  mToVKey[94] := 54; mbShift[94] := True; // ^
  mToVKey[95] := 189; mbShift[95] := True; // _
  mToVKey[96] := 192; mbShift[96] := False; // `
  mToVKey[97] := 65; mbShift[97] := False; // a
  mToVKey[98] := 66; mbShift[98] := False; // b
  mToVKey[99] := 67; mbShift[99] := False; // c
  mToVKey[100] := 68; mbShift[100] := False; // d
  mToVKey[101] := 69; mbShift[101] := False; // e
  mToVKey[102] := 70; mbShift[102] := False; // f
  mToVKey[103] := 71; mbShift[103] := False; // g
  mToVKey[104] := 72; mbShift[104] := False; // h
  mToVKey[105] := 73; mbShift[105] := False; // i
  mToVKey[106] := 74; mbShift[106] := False; // j
  mToVKey[107] := 75; mbShift[107] := False; // k
  mToVKey[108] := 76; mbShift[108] := False; // l
  mToVKey[109] := 77; mbShift[109] := False; // m
  mToVKey[110] := 78; mbShift[110] := False; // n
  mToVKey[111] := 79; mbShift[111] := False; // o
  mToVKey[112] := 80; mbShift[112] := False; // p
  mToVKey[113] := 81; mbShift[113] := False; // q
  mToVKey[114] := 82; mbShift[114] := False; // r
  mToVKey[115] := 83; mbShift[115] := False; // s
  mToVKey[116] := 84; mbShift[116] := False; // t
  mToVKey[117] := 85; mbShift[117] := False; // u
  mToVKey[118] := 86; mbShift[118] := False; // v
  mToVKey[119] := 87; mbShift[119] := False; // w
  mToVKey[120] := 88; mbShift[120] := False; // x
  mToVKey[121] := 89; mbShift[121] := False; // y
  mToVKey[122] := 90; mbShift[122] := False; // z
  mToVKey[123] := 219; mbShift[123] := True; // {
  mToVKey[124] := 220; mbShift[124] := True; // |
  mToVKey[125] := 221; mbShift[125] := True; // }
  mToVKey[126] := 192; mbShift[126] := True; // ~


end; { procedure }
//----------------------------------------------------------------------
// END Misc/Other Procedure
//----------------------------------------------------------------------

initialization
  FillArray; // Fill array when we start this unit
  bPause := false;
  bStop := false;
end.

