unit Search;

interface

uses CubeDefs,Symmetries,CordCube,graphics,classes;
{$IF not QTM}
const MAXNODES = 31;
{$ELSE}
const MAXNODES = 40;
{$IFEND}

type
//+++++++++++++++Node in search tree++++++++++++++++++++++++++++++++++++++++++++
  Node = record
    axis:TurnAxis;
    power,UDIdx,UDSym,UDTwist,RLIdx,
    RLSym,RLTwist,FBIdx,FBSym,FBTwist: Integer;
    UDPrun,RLPrun,FBPrun:Integer;

    UDSliceSorted,RLSliceSorted,FBSliceSorted,
    edge8Pos,cornPos: Integer;//phase2 coordinates
    parityEven: Boolean;//used in QTM

    UDSliceSortedSymIdx,RLSliceSortedSymIdx,FBSliceSortedSymIdx,
    UDSliceSortedSymSym,RLSliceSortedSymSym,FBSliceSortedSymSym : Integer;
    UDPrunBig,RLPrunBig,FBPrunBig:Integer;
    UDFlip,RLFlip,FBFlip:Integer;

    UDTetra,RLTetra,FBTetra:Integer;
    UDCenTwist,RLCenTwist,FBCenTwist:Integer;//for oriented Cubes
    UDCentRFLBMod2Twist,RLCentRFLBMod2Twist,FBCentRFLBMod2Twist:Integer;

    //UDSlice,RLSlice,FBSlice: Integer;
    nodenum: Int64;//Anzahl der Züge, um diese Tiefe zu vollenden
    {$IF QTM}
    virtualmove: Boolean;//true wenn in Phase2 in Zug R,F,L,B,Rs,Fs ausgeführt wird
    {$IFEND}
  end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++++++++IDA object does the search+++++++++++++++++++++++++++++++++++++
  IDA = class(TThread)
  public
    n: array[0..MAXNODES] of Node;//30 moves suffice!
    nodeCount: Int64;
    sym: Int64;//Symmetries of the cube
    depth,depth2,maxLength,inValid,returnLength: Integer;
    runOptimal,runCoset,isOriented:Boolean;
    constructor Create(cc:CoordCube);overload;
    constructor Create(ia:Ida);overload;
    function Next2PhaseSolution:Integer;
    function NextSolution(maxLen:Integer):Integer;
    procedure NextPhase2Id;
    function IsIdCube:Boolean;
 //   function ExploreCoset: Integer;
//    procedure SetBit;
//    procedure PreScanNextLevel;

    function SolverString:String;

    procedure Execute; override;//for the thread
  end;

var GetPruningLength: array [0..18,0..2] of Integer;
procedure CreateGetPruningLengthTable;


implementation

uses RubikMain,CubiCube,SysUtils,Windows,CosetExp,InComp;


//+++++++++++create an IDA-object from a cube on coordinate level+++++++++++++++
constructor IDA.Create(cc: CoordCube);
begin

  inherited Create(true);//thread issues
  Priority:=tpLower;
  if Form1.FreeThreadsonTerminate1.Checked then FreeOnTerminate:= true;

  isOriented:=cc.isOriented;

  n[0].UDIdx:= cc.flipUDSlice.n;//initialize node
  n[0].UDSym:= cc.flipUDSlice.s;
  n[0].RLIdx:= cc.flipRLSlice.n;
  n[0].RLSym:= cc.flipRLSlice.s;
  n[0].FBIdx:= cc.flipFBSlice.n;
  n[0].FBSym:= cc.flipFBSlice.s;

  if isOriented then
  begin
    n[0].UDPrun:= cc.GetCentPrun(0);
    n[0].RLPrun:= cc.GetCentPrun(1);
    n[0].FBPrun:= cc.GetCentPrun(2);
  end
  else
  begin
    n[0].UDPrun:= cc.GetPrun(0);
    n[0].RLPrun:= cc.GetPrun(1);
    n[0].FBPrun:= cc.GetPrun(2);
  end;

  n[0].UDTwist:=cc.UDTwist;
  n[0].RLTwist:=cc.RLTwist;
  n[0].FBTwist:=cc.FBTwist;
  n[0].axis:=U;
  n[0].power:=0;
  {$IF QTM}
  n[0].virtualmove:=false;//in Phase 1 gibt es keine virtual moves
  {$IFEND}
  depth:= 0;
  depth2:= 0;//in case we use two phase algorithm
  nodeCount:= 0;
  sym:=cc.sym;
  inValid:=0;


  maxLength:=MAXNODES;

  returnLength:=-1;
  runOptimal:=false;//use two phase algorithm as default

  n[0].cornPos:= cc.cornPos;
  n[0].UDSliceSorted:=cc.UDSliceSorted;
  n[0].RLSliceSorted:=cc.RLSliceSorted;
  n[0].FBSliceSorted:=cc.FBSliceSorted;

//big solver coordinates
{$IF UHUGE}
  if USES_BIG then
  begin
    n[0].UDPrunBig:= cc.GetPrunUBig(0);
    n[0].RLPrunBig:= cc.GetPrunUBig(1);
    n[0].FBPrunBig:= cc.GetPrunUBig(2);
    n[0].UDTetra:= cc.UDTetra;
    n[0].RLTetra:= cc.RLTetra;
    n[0].FBTetra:= cc.FBTetra;
  end;
{$ELSE}
  n[0].UDSliceSortedSymIdx:=cc.UDSliceSortedSym.n;
  n[0].RLSliceSortedSymIdx:=cc.RLSliceSortedSym.n;
  n[0].FBSliceSortedSymIdx:=cc.FBSliceSortedSym.n;
  n[0].UDSliceSortedSymSym:=cc.UDSliceSortedSym.s;
  n[0].RLSliceSortedSymSym:=cc.RLSliceSortedSym.s;
  n[0].FBSliceSortedSymSym:=cc.FBSliceSortedSym.s;

  n[0].UDFlip:=cc.UDFlip;
  n[0].RLFlip:=cc.RLFlip;
  n[0].FBFlip:=cc.FBFlip;
  if USES_BIG then
  begin
    n[0].UDPrunBig:= cc.GetPrunBig(0);
    n[0].RLPrunBig:= cc.GetPrunBig(1);
    n[0].FBPrunBig:= cc.GetPrunBig(2);
  end;
{$IFEND}

  n[0].UDCenTwist:= cc.UDCenTwist;//for oriented Cubes
  n[0].RLCenTwist:= cc.RLCenTwist;
  n[0].FBCenTwist:= cc.FBCenTwist;
//  n[0].UDSlice:= cc.UDSlice;
//  n[0].RLSlice:= cc.RLSlice;
//  n[0].FBSlice:= cc.FBSlice;
  n[0].UDCentRFLBMod2Twist:=cc.UDCentRFLBMod2Twist;
  n[0].RLCentRFLBMod2Twist:=cc.RLCentRFLBMod2Twist;
  n[0].FBCentRFLBMod2Twist:=cc.FBCentRFLBMod2Twist;

  n[0].parityEven:= cc.parityEven;
end;
//+++++++End create IDA-object from cube on coordinate level++++++++++++++++++++

//+++++++++++++++++++find next solution of optimal solver+++++++++++++++++++++++


function IDA.NextSolution(maxLen: Integer):Integer;
var np,np1,np2: ^Node;
    x,r_depth,i,j,k,fixNum: Integer;
    m,m1: Move;
    ax: TurnAxis;
    t_sym:Int64;
label incPower,turn,right,incAxis,checkNeighbourAxis,left,ende;
begin
  PostMessage(Form1.Handle,WM_NEXTLEVEL,Integer(self),depth+1);
  maxLength:=maxLen;
  np:= @n[depth];
  r_depth:=0; //r_depth zählt die noch zu besetzenden freien Felder rechts (mit wachsendem Index)

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
    if slicemode and  (np1^.axis<=F) and (np^.axis=Turnaxis(Ord(np1^.axis)+3))
    and (np1^.power + np^.power = 4) then goto incPower;//kein UD', U2D2, U'D etc wenn slices
  end;

turn:
  np1:=np;
  Inc(np1);
  Inc(NodeCount);
  {$IF QTM}
  np1^.parityEven:= not np^.parityEven;
  {$IFEND}
  m:= Move(3*Ord(np^.axis) + np^.power - 1);

