unit Incomp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CubeDefs, CubiCube;

type
  TIncomplete = class(TForm)
    ManInfo: TMemo;
    BStop: TButton;
    BAdd: TButton;
    GroupBox1: TGroupBox;
    FFilter: TCheckBox;
    DFilter: TCheckBox;
    LFilter: TCheckBox;
    BFilter: TCheckBox;
    BClear: TButton;
    CenTwistExclude: TGroupBox;
    UTwist: TCheckBox;
    DTwist: TCheckBox;
    RTwist: TCheckBox;
    LTwist: TCheckBox;
    FTwist: TCheckBox;
    BTwist: TCheckBox;
    SliceAllowed: TCheckBox;
    MFilter: TCheckBox;
    EFilter: TCheckBox;
    SFilter: TCheckBox;
    procedure BStopClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BAddClick(Sender: TObject);
    procedure BClearClick(Sender: TObject);
    procedure SliceAllowedClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private-Deklarationen }
  public

  end;

const MAXNODESINCOMPLETE = 40;

type  IncompNode = record
    axis:TurnAxis;
    power: Integer;
    cc: CornerCubie;
    ec: EdgeCubie;
    cperm,cori: Word;//nur wenn alle 8 Ecken definiert sind
    downCornerCoord,downEdgeCoord: Word;//nur wenn die Positionen der D-Steine definiert ist
    edge51Coord,edge52Coord,edge53Coord: Integer;//coordinates for edgePerms
    edgeUnknownCoord, edgeOriCoord: Integer;
    cornOriCoord: Integer;//Word sollte reichen
    cornPermCoord: Integer;//Word sollte reichen
    cenTwist: Integer;//orinetierte Würfel
    fullCornPrun: Integer;
    DownFacePrun: Integer;
  end;

  IncompSearch = class(TThread)
  public
    iCase: IncompleteCase;
    n: array[0..MAXNODESINCOMPLETE] of IncompNode; //nr. 21 for internal use
    depth,r_depth: Integer;
    nCornPos, nEdgePos: Integer;//number of defined corner and edge positions
    np,np1,np2: ^IncompNode;
    msg: String;
    minN: Integer;//minimal length of solution maneuver
    edge51,edge52,edge53: array[0..4] of Edge;

   // filter: Boolean;//true if moves are filtered
    excludeAxis{*,excludeAxisRot*}: array[U..Fs] of Boolean;
    isOriented:Boolean;
    ignoreTwists: Integer;

    constructor Create(ic:IncompleteCase; mode:ConstructorMode);//overload;
    function DownCornerCoord: Word; //down coordinates are raw coordinates
    procedure InvDownCornerCoord(idx: Word);
    function DownEdgeCoord: Word;
    procedure InvDownEdgeCoord(idx: Word);
    procedure CreateSymDownEdgeCoordToDownEdgeCoordTable; //erzeugt die Tabellen in beiden Richtungen
    procedure CreateDownCornCoordConjugateTable;
    procedure CreateDownFacePruningTable;


    function  Edge51PermCoord: Integer;
    function  Edge52PermCoord: Integer;
    function  Edge53PermCoord: Integer;
    procedure InvEdge51PermCoord(idx: Integer);
    procedure InvEdge52PermCoord(idx: Integer);
    procedure InvEdge53PermCoord(idx: Integer);
    function  EdgeUnknownCoord: Word;//all Koordinaten werden aus n[0] berechnet
    function  EdgeOriCoord: Word;//Undierung mit EdgeUnknown gibt die richtige Koordinate
    procedure InvEdgeUnknownCoord(idx: Word);
    procedure InvEdgeOriCoord(idx: Word);
    function  CornOriCoord: Word;
    procedure InvCornOriCoord(idx: Word);
    function  CornPermCoord: Word;
    procedure GenerateDownCornerMoveTable;
    procedure GenerateDownEdgeMoveTable;
    procedure GenerateEdgePermMoveTables;
    procedure GenerateEdgePermMoveTable(nE: Integer);
    procedure GenerateEdgeUnknownMoveTable;
    procedure GenerateEdgeOriMoveTable;
    procedure GenerateCornOriMoveTable;
    procedure GenerateEdgePermPruningTables;
    procedure GenerateCornOriPruningTable;
    procedure GenerateCornPermPruningTable;
    procedure AddSolverString;
    procedure AddMessage;
    procedure Execute; override;//for the thread
    procedure CleanupIfTerminated(Sender: TObject);
    procedure SearchGeneral;
    procedure SearchCornersComplete;
    procedure SearchDFaceComplete;
    procedure SearchBothAccels;
  end;

  procedure CreateIncompleteTables;
  function numToStr(n: Integer):String ;

var
  Incomplete: TIncomplete;
  inco,inco1: IncompSearch;
  messageboxPopup: Boolean;
  BStopClicked:Boolean;

implementation

uses RubikMain,CordCube,Search,FaceCube,Symmetries;

{$R *.dfm}


var ePermPrun1,ePermPrun2,ePErmPrun3: array of Byte;//maximal drei Pruning Tables
    cOriPrun,CPermPrun: array of Byte;
    downFacePrun:array {*[0..1547*1680 div 16+1]*} of Integer;//Die kompletten Ecken
    ePermMove1: array[0..12-1,Ux1..Fsx3] of Word;
    ePermMove2: array[0..12*11-1,Ux1..Fsx3] of Word;
    ePermMove3: array[0..12*11*10-1,Ux1..Fsx3] of Word;
    ePermMove4: array[0..12*11*10*9-1,Ux1..Fsx3] of Word;
    ePermMove5: array[0..12*11*10*9*8-1,Ux1..Fsx3] of Integer;

    eOriMove, eUnknownMove: array[0..4096-1,Ux1..Fsx3] of Word;
    cOriMove: array[0..65536-1,Ux1..Fsx3] of Word;
    downCornerMove: array[0..1680-1,Ux1..Fsx3] of Word;//slice moves
    downEdgeMove: array[0..11880-1,Ux1..Fsx3] of Word;
    DownEdgeCoordToSymDownEdgeCoord: array[0..11880-1] of Integer;
    SymDownEdgeCoordToDownEdgeCoord: array[0..1547-1] of Integer;
    DownCornerCoordConjugate: array[0..1680-1,0..7] of Word;


//+++++++++++++Set entry in unpacked DownFace pruning table++++++++++++++++++++++
procedure SetPruningDownFace(index,value:Integer);
var mask,base,offset: Integer;
begin
  mask:=3;//00000000 00000000 00000000 00000011
  base:= index shr 4;
  offset:= index and $f;
  value:= value shl (offset*2);
  mask:= mask shl (offset*2);
  mask:= not mask;
  downFacePrun[base]:= downFacePrun[base] and mask;//zero the important bits
  downFacePrun[base]:= downFacePrun[base] or value;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

function GetPruningDownFace(index: Integer):Integer;

asm
  mov ecx,eax
  shr eax,$4 {base}
  and ecx,$f
  add ecx,ecx {offset*2}
  mov edx,[downFacePrun]
  mov eax,[edx+eax*4] {Pruning[base]}
  mov edx,$3;
  shl edx,cl {mask shl offset*2}
  and eax,edx
  shr eax,cl
end;

//++++++++++++++++++++++Find the DownFace initial pruning value++++++++++++++++++
function GetPrunDownface(downEdge,downCorn:Integer):Integer;
var symDownEdge,DownEdge0,DownEdge1,downCorn0,downCorn1,sym,depth,depthMod3,index: Integer;
    m: Move;
begin
  downEdge0:=downEdge;
  SymDownEdge:= DownEdgeCoordToSymDownEdgeCoord[downEdge0];
  sym:= SymDownEdge and $f;
  SymDownEdge:=SymDownEdge shr 4;
  downCorn0:=downCorn;
  depth:=0;
  While (downCorn0<>1604) or (downEdge0<>5860) do
  begin
    depthMod3:= GetPruningDownFace(1547*DownCornerCoordConjugate[downCorn0,sym]+SymDownEdge);
 //   depthMod3:= GetPruningFullCorner(2768*TwistConjugate[cOri0,sym]+SymCPos);
    if depthMod3=0 then depthMod3:=3;
    for m:= Ux1 to Fsx3 do   //slice moves ergänzt
    begin
      if (not useSlices) and (m=Usx1) then break;
         {$IF QTM}
        case m of
          Ux2,Rx2,Fx2,Dx2,Lx2,Bx2,Usx2,Rsx2,Fsx2:continue;
        end;
        {$IFEND}
      downEdge1:= DownEdgeMove[downEdge0,m];
      SymDownEdge:= DownEdgeCoordToSymDownEdgeCoord[downEdge1];
      //symCPos:= CornPosToSymCornPos[cPos1];
      sym:= SymDownEdge and $f;
      //sym:= symCPos and $f;
      SymDownEdge:=SymDownEdge shr 4;
      //symCPos:=symCPos shr 4;
      downCorn1:= DownCornerMove[downCorn0,m];
      //cOri1:= TwistMove[cOri0,m];
      index:= 1547*DownCornerCoordConjugate[downCorn1,sym]+SymDownEdge;
      //index:= 2768*TwistConjugate[cOri1,sym]+symCPos;
      if GetPruningDownFace(index)= depthMod3-1 then //closer to start
      begin
        Inc(Depth);
        downCorn0:=downCorn1;
        downEdge0:= downEdge1;
        break;
      end;
      If  useSlices then Assert(m<>Fsx3) else Assert(m<>Bx3);//we did not get closer to start else
    end;
  end;
  Result:= depth;
end;
//++++++++++++++++++++++Find DownFace initial pruning value++++++++++++++++++


function EPermMove(index: Integer;m: Move;nEdge: Integer): Integer;
begin
  case nEdge of
  1: result:= ePermMove1[index,m];
  2: result:= ePermMove2[index,m];
  3: result:= ePermMove3[index,m];
  4: result:= ePermMove4[index,m];
  5..12: result:= ePermMove5[index,m];
  end;
end;

procedure CreateIncompleteTables;
begin
   Form1.ProgressBar.Show;

   Form1.ProgressBar.Position:=95;
   inco1:=IncompSearch.Create(Nothing,TableMode);
   Form1.ProgressBar.Position:=100;
   inco1.Resume; //um Thread zu beenden und zu löschen
   Form1.ProgressBar.Hide;

end;

procedure ReloadTables;
begin
   Form1.ProgressBar.Show;
   Form1.ProgressBar.Position:=0;
   inco1:=IncompSearch.Create(Nothing,SwitchMode);
   Form1.ProgressBar.Position:=0;
   inco1.Resume; //um Thread zu beenden und zu löschen
   Form1.ProgressBar.Hide;

end;




procedure setIndex(value: Byte; position: Integer;var table: array of Byte);
var v: Byte;
begin
  v:= table[position div 2];
  if odd(position) then v:= (v and $0f) or (value shl 4)
  else v:= (v and $f0) or value;
  table[position div 2]:= v;
end;

function getIndex(position: Integer;var table: array of Byte): Byte;
var v: Byte;
begin
  v:= table[position div 2];
  if odd(position) then Result:= (v and $f0) shr 4
  else Result:= v and $0f;
end;

procedure IncompSearch.CreateSymDownEdgeCoordToDownEdgeCoordTable;
var prod: EdgeCubie;
    classIdx,i,k,n: Integer;
    j: Edge;
const FREE = -1;
//1547 Klassen
begin
  classIdx:=0;
  for i:=0 to 11880-1 do DownEdgeCoordToSymDownEdgeCoord[i]:= FREE;
  for i:=0 to 11880-1 do
  begin
    InvDownEdgeCoord(i); //wird defaultmässig im 21. node gespeichert
    //es müssen noch die unbesetzten Positionen definiert werden
    for j:= UR to BR do if self.n[21].ec[j].e=NN then begin self.n[21].ec[j].e:= UR;break; end;
    for j:= UR to BR do if self.n[21].ec[j].e=NN then begin self.n[21].ec[j].e:= UF;break; end;
    for j:= UR to BR do if self.n[21].ec[j].e=NN then begin self.n[21].ec[j].e:= UL;break; end;
    for j:= UR to BR do if self.n[21].ec[j].e=NN then begin self.n[21].ec[j].e:= UB;break; end;
    for j:= UR to BR do if self.n[21].ec[j].e=NN then begin self.n[21].ec[j].e:= FR;break; end;
    for j:= UR to BR do if self.n[21].ec[j].e=NN then begin self.n[21].ec[j].e:= FL;break; end;
    for j:= UR to BR do if self.n[21].ec[j].e=NN then begin self.n[21].ec[j].e:= BL;break; end;
    for j:= UR to BR do if self.n[21].ec[j].e=NN then begin self.n[21].ec[j].e:= BR;break; end;

    if DownEdgeCoordToSymDownEdgeCoord[i]=FREE then
    begin
      for k:= 0 to 7 do //conjugate with all symmetries which preserve the D-slice
      begin
        EdgeMult(EdgeSym[InvIdx[k]],self.n[21].ec,prod);
        EdgeMult(prod,EdgeSym[k],self.n[0].ec);
        n:= DownEdgeCoord; //wird aus n[0] berechnet
        if DownEdgeCoordToSymDownEdgeCoord[n]=FREE then
           DownEdgeCoordToSymDownEdgeCoord[n]:= classIdx shl 4 + k;//pack classIdx and symmetry
        if k=0 then SymDownEdgeCoordToDownEdgeCoord[classIdx]:=n;
      end;
      Inc(classIdx);
    end;
  end;
end;

//Konjugation für die 2. Komponente der DownPosSym-Koordinate
procedure IncompSearch.CreateDownCornCoordConjugateTable;
var j: Corner; prod: CornerCubie; i,k: Integer;
begin
  for i:=0 to 1680-1 do
  begin                                                                               
    InvDownCornerCoord(i);//wird defaultmässig im 21. node gespeichert  DAS MUSS EVENTUELL GEÄNDERT WERDEN!!!!
    //es müssen noch die unbesetzten Positionen definiert werden
    for j:= URF to DRB do if n[21].cc[j].c=NNN then begin n[21].cc[j].c:= URF;break; end;
    for j:= URF to DRB do if n[21].cc[j].c=NNN then begin n[21].cc[j].c:= UFL;break; end;
    for j:= URF to DRB do if n[21].cc[j].c=NNN then begin n[21].cc[j].c:= ULB;break; end;
    for j:= URF to DRB do if n[21].cc[j].c=NNN then begin n[21].cc[j].c:= UBR;break; end;

    for k:= 0 to 7 do
    begin
      CornMult(CornSym[k],n[21].cc,prod);
      CornMult(prod,CornSym[InvIdx[k]],n[0].cc);
      DownCornerCoordConjugate[i,k]:= DownCornerCoord;
    end;
  end;
end;


procedure IncompSearch.GenerateCornPermPruningTable;
var j: Corner;
  coc: CubieCube;
  done,done0,depth,m: Integer;
  match:Boolean; mve: Move;
  m1: Word;
  used:array[URF..DRB] of Boolean;
begin
  coc:= CubieCube.Create;
  setLength(cPermPrun,40320);
  for m:= 0 to 40320 -1 do cPermPrun[m]:=$ff;
  done:=0; done0:=0;depth:=-1;
  //die definierten Ecken herausbekommen
  for j:=URF to DRB do  used[j]:=false;
  for j:=URF to DRB do if n[0].cc[j].c<>NNN then used[n[0].cc[j].c]:=true;
  for m:= 0 to 40320 -1 do //setup target
  begin
    coc.InvCornPermCoord(m);
    match:=true;
    for j:= URF to DRB do
    if  used[j] and (coc.PCorn^[j].c<>j) then begin match:=false;break;end;
    if match then begin cPermPrun[m]:=0;inc(done);end;
  end;
  while (done > done0) and (done<>40320) do
  begin
    done0:= done;
    inc(depth);
    for m:= 0 to 40320-1 do  //Scan Table
    begin
      if cPermPrun[m]=depth then
      begin
        for mve:= Ux1 to Fsx3 do //slice moves ergänzen
        begin
          if (not useSlices) and (mve=Usx1) then break;
        {$IF QTM}
        case mve of
          Ux2,Rx2,Fx2,Dx2,Lx2,Bx2,Usx2,Rsx2,Fsx2:continue;
        end;
        {$IFEND}
          m1:= CornPermMove[m,mve];
          if cPermPrun[m1]=$ff then //noch frei
          begin
             cPermPrun[m1]:=depth+1;
            inc(done);
          end;
        end;
      end;
    end;
  end;//while
  coc.Free;
end;


procedure  IncompSearch.GenerateCornOriPruningTable;
var //j: Corner; csave: CornerCubie;
  k,l,m,done,done0, depth: Integer; has1or2: Boolean;
  m1: Word; mve: Move;
begin
//  for j:= URF to DRB do csave[j].o:= n[0].cc[j].o; //node 0 sichern
  setLength(cOriPrun,65536);
  done:=0; done0:=0;depth:=-1;
  for m:=0 to 65536-1  do
  begin
    has1or2:=false; k:=m;
    for l:= 0 to 7 do
    begin
      if (k mod 4=1) or (k mod 4=2) then begin has1or2:=true;cOriPrun[m]:=$ff;break; end //unbelegt
      else k:= k div 4;
    end;
    if not has1or2 then begin cOriPrun[m]:=0; inc(done); end;//Orientierungen stimmen oder sind unbekannt-> ok
  end;
  while (done > done0) and (done<>65536) do
  begin
    done0:= done;
    inc(depth);
    for m:= 0 to 65536-1 do  //Scan Table
    begin
      if cOriPrun[m]=depth then
      begin
        for mve:= Ux1 to Fsx3 do  //slice moves ergänzen
        begin
        if (not useSlices) and (mve=Usx1) then break;
        {$IF QTM}
        case mve of
          Ux2,Rx2,Fx2,Dx2,Lx2,Bx2,Usx2,Rsx2,Fsx2:continue;
        end;
        {$IFEND}
          m1:= COriMove[m,mve];
          if cOriPrun[m1]=$ff then //noch frei
          begin
             cOriPrun[m1]:=depth+1;
            inc(done);
          end;
        end;
      end;
    end;
  end;//while

 // for j:= URF to DRB do n[0].cc[j].o:= csave[j].o; //node 0 restaurieren
end;

procedure IncompSearch.GenerateEdgePermMoveTable(nE: Integer);
var i,j,k,m: Integer; t: TurnAxis;
    d: Edge;
begin
  for i:= 0 to 4 do edge51[i]:= NN;
  for i:= 0 to nE-1 do edge51[i]:= Edge(i); //does not matter what edges
  nEdgePos:= nE;//Number of edges
  m:=1; for j:= 0 to nE-1 do m:=m*(12-j);
  for i:= 0 to m-1 do
  begin
    InvEdge51PermCoord(i); //wird defaultmässig im 21. node gespeichert

    for t:= U to Fs do
    begin
      for k:= 0 to 3 do
      begin
        EdgeMult(n[21].ec,EdgeCubieMove[t],n[0].ec);
        for d:=UR to BR do n[21].ec[d].e:= n[0].ec[d].e;//
        if k<>3 then
        begin
          case nE of
            1: ePermMove1[i,Move(3*Ord(t)+k)]:=Edge51PermCoord;//wird aus dem 0. Node gelesen
            2: ePermMove2[i,Move(3*Ord(t)+k)]:=Edge51PermCoord;
            3: ePermMove3[i,Move(3*Ord(t)+k)]:=Edge51PermCoord;
            4: ePermMove4[i,Move(3*Ord(t)+k)]:=Edge51PermCoord;
            5: ePermMove5[i,Move(3*Ord(t)+k)]:=Edge51PermCoord;
          end;
        end;
      end;
    end;
  end;
end;

procedure IncompSearch.GenerateEdgePermMoveTables;
var i: Integer;
begin
  for i:= 1 to 5 do GenerateEdgePermMoveTable(i);
end;

function  IncompSearch.CornOriCoord: Word;
var co: Corner; s: Word;//Wert 3 entspricht unbekanntem Wert
    i: Integer;
begin
  s:=0;
  for co:= URF to DRB do
  begin
  i:=n[0].cc[co].o;
  if i=6 then i:=3; //6 war unbekannter Wert in array
  s:= 4*s + i;
  end;
  Result:= s;
end;

procedure IncompSearch.InvCornOriCoord(idx: Word);
var co: Corner; i: Integer;
const t=21;//default für Inverses, zum Testen auf 0 setzen
begin
  for co:=DRB downto URF do
  begin
    i:= idx mod 4;
    if i=3 then i:=6;
    n[t].cc[co].o:=i;//unbekannter Wert wird hier als 6 gespeichert
    idx:= idx div 4;
  end;
end;

//++++++++++++++++++++++++++++++++++++++++++++++++++
procedure IncompSearch.GenerateCornOriMoveTable;
var i,k: Integer; t: TurnAxis; d: Corner;
begin
  for i:= 0 to 65536 -1 do
  begin
    InvCornOriCoord(i);//wird defaultmässig im 21. node gespeichert
    for t:= U to Fs do
    begin
      for k:= 0 to 3 do
      begin
        CornMult(n[21].cc,CornerCubieMove[t],n[0].cc);
        for d:=URF to DRB do n[21].cc[d].o:= n[0].cc[d].o;//zurückkopieren
        if k<>3 then cOriMove[i,Move(3*Ord(t)+k)]:=CornOriCoord;//wird aus dem 0. Node gelesen
      end;
    end;
  end;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++

//muss auch bei unbekannten Steinen definiert sein! Diese werden einfach
//beliebig mit freien Steinen belegt
function InCompSearch.CornPermCoord: Word;
var i,j,freIdx: Corner; x,s: Integer;
  free: array[URF..NNN] of Boolean; csave: CornerCubie;
begin

 for j:= URF to DRB do csave[j].c:= n[0].cc[j].c; //node 0 sichern
  for i:= URF to DRB do free[i]:=true;
  for i:= URF to DRB do free[n[0].cc[i].c]:=false;
  freIdx:=URF;
  for i:= URF to DRB do
    if n[0].cc[i].c=NNN then //zunächst unbekannte mit beliebigen freien belegen
    begin
      while not free[freIdx] do Inc(freIdx);
      Assert(freIdx<NNN);
      n[0].cc[i].c:= freIdx;
      Inc(freIdx);
    end;

  x:= 0;
  for i:= DRB downto Succ(URF) do
  begin
    s:=0;
    for j:= Pred(i) downto URF do
    begin
       if n[0].cc[j].c > n[0].cc[i].c then Inc(s);
  //    if PCorn^[j].c>PCorn^[i].c then Inc(s);
    end;
    x:= (x+s)*Ord(i);
  end;
  Result:=x;
  for j:= URF to DRB do n[0].cc[j].c:= csave[j].c; //node 0 restaurieren
end;



function IncompSearch.EdgeOriCoord:Word;//hat hier 4096 Werte!
var ed: Edge; s: Word;
begin
  s:=0;
  for ed:= UR to BR do if n[0].ec[ed].o=1 then s:= 2*s+1 else s:=2*s;//orientierung kann ja auch 6 sein!
  Result:= s;//UR sitzt dann im höchsten Bit
end;

procedure IncompSearch.InvEdgeOriCoord(idx: Word);
var ed: Edge;
const t=21;//default für Inverses, zum Testen auf 0 setzen
begin
  for ed:=BR downto UR do
  begin
    if odd(idx) then n[t].ec[ed].o:=1 //Hauptsache nicht 6, d.h. unbekannt
    else n[t].ec[ed].o:=0;//unbekannt
    idx:= idx div 2;
  end;
end;

//++++++++++++++++++++++++++++++++++++++++++++++++++
procedure IncompSearch.GenerateEdgeOriMoveTable;
var i,k: Integer; t: TurnAxis; d: Edge;
begin
  for i:= 0 to 4096-1 do
  begin
    InvEdgeOriCoord(i);//wird defaultmässig im 21. node gespeichert
    for t:= U to Fs do
    begin
      for k:= 0 to 3 do
      begin
        EdgeMult(n[21].ec,EdgeCubieMove[t],n[0].ec);
        for d:=UR to BR do n[21].ec[d].o:= n[0].ec[d].o;//zurückkopieren
        if k<>3 then eOriMove[i,Move(3*Ord(t)+k)]:=EdgeOriCoord;//wird aus dem 0. Node gelesen
      end;
    end;
  end;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++++++++++++++++++++++++++++
procedure IncompSearch.GenerateDownCornerMoveTable;
var i,k: Integer; t: TurnAxis; d: Corner;
begin
  for i:= 0 to 1680-1 do
  begin
    InvDownCornerCoord(i);//wird defaultmässig im 21. node gespeichert
    for t:= U to Fs do
    begin
      for k:= 0 to 3 do
      begin
        CornMult(n[21].cc,CornerCubieMove[t],n[0].cc);
        for d:=URF to DRB do n[21].cc[d].c:= n[0].cc[d].c;//zurückkopieren
        if k<>3 then downCornerMove[i,Move(3*Ord(t)+k)]:=DownCornerCoord;//wird aus dem 0. Node gelesen
      end;
    end;

  end;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++++++++++++++++++++++++++++