{$IF  UHUGE} //UltraHuge Solver
  if USES_BIG and not isOriented then   //Ultrabig Solver  für orientierte Cubes lansamer als Standard
  begin

    if isOriented then
    begin
      np1^.UDCentRFLBMod2Twist:= CentOriRFLBMod2Move[np^.UDCentRFLBMod2Twist,m];
    end;

    np1^.UDTwist:= TwistMove[np^.UDTwist,m];
    np1^.UDTetra:= TetraMove[np^.UDTetra,m];
    x:= flipSliceMove[np^.UDIdx,Ord(SymMove[np^.UDSym,m])];
    np1^.UDSym:=SymMult[x and 15,np^.UDSym];
    np1^.UDIdx:= x shr 4;

    m:= SymMove[16,m];

   if isOriented then
    begin
      np1^.RLCentRFLBMod2Twist:= CentOriRFLBMod2Move[np^.RLCentRFLBMod2Twist,m];
    end;

    np1^.RLTwist:= TwistMove[np^.RLTwist,m];
    np1^.RLTetra:= TetraMove[np^.RLTetra,m];
    x:= flipSliceMove[np^.RLIdx,Ord(SymMove[np^.RLSym,m])];
    np1^.RLSym:=SymMult[x and 15,np^.RLSym];
    np1^.RLIdx:= x shr 4;

    m:= SymMove[16,m];


    np1^.FBTwist:= TwistMove[np^.FBTwist,m];
    np1^.FBTetra:= TetraMove[np^.FBTetra,m];
    x:= flipSliceMove[np^.FBIdx,Ord(SymMove[np^.FBSym,m])];
    np1^.FBSym:=SymMult[x and 15,np^.FBSym];
    np1^.FBIdx:= x shr 4;


   if isOriented then
    begin
      np1^.FBCentRFLBMod2Twist:= CentOriRFLBMod2Move[np^.FBCentRFLBMod2Twist,m];
    end;

    np1^.UDPrunBig:= GetPruningLength[np^.UDPrunBig,GetPruningUBigP(2187*np1^.UDIdx +
    TwistConjugate[np1^.UDTwist,np1^.UDSym],@PruningUBigP[TetraConjugate[np1^.UDTetra,np1^.UDSym]])];

    np1^.RLPrunBig:= GetPruningLength[np^.RLPrunBig,GetPruningUBigP(2187*np1^.RLIdx +
     TwistConjugate[np1^.RLTwist,np1^.RLSym],@PruningUBigP[TetraConjugate[np1^.RLTetra,np1^.RLSym]])];

    np1^.FBPrunBig:= GetPruningLength[np^.FBPrunBig,GetPruningUBigP(2187*np1^.FBIdx
    + TwistConjugate[np1^.FBTwist,np1^.FBSym],@PruningUBigP[TetraConjugate[np1^.FBTetra,np1^.FBSym]])];

    if isOriented then
    begin
    np1^.UDPrun:= GetPruningLength[np^.UDPrun,GetPruningCentP((Int64(np1^.UDIdx)*16+
      CentOriRFLBMod2Conjugate[np1^.UDCentRFLBMod2Twist,np1^.UDSym])*2187+
      TwistConjugate[np1^.UDTwist,np1^.UDSym])];

    np1^.RLPrun:= GetPruningLength[np^.RLPrun,GetPruningCentP((Int64(np1^.RLIdx)*16+
      CentOriRFLBMod2Conjugate[np1^.RLCentRFLBMod2Twist,np1^.RLSym])*2187+
      TwistConjugate[np1^.RLTwist,np1^.RLSym])];

    np1^.FBPrun:= GetPruningLength[np^.FBPrun, GetPruningCentP((Int64(np1^.FBIdx)*16+
      CentOriRFLBMod2Conjugate[np1^.FBCentRFLBMod2Twist,np1^.FBSym])*2187+
      TwistConjugate[np1^.FBTwist,np1^.FBSym])];
    end;


    if not Terminated then
    begin
 {$IF QTM}
      if (not slicemode) and not (Odd(r_depth) xor np1^.parityEven) then goto incAxis;//im slicemode ändern manche Züge nicht die Parität der Ecken!
 {$IFEND}

//Es kann gefolgert werden, dass der Pruningwert eins höher ist, wenn alle gleich sind.
      if (r_depth>0) and (np1^.UDPrunBig=np1^.RLPrunBig)
                     and (np1^.RLPrunBig=np1^.FBPrunBig) then
      begin
      {$IF not QTM}
        if (np1^.UDPrunBig>r_depth)  then goto incAxis;
        if (np1^.UDPrunBig>r_depth-1)  then goto incPower;
      end;
      if (np1^.UDPrunBig>r_depth+1) or (np1^.RLPrunBig>r_depth+1) or (np1^.FBPrunBig>r_depth+1) then goto incAxis;
      if (np1^.UDPrunBig>r_depth) or (np1^.RLPrunBig>r_depth) or (np1^.FBPrunBig>r_depth) then goto incPower;
      {$ELSE}
        if (np1^.UDPrunBig>r_depth+1)  then goto incAxis; //QTM r_depth+1
        if (np1^.UDPrunBig>r_depth-1)  then goto incPower;
      end;
      if (np1^.UDPrunBig>r_depth+2) or (np1^.RLPrunBig>r_depth+2) or (np1^.FBPrunBig>r_depth+2) then goto incAxis; //QTM r_depth+2
      if (np1^.UDPrunBig>r_depth) or (np1^.RLPrunBig>r_depth) or (np1^.FBPrunBig>r_depth) then goto incPower;
      {$IFEND}

      if isOriented then //solte dass nicht besser in die terminated Schleife?
        if (np1^.UDPrun>r_depth) or (np1^.RLPrun>r_depth) or (np1^.FBPrun>r_depth) then goto incPower;
    end;

  {$ELSE} //Huge Solver
  if USES_BIG and not isOriented then //auch nicht für oriented cubes
  begin
    np1^.UDTwist:= TwistMove[np^.UDTwist,m];
    x:= UDSliceSortedSymMove[np^.UDSliceSortedSymIdx,SymMove[np^.UDSliceSortedSymSym,m]];
    np1^.UDSliceSortedSymSym:=SymMult[x and 15,np^.UDSliceSortedSymSym];
    np1^.UDSliceSortedSymIdx:= x shr 4;
    np1^.UDFlip:= FlipMove[np^.UDFlip,m];

    m:= SymMove[16,m];

    np1^.RLTwist:= TwistMove[np^.RLTwist,m];
    x:= UDSliceSortedSymMove[np^.RLSliceSortedSymIdx,SymMove[np^.RLSliceSortedSymSym,m]];
    np1^.RLSliceSortedSymSym:=SymMult[x and 15,np^.RLSliceSortedSymSym];
    np1^.RLSliceSortedSymIdx:= x shr 4;
    np1^.RLFlip:= FlipMove[np^.RLFlip,m];

    m:= SymMove[16,m];

    np1^.FBTwist:= TwistMove[np^.FBTwist,m];
    x:= UDSliceSortedSymMove[np^.FBSliceSortedSymIdx,SymMove[np^.FBSliceSortedSymSym,m]];
    np1^.FBSliceSortedSymSym:=SymMult[x and 15,np^.FBSliceSortedSymSym];
    np1^.FBSliceSortedSymIdx:= x shr 4;
    np1^.FBFlip:= FlipMove[np^.FBFlip,m];

    np1^.UDPrunBig:= GetPruningLength[np^.UDPrunBig,
    GetPruningBigP((Int64(np1^.UDSliceSortedSymIdx)*2048+
    FlipConjugate[np1^.UDFlip,np1^.UDSliceSortedSymSym,np1^.UDSliceSortedSymIdx])*2187+
    TwistConjugate[np1^.UDTwist,np1^.UDSliceSortedSymSym])];

    np1^.RLPrunBig:= GetPruningLength[np^.RLPrunBig,
    GetPruningBigP((Int64(np1^.RLSliceSortedSymIdx)*2048+
    FlipConjugate[np1^.RLFlip,np1^.RLSliceSortedSymSym,np1^.RLSliceSortedSymIdx])*2187+
    TwistConjugate[np1^.RLTwist,np1^.RLSliceSortedSymSym])];

    np1^.FBPrunBig:= GetPruningLength[np^.FBPrunBig,
    GetPruningBigP((Int64(np1^.FBSliceSortedSymIdx)*2048+
    FlipConjugate[np1^.FBFlip,np1^.FBSliceSortedSymSym,np1^.FBSliceSortedSymIdx])*2187+
    TwistConjugate[np1^.FBTwist,np1^.FBSliceSortedSymSym])];

    if not Terminated then
    begin
 {$IF QTM}
      if (not slicemode) and not (Odd(r_depth) xor np1^.parityEven) then goto incAxis;//im slicemode ändern manche Züge nicht die Parität der Ecken!
 {$IFEND}
//if we do the three possible moves on some fixed face in FTM, the three pruning value
//can only differ by 1

//Wie beim Huge Solver kann gefolgert werden, dass der Pruning
//Wert eins höher ist, wenn alle gleich sind.
      if (r_depth>0) and (np1^.UDPrunBig=np1^.RLPrunBig)
                     and (np1^.RLPrunBig=np1^.FBPrunBig) then
      begin
      {$IF not QTM}
        if (np1^.UDPrunBig>r_depth)  then goto incAxis;
        if (np1^.UDPrunBig>r_depth-1)  then goto incPower;
      end;
      if (np1^.UDPrunBig>r_depth+1) or (np1^.RLPrunBig>r_depth+1) or (np1^.FBPrunBig>r_depth+1) then goto incAxis;
      if (np1^.UDPrunBig>r_depth) or (np1^.RLPrunBig>r_depth) or (np1^.FBPrunBig>r_depth) then goto incPower;
      {$ELSE}
        if (np1^.UDPrunBig>r_depth+1)  then goto incAxis; //QTM r_depth+1
        if (np1^.UDPrunBig>r_depth-1)  then goto incPower;
      end;
      if (np1^.UDPrunBig>r_depth+2) or (np1^.RLPrunBig>r_depth+2) or (np1^.FBPrunBig>r_depth+2) then goto incAxis; //QTM r_depth+2
      if (np1^.UDPrunBig>r_depth) or (np1^.RLPrunBig>r_depth) or (np1^.FBPrunBig>r_depth) then goto incPower;
      {$IFEND}

    end;
    {$IFEND} //Huge Optimal Solver
  end
  else//standard optimal solver, löst auch oriented cubes
  begin

    if isOriented then
    begin

      np1^.UDSliceSorted:= UDSliceSortedMove[np^.UDSliceSorted,m];//für das Pruning aus UDSliceSorted und UDcenTwist 11880*4096
      np1^.UDcenTwist:= CentOriMove[np^.UDcenTwist,m];

      np1^.UDTwist:= TwistMove[np^.UDTwist,m];
      np1^.UDCentRFLBMod2Twist:= CentOriRFLBMod2Move[np^.UDCentRFLBMod2Twist,m];

      x:= flipSliceMove[np^.UDIdx,Ord(SymMove[np^.UDSym,m])];//wird für das Pruning aus flipslice, twist und centrflbMod2 gebraucht
      np1^.UDSym:=SymMult[x and 15,np^.UDSym];
      np1^.UDIdx:= x shr 4;

      m:= SymMove[16,m];

      np1^.RLSliceSorted:= UDSliceSortedMove[np^.RLSliceSorted,m];
      np1^.RLcenTwist:= CentOriMove[np^.RLcenTwist,m];

      np1^.RLTwist:= TwistMove[np^.RLTwist,m];
      np1^.RLCentRFLBMod2Twist:= CentOriRFLBMod2Move[np^.RLCentRFLBMod2Twist,m];

      x:= flipSliceMove[np^.RLIdx,Ord(SymMove[np^.RLSym,m])];
      np1^.RLSym:=SymMult[x and 15,np^.RLSym];
      np1^.RLIdx:= x shr 4;

      m:= SymMove[16,m];

      np1^.FBSliceSorted:= UDSliceSortedMove[np^.FBSliceSorted,m];
      np1^.FBcenTwist:= CentOriMove[np^.FBcenTwist,m];

      np1^.FBTwist:= TwistMove[np^.FBTwist,m];
      np1^.FBCentRFLBMod2Twist:= CentOriRFLBMod2Move[np^.FBCentRFLBMod2Twist,m];

      x:= flipSliceMove[np^.FBIdx,Ord(SymMove[np^.FBSym,m])];
      np1^.FBSym:=SymMult[x and 15,np^.FBSym];
      np1^.FBIdx:= x shr 4;

      np1^.UDPrun:= GetPruningLength[np^.UDPrun,
      GetPruningCentP((Int64(np1^.UDIdx)*16+
      CentOriRFLBMod2Conjugate[np1^.UDCentRFLBMod2Twist,np1^.UDSym])*2187+
      TwistConjugate[np1^.UDTwist,np1^.UDSym])];

      np1^.RLPrun:= GetPruningLength[np^.RLPrun,
      GetPruningCentP((Int64(np1^.RLIdx)*16+
      CentOriRFLBMod2Conjugate[np1^.RLCentRFLBMod2Twist,np1^.RLSym])*2187+
      TwistConjugate[np1^.RLTwist,np1^.RLSym])];

      np1^.FBPrun:= GetPruningLength[np^.FBPrun,
      GetPruningCentP((Int64(np1^.FBIdx)*16+
      CentOriRFLBMod2Conjugate[np1^.FBCentRFLBMod2Twist,np1^.FBSym])*2187+
      TwistConjugate[np1^.FBTwist,np1^.FBSym])];
    end
    else
    begin
      np1^.UDTwist:= TwistMove[np^.UDTwist,m];
      x:= flipSliceMove[np^.UDIdx,Ord(SymMove[np^.UDSym,m])];
      np1^.UDSym:=SymMult[x and 15,np^.UDSym];
      np1^.UDIdx:= x shr 4;

      m:= SymMove[16,m];

      np1^.RLTwist:= TwistMove[np^.RLTwist,m];
      x:= flipSliceMove[np^.RLIdx,Ord(SymMove[np^.RLSym,m])];
      np1^.RLSym:=SymMult[x and 15,np^.RLSym];
      np1^.RLIdx:= x shr 4;

      m:= SymMove[16,m];

      np1^.FBTwist:= TwistMove[np^.FBTwist,m];
      x:= flipSliceMove[np^.FBIdx,Ord(SymMove[np^.FBSym,m])];
      np1^.FBSym:=SymMult[x and 15,np^.FBSym];
      np1^.FBIdx:= x shr 4;

      np1^.UDPrun:= GetPruningLength[np^.UDPrun,GetPruningP(2187*np1^.UDIdx + TwistConjugate[np1^.UDTwist,np1^.UDSym])];
      np1^.RLPrun:= GetPruningLength[np^.RLPrun,GetPruningP(2187*np1^.RLIdx + TwistConjugate[np1^.RLTwist,np1^.RLSym])];
      np1^.FBPrun:= GetPruningLength[np^.FBPrun,GetPruningP(2187*np1^.FBIdx + TwistConjugate[np1^.FBTwist,np1^.FBSym])];
    end;


    if not Terminated then

    begin
 {$IF QTM}
      if (not slicemode) and not (Odd(r_depth) xor np1^.parityEven) then goto incAxis;//im slicemode ändern manche Züge nicht die Parität der Ecken!
 {$IFEND}
//Wie beim Huge Solver kann gefolgert werden, dass der Pruning
//Wert eins höher ist, wenn alle gleich sind.
      if (r_depth>0) and (np1^.UDPrun=np1^.RLPrun)
                     and (np1^.RLPrun=np1^.FBPrun) then
      begin
      {$IF not QTM}
        if (np1^.UDPrun>r_depth)  then goto incAxis;
        if (np1^.UDPrun>r_depth-1)  then goto incPower;
      end;
      if (np1^.UDPrun>r_depth+1) or (np1^.RLPrun>r_depth+1) or (np1^.FBPrun>r_depth+1) then goto incAxis;
      if (np1^.UDPrun>r_depth) or (np1^.RLPrun>r_depth) or (np1^.FBPrun>r_depth) then goto incPower;
      {$ELSE}
        if (np1^.UDPrun>r_depth+1)  then goto incAxis; //QTM r_depth+1
        if (np1^.UDPrun>r_depth-1)  then goto incPower;
      end;
      if (np1^.UDPrun>r_depth+2) or (np1^.RLPrun>r_depth+2) or (np1^.FBPrun>r_depth+2) then goto incAxis; //QTM r_depth+2
      if (np1^.UDPrun>r_depth) or (np1^.RLPrun>r_depth) or (np1^.FBPrun>r_depth) then goto incPower;
      {$IFEND}
    end;

    if isOriented then //solte dass nicht besser in die terminated Schleife?
    begin
      if (PruningCenTwistUDSliceSorted[np1^.UDSliceSorted shl 12 +np1^.UDcenTwist]>r_depth) then goto incPower;
      if (PruningCenTwistUDSliceSorted[np1^.RLSliceSorted shl 12 +np1^.RLcenTwist]>r_depth) then goto incPower;
      if (PruningCenTwistUDSliceSorted[np1^.FBSliceSorted shl 12 +np1^.FBcenTwist]>r_depth)then goto incPower;
    end;

  end;//standard Solver


  //Symmetriecheck machen!
  if (sym>1) and (depth - r_depth<=2) then //statt 3 kann man auch anderes nehmen
  begin
    fixNum:= depth - r_depth;
    t_sym:=sym;
    for i:= 1 to 47 do //Fall 0 uninteressant
    begin
      t_sym:= t_sym shr 1;
      if not odd(t_sym) then continue;
      np1:=np;
//zunächst mal die Bilder berechnen
      for j:=fixNum downto 0 do Dec(np1);

      //Züge werden verworfen, wenn die lex. Ordnung einer Transformation kleiner ist.
      //Die Reihenfolge für parallele Achsen kann durch die  Transf. vertauscht sein, das erhöht aber
      //immer die lex. Ordnung. Es kann also höchstens passieren, dass ein Zug nicht
      //verworfen wird, obwohl es möglich wäre.
      //Man kann sich klarmachen, dass man nicht nur die Potenz, sondern immer
      //auch die Achse (zumindest in FTM) verwerfen kann!
      //Der lex. Unterschied ist immer! in der letzten Stelle, falls die Transf. kleiner,
      //sonst wäre er ja schon vorher erkannt worden.
      //Dann ist die Achse des Bildes kleiner oder die Potenz, falls die Achse die
      //gleiche ist. Dann kommt aber nur x^3 -> x^1 in Frage, und dann wird die Achse
      //im nächsten Zug sowieso erhöht.
      for j:= 0 to fixNum do
      begin
        Inc(np1);
         m:= Move(3*Ord(np1^.axis) + np1^.power-1);
         m1:= SymMove[i,m];
      if  m1 < m then                                                 ///////////////////////////////////////////////
        goto  incAxis  //kleiner, verwerfen
             else if m1 > m then break;//größer
        //bei Gleichheit nächste Stelle untersuchen
      end;
    end;//i
  end;//if sym>1