procedure IncompSearch.GenerateDownEdgeMoveTable;
var i,k: Integer; t: TurnAxis; d: Edge;
begin
  for i:= 0 to 11880-1 do
  begin
    InvDownEdgeCoord(i);//wird defaultmässig im 21. node gespeichert
    for t:= U to Fs do
    begin
      for k:= 0 to 3 do
      begin
        EdgeMult(n[21].ec,EdgeCubieMove[t],n[0].ec);
        for d:=UR to BR do n[21].ec[d].e:= n[0].ec[d].e;//zurückkopieren
        if k<>3 then downEdgeMove[i,Move(3*Ord(t)+k)]:=DownEdgeCoord;//wird aus dem 0. Node gelesen
      end;
    end;
  end;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++

function IncompSearch.EdgeUnknownCoord:Word;//hat hier 4096 Werte!
var ed: Edge; s: Word;
begin
  s:=0;
  for ed:= UR to BR do if n[0].ec[ed].o<>6 then s:= 2*s+1 else s:=2*s ;
  Result:= s;//Bei unbestimmten Positionen ist das Bit 0
  //undierung mit der EdgeOriCoord gibt 0, wenn die Position ok ist
  //wir sparen uns hier eine Pruning Table
end;

procedure IncompSearch.InvEdgeUnknownCoord(idx: Word);
var ed: Edge;
const t=21;//default für Inverses, zum Testen auf 0 setzen
begin
  for ed:=BR downto UR do
  begin
    if odd(idx) then n[t].ec[ed].o:=0 //Hauptsache nicht 6, d.h. unbekannt
    else n[t].ec[ed].o:=6;//unbekannt
    idx:= idx div 2;
  end;
end;

//++++++++++++++++++++++++++++++++++++++++++++++++++
procedure IncompSearch.GenerateEdgeUnknownMoveTable;
var i,k: Integer; t: TurnAxis; d: Edge;
begin
  for i:= 0 to 4096-1 do
  begin
    InvEdgeUnknownCoord(i);//wird defaultmässig im 21. node gespeichert
    for t:= U to Fs do
    begin
      for k:= 0 to 3 do
      begin
        EdgeMult(n[21].ec,EdgeCubieMove[t],n[0].ec);
        for d:=UR to BR do n[21].ec[d].o:= n[0].ec[d].o;//zurückkopieren
        if k<>3 then eUnknownMove[i,Move(3*Ord(t)+k)]:=EdgeUnknownCoord;//wird aus dem 0. Node gelesen
      end;
    end;
  end;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++


procedure IncompSearch.GenerateEdgePermPruningTables; //bisher nur bis nEdgePos= 5
//wird bei jedem Würfel neu im Konstruktor erzeugt
var targetCoord, k, done, done0, depth,m,m1: Integer;
  j: Edge; esave: EdgeCubie; mve: Move;
begin
  for j:= UR to BR do esave[j].e:= n[0].ec[j].e; //node 0 sichern
  setLength(ePermPrun1,0);setLength(ePermPrun2,0);setLength(ePermPrun3,0);
  if nEdgePos > 0 then
  begin
    for j:= UR to BR do n[0].ec[j].e:=NN;
    k:= nEdgePos; if k>5 then k:=5;
    for m:= 0 to k-1 do n[0].ec[edge51[m]].e:=edge51[m];//Vorsicht! zerstört Node 0
    targetCoord:=Edge51PermCoord;
    case k of
      1: setLength(ePermPrun1,12 div 2);
      2: setLength(ePermPrun1,12*11 div 2);
      3: setLength(ePermPrun1,12*11*10 div 2);
      4: setLength(ePermPrun1,12*11*10*9 div 2);
      5: setLength(ePermPrun1,12*11*10*9*8 div 2);
    end;
    k:= Length(ePermPrun1);
    for m:=0 to k-1  do ePermPrun1[m]:=$ff;//unbesetzt
    SetIndex(0,targetCoord,ePermPrun1); done:=1; done0:=0;depth:=-1;
    k:= Length(ePermPrun1)*2;

    while (done > done0) and (done<>k) do
    begin
      done0:= done;
      inc(depth);
      for m:= 0 to k-1 do  //Scan Table
      begin
        if GetIndex(m,ePermPrun1)=depth then
        begin
          for mve:= Ux1 to Fsx3 do //slice moves ergänzen
          begin
            if (not useSlices) and (mve=Usx1) then break;
        {$IF QTM}
        case mve of
          Ux2,Rx2,Fx2,Dx2,Lx2,Bx2,Usx2,Rsx2,Fsx2:continue;
        end;
        {$IFEND}
            m1:= EPermMove(m,mve,nEdgePos);
            if GetIndex(m1,ePermPrun1)=$f then //noch frei
            begin
              SetIndex(depth+1,m1,ePermPrun1);
              inc(done);
            end;
          end;
        end;
      end;
    end;
  end;//nEdgePos

  if nEdgePos> 5 then
  begin
    for j:= UR to BR do n[0].ec[j].e:=NN;
    for m:= 0 to 4 do n[0].ec[edge52[m]].e:=edge52[m];//Vorsicht! zerstört Node 0
    targetCoord:=Edge52PermCoord;
    setLength(ePermPrun2,12*11*10*9*8 div 2);
    k:= Length(ePermPrun2);
    for m:=0 to k-1  do ePermPrun2[m]:=$ff;//unbesetzt
    SetIndex(0,targetCoord,ePermPrun2); done:=1; done0:=0;depth:=-1;
    k:= Length(ePermPrun2)*2;

    while (done > done0) and (done<>k) do
    begin
      done0:= done;
      inc(depth);
      for m:= 0 to k-1 do  //Scan Table
      begin
        if GetIndex(m,ePermPrun2)=depth then
        begin
          for mve:= Ux1 to Fsx3 do   //slice moves ergänzen
          begin
            if (not useSlices) and (mve=Usx1) then break;
        {$IF QTM}
        case mve of
          Ux2,Rx2,Fx2,Dx2,Lx2,Bx2,Usx2,Rsx2,Fsx2:continue;
        end;
        {$IFEND}
            m1:= EPermMove(m,mve,nEdgePos);
            if GetIndex(m1,ePermPrun2)=$f then //noch frei
            begin
              SetIndex(depth+1,m1,ePermPrun2);
              inc(done);
            end;
          end;
        end;
      end;
    end;
  end;//nEdgePos

  if nEdgePos> 10 then
  begin
    for j:= UR to BR do n[0].ec[j].e:=NN;
    for m:= 0 to 4 do n[0].ec[edge53[m]].e:=edge53[m];//Vorsicht! zerstört Node 0
    targetCoord:=Edge53PermCoord;
    setLength(ePermPrun3,12*11*10*9*8 div 2);
    k:= Length(ePermPrun3);
    for m:=0 to k-1  do ePermPrun3[m]:=$ff;//unbesetzt
    SetIndex(0,targetCoord,ePermPrun3); done:=1; done0:=0;depth:=-1;
    k:= Length(ePermPrun3)*2;

    while (done > done0) and (done<>k) do
    begin
      done0:= done;
      inc(depth);
      for m:= 0 to k-1 do  //Scan Table
      begin
        if GetIndex(m,ePermPrun3)=depth then
        begin
          for mve:= Ux1 to Fsx3 do    //slice moves ergänzen
          begin
            if (not useSlices) and (mve=Fsx3) then break;
        {$IF QTM}
        case mve of
          Ux2,Rx2,Fx2,Dx2,Lx2,Bx2,Usx2,Rsx2,Fsx2:continue;
        end;
        {$IFEND}
            m1:= EPermMove(m,mve,nEdgePos);
            if GetIndex(m1,ePermPrun3)=$f then //noch frei
            begin
              SetIndex(depth+1,m1,ePermPrun3);
              inc(done);
            end;
          end;
        end;
      end;
    end;
  end;//nEdgePos

  for j:= UR to BR do n[0].ec[j].e:= esave[j].e; //node 0 restaurieren
end;

//Positionskoordinate der 4 unteren Kanten
function IncompSearch.DownEdgeCoord: Word;
const ed: array [0..3] of Edge = (DR,DF,DL,DB);
var pos: array [0..3] of Edge; j: Edge;
 m,m1,m2,k,z: Integer;
begin
  for m:= 0 to 3 do pos[m]:=NN;
  for j:= UR to BR do
  for k:= 0 to 3 do if n[0].ec[j].e=ed[k] then begin pos[k]:= j; break; end;
  z:=0;
  m:= 4;// 4 Kanten
  for m1:= m-1  downto 0 do
  begin
    k:=0;
    for m2:= m1-1 downto 0 do if pos[m2]<pos[m1] then Inc(k);
    if m1=0 then z:= z + Ord(pos[m1]) else z:= (z+ (Ord(pos[m1])-k))*(13-m1);
  end;
  Result:= z;
end;

procedure IncompSearch.InvDownEdgeCoord(idx: Word);
var i0,i1,i2,i3,k: Integer;
     j: Edge;
     besetzt: boolean;
const t=21;
      ed: array [0..3] of Edge = (DR,DF,DL,DB);
begin
  for j:= UR to BR do n[t].ec[j].e:=NN; //alles leeren
  i0:= idx mod 12; idx:= idx div 12;
  i1:= idx mod 11; idx:= idx div 11;
  i2:= idx mod 10; i3:= idx div 10;

  n[t].ec[Edge(i0)].e:= ed[0];
  k:=0;
  for j:=UR to BR do
  begin
    besetzt:= (n[t].ec[j].e= ed[0]);
    if besetzt then begin inc(k); continue end;
    if Ord(j)=i1+k then begin n[t].ec[j].e:= ed[1]; break end;
  end;
  k:=0;
  for j:=UR to BR do
  begin
    besetzt:= ((n[t].ec[j].e= ed[0]) or (n[t].ec[j].e= ed[1]));
    if besetzt then begin inc(k); continue end;
    if Ord(j)=i2+k then begin n[t].ec[j].e:= ed[2]; break end;
  end;
  k:=0;
  for j:=UR to BR do
  begin
    besetzt:= ((n[t].ec[j].e= ed[0]) or (n[t].ec[j].e= ed[1])
               or (n[t].ec[j].e= ed[2]));
    if besetzt then begin inc(k); continue end;
    if Ord(j)=i3+k then begin n[t].ec[j].e:= ed[3]; break end;
  end;
end;



//Positionskoordinate der 4 unteren Ecken
function IncompSearch.DownCornerCoord: Word;
const corn: array [0..3] of Corner = (DFR,DLF,DBL,DRB);
var pos: array [0..3] of Corner; j: Corner;
 m,m1,m2,k,z: Integer;
begin
  for m:= 0 to 3 do pos[m]:=NNN;
  for j:= URF to DRB do
  for k:= 0 to 3 do if n[0].cc[j].c=corn[k] then begin pos[k]:= j; break; end;
  z:=0;
  m:= 4;// 4 Ecken
  for m1:= m-1  downto 0 do
  begin
    k:=0;
    for m2:= m1-1 downto 0 do if pos[m2]<pos[m1] then Inc(k);
    if m1=0 then z:= z + Ord(pos[m1]) else z:= (z+ (Ord(pos[m1])-k))*(9-m1);
  end;
  Result:= z;
end;


procedure IncompSearch.InvDownCornerCoord(idx: Word);
var i0,i1,i2,i3,k: Integer;
     j: Corner;
     besetzt: boolean;
const t=21;//
      corn: array [0..3] of Corner = (DFR,DLF,DBL,DRB);
begin
  for j:= URF to DRB do n[t].cc[j].c:=NNN; //alles leeren
  i0:= idx mod 8; idx:= idx div 8;
  i1:= idx mod 7; idx:= idx div 7;
  i2:= idx mod 6; i3:= idx div 6;

  n[t].cc[Corner(i0)].c:= corn[0];
  k:=0;
  for j:=URF to DRB do
  begin
    besetzt:= (n[t].cc[j].c= corn[0]);
    if besetzt then begin inc(k); continue end;
    if Ord(j)=i1+k then begin n[t].cc[j].c:= corn[1]; break end;
  end;
  k:=0;
  for j:=URF to DRB do
  begin
    besetzt:= ((n[t].cc[j].c= corn[0]) or (n[t].cc[j].c= corn[1]));
    if besetzt then begin inc(k); continue end;
    if Ord(j)=i2+k then begin n[t].cc[j].c:= corn[2]; break end;
  end;
  k:=0;
  for j:=URF to DRB do
  begin
    besetzt:= ((n[t].cc[j].c= corn[0]) or (n[t].cc[j].c= corn[1])
               or (n[t].cc[j].c= corn[2]));
    if besetzt then begin inc(k); continue end;
    if Ord(j)=i3+k then begin n[t].cc[j].c:= corn[3]; break end;
  end;
end;

//Positionskordinate für die ersten 5 Ecken, müssen im Array definiert sein!!!!
function IncompSearch.Edge51PermCoord: Integer;
var j: Edge; m,m1,m2,k,z: Integer;
 pos: array [0..4] of Edge;
begin
// Lage der benutzten Ecken herausfinden
  for m:= 0 to 4 do pos[m]:=NN;
  for j:= UR to BR do
  for k:= 0 to 4 do if n[0].ec[j].e=edge51[k] then begin pos[k]:= j; break; end;
  z:=0;
  m:= nEdgePos; if m >5 then m:=5;//maximal 5 Steine
  for m1:= m-1  downto 0 do
  begin
    k:=0;//Anzahl der Steine mit niedrigerem Index, die darunter liegen
    //bei allen: Stein0+12(Stein1+11(Stein2+10(Stein3 +9*Stein4)))
    //Steinx gibt dabei die Position an, abzüglich der Anzahl der Steine links davon
    for m2:= m1-1 downto 0 do if pos[m2]<pos[m1] then Inc(k);
    if m1=0 then z:= z + Ord(pos[m1]) else z:= (z+ (Ord(pos[m1])-k))*(13-m1);
  end;
  Result:= z;
end;

function IncompSearch.Edge52PermCoord: Integer;
var j: Edge; m,m1,m2,k,z: Integer;
 pos: array [0..4] of Edge;
begin
// Lage der benutzten Ecken herausfinden
  for m:= 0 to 4 do pos[m]:=NN;
  for j:= UR to BR do
  for k:= 0 to 4 do if n[0].ec[j].e=edge52[k] then begin pos[k]:= j; break; end;
  z:=0;
  m:= 5;// genau 5 Steine
  for m1:= m-1  downto 0 do
  begin
    k:=0;//Anzahl der Steine mit niedrigerem Index, die darunter liegen
    //bei allen: Stein0+12(Stein1+11(Stein2+10(Stein3 +9*Stein4)))
    //Steinx gibt dabei die Position an, abzüglich der Anzahl der Steine links davon
    for m2:= m1-1 downto 0 do if pos[m2]<pos[m1] then Inc(k);
    if m1=0 then z:= z + Ord(pos[m1]) else z:= (z+ (Ord(pos[m1])-k))*(13-m1);
  end;
  Result:= z;
end;

function IncompSearch.Edge53PermCoord: Integer;
var j: Edge; m,m1,m2,k,z: Integer;
 pos: array [0..4] of Edge;
begin
  for m:= 0 to 4 do pos[m]:=NN;
  for j:= UR to BR do
  for k:= 0 to 4 do if n[0].ec[j].e=edge53[k] then begin pos[k]:= j; break; end;
  z:=0;
  m:= 5;// genau 5 Steine
  for m1:= m-1  downto 0 do
  begin
    k:=0;
    for m2:= m1-1 downto 0 do if pos[m2]<pos[m1] then Inc(k);
    if m1=0 then z:= z + Ord(pos[m1]) else z:= (z+ (Ord(pos[m1])-k))*(13-m1);
  end;
  Result:= z;
end;

procedure IncompSearch.InvEdge51PermCoord(idx: Integer);
var i0,i1,i2,i3,i4,k: Integer;
     j: Edge;
     besetzt: boolean;
     const t=21;  //index, wo das Inverse erzeugt wird, 0 nur zum Austesten
begin
  for j:= UR to BR do n[t].ec[j].e:=NN; //alles leeren
  i0:= idx mod 12; idx:= idx div 12;
  i1:= idx mod 11; idx:= idx div 11;
  i2:= idx mod 10; idx:= idx div 10;
  i3:= idx mod 9; i4:= idx div 9;
  if nEdgepos>0 then n[t].ec[Edge(i0)].e:= edge51[0];
  if nEdgepos>1 then
  begin
    k:=0;
    for j:=UR to BR do
    begin
      besetzt:= (n[t].ec[j].e= edge51[0]);
      if besetzt then begin inc(k); continue end;
      if Ord(j)=i1+k then begin n[t].ec[j].e:= edge51[1]; break end;
    end;
  end;
  if nEdgepos >2 then
  begin
    k:=0;
    for j:=UR to BR do
    begin
      besetzt:= ((n[t].ec[j].e= edge51[0]) or (n[t].ec[j].e= edge51[1]) );
      if besetzt then begin inc(k); continue end;
      if Ord(j)=i2+k then begin n[t].ec[j].e:= edge51[2]; break end;
    end;
  end;
  if nEdgepos >3 then
  begin
    k:=0;
    for j:=UR to BR do
    begin
      besetzt:= ((n[t].ec[j].e= edge51[0]) or (n[t].ec[j].e= edge51[1])
                 or (n[t].ec[j].e= edge51[2]));
      if besetzt then begin inc(k); continue end;
      if Ord(j)=i3+k then begin n[t].ec[j].e:= edge51[3]; break end;
    end;
  end;
  if nEdgepos >4 then
  begin
    k:=0;
    for j:=UR to BR do
    begin
      besetzt:= ((n[t].ec[j].e= edge51[0]) or (n[t].ec[j].e= edge51[1])
                 or (n[t].ec[j].e= edge51[2])  or (n[t].ec[j].e= edge51[3]));
      if besetzt then begin inc(k); continue end;
      if Ord(j)=i4+k then begin n[t].ec[j].e:= edge51[4]; break end;
    end;
  end;
end;

//nur für 5 Ecken definiert!
procedure IncompSearch.InvEdge52PermCoord(idx: Integer);
var i0,i1,i2,i3,i4,k: Integer;
     j: Edge;
     besetzt: boolean;
     const t=21;
begin
  for j:= UR to BR do n[t].ec[j].e:=NN; //alles leeren
  i0:= idx mod 12; idx:= idx div 12;
  i1:= idx mod 11; idx:= idx div 11;
  i2:= idx mod 10; idx:= idx div 10;
  i3:= idx mod 9; i4:= idx div 9;

  n[t].ec[Edge(i0)].e:= edge52[0];
  k:=0;
  for j:=UR to BR do
  begin
    besetzt:= (n[t].ec[j].e= edge52[0]);
    if besetzt then begin inc(k); continue end;
    if Ord(j)=i1+k then begin n[t].ec[j].e:= edge52[1]; break end;
  end;
  k:=0;
  for j:=UR to BR do
  begin
    besetzt:= ((n[t].ec[j].e= edge52[0]) or (n[t].ec[j].e= edge52[1]));
    if besetzt then begin inc(k); continue end;
    if Ord(j)=i2+k then begin n[t].ec[j].e:= edge52[2]; break end;
  end;
  k:=0;
  for j:=UR to BR do
  begin
    besetzt:= ((n[t].ec[j].e= edge52[0]) or (n[t].ec[j].e= edge52[1])
               or (n[t].ec[j].e= edge52[2]));
    if besetzt then begin inc(k); continue end;
    if Ord(j)=i3+k then begin n[t].ec[j].e:= edge52[3]; break end;
  end;
  k:=0;
  for j:=UR to BR do
  begin
    besetzt:= ((n[t].ec[j].e= edge52[0]) or (n[t].ec[j].e= edge52[1])
               or (n[t].ec[j].e= edge52[2])  or (n[t].ec[j].e= edge52[3]));
    if besetzt then begin inc(k); continue end;
    if Ord(j)=i4+k then begin n[t].ec[j].e:= edge52[4]; break end;
  end;
end;

//nur für 5 Ecken definiert!
procedure IncompSearch.InvEdge53PermCoord(idx: Integer);
var i0,i1,i2,i3,i4,k: Integer;
    j: Edge;
     besetzt: boolean;
     const t=21;
begin
  for j:= UR to BR do n[t].ec[j].e:=NN; //alles leeren
  i0:= idx mod 12; idx:= idx div 12;
  i1:= idx mod 11; idx:= idx div 11;
  i2:= idx mod 10; idx:= idx div 10;
  i3:= idx mod 9; i4:= idx div 9;

  n[t].ec[Edge(i0)].e:= edge53[0];
  k:=0;
  for j:=UR to BR do
  begin
    besetzt:= (n[t].ec[j].e= edge53[0]);
    if besetzt then begin inc(k); continue end;
    if Ord(j)=i1+k then begin n[t].ec[j].e:= edge53[1]; break end;
  end;
  k:=0;
  for j:=UR to BR do
  begin
    besetzt:= ((n[t].ec[j].e= edge53[0]) or (n[t].ec[j].e= edge53[1]));
    if besetzt then begin inc(k); continue end;
    if Ord(j)=i2+k then begin n[t].ec[j].e:= edge53[2]; break end;
  end;
  k:=0;
  for j:=UR to BR do
  begin
    besetzt:= ((n[t].ec[j].e= edge53[0]) or (n[t].ec[j].e= edge53[1])
               or (n[t].ec[j].e= edge53[2]));
    if besetzt then begin inc(k); continue end;
    if Ord(j)=i3+k then begin n[t].ec[j].e:= edge53[3]; break end;
  end;
  k:=0;
  for j:=UR to BR do
  begin
    besetzt:= ((n[t].ec[j].e= edge53[0]) or (n[t].ec[j].e= edge53[1])
               or (n[t].ec[j].e= edge53[2])  or (n[t].ec[j].e= edge53[3]));
    if besetzt then begin inc(k); continue end;
    if Ord(j)=i4+k then begin n[t].ec[j].e:= edge53[4]; break end;
  end;
end;


constructor InCompSearch.Create(ic:IncompleteCase; mode:ConstructorMode);
var i: Corner; j: Edge;
    c: CubieCube; m : Integer;
begin
  inherited Create(true);//do not start immediately
  Priority:=tpLower;
  FreeOnTerminate:=true;
  Onterminate:= CleanupIfTerminated;
  depth:=0;
  np:= @n[depth];
  r_depth:=0;
  minN:=-1;
  n[0].axis:=U;
  n[0].power:=0;

  case mode of
  Searchmode:
    begin
    c:= CubieCube.Create(fCube);
    for i:=URF to DRB do n[0].cc[i]:=c.PCorn^[i];
    for j:=UR to BR do n[0].ec[j]:=c.PEdge^[j];

    n[0].cenTwist:= c.CentOriCoord;
    isOriented:= c.isOriented;

    nEdgePos:=0;
    for i:=URF to DRB do if n[0].cc[i].c<>NNN then Inc(nCornPos);
    for j:= UR to BR do if  n[0].ec[j].e<>NN then Inc(nEdgePos);
    for m:=0 to 4 do begin edge51[m]:= NN;edge52[m]:= NN;edge53[m]:= NN; end;
    case nEdgePos of //setze die Steine in den drei fünfer arrays
    0,1,2,3,4,5:
      begin
        m:=0;
        for j:= UR to BR do if n[0].ec[j].e<>NN then
        begin edge51[m]:=n[0].ec[j].e; Inc(m); end;

        n[0].edge51Coord:=Edge51PermCoord;
      end;
    6,7,8,9,10:
      begin
        m:=0;
        for j:= UR to BR do if (n[0].ec[j].e<>NN) and (m<5) then
          begin edge51[m]:=n[0].ec[j].e; Inc(m); end;

        n[0].edge51Coord:=Edge51PermCoord;
        m:=0;
        for j:= BR downto UR  do if (n[0].ec[j].e<>NN) and (m<5) then
          begin edge52[m]:=n[0].ec[j].e; Inc(m); end;

          n[0].edge52Coord:=Edge52PermCoord;
       end;
    11,12:
      begin
        m:=0;
        for j:= UR to BR do
        begin
          if (n[0].ec[j].e<>NN) then
          begin
            if m<5 then edge51[m]:=n[0].ec[j].e
            else if m<10 then edge52[m-5]:=n[0].ec[j].e;
            Inc(m);
          end;
        end;
        m:=0;
        for j:= BR downto UR  do if (n[0].ec[j].e<>NN) and (m<5) then
          begin edge53[m]:=n[0].ec[j].e; Inc(m); end;

          n[0].edge51Coord:=Edge51PermCoord;
          n[0].edge52Coord:=Edge52PermCoord;
          n[0].edge53Coord:=Edge53PermCoord;
      end;//11,12
    end;//case  nEdgPos

    GenerateEdgePermPruningTables;//abhängig vom jeweiligem Würfel
    GenerateCornPermPruningTable;

    n[0].edgeUnknownCoord:= EdgeUnknownCoord;
    n[0].edgeOriCoord:= EdgeOriCoord;
    n[0].cornOriCoord:= CornOriCoord;
    n[0].cornPermCoord:= CornPermCoord;
    if (ic=BOTHACCELS) or (ic=DFACE) then
    begin
      n[0].downCornerCoord:= DownCornerCoord;
      n[0].downEdgeCoord:= DownEdgeCoord;
    end;
    c.Free;
   end;// SearchMode
  TableMode:
  begin
   GenerateDownCornerMoveTable;
   GenerateDownEdgeMoveTable;
   CreateSymDownEdgeCoordToDownEdgeCoordTable;
   CreateDownCornCoordConjugateTable;
   CreateDownFacePruningTable;
   GenerateEdgePermMoveTables;
   GenerateEdgeUnknownMoveTable;
   GenerateEdgeOriMoveTable;
   GenerateCornOriMoveTable;
   GenerateCornOriPruningTable;
  end;
  SwitchMode://Wenn slice mode geändert wird

  begin
   CreateFullCornerPruningTable(useSlices);
   CreateDownFacePruningTable;
   Form1.ProgressBar.Position:=10;
   GenerateCornOriPruningTable;
  end;



  end;

  icase:=ic;