//Ende Symmetriecheck

  if (r_depth=0) then
  begin
    if Terminated then
    begin
      returnLength:=-2;
      Result:=returnLength; //abort
      goto ende;
    end;
  {$IF SPECIAL4}
    if depth>12 then //bei 13 ist maximale Länge 14
    begin
      returnLength:=0;
      Result:=returnLength; //abort
      goto ende;
    end;
   {$IFEND}




    if (not IsIdCube) then goto incPower;
      returnLength:=depth+1;
      Result:=returnLength; //solution
          n[depth+1].nodenum:=nodecount;
      PostMessage(Form1.Handle,WM_NEXTLEVEL,Integer(self),depth+100);//TForm1.ShowNextLevel
    goto ende;
  end;
right:
  Dec(r_depth);
  Inc(np); np^.axis:= U;
  goto checkNeighbourAxis;

incAxis:
//  if np^.axis=B then goto left;
//  Inc(np^.axis);

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  if (not sliceMode and (np^.axis=B)) or (np^.axis=Fs) then goto left;
  Inc(np^.axis);
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



checkNeighbourAxis:
  if depth<>r_depth then //else no left neighbour
  begin
    np1:=np; Dec(np1);
    {$IF not QTM}
    if (np^.axis=np1^.axis) then goto incAxis;//in FTM no successive moves with same axis
    {$ELSE}
    if (np^.axis= np1^.axis) and (np1^.power = 3) then goto incAxis;//In QTM only X*X, not X'*X
    np2:=np1;Dec(np2);
    if (depth-r_depth>1) and //else no neighbour left of left neighbour
       (np^.axis= np1^.axis) and (np^.axis=np2^.axis) then goto incAxis;
         //in QTM not three successive moves with same axis
    {$IFEND}
    if np^.axis<=F then
    if TurnAxis(Ord(np^.axis)+3)=np1^.axis then goto incAxis;//no D*U, L*R etc.
    //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    if sliceMode then
    begin
      if np^.axis<=F then
      if TurnAxis(Ord(np^.axis)+6)=np1^.axis then goto incAxis;//no Us*U, Rs*R etc.
      if np^.axis<=B then
      if TurnAxis(Ord(np^.axis)+3)=np1^.axis then goto incAxis;//no Us*D, Rs*L etc.
                                                               //D*U, L*R already done
      if np^.axis>=Us then
      if TurnAxis(Ord(np^.axis)- 3)=np1^.axis then goto incAxis;//no D*Us, L*Rs etc.
      if np^.axis>=Us then
      if TurnAxis(Ord(np^.axis)- 6)=np1^.axis then goto incAxis;//no U*Us, R*Rs et.
    end;
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  end;

// np^.power:=1;//all checks ok
// goto turn;
 np^.power:=0;//all checks ok
 goto incpower;

left:
  if depth = r_depth then//depth is incremented
  begin
    if depth=maxLength-1 then
    begin
      Result:=-1;
      goto ende
    end;
    Inc(depth);Inc(r_depth);
    n[depth].nodenum:=nodecount;
    PostMessage(Form1.Handle,WM_NEXTLEVEL,Integer(self),depth+1);//Communicate

    np^.axis:=U;
    np^.power:=1;
    goto turn;
  end
  else
  begin
    Dec(np);
    Inc(r_depth);
    if inValid>depth-r_depth then inValid:=depth-r_depth;
    goto incPower;
  end;
ende:
end;
//++++++++++++++++End find next solution of optimal solver+++++++++++++++++++++++

//++++++++++++++++Check if the Phase 1 solution is a solved cube++++++++++++++++
function IDA.IsIdCube: Boolean;
var i: Integer;
    m:Move;
    np: ^Node;

begin

  if isOriented then //dann wird im Augenblick nur der Standardsolver verwendet, da die großen nichts bringen
  begin
    for i:=invalid to depth do
    begin
      m:= Move(3*Ord(n[i].axis) + n[i].power - 1);

 //     n[i+1].UDcenTwist:= CentOriMove[n[i].UDcenTwist,m]; //beim Standard Solver nicht nötig

      n[i+1].cornPos:=CornPermMove[n[i].cornPos,m];

 //     n[i+1].UDSliceSorted:=UDSliceSortedMove[n[i].UDSliceSorted,m]; //wird beim Standardsolver mit Orientierung mitgeführt
 //     m:= SymMove[16,m];
 //     n[i+1].RLSliceSorted:=UDSliceSortedMove[n[i].RLSliceSorted,m];
 //     m:= SymMove[16,m];
 //     n[i+1].FBSliceSorted:=UDSliceSortedMove[n[i].FBSliceSorted,m];
    end;
  end
  else
  begin
    for i:=invalid to depth do
    begin
      m:= Move(3*Ord(n[i].axis) + n[i].power - 1);

      n[i+1].cornPos:=CornPermMove[n[i].cornPos,m];

      n[i+1].UDSliceSorted:=UDSliceSortedMove[n[i].UDSliceSorted,m]; //Nötig bei Standardsolver ohne Orientierung und beim UHUGE solver
      m:= SymMove[16,m];
      n[i+1].RLSliceSorted:=UDSliceSortedMove[n[i].RLSliceSorted,m];
      m:= SymMove[16,m];
      n[i+1].FBSliceSorted:=UDSliceSortedMove[n[i].FBSliceSorted,m];
    end;
  end;


  inValid:=depth;
  np:= @n[depth+1];
  if  (np^.cornPos=0) and (np^.UDSliceSorted=0)and  (np^.RLSliceSorted=0) and (np^.FBSliceSorted=0)
 then Result:=True
 else Result:=False;
  // if isOriented and (np^.UDCenTwist<>0) then Result:=False;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++Find next solution for Two-Phase-Algorithm++++++++++++++++++++

{$IF not QTM}
function IDA.Next2PhaseSolution: Integer;

var np,np1,np2: ^Node;
    x,r_depth: Integer;
    m: Move;
label incPower,turn,right,incAxis,checkNeighbourAxis,left,ende,phase2;
begin
 np:= @n[depth];
 r_depth:=0;
incPower:
  Inc(np^.power);
  if (np^.power>3) then goto incAxis;
  if sliceMode and (depth<>r_depth) then //else no left neighbour
  begin
    np1:=np;Dec(np1);
    if  (np1^.axis<=F) and (np^.axis=Turnaxis(Ord(np1^.axis)+3))
    and (np1^.power + np^.power = 4) then goto incPower;// goto incAxis; //kein UD', U2D2, U'D etc wenn slices
  end;

turn:
  np1:=np;
  Inc(np1);
  Inc(NodeCount);

  m:= Move(3*Ord(np^.axis) + np^.power - 1);

 // np1^.cenTwist:= CentOriMove[np^.cenTwist,m];

  if isOriented then
  begin
    np1^.UDTwist:= TwistMove[np^.UDTwist,m];
    np1^.UDCentRFLBMod2Twist:= CentOriRFLBMod2Move[np^.UDCentRFLBMod2Twist,m];
    x:= flipSliceMove[np^.UDIdx,Ord(SymMove[np^.UDSym,m])];
    np1^.UDSym:=SymMult[x and 15,np^.UDSym];
    np1^.UDIdx:= x shr 4;

    np1^.UDPrun:= GetPruningLength[np^.UDPrun,
      GetPruningCentP((Int64(np1^.UDIdx)*16+
      CentOriRFLBMod2Conjugate[np1^.UDCentRFLBMod2Twist,np1^.UDSym])*2187+
      TwistConjugate[np1^.UDTwist,np1^.UDSym])];
  end
  else
  begin
    np1^.UDTwist:= TwistMove[np^.UDTwist,m];
    x:= flipSliceMove[np^.UDIdx,Ord(SymMove[np^.UDSym,m])];
    np1^.UDSym:=SymMult[x and 15,np^.UDSym];
    np1^.UDIdx:= x shr 4;

    np1^.UDPrun:= GetPruningLength[np^.UDPrun,GetPruningP(2187*np1^.UDIdx + TwistConjugate[np1^.UDTwist,np1^.UDSym])];
  end;
  if (np1^.UDPrun>r_depth+1) then goto incAxis;
  if (np1^.UDPrun>r_depth) or (( np1^.UDPrun=0) and (r_depth>0)) then goto incPower;
  //we deny phase2 states within phase1, so maybe we loose the best solution
  //if (np1^.UDPrun>r_depth) then goto incPower;    //Version, die auch Phase2 states erlaubt!
 //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// if sliceMode and (depth<>r_depth) then //else no left neighbour