end;

function numToStr(n: Integer):String ;
var s: String;
begin
   case n of
     1: s:=s+' ';
     2: s:=s+'2 ';
     3: s:=s+chr(39)+' ';
   end;
   result:= s;
end;

procedure InCompSearch.AddSolverString;
var i,p,j: Integer;
    s,s1,ln,tmp: String;
    t: TurnAxis;
    invertPower: Boolean;
    curAx,curAxTmp: Axis;

label l1;
begin
 i:=0;
 while i<depth+1 do
 begin

   case n[i].axis of
     U: s:=s+'U';
     R: s:=s+'R';
     F: s:=s+'F';
     D: s:=s+'D';
     L: s:=s+'L';
     B: s:=s+'B';
     Us:s:=s+'Us';
     Rs:s:=s+'Rs';
     Fs:s:=s+'Fs';
   end;
 //  case n[i].power of
 //    1: s:=s+' ';
 //    2: s:=s+'2 ';
 //    3: s:=s+chr(39)+' ';
 //  end;
   s:=s+numToStr(n[i].power);
   Inc(i);
 end;

  if minN=-1 then minN:=depth;//set minimal depth
  if useSlices and ((manSep='q')or (manSep='sq'))then tmp:='sq';
  if not useSlices and ((manSep='q')or (manSep='sq'))then tmp:='q';
  if useSlices and ((manSep='f')or (manSep='s'))then tmp:='s';
  if not useSlices and ((manSep='f')or (manSep='s'))then tmp:='f';
  if minN= depth then ln:=' ('+IntToStr(depth+1)+tmp+'*)'
  else ln:=' ('+IntToStr(depth+1)+tmp+')';


 //jetzt für den Fall useSlices das Maneuver berechnen

 for t:=U to B do curAx[t]:=t;

 i:=0;
 while i<depth+1 do
 begin
   invertPower:=false;
   case n[i].axis of
     U..B: s1:=s1+AxisToString[curAx[n[i].axis]];
     Us..Fs:
       begin
         t:=curAx[TurnAxis(Ord(n[i].axis)-6)];//Us->U etc.
         if t>F then begin invertPower:=true;t:=TurnAxis(Ord(t)-3);end;
         s1:=s1+SliceToString[t];
       end;
   end;
   if (n[i].axis>B) and(t=F) then invertPower:= not invertPower;//bei Fs Sinn anders herum

   p:= n[i].power;
   if invertPower then p:=4-p;
     s1:=s1+numToStr(p);
 //jetzt den Würfel entsprechend drehen.
   if n[i].axis >B then //slicemoves
     case t of
       U:
         begin
           for j:=1 to p do
           begin
             AxisMult(curAx,AxisMove[D],curAxTmp);
             for t:=U to B do curAx[t]:=curAxTmp[t];
           end;
         end;
       R:
         begin
           for j:=1 to p do
           begin
             AxisMult(curAx,AxisMove[L],curAxTmp);
             for t:=U to B do curAx[t]:=curAxTmp[t];
           end;
         end;
      F:
         begin
           for j:=1 to p do
           begin
             AxisMult(curAx,AxisMove[F],curAxTmp);
             for t:=U to B do curAx[t]:=curAxTmp[t];
           end;
         end;
     end;

 Inc(i);
 end;

 if useSlices then  //Orientierung korrigieren
 begin
   tmp:='';
l1:
   if (curAx[U]=U) and (curAx[R]=R) then tmp:=tmp+''
   else if (curAx[U]=U) then
   begin
     p:=0;
     repeat
       AxisMult(curAx,AxisMove[U],curAxTmp);
       for t:=U to B do curAx[t]:=curAxTmp[t];
       Inc(p);
     until curAx[R]=R;
     tmp:=tmp+'y'+numToStr(p);
   end
   else if (curAx[R]=R) then
   begin
     p:=0;
     repeat
       AxisMult(curAx,AxisMove[R],curAxTmp);
       for t:=U to B do curAx[t]:=curAxTmp[t];
       Inc(p);
     until curAx[U]=U;
     tmp:=tmp+'x'+numToStr(p);;
   end
   else if (curAx[F]=F) then
   begin
     p:=0;
     repeat
       AxisMult(curAx,AxisMove[F],curAxTmp);
       for t:=U to B do curAx[t]:=curAxTmp[t];
       Inc(p);
     until curAx[U]=U;
     tmp:=tmp+'z'+numToStr(p);;
   end
   else
   begin
     p:=0;
     repeat
       AxisMult(curAx,AxisMove[R],curAxTmp);
       for t:=U to B do curAx[t]:=curAxTmp[t];
       Inc(p);
     until (curAx[U]=U) or (curAx[F]=F);
     tmp:=tmp+'x'+numToStr(p);
     goto l1;
   end;
   s:= s1+tmp;
 end;
 // in case of slice moves exclude maneuvers which contain forbidden faces

  if (Incomplete.FFilter).Checked and (Pos('F',s)> 0) then exit;
  if (Incomplete.DFilter).Checked and (Pos('D',s)> 0) then exit;
  if (Incomplete.LFilter).Checked and (Pos('L',s)> 0) then exit;
  if (Incomplete.BFilter).Checked and (Pos('B',s)> 0) then exit;
  if (Incomplete.EFilter).Checked and (Pos('E',s)> 0) then exit;
  if (Incomplete.MFilter).Checked and (Pos('M',s)> 0) then exit;
  if (Incomplete.SFilter).Checked and (Pos('S',s)> 0) then exit;

 Incomplete.ManInfo.Lines.Add(s+ln);
end;

procedure InCompSearch.AddMessage;
begin
 Incomplete.ManInfo.Lines.Add(msg);
 Incomplete.ManInfo.Lines.Add('');
end;


procedure InCompSearch.CleanupIfTerminated(Sender: TObject);
begin
  if BStopClicked then  //stop button was pressed
  begin
    Incomplete.ManInfo.Lines.Add('');
    Incomplete.ManInfo.Lines.Add('computation stopped.');
    Incomplete.ManInfo.Lines.Add('');
    BStopClicked:= false;
  end;
end;


procedure IncompSearch.Execute;
begin
  case icase of
   DEFAULT: SearchGeneral;
   DFACE: SearchDFaceComplete;
   EIGHTCORN:  SearchCornersComplete;
   BOTHACCELS: SearchBothAccels;
   NOTHING: exit;
  end;
end;


procedure IncompSearch.SearchGeneral;
var m: Move;
prun1,prun2,prun3,coPrun,cpPrun: Integer;
label incPower,turn,right,incAxis,checkNeighbourAxis,left,ende;
begin

incPower:
  Inc(np^.power);
  {$IF QTM}
  if (np^.power=2) then Inc(np^.power);
  {$IFEND}
  if (np^.power>3) then goto incAxis;
  if (depth<>r_depth) then  //sonst kein linker Nachbar
  begin
    np1:=np; Dec(np1);
    {$IF QTM}
    if (np1^.axis=np^.axis)and ((np1^.power=3) or (np^.power=3)) then goto incAxis; //only X*X, not X*X',X'*X or X'*X'
    {$IFEND}
    if useSlices and  (np1^.axis<=F) and (np^.axis=Turnaxis(Ord(np1^.axis)+3))
    and (np1^.power + np^.power = 4) then goto incPower;//kein UD', U2D2, U'D etc wenn slices
  end;
turn:
  np1:=np;
  Inc(np1);
  m:= Move(3*Ord(np^.axis) + np^.power - 1);
//+++++++++++++++++++++++++++++++++

  np1^.cenTwist:= CentOriMove[np^.cenTwist,m];

  if nEdgePos>0 then
  begin
    np1^.edge51Coord:= EPermMove(np^.edge51Coord,m,nEdgePos);
    prun1:=  GetIndex(np1^.edge51Coord,EPermPrun1);
  end;
  if nEdgePos>5 then
  begin
    np1^.edge52Coord:= EPermMove(np^.edge52Coord,m,5);
    prun2:=  GetIndex(np1^.edge52Coord,EPermPrun2);
  end;
  if nEdgePos>10 then
  begin
    np1^.edge53Coord:= EPermMove(np^.edge53Coord,m,5);
    prun3:=  GetIndex(np1^.edge53Coord,EPermPrun3);
  end;
  np1^.edgeOriCoord:= EOriMove[np^.edgeOriCoord,m];
  np1^.edgeUnknownCoord:= EUnknownMove[np^.edgeUnknownCoord,m];

  np1^.cornOriCoord:= COriMove[np^.cornOriCoord,m];
  coPrun:= COriPrun[np1^.cornOriCoord];
  Assert(coPrun<>$ff);

  np1^.cornPermCoord:= CornPermMove[np^.cornPermCoord,m];
  cpPrun:= CPermPrun[np1^.cornPermCoord];

//++++++++++++++++++++++++++++++++++++++++++++++++
  if not Terminated then
  begin
{$If not QTM}
    if nEdgePos>0 then if prun1>r_depth+1 then goto incAxis;
    if nEdgePos>5 then if prun2>r_depth+1 then goto incAxis;
    if nEdgePos>10 then if prun3>r_depth+1 then goto incAxis;
    if coPrun>r_depth+1 then goto incAxis;
    if cpPrun>r_depth+1 then goto incAxis;
{$IFEND}
    if coPrun>r_depth then goto incPower;
    if cpPrun>r_depth then goto incPower;
    if nEdgePos>0 then if prun1>r_depth then goto incPower;
    if nEdgePos>5 then if prun2>r_depth then goto incPower;
    if nEdgePos>10 then if prun3>r_depth then goto incPower;
  end;
 //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// if useSlices and (depth<>r_depth) then //else no left neighbour
//  begin
//    np2:=np;Dec(np2);
//    if  (np2^.axis<=F) and (np^.axis=Turnaxis(Ord(np2^.axis)+3))
//    and (np2^.power + np^.power = 4) then
//      goto incPower; //kein UD', U2D2, U'D etc wenn slices
//  end;
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  if (r_depth=0) then
  begin
  if Terminated then goto ende;

  if np1^.edgeOriCoord and np1^.edgeUnknownCoord<>0 then goto incPower;

  if isOriented and ((np1^.cenTwist and ignoreTwists) <>0) then goto incPower;


  Synchronize(AddSolverString);
  goto incPower;//weitersuchen!!!
  end;//if r_depth=0
right:
  Dec(r_depth);
  Inc(np); np^.axis:= U;
  goto checkNeighbourAxis;

incAxis:
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  if (not useSlices and (np^.axis=B)) or (np^.axis=Fs) then goto left;
  Inc(np^.axis);
  while (not useSlices) and excludeAxis[np^.axis] do
  begin
    if (not useSlices and (np^.axis=B)) or (np^.axis=Fs) then goto left;
    Inc(np^.axis);
  end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

checkNeighbourAxis:
{$IF not QTM}
  if depth<>r_depth then //else no left neighbour
  begin
    np1:=np; Dec(np1);
    if (np^.axis=np1^.axis) then goto incAxis;//in FTM no successive moves with same axis
    if np^.axis<=F then
    if TurnAxis(Ord(np^.axis)+3)=np1^.axis then goto incAxis;//no D*U, L*R etc.
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    if useSlices then
    begin
     // if np^.axis<=F then
     // if TurnAxis(Ord(np^.axis)+6)=np1^.axis then goto incAxis;//no Us*U, Rs*R etc.
     // if np^.axis<=B then
     // if TurnAxis(Ord(np^.axis)+3)=np1^.axis then goto incAxis;//no Us*D, Rs*L etc.
                                                               //D*U, L*R already done
      if np^.axis>=Us then
      if TurnAxis(Ord(np^.axis)- 3)=np1^.axis then goto incAxis;//no D*Us, L*Rs etc.
      if np^.axis>=Us then
      if TurnAxis(Ord(np^.axis)- 6)=np1^.axis then goto incAxis;//no U*Us, R*Rs et.
    end;
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  end;
{$ELSE}
  if depth<>r_depth then //else no left neighbour
  begin
    np1:=np; Dec(np1);
     if (np^.axis= np1^.axis) and (np1^.power = 3) then goto incAxis;
    //only X*X, not X'*X
    np2:=np1;Dec(np2);
    if (depth-r_depth>1) and //else no neighbour left of left neighbour
       (np^.axis= np1^.axis) and (np^.axis=np2^.axis) then goto incAxis;
         //in QTM not three successive moves with same axis
    if np^.axis<=F then
    if TurnAxis(Ord(np^.axis)+3)=np1^.axis then goto incAxis;//no D*U, L*R etc.
    //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    if useSlices then
    begin
      // if np^.axis<=F then
      // if TurnAxis(Ord(np^.axis)+6)=np1^.axis then goto incAxis;//no Us*U, Rs*R etc.
      // if np^.axis<=B then
      // if TurnAxis(Ord(np^.axis)+3)=np1^.axis then goto incAxis;//no Us*D, Rs*L etc.
                                                               //D*U, L*R already done
      if np^.axis>=Us then
      if TurnAxis(Ord(np^.axis)- 3)=np1^.axis then goto incAxis;//no D*Us, L*Rs etc.
      if np^.axis>=Us then
      if TurnAxis(Ord(np^.axis)- 6)=np1^.axis then goto incAxis;//no U*Us, R*Rs et.
    end;
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  end;
{$IFEND}


// np^.power:=1;//all checks ok
// goto turn;
    np^.power:=0;
    goto incpower;

left:
  if depth = r_depth then//depth is incremented
  begin
    Inc(depth);Inc(r_depth);
    if depth>5 then
     begin msg:='Searching depth '+IntToStr(depth+1);Synchronize(AddMessage); end;
    np^.axis:=U;
    np^.power:=1;
    goto turn;

  end
  else
  begin
    Dec(np);
    Inc(r_depth);
    goto incPower;
  end;
ende:

end;

procedure IncompSearch.SearchCornersComplete;
var m: Move;
i,k: Corner; j: Edge;
x,s,csym,cidx,index: Integer;
prun1,prun2,prun3: Integer;
label incPower,turn,right,incAxis,checkNeighbourAxis,left,ende;
begin
  x:= 0;
  for i:= DRB downto Succ(URF) do
  begin
    s:=0;
    for k:= Pred(i) downto URF do
    begin
      if np^.cc[k].c>np^.cc[i].c then Inc(s);
    end;
    x:= (x+s)*Ord(i);
  end;
  np^.cperm:=x;

  s:=0;
  for i:= URF to Pred(DRB) do s:= 3*s + np^.cc[i].o;
  np^.cori:= s;
  np^.fullCornPrun:=GetPrunFullCorner(x,s);


incPower:
  Inc(np^.power);
  {$IF QTM}
  if (np^.power=2) then Inc(np^.power);
  {$IFEND}
  if (np^.power>3) then goto incAxis;
  if (depth<>r_depth) then  //sonst kein linker Nachbar
  begin
    np1:=np; Dec(np1);
    {$IF QTM}
    if (np1^.axis=np^.axis)and ((np1^.power=3) or (np^.power=3)) then goto incAxis; //only X*X, not X*X',X'*X or X'*X'
    {$IFEND}
    if useSlices and  (np1^.axis<=F) and (np^.axis=Turnaxis(Ord(np1^.axis)+3))
    and (np1^.power + np^.power = 4) then goto incPower;//kein UD', U2D2, U'D etc wenn slices
  end;
turn:
  np1:=np;
  Inc(np1);
  m:= Move(3*Ord(np^.axis) + np^.power - 1);

  np1^.cenTwist:= CentOriMove[np^.cenTwist,m];

  if nEdgePos>0 then
  begin
    np1^.edge51Coord:= EPermMove(np^.edge51Coord,m,nEdgePos);
    prun1:=  GetIndex(np1^.edge51Coord,EPermPrun1);
  end;
  if nEdgePos>5 then
  begin
    np1^.edge52Coord:= EPermMove(np^.edge52Coord,m,5);
    prun2:=  GetIndex(np1^.edge52Coord,EPermPrun2);
  end;
  if nEdgePos>10 then
  begin
    np1^.edge53Coord:= EPermMove(np^.edge53Coord,m,5);
    prun3:=  GetIndex(np1^.edge53Coord,EPermPrun3);
  end;
  np1^.edgeOriCoord:= EOriMove[np^.edgeOriCoord,m];
  np1^.edgeUnknownCoord:= EUnknownMove[np^.edgeUnknownCoord,m];
//++++++++++++++++++++++++++++


  np1^.cperm:= CornPermMove[np^.cperm,m];
  x:= CornPosToSymCornPos[np1^.cperm];//Sym-Koordinate
  cSym:= x and $f;
  cIdx:= x shr 4;
  np1^.cori:= TwistMove[np^.cori,m];  //wie phase2 pruningtable!
  index:= 2768*TwistConjugate[np1^.cori,cSym]+cIdx;
  np1^.fullCornPrun:= GetPruningLength[np^.fullCornPrun,GetPruningFullCorner(index)];


  if not Terminated then
  begin
{$If not QTM}
    if (np1^.fullCornPrun>r_depth+1) then goto incAxis;
    if nEdgePos>0 then if prun1>r_depth+1 then goto incAxis;
    if nEdgePos>5 then if prun2>r_depth+1 then goto incAxis;
    if nEdgePos>10 then if prun3>r_depth+1 then goto incAxis;
{$IFEND}

    if (np1^.fullCornPrun>r_depth)  then goto incPower;
    if nEdgePos>0 then if prun1>r_depth then goto incPower;
    if nEdgePos>5 then if prun2>r_depth then goto incPower;
    if nEdgePos>10 then if prun3>r_depth then goto incPower;
  end;

 //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  if useSlices and (depth<>r_depth) then //else no left neighbour
//  begin
//    np2:=np;Dec(np2);
//    if  (np2^.axis<=F) and (np^.axis=Turnaxis(Ord(np2^.axis)+3))
//    and (np2^.power + np^.power = 4) then
//      goto incPower; //kein UD', U2D2, U'D etc wenn slices
//  end;
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



  if (r_depth=0) then
  begin
  if Terminated then goto ende;
//checken, ob cube ok
{
  for i:= URF to DRB do
  begin
    if (np1^.cc[i].c<>NNN) and (np1^.cc[i].c<>i) then goto incPower;
    if (np1^.cc[i].o<>6) and (np1^.cc[i].o<>0) then goto incPower;
  end;
}
  for j:= UR to BR do
  begin
//    if (np1^.ec[j].e<>NN) and (np1^.ec[j].e<>j) then goto incPower;
//    if (np1^.ec[j].o<>6) and (np1^.ec[j].o<>0) then goto incPower;
  end;
  if np1^.edgeOriCoord and np1^.edgeUnknownCoord<>0 then goto incPower;

  if isOriented and ((np1^.cenTwist and ignoreTwists) <>0) then goto incPower;

//Ergebnis ausgeben
  Synchronize(AddSolverString);
  goto incPower;//weitersuchen!!!
  end;//if r_depth=0
right:
  Dec(r_depth);
  Inc(np); np^.axis:= U;
  goto checkNeighbourAxis;

incAxis:
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  if (not useSlices and (np^.axis=B)) or (np^.axis=Fs) then goto left;
  Inc(np^.axis);
  while  (not useSlices) and excludeAxis[np^.axis] do
  begin
    if (not useSlices and (np^.axis=B)) or (np^.axis=Fs) then goto left;
    Inc(np^.axis);
  end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

checkNeighbourAxis:
{$IF not QTM}
  if depth<>r_depth then //else no left neighbour
  begin
    np1:=np; Dec(np1);
    if (np^.axis=np1^.axis) then goto incAxis;//in FTM no successive moves with same axis
    if np^.axis<=F then
    if TurnAxis(Ord(np^.axis)+3)=np1^.axis then goto incAxis;//no D*U, L*R etc.
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    if useSlices then
    begin
     // if np^.axis<=F then
     // if TurnAxis(Ord(np^.axis)+6)=np1^.axis then goto incAxis;//no Us*U, Rs*R etc.
     // if np^.axis<=B then
     // if TurnAxis(Ord(np^.axis)+3)=np1^.axis then goto incAxis;//no Us*D, Rs*L etc.
                                                               //D*U, L*R already done
      if np^.axis>=Us then
      if TurnAxis(Ord(np^.axis)- 3)=np1^.axis then goto incAxis;//no D*Us, L*Rs etc.
      if np^.axis>=Us then
      if TurnAxis(Ord(np^.axis)- 6)=np1^.axis then goto incAxis;//no U*Us, R*Rs et.
    end;
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  end;
{$ELSE}
  if depth<>r_depth then //else no left neighbour
  begin
    np1:=np; Dec(np1);
     if (np^.axis= np1^.axis) and (np1^.power = 3) then goto incAxis;
    //only X*X, not X'*X
    np2:=np1;Dec(np2);
    if (depth-r_depth>1) and //else no neighbour left of left neighbour
       (np^.axis= np1^.axis) and (np^.axis=np2^.axis) then goto incAxis;
         //in QTM not three successive moves with same axis
    if np^.axis<=F then
    if TurnAxis(Ord(np^.axis)+3)=np1^.axis then goto incAxis;//no D*U, L*R etc.
    //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    if useSlices then
    begin
      // if np^.axis<=F then
      // if TurnAxis(Ord(np^.axis)+6)=np1^.axis then goto incAxis;//no Us*U, Rs*R etc.
      // if np^.axis<=B then
      // if TurnAxis(Ord(np^.axis)+3)=np1^.axis then goto incAxis;//no Us*D, Rs*L etc.
                                                               //D*U, L*R already done
      if np^.axis>=Us then
      if TurnAxis(Ord(np^.axis)- 3)=np1^.axis then goto incAxis;//no D*Us, L*Rs etc.
      if np^.axis>=Us then
      if TurnAxis(Ord(np^.axis)- 6)=np1^.axis then goto incAxis;//no U*Us, R*Rs et.
    end;
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  end;
{$IFEND}

// np^.power:=1;//all checks ok
// goto turn;
    np^.power:=0;
    goto incpower;

left:
  if depth = r_depth then//depth is incremented
  begin
    Inc(depth);Inc(r_depth);
    if depth>5 then
      begin msg:='Searching depth '+IntToStr(depth+1); Synchronize(AddMessage); end;
    np^.axis:=U;
    np^.power:=1;
    goto turn;
  end
  else
  begin
    Dec(np);
    Inc(r_depth);
    goto incPower;
  end;
ende:

end;

procedure IncompSearch.SearchDFaceComplete;
var m: Move;
x,csym,cidx,index: Integer;
prun1,prun2,prun3,coPrun,cpPrun:Integer;
label incPower,turn,right,incAxis,checkNeighbourAxis,left,ende;
begin

  np^.DownFacePrun:=GetPrunDownFace(np^.DownEdgeCoord,np^.DownCornerCoord);

incPower:
  Inc(np^.power);
  {$IF QTM}
  if (np^.power=2) then Inc(np^.power);
  {$IFEND}
  if (np^.power>3) then goto incAxis;
  if (depth<>r_depth) then  //sonst kein linker Nachbar
  begin
    np1:=np; Dec(np1);
    {$IF QTM}
    if (np1^.axis=np^.axis)and ((np1^.power=3) or (np^.power=3)) then goto incAxis; //only X*X, not X*X',X'*X or X'*X'
    {$IFEND}
    if useSlices and  (np1^.axis<=F) and (np^.axis=Turnaxis(Ord(np1^.axis)+3))
    and (np1^.power + np^.power = 4) then goto incPower;//kein UD', U2D2, U'D etc wenn slices
  end;
turn:
  np1:=np;
  Inc(np1);
  m:= Move(3*Ord(np^.axis) + np^.power - 1);
//++++++++++++++++++++++++

  np1^.cenTwist:= CentOriMove[np^.cenTwist,m];

  if nEdgePos>0 then
  begin
    np1^.edge51Coord:= EPermMove(np^.edge51Coord,m,nEdgePos);
    prun1:=  GetIndex(np1^.edge51Coord,EPermPrun1);
  end;
  if nEdgePos>5 then
  begin
    np1^.edge52Coord:= EPermMove(np^.edge52Coord,m,5);
    prun2:=  GetIndex(np1^.edge52Coord,EPermPrun2);
  end;
  if nEdgePos>10 then
  begin
    np1^.edge53Coord:= EPermMove(np^.edge53Coord,m,5);
    prun3:=  GetIndex(np1^.edge53Coord,EPermPrun3);
  end;
  np1^.edgeOriCoord:= EOriMove[np^.edgeOriCoord,m];
  np1^.edgeUnknownCoord:= EUnknownMove[np^.edgeUnknownCoord,m];