//  begin
//    np2:=np;Dec(np2);
//    if  (np2^.axis<=F) and (np^.axis=Turnaxis(Ord(np2^.axis)+3))
//    and (np2^.power + np^.power = 4) then
//       goto incPower;// goto incAxis; //kein UD', U2D2, U'D etc wenn slices
//  end;
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


  if (r_depth=0) then
  begin
phase2:

    if Terminated then
    begin
      returnLength:=-2;
      Result:=returnLength;
      goto ende;
    end;


  //returnLength:=depth+1;Result:=depth+1; goto ende;


    NextPhase2ID;


    case depth2 of
      -2: goto incPower;
      -3: goto incAxis;
      -4: goto left;
    end;

    if (depth=0) and (depth2=0) and (n[0].axis=U) and (n[0].power=1)
    and (n[1].axis=U) and (n[1].power=3) then // in case of Id cube
    begin
      returnLength:=2;
      Result:=2;
      goto ende;
    end;
// we do not allow UU,RR,FF,DU,DD,LL,LR,BB,BF between phase1 and 2
    if depth2>=0 then
    begin
      if n[depth].axis=n[depth+1].axis then goto incPower;
      if Ord(n[depth].axis)= Ord(n[depth+1].axis)+3 then goto incPower;
    end;

    returnLength:=depth+depth2+2;
    Result:=returnLength; //solution
    goto ende;
  end;
right:
  Dec(r_depth);
  Inc(np); np^.axis:= U;
  goto checkNeighbourAxis;

incAxis:
//  if np^.axis=B then goto left;
//  Inc(np^.axis);

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  if (not sliceMode and (np^.axis=B)) or (np^.axis=Fs) then goto left;
  Inc(np^.axis);
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


checkNeighbourAxis:
  if depth<>r_depth then //else no left neighbour
  begin
    np1:=np; Dec(np1);
    if (np^.axis=np1^.axis) then goto incAxis;//in FTM no successive moves with same axis
    if np^.axis<=F then
    if TurnAxis(Ord(np^.axis)+3)=np1^.axis then goto incAxis;//no D*U, L*R etc.
    //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    if sliceMode then
    begin
      if np^.axis<=F then
      if TurnAxis(Ord(np^.axis)+6)=np1^.axis then goto incAxis;//no Us*U, Rs*R etc.
      if np^.axis<=B then
      if TurnAxis(Ord(np^.axis)+3)=np1^.axis then goto incAxis;//no Us*D, Rs*L etc.
                                                               //D*U, L*R already done
      if np^.axis>=Us then
      if TurnAxis(Ord(np^.axis)- 3)=np1^.axis then goto incAxis;//no D*Us, L*Rs etc.
      if np^.axis>=Us then
      if TurnAxis(Ord(np^.axis)- 6)=np1^.axis then goto incAxis;//no U*Us, R*Rs et.
    end;
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  end;
//  np^.power:=1;
//  goto turn;
    np^.power:=0;
    goto incpower;


left:
  if depth = r_depth then//depth is incremented
  begin
    nodeCount:=0;
    if depth>=maxLength-1 then
    begin
      returnLength:=-1;
      Result:=returnLength; //no more solution
      goto ende
    end;
    Inc(depth);Inc(r_depth);
    np^.axis:=U;
    np^.power:=1;
    goto turn;
  end
  else
  begin
    Dec(np);
    Inc(r_depth);
    if inValid>depth-r_depth then inValid:=depth-r_depth;
    goto incPower;
  end;
ende:
end;

{$ELSE}

function IDA.Next2PhaseSolution: Integer;

var np,np1,np2: ^Node;
    x,r_depth: Integer;
    m: Move;
label incPower,turn,right,incAxis,checkNeighbourAxis,left,ende,phase2;
begin
 np:= @n[depth];
 r_depth:=0;
incPower:
  Inc(np^.power);
  if (np^.power=2) then Inc(np^.power);
  if (np^.power>3) then goto incAxis;
  if (depth<>r_depth) then  //sonst kein linker Nachbar
  begin
    np1:=np; Dec(np1);
    if (np1^.axis=np^.axis)and ((np1^.power=3) or (np^.power=3)) then goto incAxis; //only X*X, not X*X',X'*X or X'*X'
    if slicemode and  (np1^.axis<=F) and (np^.axis=Turnaxis(Ord(np1^.axis)+3))
    and (np1^.power + np^.power = 4) then goto incPower;//kein UD', U2D2, U'D etc wenn slices
  end;


turn:
  np1:=np;
  Inc(np1);
  Inc(NodeCount);
  //np1^.parityEven:= not np^.parityEven;

  m:= Move(3*Ord(np^.axis) + np^.power - 1);

 // np1^.cenTwist:= CentOriMove[np^.cenTwist,m];

  if isOriented then
  begin
    np1^.UDTwist:= TwistMove[np^.UDTwist,m];
    np1^.UDCentRFLBMod2Twist:= CentOriRFLBMod2Move[np^.UDCentRFLBMod2Twist,m];
    x:= flipSliceMove[np^.UDIdx,Ord(SymMove[np^.UDSym,m])];
    np1^.UDSym:=SymMult[x and 15,np^.UDSym];
    np1^.UDIdx:= x shr 4;

    np1^.UDPrun:= GetPruningLength[np^.UDPrun,
      GetPruningCentP((Int64(np1^.UDIdx)*16+
      CentOriRFLBMod2Conjugate[np1^.UDCentRFLBMod2Twist,np1^.UDSym])*2187+
      TwistConjugate[np1^.UDTwist,np1^.UDSym])];
  end
  else
  begin
    np1^.UDTwist:= TwistMove[np^.UDTwist,m];
    x:= flipSliceMove[np^.UDIdx,Ord(SymMove[np^.UDSym,m])];
    np1^.UDSym:=SymMult[x and 15,np^.UDSym];
    np1^.UDIdx:= x shr 4;

    np1^.UDPrun:= GetPruningLength[np^.UDPrun,GetPruningP(2187*np1^.UDIdx + TwistConjugate[np1^.UDTwist,np1^.UDSym])];
  end;
  if (np1^.UDPrun>r_depth+2) then goto incAxis;
  if (np1^.UDPrun>r_depth) or (( np1^.UDPrun=0) and (r_depth>0)) then goto incPower;
  //we deny phase2 states within phase1, so maybe we loose the best solution
  //if (np1^.UDPrun>r_depth) then goto incPower;    //Version, die auch Phase2 states erlaubt!
 //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 //if sliceMode and (depth<>r_depth) then //else no left neighbour
 // begin
 //   np2:=np;Dec(np2);
 //   if  (np2^.axis<=F) and (np^.axis=Turnaxis(Ord(np2^.axis)+3))
 //   and (np2^.power + np^.power = 4) then
 //      goto incPower;// goto incAxis; //kein UD', U2D2, U'D etc wenn slices  , WARUM NICHT im TURN TEIL Vorsicht mit inc/dec np1
 // end;
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


  if (r_depth=0) then
  begin
phase2:

    if Terminated then
    begin
      returnLength:=-2;
      Result:=returnLength;
      goto ende;
    end;


  //returnLength:=depth+1;Result:=depth+1; goto ende;

    NextPhase2ID;


    case depth2 of
      -2: goto incPower;
      -3: goto incAxis;
      -4: goto left;
    end;

    if (depth=0) and (depth2=0) and (n[0].axis=U) and (n[0].power=1)
    and (n[1].axis=U) and (n[1].power=3) then // in case of Id cube
    begin
      returnLength:=2;
      Result:=2;
      goto ende;
    end;
// we do not allow UU,RR,FF,DU,DD,LL,LR,BB,BF between phase1 and 2
    if depth2>=0 then
    begin
  //    if n[depth].axis=n[depth+1].axis then goto incPower;
      if Ord(n[depth].axis)= Ord(n[depth+1].axis)+3 then goto incPower;
    end;

    returnLength:=depth+depth2+2;
    Result:=returnLength; //solution
    goto ende;
  end;
right:
  Dec(r_depth);
  Inc(np); np^.axis:= U;
  np^.virtualmove:=false;//keine virtual moves in phase 1
  goto checkNeighbourAxis;

incAxis:
//  if np^.axis=B then goto left;
//  Inc(np^.axis);

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  if (not sliceMode and (np^.axis=B)) or (np^.axis=Fs) then goto left;
  Inc(np^.axis);
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


checkNeighbourAxis:
  if depth<>r_depth then //else no left neighbour
  begin
    np1:=np; Dec(np1);
    if (np^.axis= np1^.axis) and (np1^.power = 3) then goto incAxis;
    //only X*X, not X'*X
    np2:=np1;Dec(np2);
    if (depth-r_depth>1) and //else no neighbour left of left neighbour
         (np^.axis= np1^.axis) and  (np^.axis= np2^.axis) then goto incAxis;
         //in QTM not three successive moves with same axis

    if np^.axis<=F then
    if TurnAxis(Ord(np^.axis)+3)=np1^.axis then goto incAxis;//no D*U, L*R etc.
    //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    if sliceMode then
    begin
      if np^.axis<=F then
      if TurnAxis(Ord(np^.axis)+6)=np1^.axis then goto incAxis;//no Us*U, Rs*R etc.
      if np^.axis<=B then
      if TurnAxis(Ord(np^.axis)+3)=np1^.axis then goto incAxis;//no Us*D, Rs*L etc.
                                                               //D*U, L*R already done
      if np^.axis>=Us then
      if TurnAxis(Ord(np^.axis)- 3)=np1^.axis then goto incAxis;//no D*Us, L*Rs etc.
      if np^.axis>=Us then
      if TurnAxis(Ord(np^.axis)- 6)=np1^.axis then goto incAxis;//no U*Us, R*Rs et.
    end;
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  end;
//  np^.power:=1;
//  goto turn;
    np^.power:=0;
    goto incpower;