//++++++++++falls nicht cornerscomplete, muss das sein+++++++++++++++++++++++++
  np1^.cornOriCoord:= COriMove[np^.cornOriCoord,m];
  coPrun:= COriPrun[np1^.cornOriCoord];
  Assert(coPrun<>$ff);
  np1^.cornPermCoord:= CornPermMove[np^.cornPermCoord,m];
  cpPrun:= CPermPrun[np1^.cornPermCoord];
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  np1^.downEdgeCoord:= DownEdgeMove[np^.downEdgeCoord,m];
  x:= DownEdgeCoordToSymDownEdgeCoord[np1^.downEdgeCoord];
  cSym:= x and $f;
  cIdx:= x shr 4;
  np1^.downCornerCoord:= DownCornerMove[np^.downCornerCoord,m];
  //index:= 2768*TwistConjugate[np1^.cori,cSym]+cIdx;
  index:= 1547*DownCornerCoordConjugate[np1^.downCornerCoord,cSym]+cIdx;
  np1^.DownFacePrun:= GetPruningLength[np^.DownFacePrun,GetPruningDownFace(index)];
//++++++++++++++++++++++++++++


  if not Terminated then
  begin
{$If not QTM}
    if (np1^.DownFacePrun>r_depth+1) then goto incAxis;
    if nEdgePos>0 then if prun1>r_depth+1 then goto incAxis;
    if nEdgePos>5 then if prun2>r_depth+1 then goto incAxis;
    if nEdgePos>10 then if prun3>r_depth+1 then goto incAxis;
    if coPrun>r_depth+1 then goto incAxis;
    if cpPrun>r_depth+1 then goto incAxis;
{$IFEND}

    if (np1^.DownFacePrun>r_depth)  then goto incPower;
    if nEdgePos>0 then if prun1>r_depth then goto incPower;
    if nEdgePos>5 then if prun2>r_depth then goto incPower;
    if nEdgePos>10 then if prun3>r_depth then goto incPower;
    if coPrun>r_depth then goto incPower;
    if cpPrun>r_depth then goto incPower;

//+++++++++++++++++++++++++++++++++++++++++
  end;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// if useSlices and (depth<>r_depth) then //else no left neighbour
//  begin
//    np2:=np;Dec(np2);
//    if  (np2^.axis<=F) and (np^.axis=Turnaxis(Ord(np2^.axis)+3))
//    and (np2^.power + np^.power = 4) then
//      goto incPower; //kein UD', U2D2, U'D etc wenn slices
//  end;
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  if (r_depth=0) then
  begin
  if Terminated then goto ende;
//checken, ob cube ok

  if np1^.edgeOriCoord and np1^.edgeUnknownCoord<>0 then goto incPower;

  if isOriented and ((np1^.cenTwist and ignoreTwists) <>0) then goto incPower;

//Ergebnis ausgeben
  Assert(np1^.downCornerCoord=1604);
  Assert(np1^.downEdgeCoord=5860);
  Assert(np1^.DownFacePrun=0);
  Synchronize(AddSolverString);
  goto incPower;//weitersuchen!!!
  end;//if r_depth=0
right:
  Dec(r_depth);
  Inc(np); np^.axis:= U;
  goto checkNeighbourAxis;

incAxis:
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  if (not useSlices and (np^.axis=B)) or (np^.axis=Fs) then goto left;
  Inc(np^.axis);
  while  (not useSlices) and excludeAxis[np^.axis] do
  begin
    if (not useSlices and (np^.axis=B)) or (np^.axis=Fs) then goto left;
    Inc(np^.axis);
  end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

checkNeighbourAxis:
{$IF not QTM}
  if depth<>r_depth then //else no left neighbour
  begin
    np1:=np; Dec(np1);
    if (np^.axis=np1^.axis) then goto incAxis;//in FTM no successive moves with same axis
    if np^.axis<=F then
    if TurnAxis(Ord(np^.axis)+3)=np1^.axis then goto incAxis;//no D*U, L*R etc.
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    if useSlices then
    begin
     // if np^.axis<=F then
     // if TurnAxis(Ord(np^.axis)+6)=np1^.axis then goto incAxis;//no Us*U, Rs*R etc.
     // if np^.axis<=B then
     // if TurnAxis(Ord(np^.axis)+3)=np1^.axis then goto incAxis;//no Us*D, Rs*L etc.
                                                               //D*U, L*R already done
      if np^.axis>=Us then
      if TurnAxis(Ord(np^.axis)- 3)=np1^.axis then goto incAxis;//no D*Us, L*Rs etc.
      if np^.axis>=Us then
      if TurnAxis(Ord(np^.axis)- 6)=np1^.axis then goto incAxis;//no U*Us, R*Rs et.
    end;
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  end;
{$ELSE}
  if depth<>r_depth then //else no left neighbour
  begin
    np1:=np; Dec(np1);
     if (np^.axis= np1^.axis) and (np1^.power = 3) then goto incAxis;
    //only X*X, not X'*X
    np2:=np1;Dec(np2);
    if (depth-r_depth>1) and //else no neighbour left of left neighbour
       (np^.axis= np1^.axis) and (np^.axis=np2^.axis) then goto incAxis;
         //in QTM not three successive moves with same axis
    if np^.axis<=F then
    if TurnAxis(Ord(np^.axis)+3)=np1^.axis then goto incAxis;//no D*U, L*R etc.
    //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    if useSlices then
    begin
      // if np^.axis<=F then
      // if TurnAxis(Ord(np^.axis)+6)=np1^.axis then goto incAxis;//no Us*U, Rs*R etc.
      // if np^.axis<=B then
      // if TurnAxis(Ord(np^.axis)+3)=np1^.axis then goto incAxis;//no Us*D, Rs*L etc.
                                                               //D*U, L*R already done
      if np^.axis>=Us then
      if TurnAxis(Ord(np^.axis)- 3)=np1^.axis then goto incAxis;//no D*Us, L*Rs etc.
      if np^.axis>=Us then
      if TurnAxis(Ord(np^.axis)- 6)=np1^.axis then goto incAxis;//no U*Us, R*Rs et.
    end;
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  end;
{$IFEND}

// np^.power:=1;//all checks ok
// goto turn;
    np^.power:=0;
    goto incpower;

left:
  if depth = r_depth then//depth is incremented
  begin
    Inc(depth);Inc(r_depth);
    if depth>5 then
      begin msg:='Searching depth '+IntToStr(depth+1); Synchronize(AddMessage); end;
    np^.axis:=U;
    np^.power:=1;
    goto turn;
  end
  else
  begin
    Dec(np);
    Inc(r_depth);
    goto incPower;
  end;
ende:

end;


procedure IncompSearch.SearchBothAccels;
var m: Move;
i,k: Corner;
x,s,csym,cidx,index: Integer;
prun1,prun2,prun3:Integer;
label incPower,turn,right,incAxis,checkNeighbourAxis,left,ende;
begin
  x:= 0;
  for i:= DRB downto Succ(URF) do
  begin
    s:=0;
    for k:= Pred(i) downto URF do
    begin
      if np^.cc[k].c>np^.cc[i].c then Inc(s);
    end;
    x:= (x+s)*Ord(i);
  end;
  np^.cperm:=x;

  s:=0;
  for i:= URF to Pred(DRB) do s:= 3*s + np^.cc[i].o;
  np^.cori:= s;
  np^.fullCornPrun:=GetPrunFullCorner(x,s);

  np^.DownFacePrun:=GetPrunDownFace(np^.DownEdgeCoord,np^.DownCornerCoord);

incPower:
  Inc(np^.power);
    {$IF QTM}
  if (np^.power=2) then Inc(np^.power);
  {$IFEND}
  if (np^.power>3) then goto incAxis;

  if (depth<>r_depth) then  //sonst kein linker Nachbar
  begin
    np1:=np; Dec(np1);
    {$IF QTM}
    if (np1^.axis=np^.axis)and ((np1^.power=3) or (np^.power=3)) then goto incAxis; //only X*X, not X*X',X'*X or X'*X'
    {$IFEND}
    if useSlices and  (np1^.axis<=F) and (np^.axis=Turnaxis(Ord(np1^.axis)+3))
    and (np1^.power + np^.power = 4) then goto incPower;//kein UD', U2D2, U'D etc wenn slices
  end;


turn:
  np1:=np;
  Inc(np1);
  m:= Move(3*Ord(np^.axis) + np^.power - 1);
  np1^.cenTwist:= CentOriMove[np^.cenTwist,m];


  if nEdgePos>0 then
  begin
    np1^.edge51Coord:= EPermMove(np^.edge51Coord,m,nEdgePos);
    prun1:=  GetIndex(np1^.edge51Coord,EPermPrun1);
  end;
  if nEdgePos>5 then
  begin
    np1^.edge52Coord:= EPermMove(np^.edge52Coord,m,5);
    prun2:=  GetIndex(np1^.edge52Coord,EPermPrun2);
  end;
  if nEdgePos>10 then
  begin
    np1^.edge53Coord:= EPermMove(np^.edge53Coord,m,5);
    prun3:=  GetIndex(np1^.edge53Coord,EPermPrun3);
  end;
  np1^.edgeOriCoord:= EOriMove[np^.edgeOriCoord,m];
  np1^.edgeUnknownCoord:= EUnknownMove[np^.edgeUnknownCoord,m];

  np1^.downEdgeCoord:= DownEdgeMove[np^.downEdgeCoord,m];
  x:= DownEdgeCoordToSymDownEdgeCoord[np1^.downEdgeCoord];
  cSym:= x and $f;
  cIdx:= x shr 4;
  np1^.downCornerCoord:= DownCornerMove[np^.downCornerCoord,m];
  index:= 1547*DownCornerCoordConjugate[np1^.downCornerCoord,cSym]+cIdx;
  np1^.DownFacePrun:= GetPruningLength[np^.DownFacePrun,GetPruningDownFace(index)];


  np1^.cperm:= CornPermMove[np^.cperm,m];
  x:= CornPosToSymCornPos[np1^.cperm];//Sym-Koordinate
  cSym:= x and $f;
  cIdx:= x shr 4;
  np1^.cori:= TwistMove[np^.cori,m];  //wie phase2 pruningtable!
  index:= 2768*TwistConjugate[np1^.cori,cSym]+cIdx;
  np1^.fullCornPrun:= GetPruningLength[np^.fullCornPrun,GetPruningFullCorner(index)];

  if not Terminated then
  begin
  {$If not QTM}
    if (np1^.fullCornPrun>r_depth+1) then goto incAxis;
    if (np1^.DownFacePrun>r_depth+1) then goto incAxis;
    if nEdgePos>0 then if prun1>r_depth+1 then goto incAxis;
    if nEdgePos>5 then if prun2>r_depth+1 then goto incAxis;
    if nEdgePos>10 then if prun3>r_depth+1 then goto incAxis;
  {$IFEND}

    if (np1^.fullCornPrun>r_depth)  then goto incPower;
    if (np1^.DownFacePrun>r_depth)  then goto incPower;
    if nEdgePos>0 then if prun1>r_depth then goto incPower;
    if nEdgePos>5 then if prun2>r_depth then goto incPower;
    if nEdgePos>10 then if prun3>r_depth then goto incPower;
  end;

 //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// if useSlices and (depth<>r_depth) then //else no left neighbour
//  begin
//    np2:=np;Dec(np2);
//    if  (np2^.axis<=F) and (np^.axis=Turnaxis(Ord(np2^.axis)+3))
//    and (np2^.power + np^.power = 4) then
//       goto incPower;// goto incAxis; //kein UD', U2D2, U'D etc wenn slices
//  end;
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  if (r_depth=0) then
  begin
  if Terminated then goto ende;
//checken, ob cube ok
  if np1^.edgeOriCoord and np1^.edgeUnknownCoord<>0 then goto incPower;
  if isOriented and ((np1^.cenTwist and ignoreTwists) <>0) then goto incPower;


//Ergebnis ausgeben
  Assert(np1^.downCornerCoord=1604);
  Assert(np1^.downEdgeCoord=5860);
  Assert(np1^.DownFacePrun=0);
  Synchronize(AddSolverString);
  goto incPower;//weitersuchen!!!
  end;//if r_depth=0
right:
  Dec(r_depth);
  Inc(np); np^.axis:= U;
  goto checkNeighbourAxis;

incAxis:
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  if (not useSlices and (np^.axis=B)) or (np^.axis=Fs) then goto left;
  Inc(np^.axis);
  while  (not useSlices) and excludeAxis[np^.axis] do
  begin
    if (not useSlices and (np^.axis=B)) or (np^.axis=Fs) then goto left;
    Inc(np^.axis);
  end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


checkNeighbourAxis:
{$IF not QTM}
  if depth<>r_depth then //else no left neighbour
  begin
    np1:=np; Dec(np1);
    if (np^.axis=np1^.axis) then goto incAxis;//in FTM no successive moves with same axis
    if np^.axis<=F then
    if TurnAxis(Ord(np^.axis)+3)=np1^.axis then goto incAxis;//no D*U, L*R etc.
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    if useSlices then
    begin
     // if np^.axis<=F then
     // if TurnAxis(Ord(np^.axis)+6)=np1^.axis then goto incAxis;//no Us*U, Rs*R etc.
     // if np^.axis<=B then
     // if TurnAxis(Ord(np^.axis)+3)=np1^.axis then goto incAxis;//no Us*D, Rs*L etc.
                                                               //D*U, L*R already done
      if np^.axis>=Us then
      if TurnAxis(Ord(np^.axis)- 3)=np1^.axis then goto incAxis;//no D*Us, L*Rs etc.
      if np^.axis>=Us then
      if TurnAxis(Ord(np^.axis)- 6)=np1^.axis then goto incAxis;//no U*Us, R*Rs et.
    end;
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  end;
{$ELSE}
  if depth<>r_depth then //else no left neighbour
  begin
    np1:=np; Dec(np1);
     if (np^.axis= np1^.axis) and (np1^.power = 3) then goto incAxis;
    //only X*X, not X'*X
    np2:=np1;Dec(np2);
    if (depth-r_depth>1) and //else no neighbour left of left neighbour
       (np^.axis= np1^.axis) and (np^.axis=np2^.axis) then goto incAxis;
         //in QTM not three successive moves with same axis
    if np^.axis<=F then
    if TurnAxis(Ord(np^.axis)+3)=np1^.axis then goto incAxis;//no D*U, L*R etc.
    //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    if useSlices then
    begin
      // if np^.axis<=F then
      // if TurnAxis(Ord(np^.axis)+6)=np1^.axis then goto incAxis;//no Us*U, Rs*R etc.
      // if np^.axis<=B then
      // if TurnAxis(Ord(np^.axis)+3)=np1^.axis then goto incAxis;//no Us*D, Rs*L etc.
                                                               //D*U, L*R already done
      if np^.axis>=Us then
      if TurnAxis(Ord(np^.axis)- 3)=np1^.axis then goto incAxis;//no D*Us, L*Rs etc.
      if np^.axis>=Us then
      if TurnAxis(Ord(np^.axis)- 6)=np1^.axis then goto incAxis;//no U*Us, R*Rs et.
    end;
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  end;
{$IFEND}

// np^.power:=1;//all checks ok
// goto turn;
  np^.power:=0;//all checks ok
  goto incpower;

left:
  if depth = r_depth then//depth is incremented
  begin
    Inc(depth);Inc(r_depth);
    if depth>5 then
      begin msg:='Searching depth '+IntToStr(depth+1); Synchronize(AddMessage); end;
    np^.axis:=U;
    np^.power:=1;
    goto turn;
  end
  else
  begin                  
    Dec(np);
    Inc(r_depth);
    goto incPower;
  end;
ende:

end;

//++++++++++++++++++++++++++++++++++++++++++++++++++
procedure IncompSearch.CreateDownFacePruningTable;
var i,j,n,done,depth,realDepth,downCorn,downCorn0,downCornConj,altDownCorn,
    downEdge0,symDownEdge0,symDownEdge,sym,index,value:Integer; z,b:Word;
    SymState: array of Word; 
    ed: Edge; prod: EdgeCubie;
    m: Move;
    flipBackward,match:Boolean;

label nextI;
begin
 
    SetLength(downFacePrun,1547*1680 div 16 + 1);
    flipBackward:=false;//flip to backward search if true
    SetLength(SymState,1547);
    for i:= 0 to 1547-1 do
    begin
      z:= SymDownEdgeCoordToDownEdgeCoord[i];//symmetry part is 0
      InvDownEdgeCoord(z); //wird in node 21 gespeichert
    //es müssen noch die unbesetzten Positionen definiert werden
      for ed:= UR to BR do if self.n[21].ec[ed].e=NN then begin self.n[21].ec[ed].e:= UR;break; end;
      for ed:= UR to BR do if self.n[21].ec[ed].e=NN then begin self.n[21].ec[ed].e:= UF;break; end;
      for ed:= UR to BR do if self.n[21].ec[ed].e=NN then begin self.n[21].ec[ed].e:= UL;break; end;
      for ed:= UR to BR do if self.n[21].ec[ed].e=NN then begin self.n[21].ec[ed].e:= UB;break; end;
      for ed:= UR to BR do if self.n[21].ec[ed].e=NN then begin self.n[21].ec[ed].e:= FR;break; end;
      for ed:= UR to BR do if self.n[21].ec[ed].e=NN then begin self.n[21].ec[ed].e:= FL;break; end;
      for ed:= UR to BR do if self.n[21].ec[ed].e=NN then begin self.n[21].ec[ed].e:= BL;break; end;
      for ed:= UR to BR do if self.n[21].ec[ed].e=NN then begin self.n[21].ec[ed].e:= BR;break; end;

      for j:= 0 to 7 do  //nur 8 Symmetrien erhalten D
      begin
        EdgeMult(EdgeSym[InvIdx[j]],self.n[21].ec,prod);
        EdgeMult(prod,EdgeSym[j],self.n[0].ec);

        if DownEdgeCoordToSymDownEdgeCoord[DownEdgeCoord] and $f = 0 then
        begin
          b:= 1 shl j;
          SymState[i]:=SymState[i] or b;
        end;
      end;
    end;

    for i:=0 to 1547*1680 div 16 do downFacePrun[i]:=-1;
    i:= DownEdgeCoordToSymDownEdgeCoord[5860];//Koordinate des Zielzustandes
    i:= i shr 4;//Symmetrieteil entfernen
    SetPruningDownFace(1547*1604+i,0);//1604 downCornerCoord des Zielzustandes
    done:=1;
    depth:=-1;
    realDepth:=-1;
    while (done<>1547*1680)do
    begin
      if realdepth=6 then flipBackward:=true;//!!!!!!!noch ändern!!!!!!!!!!!!!!!!!!!!
      Inc(realDepth);
      Inc(depth);
      depth:= depth mod 3;

      for i:=0 to 1547*1680-1 do
      begin
        match:=true;//any value
        case flipBackward of
          true: match:= GetPruningDownFace(i)=3;//not occupied yet
          false: match:= GetPruningDownFace(i)=depth;
        end;
         if match then
        begin
          downCorn0:= i div 1547;
          symDownEdge0:= i mod 1547;
          downEdge0:=SymDownEdgeCoordToDownEdgeCoord[symDownEdge0];
          for m:= Ux1 to Fsx3 do   //slice moves ergänzt
          begin
            if (not useSlices) and (m=Usx1) then break;
      {$IF QTM}
                case m of
                Ux2,Rx2,Fx2,Dx2,Lx2,Bx2,Usx2,Rsx2,Fsx2:continue;
                end;
      {$IFEND}
            symDownEdge:= DownEdgeCoordToSymDownEdgeCoord[DownEdgeMove[downEdge0,m]];
            downCorn:= DownCornerMove[downCorn0,m];
            sym:= symDownEdge and 15;
            symDownEdge:= symDownEdge shr 4;
            downCornConj:= DownCornerCoordConjugate[downCorn,sym];
            index:= 1547*downCornConj+symDownEdge;

            case flipBackward of
              false:
              begin
                if GetPruningDownFace(index)=3 then
                begin
                  SetPruningDownFace(index,(depth+1) mod 3);
                  Inc(done);
                  sym:= SymState[SymDownEdge];
                  if sym<>1 then //symmetric position has many representations
                  begin
                    for j:= 1 to 7 do //nur 8 Symmetrien, die D erhalten
                    begin
                      sym:= sym shr 1;
                      if sym and 1 = 1 then
                      begin
                        altDownCorn:= DownCornerCoordConjugate[downCornConj,j];//
                        index:= 1547*altDownCorn+symDownEdge;
                        if GetPruningDownFace(index)=3 then
                        begin
                          SetPruningDownFace(index,(depth+1) mod 3);
                          Inc(done);
                        end;
                      end;
                    end;
                  end;//if
                end;
              end;
              true:
              begin
                if GetPruningDownFace(index)= depth then
                begin
                  SetPruningDownFace(i,(depth+1) mod 3);
                  Inc(done);
                    break;
                end;
              end;
            end;

          end;//for m
        end;//if match
      end;//for i
    end;//while done...


end;
//++++++++++++++++++End Create dface pruning table++++++++++++++++++++++++++++

procedure TIncomplete.BStopClick(Sender: TObject);
begin
  BStop.Enabled:=false;
  BClear.Enabled:=true;
  inco.Terminate;
  incoIsRunning:=false;
  BStopClicked:=true;
end;



procedure TIncomplete.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  if incoIsRunning then
  begin
    inco.Terminate;
    incoIsRunning:=false;
    BClear.Enabled:=true;
  end;
  ManInfo.Clear;
end;


procedure TIncomplete.BAddClick(Sender: TObject);
var i,n,mvs: Integer; isoSave: Boolean;
  fc: FaceletCube;                                                                         
  s,tmp: String;
begin
  n:= ManInfo.Lines.Count;
  if useSlices and ((manSep='q')or (manSep='sq'))then tmp:='sq';
  if not useSlices and ((manSep='q')or (manSep='sq'))then tmp:='q';
  if useSlices and ((manSep='f')or (manSep='s'))then tmp:='s';
  if not useSlices and ((manSep='f')or (manSep='s'))then tmp:='f';
  for i:= 0 to n-1 do
  begin
    If (Pos(tmp+'*)',ManInfo.Lines[i])>0) or (Pos(tmp+')',ManInfo.Lines[i])>0) then
    begin

      fc:=FaceletCube.Create(nil);//nur default Konstruktor
      s:= ManInfo.Lines[i];
      if Pos('//',s)>0 then fc.patName:=Trim(Copy(s,Pos('//',s)+2,Length(s)));//all after '   ' is patName
      if Pos('*)',s)>0 then //optimales Maneuver
      begin
        fc.optManeuver:=Copy(s,1,Pos('*)',s)+1);  //Solver speichern
        DoManeuverstring(fc,fc.InverseOptManeuver,mvs); //Diese Routine sollte immer benutzt werden!!!!
        fc.runOptimal:=true;
        fc.optLength:=mvs;
        fc.phase2Length:=MAXNODES;//we have no 2-phase maneuver yet
      end
      else
      begin
        fc.maneuver:=Copy(s,1,Pos(tmp+')',s)+Length(tmp)); //Solver speichern
        DoManeuverstring(fc,fc.InverseManeuver,mvs);
        //fc.maneuver:=fc.InverseManeuver;
        fc.phase2Length:=mvs;
      end;

      isosave:=checkIsomorphics;
      checkIsomorphics:=false;
      Form1.AddCube(fc,true,false,false,0,false);
      checkIsomorphics:=isoSave;
      fc.Free;
    end
  end;
end;



procedure TIncomplete.BClearClick(Sender: TObject);
begin
  ManInfo.Clear;
end;

procedure TIncomplete.SliceAllowedClick(Sender: TObject);
begin
  if not incoIsRunning and not messageboxpopup then
  begin
    if (Sender as TCheckBox).Checked then
    begin
      useSlices:= true;
      MFilter.Enabled:=true;
      EFilter.Enabled:=true;
      SFilter.Enabled:=true;
    end
    else
    begin
      useSlices:=false;
      MFilter.Enabled:=false;
      EFilter.Enabled:=false;
      SFilter.Enabled:=false;
    end;
  //  CreateFullCornerPruningTable(useSlices);
    Form1.SetUpProgressBar(0,100,'');
    Form1.ProgressBar.Show;
    Form1.ProgressBar.Position:=50;
    ReloadTables;
    Form1.ProgressBar.Position:=100;
  end
  else
  begin
     if incoIsrunning and not messageboxpopup then
     begin
       Application.Messagebox('Stop the running search before switching slice mode!','', MB_OK);
       messageboxpopup:=true;
       (Sender as TCheckBox).Checked:= not (Sender as TCheckBox).Checked;
     end
     else if messageboxpopup then messageboxpopup:= false;
  end;

end;


procedure TIncomplete.FormCreate(Sender: TObject);
begin
  BStopClicked:=false;
end;

end.