//    if (np^.axis=np1^.axis) then goto incAxis;//in FTM no successive moves with same axis

left:
  if depth = r_depth then//depth is incremented
  begin
    nodeCount:=0;
    if depth>=maxLength-1 then
    begin
      returnLength:=-1;
      Result:=returnLength; //no more solution
      goto ende
    end;
    Inc(depth);Inc(r_depth);
    np^.axis:=U;
    np^.power:=1;
    goto turn;
  end
  else
  begin
    Dec(np);
    Inc(r_depth);
    if inValid>depth-r_depth then inValid:=depth-r_depth;
    goto incPower;
  end;
ende:
end;

{$IFEND}

//++++++++++++++++End Find next solution for Two-Phase-Algorithm++++++++++++++++

//++++++++++++++++++++Find a Phase 2 solution+++++++++++++++++++++++++++++++++++
{$IF not QTM}
procedure IDA.NextPhase2ID;
var temp,i,r_depth,symCPos,sym: Integer;
     m: Move; np,np1,np2: ^Node;
label ende,incPower,incAxis,turn,idCheck,right,checkNeighbourAxis,left,xxx;
begin
  np:= @n[depth+1];
//precheck only with corners

 for i:=inValid to depth do
 begin
   m:= Move(3*Ord(n[i].axis) + n[i].power - 1);
   n[i+1].cornPos:=CornPermMove[n[i].cornPos,m];
 end;
 temp:= PruningCornPermPh2[np^.cornPos];

 if temp> maxLength-(depth+1)+2 then begin depth2:=-4; goto ende; end;//no solution, go left
 if temp> maxLength-(depth+1)+1 then begin depth2:=-3; goto ende; end;//no solution, new axis
 if temp> maxLength-(depth+1) then begin depth2:=-2; goto ende; end;//no solution, new power


//generate phase2 coordinates

 for i:=inValid to depth do
 begin
   m:= Move(3*Ord(n[i].axis) + n[i].power - 1);

   n[i+1].UDCenTwist:=CentOriMove[n[i].UDCenTwist,m];


   n[i+1].UDSliceSorted:=UDSliceSortedMove[n[i].UDSliceSorted,m];
   m:= SymMove[16,m];
   n[i+1].RLSliceSorted:=UDSliceSortedMove[n[i].RLSliceSorted,m];
   m:= SymMove[16,m];
   n[i+1].FBSliceSorted:=UDSliceSortedMove[n[i].FBSliceSorted,m];
 end;
 inValid:=depth;
//bei orientierten Würfeln muss die Parität der UDSlice*2 mit der Summe der RFLB
//centertwists mod4 übereinstimmen!
 if isOriented then
 begin
   if (UDSliceParity[np^.UDSliceSorted] xor RFLBCentOriParity[np^.UDCenTwist]=1)
   then begin depth2:=-2; goto ende; end;//no solution possible, new power
 end;

// np:= @n[depth+1];
 np^.edge8Pos:= GetEdge8Perm[np^.RLSliceSorted,np^.FBSliceSorted mod 24];

 if isOriented and (np^.UDCenTwist<>0) then goto xxx;  // /////////////////////////////////////// ?????????????????????????

 if  (np^.edge8Pos=0) and  (np^.UDSliceSorted=0) and (np^.cornPos=0) then
 begin
   depth2:=-1;//no phase 2 necessary
   goto ende;
 end;

xxx:
 np^.UDPrun:= GetPrunPhase2(np^.cornPos,np^.edge8Pos);//check if a sufficient short

 temp:= np^.UDPrun;  //hier kann man noch die andere Pruningtables benutzen!!!!!!!!!!!!!!!!!


// if isOriented and (PruningCenTwistUDSliceSorted[np^.UDSliceSorted shl 12 +np^.UDcenTwist]>temp) then
// temp:= PruningCenTwistUDSliceSorted[np^.UDSliceSorted shl 12 +np^.UDcenTwist];

 if temp> maxLength-(depth+1)+2 then begin depth2:=-4; goto ende; end;//no solution, go left  STIMMT DAS WIRKLICH????
 if temp> maxLength-(depth+1)+1 then begin depth2:=-3; goto ende; end;//no solution, new axis
 if temp> maxLength-(depth+1) then begin depth2:=-2; goto ende; end;//no solution, new power

 r_depth:=0;
 depth2:=0;
 np^.power:=0;
 np^.axis:=U;


incPower:
  Inc(np^.power);
  if (np^.axis<>U) and (np^.axis<>D) then Inc(np^.power);
  if (np^.power>3) then goto incAxis;
  if sliceMode{and (depth<>r_depth)} then //else no left neighbour LINKER NACHBAR SOLLTE IMMER VORHANDEN SEIN
  begin
    np1:=np;Dec(np1);
    if  (np1^.axis<=F) and (np1^.axis=Turnaxis(Ord(np1^.axis)+3))
    and (np1^.power + np^.power = 4) then
       goto incPower;// goto incAxis; //kein UD', U2D2, U'D etc wenn slices
  end;

turn:
  np1:=np;
  Inc(np1);
  m:= Move(3*Ord(np^.axis) + np^.power - 1);

  np1^.cornPos:= CornPermMove[np^.cornPos,m];
  np1^.edge8Pos:= Edge8PermMove[np^.edge8Pos,m];
  symCPos:= CornPosToSymCornPos[np1^.cornPos];
  sym:= symCPos and $f;
  symCPos:=symCPos shr 4;
  np1^.UDPrun:= GetPruningLength[np^.UDPrun,GetPruningPhase2P(2768*Edge8PosConjugate[np1^.edge8Pos,sym] + symCPos)];

  if (np1^.UDPrun>r_depth+1) then goto incAxis;
  if (np1^.UDPrun>r_depth) then goto incPower;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// if sliceMode and (depth<>r_depth) then //else no left neighbour
//  begin
//    np2:=np;Dec(np2);
//    if  (np2^.axis<=F) and (np^.axis=Turnaxis(Ord(np2^.axis)+3))
//    and (np2^.power + np^.power = 4) then
//       goto incPower;// goto incAxis; //kein UD', U2D2, U'D etc wenn slices
//  end;
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  if (r_depth=0) then
  begin
idcheck:
    temp:=n[depth+1].UDSliceSorted;
    for i:=depth+1 to depth+1+depth2 do
    begin
      m:= Move(3*Ord(n[i].axis) + n[i].power - 1);
      temp:= UDSliceSortedMove[temp,m];
    end;
    if temp<>0 then goto incPower;
    if not isOriented then goto ende;//solution for unoriented cube

    temp:=n[depth+1].UDcenTwist;
    for i:=depth+1 to depth+1+depth2 do
    begin
      m:= Move(3*Ord(n[i].axis) + n[i].power - 1);
      temp:= CentOriMove[temp,m];
    end;
    if temp<>0 then goto incPower else goto ende;
  end;

right:
  Dec(r_depth);
  Inc(np); np^.axis:= U;
  goto checkNeighbourAxis;

incAxis:
//  if np^.axis=B then goto left;
//  Inc(np^.axis);
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  if (not sliceMode and (np^.axis=B)) or (np^.axis=Fs) then goto left;
  Inc(np^.axis);
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


checkNeighbourAxis:
  if depth2<>r_depth then //else no left neighbour
  begin
    np1:=np; Dec(np1);
    if (np^.axis=np1^.axis) then goto incAxis;//no UU etc.
    if np^.axis<=F then
    if TurnAxis(Ord(np^.axis)+3)=np1^.axis then goto incAxis;//no DU etc.
   //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    if sliceMode then
    begin
      if np^.axis<=F then
      if TurnAxis(Ord(np^.axis)+6)=np1^.axis then goto incAxis;//no Us*U, Rs*R etc.
      if np^.axis<=B then
      if TurnAxis(Ord(np^.axis)+3)=np1^.axis then goto incAxis;//no Us*D, Rs*L etc.
                                                               //D*U, L*R already done
      if np^.axis>=Us then
      if TurnAxis(Ord(np^.axis)- 3)=np1^.axis then goto incAxis;//no D*Us, L*Rs etc.
      if np^.axis>=Us then
      if TurnAxis(Ord(np^.axis)- 6)=np1^.axis then goto incAxis;//no U*Us, R*Rs et.
    end;
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  end;
//    np^.power:=1;
//    if (np^.axis<>U) and (np^.axis<>D) then Inc(np^.power);
//    goto turn;
    np^.power:=0;
    goto incpower;

left:
  if depth2 = r_depth then//depth2 is incremented
  begin
    nodeCount:=0;
      //warum nur wenn isoriented?
    if isOriented and (depth2>9) then  //ignore solutions with phase2length>10  !!!!!!für phase2 Demos auf 30 erhöhen!!!!!!!!!!!!!
    begin
      depth2:=-2;//use this to signal no solution
      goto ende
    end;
    
    if depth2>=maxLength-depth-2 then //no solution <= maxLen
    begin
      depth2:=-2;//use this to signal no solution
      goto ende
    end;
    Inc(depth2);Inc(r_depth);
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


{$ELSE}

procedure IDA.NextPhase2ID;
var temp,i,r_depth,symCPos,sym: Integer;
     m: Move; np,np1,np2: ^Node;
label ende,incPower,incAxis,turn,idCheck,right,checkNeighbourAxis,left,xxx;
begin
  np:= @n[depth+1];
//precheck only with corners

 for i:=inValid to depth do
 begin
   m:= Move(3*Ord(n[i].axis) + n[i].power - 1);
   n[i+1].cornPos:=CornPermMove[n[i].cornPos,m];
 end;
 temp:= PruningCornPermPh2[np^.cornPos];

 if temp> maxLength-(depth+1)+2 then begin depth2:=-3; goto ende; end;//no solution, new axis
 if temp> maxLength-(depth+1)+1 then begin depth2:=-2; goto ende; end;//no solution, new power, da von U nach Ù' sich die Länge in Phase 1 um 2 verändern kann
 if temp> maxLength-(depth+1) then begin depth2:=-2; goto ende; end;//no solution, new power


//generate phase2 coordinates

 for i:=inValid to depth do
 begin
   m:= Move(3*Ord(n[i].axis) + n[i].power - 1);

   n[i+1].UDCenTwist:=CentOriMove[n[i].UDCenTwist,m];


   n[i+1].UDSliceSorted:=UDSliceSortedMove[n[i].UDSliceSorted,m];
   m:= SymMove[16,m];
   n[i+1].RLSliceSorted:=UDSliceSortedMove[n[i].RLSliceSorted,m];
   m:= SymMove[16,m];
   n[i+1].FBSliceSorted:=UDSliceSortedMove[n[i].FBSliceSorted,m];
 end;
 inValid:=depth;
//bei orientierten Würfeln muss die Parität der UDSlice*2 mit der Summe der RFLB
//centertwists mod4 übereinstimmen!
 if isOriented then
 begin
   if (UDSliceParity[np^.UDSliceSorted] xor RFLBCentOriParity[np^.UDCenTwist]=1)
   then begin depth2:=-2; goto ende; end;//no solution possible, new power
 end;

// np:= @n[depth+1];
 np^.edge8Pos:= GetEdge8Perm[np^.RLSliceSorted,np^.FBSliceSorted mod 24];

 if isOriented and (np^.UDCenTwist<>0) then goto xxx;  //Keine Identität

 if  (np^.edge8Pos=0) and  (np^.UDSliceSorted=0) and (np^.cornPos=0) then
 begin
   depth2:=-1;//no phase 2 necessary
   goto ende;
 end;

xxx:
 //np^.UDPrun:= GetPrunPhase2(np^.cornPos,np^.edge8Pos);//check if a sufficient short

 temp:= np^.UDPrun;  //hier kann man noch die andere Pruningtables benutzen!!!!!!!!!!!!!!!!!


// if isOriented and (PruningCenTwistUDSliceSorted[np^.UDSliceSorted shl 12 +np^.UDcenTwist]>temp) then
// temp:= PruningCenTwistUDSliceSorted[np^.UDSliceSorted shl 12 +np^.UDcenTwist];

 if temp> maxLength-(depth+1)+2 then begin depth2:=-3; goto ende; end;//no solution, new axis
 if temp> maxLength-(depth+1)+1 then begin depth2:=-2; goto ende; end;//no solution, new power, da von U nach U' sich die Länge in Phase 1 um 2 verändern kann
 if temp> maxLength-(depth+1) then begin depth2:=-2; goto ende; end;//no solution, new power


 if not slicemode then// im Us,Rs,Fs ändern die Parität nicht
 begin
   if (n[0].parityEven and Odd(depth)) or (not n[0].parityEven and not Odd(depth))then
   begin
     depth2:=1;
     r_depth:=1;
   end
   else
   begin
     depth2:=0;
     r_depth:=0;
   end
 end
 else
 begin
   r_depth:=0;
   depth2:=0;
 end;
 np^.power:=0;
 np^.axis:=U;
 np^.virtualmove:=false; //Nur R,L,F,B,Rs,Fs sind virtual moves


incPower:
 // Inc(np^.power);  //Dies ist der HTM code
 // if (np^.axis<>U) and (np^.axis<>D) then Inc(np^.power);
 // if (np^.power>3) then goto incAxis;
  Inc(np^.power);
  if (np^.power=2) then
  begin
    case np^.axis of R,F,L,B,Rs,Fs:goto incAxis; end; //Es sind nur die virtuellen Drehungen R,F.. erlaubt,nicht R',F'....
    Inc(np^.power);//Keine quadrat. Drehungen erlaubt in QTM
  end;
  if (np^.power>3) then goto incAxis;

//  np1:=np; Dec(np1);
//  if {(depth<>r_depth){have left neigbour and}(np1^.axis=np^.axis)//linker Nachbar ist immer vorhanden, da Phase 1 immer eine Lösung hat
//       and ((np1^.power=3) or (np^.power=3)) then goto incAxis;
   //only X*X, not X*X',X'*X or X'*X'



//   if (depth<>r_depth) then  //sonst kein linker Nachbar   LINKER NACHBAR IST AUS PHASE1 IMMER DA
  begin
    np1:=np; Dec(np1);
    if (np1^.axis=np^.axis)and ((np1^.power=3) or (np^.power=3)) then goto incAxis; //only X*X, not X*X',X'*X or X'*X'
    if slicemode and  (np1^.axis<=F) and (np^.axis=Turnaxis(Ord(np1^.axis)+3))
    and (np1^.power + np^.power = 4) then goto incPower;//kein UD', U2D2, U'D etc wenn slices
  end;




turn: //nicht bei virtual moves
  np1:=np;
  Inc(np1);
  m:= Move(3*Ord(np^.axis) + np^.power - 1);
  if np.virtualmove then
  begin
    if r_depth=0 then goto incAxis;//keine Lösung mit virtuellem Zug am Ende  falsch, nur neue Achse!!!
    np1^.cornPos:= np^.cornPos; //Koordinaten einfach übertragen
    np1^.edge8Pos:= np^.edge8Pos;
    goto right;
  end;
  case m of Rx1,Fx1,Lx1,Bx1,Rsx1,Fsx1:Inc(m);end;//kein virtueller Zug, Drehung jetzt quadratisch
  np1^.cornPos:= CornPermMove[np^.cornPos,m];
  np1^.edge8Pos:= Edge8PermMove[np^.edge8Pos,m];
  symCPos:= CornPosToSymCornPos[np1^.cornPos];
  sym:= symCPos and $f;
  symCPos:=symCPos shr 4;//die Äquivalenzklasse
  temp:= 2768*Edge8PosConjugate[np1^.edge8Pos,sym] + symCPos;
  if Odd(temp)
  then np1^.UDPrun:= 2*(PruningPhase2Q[temp div 2] shr 4) + PruningPhase2Q[2768*40320 div 2 +symCPos]
  else np1^.UDPrun:= 2*(PruningPhase2Q[temp div 2] and $f) + PruningPhase2Q[2768*40320 div 2+symCPos] ;

//  np1^.UDPrun:= GetPruningLength[np^.UDPrun,GetPruningPhase2P(2768*Edge8PosConjugate[np1^.edge8Pos,sym] + symCPos)];

  if (np1^.UDPrun>r_depth+2) then goto incAxis; //kommt bei RR FF LL unb BB häufig vor!
  if (np1^.UDPrun>r_depth) then goto incPower;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// if sliceMode and (depth<>r_depth) then //else no left neighbour
//  begin
//    np2:=np;Dec(np2);
//    if  (np2^.axis<=F) and (np^.axis=Turnaxis(Ord(np2^.axis)+3))
//    and (np2^.power + np^.power = 4) then
//       goto incPower;// goto incAxis; //kein UD', U2D2, U'D etc wenn slices
//  end;
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  if (r_depth=0) then
  begin
idcheck:
    temp:=n[depth+1].UDSliceSorted;
    for i:=depth+1 to depth+1+depth2 do
    begin
      m:= Move(3*Ord(n[i].axis) + n[i].power - 1);
      temp:= UDSliceSortedMove[temp,m];
    end;
    if temp<>0 then goto incPower;
    if not isOriented then goto ende;//solution for unoriented cube

    temp:=n[depth+1].UDcenTwist;
    for i:=depth+1 to depth+1+depth2 do
    begin
      m:= Move(3*Ord(n[i].axis) + n[i].power - 1);
      temp:= CentOriMove[temp,m];
    end;
    if temp<>0 then goto incPower else goto ende;
  end;

right:
  Dec(r_depth);
  if np^.virtualmove then begin np1:=np;Inc(np);np^.axis:= np1^.axis;end
  else begin  Inc(np); np^.axis:= U; end;
  goto checkNeighbourAxis;

incAxis:
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  if (not sliceMode and (np^.axis=B)) or (np^.axis=Fs) then goto left;
  np1:=np;Dec(np1);
  if np1.virtualmove then goto left;//der virtuelle Zug kann nicht rechts eine andere Achse haben
  Inc(np^.axis);
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



checkNeighbourAxis://da Phase 1 immer einen Zug hat, kann man immer von einm linken Nb ausgehen
 // if depth2<>r_depth then //else no left neighbour
  begin
    np1:=np; Dec(np1);
    if (np^.axis= np1^.axis) and (np1^.power = 3) then goto incAxis;
    //only X*X, not X'*X
    np2:=np1;Dec(np2);
    if {(depth-r_depth>1)}(depth2<>r_depth) and //else no neighbour left of left neighbour  depth oder depth2???????
         (np^.axis= np1^.axis) and  (np^.axis= np2^.axis) then goto incAxis;
         //in QTM not three successive moves with same axis
    if np^.axis<=F then
    if TurnAxis(Ord(np^.axis)+3)=np1^.axis then goto incAxis;//no DU, LR etc.
   //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    if sliceMode then
    begin
      if np^.axis<=F then
      if TurnAxis(Ord(np^.axis)+6)=np1^.axis then goto incAxis;//no Us*U, Rs*R etc.
      if np^.axis<=B then
      if TurnAxis(Ord(np^.axis)+3)=np1^.axis then goto incAxis;//no Us*D, Rs*L etc.
                                                               //D*U, L*R already done
      if np^.axis>=Us then
      if TurnAxis(Ord(np^.axis)- 3)=np1^.axis then goto incAxis;//no D*Us, L*Rs etc.
      if np^.axis>=Us then
      if TurnAxis(Ord(np^.axis)- 6)=np1^.axis then goto incAxis;//no U*Us, R*Rs et.
    end;
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  end;
    //if (np^.axis<>U) and (np^.axis<>D) then Inc(np^.power);  dies gilt nur in ftm
     np^.virtualmove:=false;
     case np^.axis of R,F,L,B,Rs,Fs:If not np1^.virtualmove then np^.virtualmove:=true;
     end;
//    np^.power:=1;
//    goto turn;
    np^.power:=0;
    goto incpower;

left:
  if depth2 = r_depth then//depth2 is incremented
  begin
    nodeCount:=0;
      //warum nur wenn isoriented?
    if {isOriented and }(depth2>25) then  //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    begin
      depth2:=-2;//use this to signal no solution
      goto ende
    end;

    if depth2>=maxLength-depth-2 then //no solution <= maxLen
    begin
      depth2:=-2;//use this to signal no solution
      goto ende
    end;
    if not slicemode then
    begin depth2:=depth2+2;r_depth:=r_depth+2; end
    else begin Inc(depth2);Inc(r_depth) end;
    np^.axis:=U;
    np^.power:=1;
    np^.virtualmove:=false;
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

{$IFEND}


//++++++++++++++++++++End Find a Phase 2 solution+++++++++++++++++++++++++++++++


//+++++++++Generate Solver String from node representation++++++++++++++++++++++
function IDA.SolverString:String;


var i,p,j: Integer;
    s,s1,ln,tmp: String;
    t: TurnAxis;
    invertPower: Boolean;
    curAx,curAxTmp: Axis;
    depth1: Integer;

label l1;
begin
 i:=0;
 depth1:=returnlength-1;

 while i<depth1+1 do
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

   s:=s+numToStr(n[i].power);
   Inc(i);
 end;

  ln:=' ('+IntToStr(depth1+1)+manSep+')';


 //jetzt für den Fall useSlices das Maneuver berechnen

 for t:=U to B do curAx[t]:=t;

 i:=0;
 while i<depth1+1 do
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

 if sliceMode then  //Orientierung korrigieren
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
 result:=(s+ln);
 //Incomplete.ManInfo.Lines.Add(s+ln);




end;
//+++++++++Generate Solver String from node representation++++++++++++++++++++++


//Generate a table which gives the new pruning value from the old value and+++++
//the new value mod 3+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
procedure CreateGetPruningLengthTable;
var i,j,diff:Integer;
begin
  for i:= 0 to 18 do
  for j:= 0 to 2 do
  begin
    diff:=j-i mod 3;
    if diff<0 then diff:=diff+3;
    case diff of
      2: GetPruningLength[i,j]:=i - 1;
      1: GetPruningLength[i,j]:=i + 1;
      0: GetPruningLength[i,j]:=i;
    end;
  end;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++Run Search until maneuver lenght <= stopAt+2+++++++++++++++++++++++++
procedure IDA.Execute;
begin
  if runOptimal then
  begin
    NextSolution(OptimalMax)  ////////////////////////////////////////////////////////////////////////////////////////////////////////
  end
  else
  repeat
  Next2PhaseSolution;
  {$IF not QTM}
  until returnlength<=stopAt+3;
  {$ELSE}
  until returnlength<=stopAt+17; //Drüber wird keine Lösung angezeigt!!
  {$IFEND}
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++++++++++Initialize Structure for  IDA search+++++++++++++++++++++++++
constructor IDA.Create(ia: Ida);
var i: Integer;
begin
  inherited Create(true);//do no start
  Priority:=tpLower;
  for i:=0 to MAXNODES do
  begin
    n[i].UDIdx:= ia.n[i].UDIdx;
    n[i].UDSym:= ia.n[i].UDSym;
    n[i].RLIdx:= ia.n[i].RLIdx;
    n[i].RLSym:= ia.n[i].RLSym;
    n[i].FBIdx:= ia.n[i].FBIdx;
    n[i].FBSym:= ia.n[i].FBSym;
    n[i].UDPrun:= ia.n[i].UDPrun;
    n[i].RLPrun:= ia.n[i].RLPrun;
    n[i].FBPrun:= ia.n[i].FBPrun;
    n[i].UDTwist:= ia.n[i].UDTwist;
    n[i].RLTwist:= ia.n[i].RLTwist;
    n[i].FBTwist:= ia.n[i].FBTwist;
    n[i].UDTetra:= ia.n[i].UDTetra;
    n[i].RLTetra:= ia.n[i].RLTetra;
    n[i].FBTetra:= ia.n[i].FBTetra;
    n[i].axis:= ia.n[i].axis;
    n[i].power:= ia.n[i].power;
    n[i].cornPos:= ia.n[i].cornPos;
    n[i].UDSliceSorted:=ia.n[i].UDSliceSorted;
    n[i].RLSliceSorted:=ia.n[i].RLSliceSorted;
    n[i].FBSliceSorted:=ia.n[i].FBSliceSorted;

    n[i].UDSliceSortedSymIdx:=ia.n[i].UDSliceSortedSymIdx;
    n[i].RLSliceSortedSymIdx:=ia.n[i].RLSliceSortedSymIdx;
    n[i].FBSliceSortedSymIdx:=ia.n[i].FBSliceSortedSymIdx;
    n[i].UDSliceSortedSymSym:=ia.n[i].UDSliceSortedSymSym;
    n[i].RLSliceSortedSymSym:=ia.n[i].RLSliceSortedSymSym;
    n[i].FBSliceSortedSymSym:=ia.n[i].FBSliceSortedSymSym;
    n[i].UDFlip:=ia.n[i].UDFlip;
    n[i].RLFlip:=ia.n[i].RLFlip;
    n[i].FBFlip:=ia.n[i].FBFlip;
    n[i].UDPrunBig:=ia.n[i].UDPrunBig;
    n[i].RLPrunBig:=ia.n[i].RLPrunBig;
    n[i].FBPrunBig:=ia.n[i].FBPrunBig;
    n[i].UDCenTwist:= ia.n[i].UDCenTwist;
    n[i].RLCenTwist:= ia.n[i].RLCenTwist;
    n[i].FBCenTwist:= ia.n[i].FBCenTwist;

 // n[i].UDSlice:=ia.n[i].UDSlice;
 // n[i].RLSlice:=ia.n[i].RLSlice;
 // n[i].FBSlice:=ia.n[i].FBSlice;
    n[i].UDCentRFLBMod2Twist:=ia.n[i].UDCentRFLBMod2Twist;
    n[i].RLCentRFLBMod2Twist:=ia.n[i].RLCentRFLBMod2Twist;
    n[i].FBCentRFLBMod2Twist:=ia.n[i].FBCentRFLBMod2Twist;
    n[i].parityEven:= ia.n[i].parityEven;
 end;
    depth:= ia.depth;
    depth2:= ia.depth2;
    isOriented:=ia.isOriented;
    nodeCount:= ia.nodeCount;
    sym:= ia.sym;
    inValid:= ia.inValid;
    maxLength:= ia.maxLength;
    returnLength:=ia.returnLength;
    runOptimal:=false;
    runCoset:=false;

end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++





end.
