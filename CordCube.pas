unit CordCube;
interface
uses CubiCube, CubeDefs, graphics;

//+++++++++++++++++Extract pruning value from Pruning Tables++++++++++++++++++++
function GetPruningP(index:Integer):Integer;
{$IF not QTM}
function GetPruningPhase2P(index: Integer): Integer;
{$IFEND}
function GetPruningBigP(index: LongWord):Integer;
function GetPruningCentP(index: LongWord):Integer;
function GetPruningUBigP(index: LongWord;p:Pointer):Integer;
function GetPruningFullCorner(index: Integer):Integer;
{$IF FULLPHASE2}
function GetPruningFullPhase2(index:LongWord;slice:Integer):Integer;
{$IFEND}
//++++++++++++++++Find the Phase2 initial pruning value+++++++++++++++++++++++++
{$IF not QTM}
function GetPrunPhase2(cPos,e8Pos:Integer):Integer;
{$IFEND}
//+++++++++++Initial values for the incomplete Solver ++++++++++++++++++++++++
function GetPrunFullCorner(cPos,cOri:Integer):Integer;

//Create table used to extract phase 2 edge permutation coordinate from+++++++++
//RLSliceSorted and FBSliceSorted coordinates+++++++++++++++++++++++++++++++++++
procedure CreateGetEdge8PermTable;

//+++++++++++++++++++++Tables for the Huge Optimal Solver+++++++++++++++++++++++
procedure CreateBigPruningTable;
procedure CreateUltraBigPruningTable;

{$IF FULLPHASE2}
procedure CreateFullPhase2PruningTable;
{$IFEND}

procedure CreateFlipConjugateTable;

procedure CreateGetCorn8PermTable;//für den Coset-Explorer

procedure CreateFlipUDSliceCentPruningTable;
procedure CreateCenTwistUDSliceSortedPruningTable;


procedure CreateFullCornerPruningTable(useSlice:Boolean);

type

  SymCoord= record n: Integer; s: Integer; end;//the parts of a sym-coordinate
  //n is the class index, s the symmetry index

//++++++++++++++++Class for the cubes on the Coordinate Level+++++++++++++++++++
  CoordCube = class
  public

    //+++++++++++++++First phase and Optimal Solver coordinates+++++++++++++++++
    flipUDSlice,flipRLSlice,flipFBSlice: SymCoord;
    UDTwist,RLTwist,FBTwist: Word;//corner orientation coordinates
    UDTetra,RLTetra,FBTetra: Word;//Tetra coordinate, used in ultrabig solver

    //++++++++++++++++++Second phase coordinates++++++++++++++++++++++++++++++++
    UDSliceSorted,RLSliceSorted,FBSliceSorted,cornPos: Word;
    edge8Pos: Word;

    //+++++++++++++++++++Big Optimal Solver coordinates+++++++++++++++++++++++++
    UDSliceSortedSym,RLSliceSortedSym,FBSliceSortedSym: SymCoord;

    UDFlip,RLFlip,FBFlip: Word;

    //+++++++++++++++++++Parity used only in QTM++++++++++++++++++++++++++++++++
    parityEven: Boolean;

    //+++++++++++++++++++Symmetries of this Cube++++++++++++++++++++++++++++++++
    sym: Int64; //bit n = 1: has symmetry n (0<=n<=47)
    
    //+++++++++++++++++++Twist of the centers+++++++++++++++++++++++++++++++++++
    UDCenTwist,RLCenTwist,FBCenTwist: Word;
//    UDSlice, RLSlice, FBSlice: Word;//also needed for oriented Cubes WIEDER ENTFERNEN  !!!!!!!!!!!!!!!!!!!!!!!
    UDCentRFLBMod2Twist,RLCentRFLBMod2Twist,FBCentRFLBMod2Twist:Word;


    isOriented: Boolean;//Center orientation included?
    //++++++++++++++Routines used only for debugging++++++++++++++++++++++++++++
    procedure DoMove(m: Move);
    procedure DoMovePhase2(m: Move);
    procedure Print(c:TCanvas;x,y:Longint);

    //+++++Find the Phase 1 and Big Optimals Solver initial pruning value+++++++
    function GetPrun(direction:Integer):Integer;
    function GetCentPrun(direction:Integer):Integer;
    function GetPrunBig(direction: Integer):Integer;
    function GetPrunUBig(direction: Integer):Integer;
    //+++++++++++++++++++++++++++++++++constructors+++++++++++++++++++++++++++++
    constructor Create; overload;
    constructor Create(cc: CubieCube); overload;
  end;
//++++++++++++End Class for the cubes on the Coordinate Level+++++++++++++++++++

//++++++++++++++Arrays for the Move Tables++++++++++++++++++++++++++++++++++++++
var TwistMove: array[0..2187-1,Ux1..Fsx3] of Word;//auf slice moves erweitert
    FlipMove: array[0..2048-1,Ux1..Fsx3] of Word;
    UDSliceMove: array[0..495-1,Ux1..Fsx3] of Word;
    CentOriMove: array[0..4096-1,Ux1..Fsx3] of Word;//auf slice moves erweitert

    CentOriRFLBMod2Move: array[0..16-1,Ux1..Fsx3] of Word;
    TetraMove: array[0..70-1,Ux1..Fsx3] of Word;
    CornPermMove: array[0..40320-1,Ux1..Fsx3] of Word;//auf slice moves erweitert
    UDSliceSortedMove: array[0..11880-1,Ux1..Fsx3] of Word;
    UDSliceSortedSymMove: array[0..788-1,Ux1..Fsx3] of Integer;
    Edge8PermMove: array[0..40320-1,Ux1..Fsx3] of Word;
    FlipSliceMove: array of array{[0..64430-1,Ux1..Fsx3]} of Integer;//dynamic creation

//++++++++++++++++Arrays for the Conjugation by symmetries++++++++++++++++++++++
    TwistConjugate: array[0..2187-1,0..15] of Word;
    TetraConjugate: array[0..70-1,0..15] of Word;
    FlipConjugate: array of array of array {[0..2048-1,0..15,0..788-1]}of Word;
    Edge8PosConjugate: array[0..40320-1,0..15] of Word;
    CornPermConjugate: array[0..40320-1,0..15] of Word;
    UDSliceSortedConjugate: array[0..24-1,0..15] of Word;//eingeschränkt auf phase2!
    CentOriRFLBMod2Conjugate: array[0..16-1,0..15] of Word;
//    UDSliceConjugate: array[0..495-1,0..15] of Word;


// ++++++Array for the computation of the phase 2 edge coordinate+++++++++++++++
    GetEdge8Perm: array[0..11880-1,0..24-1] of Word;

//+++++++++++++++++++++++Pruning Table arrays+++++++++++++++++++++++++++++++++++
    Pruning: array {*[0..64430*2187 div 16+1]*} of Integer;//phase 1/optimal unpacked
    PruningP: array {*[0..64430*2187 div 5]*} of Byte;//phase 1/optimal packed

    PruningCent: array {*[0..64430*2187*16 div 16]*} of Integer;//oriented phase 1/optimal unpacked
    PruningCentP: array {*[0..64430*2187*16 div 5]*} of Byte;//oriented phase 1/optimal packed

    PruningFullCorner: array {*[0..2768*2187 div 16+1]*} of Integer;//Die kompletten Ecken
    {$IF not QTM}
    PruningPhase2: array {*[0..2768*40320 div 16+1]*} of Integer;//phase 2
    PruningPhase2P: array {*[0..2768*40320 div 5]*} of Byte;
    {$ELSE}
    PruningPhase2Q: array {*[0..2768*40320-1]*} of Byte;//phase 2 in QTM
    depthmod2Remain: array(*[0..2768-1]*) of Byte;
    {$IFEND}
    PruningBig: array {*[0..788*2187*2048 div 16+1]*} of Integer;//big optima solver
    PruningBigP: array {*[0..788*2187*2048 div 5+1]*} of Byte;
    PruningCornPermPh2: array[0..40320-1] of Byte;//for pre-check in phase 2
    PruningUBig: array[0..70-1] of array of Integer;
    PruningUBigP: array[0..70-1] of array of Byte;

    PruningCenTwistUDSliceSorted: array {[0..11880*4096-1]} of Byte;

{$IF FULLPHASE2}
   PruningFullPhase2: array[0..24-1] of array of Byte;
{$IFEND}

//+++++++GetPacked[i,j] extracts value for entry j from byte value i++++++++++++
    GetPacked: array [0..243-1,0..4] of Byte;

//++++++++++++++++++++++++++Für den Coset-Explorer++++++++++++++++++++++++++++++
   BitVector: array {[0..24*40320*288/32-1]} of Integer;//für den Bitvektor 24*40320*288
   BitVectorPS: array {[0..24*40320*288/32-1]} of Integer;//für den Bitvektor 24*40320*288
   GetCorn8Perm: array[0..40320-1] of Word;//Eckenpermutationen in den Tetraedern

//++++++++++++++++++++++++++Für phase 2 bei orientierten Cubes++++++++++++++++++
   UDSliceParity: array [0..24-1] of Byte;
   RFLBCentOriParity: array [0..4096-1] of Byte;


//+++++++++++++++++++++++++++Table Generation Routines++++++++++++++++++++++++++
  procedure CreateMoveTables;
  procedure CreatePruningTables;
  procedure CreateConjugateTables;
  procedure CreateUDSliceSortedSymMoveTable;
  procedure CreateGetPackedTable;

implementation

uses Symmetries, classes, SysUtils, RubikMain, Forms,Windows,OptOptions, FaceCube; /////////FaceCube wieder rausnehmen!!!!!!!!

//+++++++++++++++++++++++++++Default Constructor++++++++++++++++++++++++++++++++
constructor CoordCube.Create;
begin
  flipUDSlice.n:=0;flipRLSlice.n:=0;flipFBSlice.n:=0;
  flipUDSlice.s:=0;flipRLSlice.s:=0;flipFBSlice.s:=0;

  UDTwist:=0;RLTwist:=0;FBTwist:=0;
  UDTetra:=0;RLTetra:=0;FBTetra:=0;

  UDSliceSorted:=0;RLSliceSorted:=0;FBSliceSorted:=0;cornPos:=0;
  edge8Pos:= 0;

  UDSliceSortedSym.n:=0;RLSliceSortedSym.n:=0;FBSliceSortedSym.n:=0;
  UDSliceSortedSym.s:=0;RLSliceSortedSym.s:=0;FBSliceSortedSym.s:=0;
  parityEven:=true;
  sym:=1;//Identity :=0;

  UDCenTwist:=0;RLCenTwist:=0;FBCenTwist:=0; //needed for oriented Cubes
  UDCentRFLBMod2Twist:=0;RLCentRFLBMod2Twist:=0;FBCentRFLBMod2Twist:=0;

  isOriented:= false;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++++++++++++Create CoordCube from CubieCube++++++++++++++++++++++++++++
constructor CoordCube.Create(cc:CubieCube);
var prodC: CornerCubie; prodE: EdgeCubie; prodCn: CenterCubie;
    s: Integer; hasSym:Boolean;
    c1:Corner; e1:Edge; cn1: TurnAxis;
begin
  //++++++++++++++++++++++++Initialize the symmetry+++++++++++++++++++++++++++++
  sym:=0;
  isOriented:= cc.isOriented;
  for s:= 0 to 47 do
  begin
    hasSym:=true; //dies muss jetzt widerlegt werden!
    CornMult(CornSym[s],cc.PCorn^,cc.PCornTemp^);
    CornMult(cc.PCornTemp^,CornSym[InvIdx[s]],prodC);
    EdgeMult(EdgeSym[s],cc.PEdge^,cc.PEdgeTemp^);
    EdgeMult(cc.PEdgeTemp^,EdgeSym[InvIdx[s]],prodE);
    if isOriented then
    begin
      CentMult(CentSym[s],cc.PCent^,cc.PCentTemp^);
      CentMult(cc.PCentTemp^,CentSym[InvIdx[s]],prodCn);
    end;
    for c1:= URF to DRB do
      if (prodC[c1].c<>cc.PCorn^[c1].c) or (ProdC[c1].o<>cc.PCorn^[c1].o) then
      begin
        hasSym:=false;
        break;
      end;
    for e1:= UR to BR do
    begin
      if not hasSym then break;
      if (prodE[e1].e<>cc.PEdge^[e1].e) or (prodE[e1].o<>cc.PEdge^[e1].o) then
      begin
        hasSym:=false;
        break;
      end;
    end;
    if isOriented then
    for cn1:= U to B do//nur wenn
    begin
      if not hasSym then break;
      if (prodCn[cn1].c<>cc.PCent^[cn1].c) or (prodCn[cn1].o<>cc.PCent^[cn1].o) then
      begin
        hasSym:=false;
        break;
      end;
    end;

    if hasSym then sym:= sym or ( Int64(1) shl s);
  end;
//++++++++++++++++++++Initialize the coordinates++++++++++++++++++++++++++++++
  cornPos:= cc.CornPermCoord;

  UDTwist:= cc.CornOriCoord;
  UDFlip:= cc.EdgeOriCoord;
  UDTetra:= cc.TetraCoord;
  UDSliceSorted:= cc.UDSliceSortedCoord;

  UDCenTwist:= cc.CentOriCoord;
  UDCentRFLBMod2Twist:=cc.CentOriRFLBMod2Coord;

  flipUDSlice.n:= cc.FlipUDSliceCoord;
  flipUDSlice.s:= flipUDSlice.n and 15;
  flipUDSlice.n:=flipUDSlice.n shr 4;

  UDSliceSortedSym.n:= cc.UDSliceSortedSymCoord;
  UDSliceSortedSym.s:= UDSliceSortedSym.n and 15;
  UDSliceSortedSym.n:=UDSliceSortedSym.n shr 4;

  EdgeMult(EdgeSym[16],cc.PEdge^,prodE); //Apply S_URF3*X*S_URF3^-1 to edges
  EdgeMult(prodE,EdgeSym[InvIdx[16]],cc.PEdge^);
  CornMult(CornSym[16],cc.PCorn^,prodC); //Apply S_URF3*X*S_URF3^-1 to corners
  CornMult(prodC,CornSym[InvIdx[16]],cc.PCorn^);
  CentMult(CentSym[16],cc.PCent^,prodCn); //Apply S_URF3*X*S_URF3^-1 to centers
  CentMult(prodCn,CentSym[InvIdx[16]],cc.PCent^);


  RLTwist:= cc.CornOriCoord;
  RLFlip:= cc.EdgeOriCoord;
  RLTetra:= cc.TetraCoord;
  RLSliceSorted:= cc.UDSliceSortedCoord;

  RLCenTwist:= cc.CentOriCoord;
  RLCentRFLBMod2Twist:=cc.CentOriRFLBMod2Coord;

  flipRLSlice.n:= cc.FlipUDSliceCoord;
  flipRLSlice.s:= flipRLSlice.n and 15;
  flipRLSlice.n:= flipRLSlice.n shr 4;

  RLSliceSortedSym.n:= cc.UDSliceSortedSymCoord;
  RLSliceSortedSym.s:= RLSliceSortedSym.n and 15;
  RLSliceSortedSym.n:=RLSliceSortedSym.n shr 4;

  EdgeMult(EdgeSym[16],cc.PEdge^,prodE);
  EdgeMult(prodE,EdgeSym[InvIdx[16]],cc.PEdge^);
  CornMult(CornSym[16],cc.PCorn^,prodC);
  CornMult(prodC,CornSym[InvIdx[16]],cc.PCorn^);
  CentMult(CentSym[16],cc.PCent^,prodCn);
  CentMult(prodCn,CentSym[InvIdx[16]],cc.PCent^);

  FBTwist:= cc.CornOriCoord;
  FBFlip:= cc.EdgeOriCoord;
  FBTetra:= cc.TetraCoord;
  FBSliceSorted:= cc.UDSliceSortedCoord;

  FBCenTwist:= cc.CentOriCoord;
  FBCentRFLBMod2Twist:=cc.CentOriRFLBMod2Coord;

  edge8Pos:= GetEdge8Perm[RLSliceSorted,FBSliceSorted mod 24];
  //correct only if cube is in phase2

  flipFBSlice.n:= cc.FlipUDSliceCoord;
  flipFBSlice.s:= flipFBSlice.n and 15;
  flipFBSlice.n:= flipFBSlice.n shr 4;

  FBSliceSortedSym.n:= cc.UDSliceSortedSymCoord;
  FBSliceSortedSym.s:= FBSliceSortedSym.n and 15;
  FBSliceSortedSym.n:= FBSliceSortedSym.n shr 4;


  EdgeMult(EdgeSym[16],cc.PEdge^,prodE); //restore cc
  EdgeMult(prodE,EdgeSym[InvIdx[16]],cc.PEdge^);
  CornMult(CornSym[16],cc.PCorn^,prodC);
  CornMult(prodC,CornSym[InvIdx[16]],cc.PCorn^);
  CentMult(CentSym[16],cc.PCent^,prodCn);
  CentMult(prodCn,CentSym[InvIdx[16]],cc.PCent^);

  parityEven:= cc.CornParityEven;


end;
//++++++++++++++++End Create CoordCube from CubieCube+++++++++++++++++++++++++++



procedure CreateCentOriRFLBMod2MoveTable;
var c: CubieCube; i,k: Integer; j: TurnAxis;
begin
  c:= CubieCube.Create;
  for i:=0 to 16-1 do
  begin
    c.InvCentOriRFLBMod2Coord(i);
    for j:= U to Fs do
    begin
      for k:= 0 to 3 do
      begin
        c.Move(j);
        if k<>3 then CentOriRFLBMod2Move[i,Move(3*Ord(j)+k)]:=c.CentOriRFLBMod2Coord;
      end;
    end;
  end;
  c.Free;
end;


procedure CreateRFLBCentOriParityTable;
var c: CubieCube; i: Integer;
begin
 c:= CubieCube.Create;
 for i:= 0 to 4096-1 do
 begin
   c.InvCentOriCoord(i);
   if c.RFLBCentOriParityEven
   then RFLBCentOriParity[i]:=0
   else RFLBCentOriParity[i]:=1;
 end;
 c.Free;
end;

procedure CreateUDSliceParityTable;
var c: CubieCube; i: Integer;
begin
 c:= CubieCube.Create;
 for i:= 0 to 24-1 do
 begin
   c.InvUDSliceSortedCoord(i);
   if c.UDSliceParityEven
   then UDSliceParity[i]:=0
   else UDSliceParity[i]:=1;
 end;
 c.Free;
end;



//++++++++++++++Create Move Table for the centers+++++++++++++++++++++++++++++++
procedure CreateCentOriMoveTable;
var c: CubieCube; i,k: Integer; j,j1: TurnAxis;
begin
  c:= CubieCube.Create;
  for i:=0 to 4096-1 do
  begin
    if i and $fff =0 then Application.ProcessMessages;
    c.InvCentOriCoord(i);
    for j:= U to Fs do
    begin
      for k:= 0 to 3 do
      begin
        c.Move(j);
        if k<>3 then CentOriMove[i,Move(3*Ord(j)+k)]:=c.CentOriCoord;
      end;
    end;

  end;
  c.Free;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++Create Move Table for the UDSliceCoord+++++++++++++++++++++++++++++++
procedure CreateUDSliceMoveTable;
var c: CubieCube; i,k: Integer; j: TurnAxis;
begin
  c:= CubieCube.Create;
  for i:=0 to 495-1 do
  begin
    c.InvUDSliceCoord(i);
    for j:= U to Fs do
    begin
      for k:= 0 to 3 do
      begin
        c.Move(j);
        if k<>3 then UDSliceMove[i,Move(3*Ord(j)+k)]:=c.UDSliceCoord;
      end;
    end;
  end;
  c.Free;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



//++++++++++++++Create Move Table for the corner orientations+++++++++++++++++++
procedure CreateTwistMoveTable;
var c: CubieCube; i,k: Integer; j,j1: TurnAxis;
begin
  c:= CubieCube.Create;
  for i:=0 to 2187-1 do
  begin
    if i and $fff =0 then Application.ProcessMessages;
    c.InvCornOriCoord(i);
    for j:= U to Fs do
    begin
      for k:= 0 to 3 do
      begin
        c.Move(j);
        if k<>3 then TwistMove[i,Move(3*Ord(j)+k)]:=c.CornOriCoord;
      end;
    end;
  end;
  c.Free;
  Form1.ProgressBar.Position:=30;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++Create Move Table for the edge orientations+++++++++++++++++++++
procedure CreateFlipMoveTable;
var c: CubieCube; i,k: Integer; j: TurnAxis;
begin
  c:= CubieCube.Create;
  for i:=0 to 2048-1 do
  begin
    c.InvEdgeOriCoord(i);
    for j:= U to Fs do
    begin
      for k:= 0 to 3 do
      begin
        c.Move(j);
        if k<>3 then FlipMove[i,Move(3*Ord(j)+k)]:=c.EdgeOriCoord;
      end;
    end;
  end;
  c.Free;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++Create Move Table for the tetraeder coordinate+++++++++++++++++++++
procedure CreateTetraMoveTable;
var c: CubieCube; i,k: Integer; j: TurnAxis;
begin
  c:= CubieCube.Create;
  for i:=0 to 70-1 do
  begin
    c.InvTetraCoord(i);
    for j:= U to Fs do
    begin
      for k:= 0 to 3 do
      begin
        c.Move(j);
        if k<>3 then TetraMove[i,Move(3*Ord(j)+k)]:=c.TetraCoord;
      end;
    end;
  end;
  c.Free;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



//++++++++++++++++Create Move Table for the Corner Permutations+++++++++++++++++
procedure CreateCornPermMoveTable;
var c: CubieCube; i,k: Integer; j,j1: TurnAxis;
begin
  c:= CubieCube.Create;
  for i:=0 to 40320-1 do
  begin
    if i and $fff = 0 then Application.ProcessMessages;
    c.InvCornPermCoord(i);
    for j:= U to Fs do
    begin
      for k:= 0 to 3 do
      begin
        c.Move(j);
        if k<>3 then CornPermMove[i,Move(3*Ord(j)+k)]:=c.CornPermCoord;
      end;
    end;
  end;
  c.Free;
  Form1.ProgressBar.Position:=60;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



//++++++++++++Create Move Table for the FlipUDSlice sym-coordinate++++++++++++++
procedure CreateFlipUDSliceMoveTable;
var c: CubieCube; i,k,n: Integer; j: TurnAxis;
    fstr: TFileStream;
const filename = 'flipUDslice.move';
begin
  SetLength(FlipSliceMove,64430,27);//27 is number of different moves
  if FileExists(filename) then
  begin
    fstr := TFileStream.Create(filename, fmOpenRead);
    for k:= 0 to 64430-1 do
    begin
      fstr.ReadBuffer(FlipSliceMove[k][0],27*4);
      if k and $fff =0 then Application.ProcessMessages;
    end;
    Form1.ProgressBar.Position:=40;
  end
  else
  begin
    c:= CubieCube.Create;
    Form1.SetUpProgressBar(0,64430-1,'Creating '+filename+' (6.6 MB)');
    for i:=0 to 64430-1 do
    begin
      Form1.ProgressBar.Position:=i;
      if i and $fff =0 then Application.ProcessMessages;
      n:= FlipUDSliceToRawFlipUDSlice[i];
      c.InvUDSliceCoord(n div 2048);
      c.InvEdgeOriCoord(n mod 2048);
      for j:= U to Fs do
      begin
        for k:= 0 to 3 do //X1,X2,X3 (and X4=ID to restore Cube)
        begin
          c.Move(j);
          if k<>3 then FlipSliceMove[i,3*Ord(j)+k]:= c.FlipUDSliceCoord;
        end;
      end;
    end;
    fstr := TFileStream.Create(filename, fmCreate);
    for k:= 0 to 64430-1 do
      fstr.WriteBuffer(FlipSliceMove[k][0],27*4);
    c.Free;
    Form1.SetUpProgressBar(0,100,'Loading...');
  end;
  fstr.Free;
end;
//++++++++++End Create Move Table for the FlipUDSlice sym-coordinate++++++++++++

//+++++++++++++Create Move Table for the UDSliceSorted raw-coordinate+++++++++++
procedure CreateUDSliceSortedMoveTable;
var c: CubieCube; i,k: Integer; j: TurnAxis;
begin
  c:= CubieCube.Create;
  for i:=0 to 11879 do
  begin
    if i and $fff = 0 then Application.ProcessMessages;
    c.InvUDSliceSortedCoord(i);
    for j:= U to Fs do
    begin
      for k:= 0 to 3 do
      begin
        c.Move(j);
        if k<>3 then UDSliceSortedMove[i,Move(3*Ord(j)+k)]:=c.UDSliceSortedCoord;
      end;
    end;
  end;
  c.Free;
  Form1.ProgressBar.Position:=50;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++++++Create Move Table for the UDSliceSorted sym-coordinate+++++++++++
//+++++++++++++++++used only in Big Optimal Solver++++++++++++++++++++++++++++++
procedure CreateUDSliceSortedSymMoveTable;
var c: CubieCube; i,k: Integer; j: TurnAxis;
begin
  c:= CubieCube.Create;
  for i:=0 to 788-1 do
  begin
    c.InvUDSliceSortedSymCoord(i shl 4);//use the representants!!
    for j:= U to Fs do
    begin
      for k:= 0 to 3 do
      begin
        c.Move(j);
        if k<>3 then UDSliceSortedSymMove[i,Move(3*Ord(j)+k)]:=c.UDSliceSortedSymCoord;
      end;
    end;
  end;
  c.Free;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++Create Move Table for the phase 2 edge permutation coordinate+++++++
procedure CreateEdge8PermMoveTable;
var c: CubieCube; i,k: Integer; j: TurnAxis;
begin
  c:= CubieCube.Create;
  for i:=0 to 40320-1 do
  begin
   if i and $fff = 0 then Application.ProcessMessages;
   c.InvPhase2EdgePermCoord(i);
    for j:= U to Fs do
    begin
      for k:= 0 to 3 do
      begin
        c.Move(j);
        case j of
          U,D,Us:
          if k<3 then Edge8PermMove[i,Move(3*Ord(j)+k)]:=c.Phase2EdgePermCoord;
          R,L,F,B,Rs,Fs:
          if k=1 then Edge8PermMove[i,Move(3*Ord(j)+k)]:=c.Phase2EdgePermCoord;
        end;
      end;
    end;
  end;
  c.Free;
  Form1.ProgressBar.Position:=70;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//Create table used to extract phase 2 edge permutation coordinate from+++++++++
//RLSliceSorted and FBSliceSorted coordinates+++++++++++++++++++++++++++++++++++
procedure CreateGetEdge8PermTable;
var i,j,x,y:Word; c:CubieCube;prodE: EdgeCubie;
begin
  c:= CubieCube.Create;
  for i:=0 to 11880-1 do
  for j:= 0 to 24-1 do
  GetEdge8Perm[i,j]:=55555;//magic number used for empty entry
  for i:=0 to 40320-1 do
  begin
    if i and $fff =0 then Application.ProcessMessages;
    c.InvPhase2EdgePermCoord(i);

    EdgeMult(EdgeSym[16],c.PEdge^,prodE); //Apply S_URF3*X*S_URF3^-1 to edges
    EdgeMult(prodE,EdgeSym[InvIdx[16]],c.PEdge^);
    x:= c.UDSliceSortedCoord;//the RLSliceSortedCoord

    EdgeMult(EdgeSym[16],c.PEdge^,prodE);
    EdgeMult(prodE,EdgeSym[InvIdx[16]],c.PEdge^);//the FBSliceSortedCoord
    y:= c.UDSliceSortedCoord mod 24;//do not need the positional part
    Assert(GetEdge8Perm[x,y]=55555);
    GetEdge8Perm[x,y]:=i;
  end;
  c.free;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


procedure CreateGetCorn8PermTable;//falls Slicekoordinate
Type Tetra1Corner = (URF1,UFL1,URB1,UBR1);
//     Tetra2Corner = (DFR1,DLF1,DBL1,DRB1);
var c:CubieCube; k,x1,x2,s: Integer; i1,j1: Tetra1Corner;
       test: array[URF..DRB] of Integer; cc: Corner;
const
 Tetra1ToCorner: array [URF1..UBR1] of Corner =
 (URF,UFL,ULB,UBR);
begin
  c:= CubieCube.Create;
  for k:=0 to 40320-1 do
  begin
    if k and $fff =0 then Application.ProcessMessages;
    c.InvCornPermCoord(k);
    //testen ob die ersten vier Koordinaten überhaupt im Tetraeder liegen
    for cc:= URF to DRB do test[cc]:=0;
    for i1:= URF1 to UBR1 do Inc(test[c.PCorn^[Tetra1ToCorner[i1]].c]);
    if test[URF]*test[UFL]*test[ULB]*test[UBR]<>1 then x1:=-1
    else
    begin
      x1:= 0;
      for i1:= UBR1 downto Succ(URF1) do
      begin
       s:=0;
       for j1:= Pred(i1) downto URF1 do
       begin
         if c.PCorn^[Tetra1ToCorner[j1]].c>c.PCorn^[Tetra1ToCorner[i1]].c then Inc(s);
        end;
        x1:= (x1+s)*Ord(i1);
      end;
    end;

//ich habe ein besseres Gefühl, das auf die Position von zwei Steinen zu beziehen.
    if      (c.PCorn^[DFR].c=DFR) and (c.PCorn^[DLF].c=DLF) then x2:=0
    else if (c.PCorn^[DFR].c=DFR) and (c.PCorn^[DBL].c=DLF) then x2:=1
    else if (c.PCorn^[DFR].c=DFR) and (c.PCorn^[DRB].c=DLF) then x2:=2
    else if (c.PCorn^[DLF].c=DFR) and (c.PCorn^[DFR].c=DLF) then x2:=3
    else if (c.PCorn^[DLF].c=DFR) and (c.PCorn^[DBL].c=DLF) then x2:=4
    else if (c.PCorn^[DLF].c=DFR) and (c.PCorn^[DRB].c=DLF) then x2:=5
    else if (c.PCorn^[DBL].c=DFR) and (c.PCorn^[DFR].c=DLF) then x2:=6
    else if (c.PCorn^[DBL].c=DFR) and (c.PCorn^[DLF].c=DLF) then x2:=7
    else if (c.PCorn^[DBL].c=DFR) and (c.PCorn^[DRB].c=DLF) then x2:=8
    else if (c.PCorn^[DRB].c=DFR) and (c.PCorn^[DFR].c=DLF) then x2:=9
    else if (c.PCorn^[DRB].c=DFR) and (c.PCorn^[DLF].c=DLF) then x2:=10
    else if (c.PCorn^[DRB].c=DFR) and (c.PCorn^[DBL].c=DLF) then x2:=11
    else x2:=-1;

    if (x1=-1) or (x2=-1) then GetCorn8Perm[k]:=288 else GetCorn8Perm[k]:=12*x1+x2;
  end;
  c.free;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++






//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
procedure CreateMoveTables;
begin
  CreateTwistMoveTable;
  CreateFlipMoveTable;
  CreateTetraMoveTable;
  CreateFlipUDSliceMoveTable;

  CreateUDSliceSortedMoveTable;
  CreateCornPermMoveTable;

  CreateGetCorn8PermTable;//für Coset-Explorer
//  CreateCorn8PermMoveTable;  //für den Coset Explorer (Prescan)

  CreateEdge8PermMoveTable;
  CreateUDSliceSortedSymMoveTable;

  CreateCentOriMoveTable; //needed for oriented Cubes
  CreateCentOriRFLBMod2MoveTable;
  CreateRFLBCentOriParityTable;
  CreateUDSliceParityTable;
  CreateUDSliceMoveTable;

end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++++++Set entry in unpacked phase 1 pruning table++++++++++++++++++++++
procedure SetPruning(index,value:Integer);
var mask,base,offset: Integer;
begin
  mask:=3;//00000000 00000000 00000000 00000011
  base:= index shr 4;
  offset:= index and $f;
  value:= value shl (offset*2);
  mask:= mask shl (offset*2);
  mask:= not mask;
  Pruning[base]:= Pruning[base] and mask;//zero the important bits
  Pruning[base]:= Pruning[base] or value;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++++++Set entry in unpacked phase 2 pruning table++++++++++++++++++++++
{$IF not QTM}
procedure SetPruningPhase2(index,value:Integer);
var mask,base,offset: Integer;
begin
  mask:=3;//00000000 00000000 00000000 00000011
  base:= index shr 4;
  offset:= index and $f;
  value:= value shl (offset*2);
  mask:= mask shl (offset*2);
  mask:= not mask;
  PruningPhase2[base]:= PruningPhase2[base] and mask;//zero the important bits
  PruningPhase2[base]:= PruningPhase2[base] or value;
end;
{$IFEND}
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++++++Set entry in unpacked full Corner pruning table++++++++++++++++++++++
procedure SetPruningFullCorner(index,value:Integer);
var mask,base,offset: Integer;
begin
  mask:=3;//00000000 00000000 00000000 00000011
  base:= index shr 4;
  offset:= index and $f;
  value:= value shl (offset*2);
  mask:= mask shl (offset*2);
  mask:= not mask;
  PruningFullCorner[base]:= PruningFullCorner[base] and mask;//zero the important bits
  PruningFullCorner[base]:= PruningFullCorner[base] or value;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


//+++++++++++++Set entry in unpacked cent pruning table++++++++++++++++++++++++++
procedure SetPruningCent(index:LongWord;value:Integer);
var mask,base,offset: Integer;
begin
  mask:=3;//00000000 00000000 00000000 00000011
  base:= index shr 4;
  offset:= index and $f;
  value:= value shl (offset*2);
  mask:= mask shl (offset*2);
  mask:= not mask;
  PruningCent[base]:= PruningCent[base] and mask;//zero the important bits
  PruningCent[base]:= PruningCent[base] or value;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++++++Set entry in unpacked big pruning table++++++++++++++++++++++++++
procedure SetPruningBig(index:LongWord;value:Integer);
var mask,base,offset: Integer;
begin
  mask:=3;//00000000 00000000 00000000 00000011
  base:= index shr 4;
  offset:= index and $f;
  value:= value shl (offset*2);
  mask:= mask shl (offset*2);
  mask:= not mask;
  PruningBig[base]:= PruningBig[base] and mask;//zero the important bits
  PruningBig[base]:= PruningBig[base] or value;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++++++Set entry in unpacked ultrabig pruning tables++++++++++++++++++++
procedure SetPruningUBig(index:LongWord;value,tetra:Integer);
var mask,base,offset: Integer;
begin
  mask:=3;//00000000 00000000 00000000 00000011
  base:= index shr 4;
  offset:= index and $f;
  value:= value shl (offset*2);
  mask:= mask shl (offset*2);
  mask:= not mask;
  PruningUBig[tetra][base]:= PruningUBig[tetra][base] and mask;//zero the important bits
  PruningUBig[tetra][base]:= PruningUBig[tetra][base] or value;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++Get entry in unpacked phase 1 pruning table+++++++++++++++++++
function GetPruning(index: Integer):Integer;
//var mask,base,offset: Integer; //Delphi version of asseembler code
{*begin
  mask:=3;//00000000 00000000 00000000 00000011
  base:= index shr 4;
  offset:= index and $f;
  mask:= mask shl (offset*2);
  mask:= mask and Pruning[base];
  Result:= mask shr (offset*2)
end;*}
asm
  mov ecx,eax
  shr eax,$4 {base}
  and ecx,$f
  add ecx,ecx {offset*2}
  mov edx,[Pruning]
  mov eax,[edx+eax*4] {Pruning[base]}
  mov edx,$3;
  shl edx,cl {mask shl offset*2}
  and eax,edx
  shr eax,cl
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++Get entry in packed phase 1 pruning table+++++++++++++++++++
function GetPruningP(index: Integer):Integer;

asm
  cmp eax,(64430/5)*2187*4
  jae @x5
  mov edx,eax
  and edx,3 //offset
  shr eax,2 //base
  mov ecx,[PruningP]
  movzx eax, BYTE PTR[ecx+eax]  {eax:=Pruning[base]}
  lea eax,[eax+eax*4] {multiply by 5 to find offset in GetPacked}
  add eax,OFFSET GetPacked {eax:=GetPacked[Pruning[base]]}
  movzx eax,BYTE PTR[eax+edx] {eax:=GetPacked[Pruning[base],offset]}
  ret
@x5:
  sub eax,(64430/5)*2187*4 //base, offset is 4
  mov ecx,[PruningP]
  movzx eax, BYTE PTR[ecx+eax]
  lea eax,[eax+eax*4]
  add eax,OFFSET GetPacked
  movzx eax,BYTE PTR[eax+4]
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++Get entry in unpacked phase 2 pruning table+++++++++++++++++++
{$IF not QTM}
function GetPruningPhase2(index: Integer):Integer;

asm
  mov ecx,eax
  shr eax,$4 {base}
  and ecx,$f
  add ecx,ecx {offset*2}
  mov edx,[PruningPhase2]
  mov eax,[edx+eax*4] {Pruning[base]}
  mov edx,$3;
  shl edx,cl {mask shl offset*2}
  and eax,edx
  shr eax,cl
end;
{$IFEND}
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++Get entry in packed phase 2 pruning table+++++++++++++++++++++
{$IF not QTM}
function GetPruningPhase2P(index: Integer):Integer;

asm
  cmp eax,(40320/5)*2768*4
  jae @x5
  mov edx,eax
  and edx,3 //offset
  shr eax,2 //base
  mov ecx,[PruningPhase2P]
  movzx eax, BYTE PTR[ecx+eax]  {eax:=Pruning[base]}
  lea eax,[eax+eax*4] {multiply by 5 to find offset in GetPacked}
  add eax,OFFSET GetPacked {eax:=GetPacked[Pruning[base]]}
  movzx eax,BYTE PTR[eax+edx] {eax:=GetPacked[Pruning[base],offset]}
  ret
@x5:
  sub eax,(40320/5)*2768*4 //base, offset is 4
  mov ecx,[PruningPhase2P]
  movzx eax, BYTE PTR[ecx+eax]
  lea eax,[eax+eax*4]
  add eax,OFFSET GetPacked
  movzx eax,BYTE PTR[eax+4]
end;
{$IFEND}
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++Get entry in unpacked fullCorner table+++++++++++++++++++
function GetPruningFullCorner(index: Integer):Integer;

asm
  mov ecx,eax
  shr eax,$4 {base}
  and ecx,$f
  add ecx,ecx {offset*2}
  mov edx,[PruningFullCorner]
  mov eax,[edx+eax*4] {Pruning[base]}
  mov edx,$3;
  shl edx,cl {mask shl offset*2}
  and eax,edx
  shr eax,cl
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++Get entry in unpacked cent pruning table+++++++++++++++++++++++
function GetPruningCent(index: LongWord):Integer;
asm
  mov ecx,eax
  shr eax,$4 {base}
  and ecx,$f
  add ecx,ecx {offset*2}
  mov edx,[PruningCent]
  mov eax,[edx+eax*4] {Pruning[base]}
  mov edx,$3;
  shl edx,cl {mask shl offset*2}
  and eax,edx
  shr eax,cl
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++Get entry in unpacked big pruning table+++++++++++++++++++++++
function GetPruningBig(index: LongWord):Integer;
asm
  mov ecx,eax
  shr eax,$4 {base}
  and ecx,$f
  add ecx,ecx {offset*2}
  mov edx,[PruningBig]
  mov eax,[edx+eax*4] {Pruning[base]}
  mov edx,$3;
  shl edx,cl {mask shl offset*2}
  and eax,edx
  shr eax,cl
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++Get entry in unpacked big pruning table+++++++++++++++++++++++
function GetPruningUBig(index: LongWord; p: Pointer):Integer;
asm
  mov ecx,eax
  shr eax,$4 {base}
  and ecx,$f
  add ecx,ecx {offset*2}
  mov edx,[p] //edx zeigt wahrscheinlich schon auf p!!!, /////////////////////////////
  mov eax,[edx+eax*4] {Pruning[base]}
  mov edx,$3;
  shl edx,cl {mask shl offset*2}
  and eax,edx
  shr eax,cl
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


//++++++++++++++++Get entry in packed cent pruning table+++++++++++++++++++++++++
function GetPruningCentP(index: LongWord):Integer;

asm
  cmp eax,450906912*4
  jae @x5
  mov edx,eax
  and edx,3 //offset
  shr eax,2 //base
  mov ecx,[PruningCentP]
  movzx eax, BYTE PTR[ecx+eax]
  lea eax,[eax+eax*4]
  add eax,OFFSET GetPacked
  movzx eax,BYTE PTR[eax+edx]
  ret
@x5:
  sub eax,450906912*4
  mov ecx,[PruningCentP]
  movzx eax, BYTE PTR[ecx+eax]
  lea eax,[eax+eax*4]
  add eax,OFFSET GetPacked
  movzx eax,BYTE PTR[eax+4]
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++





//++++++++++++++++Get entry in packed big pruning table+++++++++++++++++++++++++
function GetPruningBigP(index: LongWord):Integer;

asm
  cmp eax,705886618*4
  jae @x5
  mov edx,eax
  and edx,3 //offset
  shr eax,2 //base
  mov ecx,[PruningBigP]
  movzx eax, BYTE PTR[ecx+eax]
  lea eax,[eax+eax*4]
  add eax,OFFSET GetPacked
  movzx eax,BYTE PTR[eax+edx]
  ret
@x5:
  sub eax,705886618*4
  mov ecx,[PruningBigP]
  movzx eax, BYTE PTR[ecx+eax]
  lea eax,[eax+eax*4]
  add eax,OFFSET GetPacked
  movzx eax,BYTE PTR[eax+4]
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++Get entry in packed ultrabig pruning table+++++++++++++++++++++++++
function GetPruningUBigP(index: LongWord; p: Pointer):Integer; //p ist Pointer auf die TetraTabelle
//edx enthält p, eax enthält index
asm
  mov ecx,[edx] //pointer auf Tabellenstart sichern
  cmp eax,(64430/5)*2187*4
  jae @x5
  mov edx,eax
  and edx,3 //offset
  shr eax,2 //base
  movzx eax, BYTE PTR[ecx+eax]  {eax:=Pruning[base]}
  lea eax,[eax+eax*4] {multiply by 5 to find offset in GetPacked}
  add eax,OFFSET GetPacked {eax:=GetPacked[Pruning[base]]}
  movzx eax,BYTE PTR[eax+edx] {eax:=GetPacked[Pruning[base],offset]}
  ret
@x5:
  sub eax,(64430/5)*2187*4 //base, offset is 4
  movzx eax, BYTE PTR[ecx+eax]
  lea eax,[eax+eax*4]
  add eax,OFFSET GetPacked
  movzx eax,BYTE PTR[eax+4]
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




//++++++++Create pruning table for corners (only phase 2 moves)+++++++++++++++++

{$IF not QTM}
procedure CreateCornPermPh2PruningTable;
var i,depth,done:Integer;m:Move;
begin
  for i:=0 to 40320-1 do PruningCornPermPh2[i]:=255;
  depth:=0;
  PruningCornPermPh2[0]:=depth;
  done:=1;

  while done <>40320 do
  begin
    for i:=0 to 40320-1 do
    begin
      if PruningCornPermPh2[i]=depth then
      for m:= Ux1 to Fsx3 do
      begin
        if (not sliceMode) and (m=Usx1) then break;
        case m of
          Rx1,Rx3,Fx1,Fx3,Lx1,Lx3,Bx1,Bx3,Rsx1,Rsx3,Fsx1,Fsx3:continue;//only phase 2 turns
        end;
        if PruningCornPermPh2[CornPermMove[i,m]]=255 then
        begin
          PruningCornPermPh2[CornPermMove[i,m]]:=depth+1;
          Inc(done);
        end;
      end;
    end;
    Inc(depth);
  end;
end;
{$ELSE}
procedure CreateCornPermPh2PruningTable;
var i,depth,done:Integer;m:Move;
begin
  for i:=0 to 40320-1 do PruningCornPermPh2[i]:=255;
  depth:=0;
  PruningCornPermPh2[0]:=depth;
  done:=1;

  while done <>40320 do
  begin
    for i:=0 to 40320-1 do
    begin
      if PruningCornPermPh2[i]=depth then
      for m:= Ux1 to Usx3 do //increase depth by 1
      begin
        if (not sliceMode) and (m=Usx1) then break;
        case m of
          Ux2,Rx1,Rx2,Rx3,Fx1,Fx2,Fx3,Dx2,Lx1,Lx2,Lx3,Bx1,Bx2,Bx3,Usx2:continue;//only Ux1,Ux3,Dx1,Dx3,Usx1,Usx3
        end;
        if PruningCornPermPh2[CornPermMove[i,m]]=255 then
        begin
          PruningCornPermPh2[CornPermMove[i,m]]:=depth+1;
          Inc(done);
        end;
      end;
    end;
    If depth>0 then
    begin
      for i:=0 to 40320-1 do
      begin
        if PruningCornPermPh2[i]=depth-1 then
        for m:= Ux1 to Fsx3 do //increase depth by 2
        begin
          if (not sliceMode) and (m=Usx1) then break;
          case m of
            Ux1,Ux2,Ux3,Rx1,Rx3,Fx1,Fx3,Dx1,Dx2,Dx3,Lx1,Lx3,Bx1,Bx3,Usx1,Usx2,Usx3,Rsx1,Rsx3,Fsx1,Fsx3:continue;//only Rx2,Fx2,Lx2,Bx2,Rsx2,Fsx2
          end;
          if PruningCornPermPh2[CornPermMove[i,m]]=255 then
          begin
            PruningCornPermPh2[CornPermMove[i,m]]:=depth+1;
            Inc(done);
          end;
        end;
      end;
    end;
    Inc(depth);
  end;
end;
{$IFEND}
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


//++Create pruning table twisted Centers and UDSliceSortedCoord+++++++++++++++++
//used as additional table for better performance
procedure CreateCenTwistUDSliceSortedPruningTable;//Erstmal ohne Komprimierung!!
var i,depth,done,UDSliceSorted, cenTwist:Integer;m:Move;
begin
  SetLength(PruningCenTwistUDSliceSorted,11880*4096);
  for i:=0 to 11880*4096-1 do PruningCenTwistUDSliceSorted[i]:=255;
  depth:=0;
  PruningCenTwistUDSliceSorted[0]:=depth;
  done:=1;

  Form1.ProgressBar.Visible:= true;
  Form1.ProgressLabel.Visible:=true;
  Form1.SetUpProgressBar(0,10,'Please wait...');


  while done <>11880*4096 do
  begin
    Form1.ProgressBar.Position:=depth;
    Application.ProcessMessages;
    for i:=0 to 11880*4096-1 do
    begin
      if i and $fff =0 then Application.ProcessMessages;
      if PruningCenTwistUDSliceSorted[i]=depth then
      for m:= Ux1 to Fsx3 do
      begin
        if (not sliceMode) and (m=Usx1) then break;  //muss also beim wechsel im slicemode ggf. neu erzeugt werden!!!
        {$IF QTM}
        case m of
          Ux2,Rx2,Fx2,Dx2,Lx2,Bx2,Usx2,Rsx2,Fsx2:continue;
        end;
        {$IFEND}

        cenTwist:= i and $FFF;//ctUDSlice:=4096*UDSlice+cenTwist
        UDSliceSorted:= i shr 12;
        UDSliceSorted:= UDSliceSortedMove[UDSliceSorted,m];
        cenTwist:= centOriMove[cenTwist,m];
        if PruningCenTwistUDSliceSorted[UDSliceSorted shl 12 + cenTwist]=255 then
        begin
          PruningCenTwistUDSliceSorted[UDSliceSorted shl 12 + cenTwist]:=depth+1;
          Inc(done);
        end;
      end;
    end;
    Inc(depth);
  end;
  Form1.ProgressBar.Visible:= false;
  Form1.ProgressLabel.Visible:=false;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


//++++++++++++++++++++++Create pruningCent table++++++++++++++++++++++++++++++++
procedure CreateFlipUDSliceCentPruningTable;
var i,j,n,k,depth,realDepth,flipUDSlice,flipUDSlice0,
    twist,twist0,cent,cent0,altTwist,altCent,z,sym,value: Integer;
    c,d: CubieCube;
    prod: EdgeCubie;
    b: Word;  m: Move;
    SymState: array of Word;
    fs: TFileStream;
    done,index,idx:Cardinal;
    x:Integer;
    flipBackward,match:Boolean;
    buf: array[0..2187-1] of Byte;

    fileName: String;

label nextK;

begin
  {$If not QTM}
  if sliceMode then fileName:= 'phase1CntPFs.prun' else fileName:= 'phase1CntPF.prun';
  {$ELSE}
  if sliceMode then fileName:= 'phase1CntPQs.prun' else fileName:= 'phase1CntPQ.prun';
  {$IFEND}
  Form1.SetUpProgressBar(0,16,'Initializing memory. Please wait...');
  Form1.ProgressLabel.Visible:=true;
  Form1.Progressbar.Visible:=true;
  fs:=nil;

  SetCurrentDir(ExtractFilePath(Paramstr(0)));//Cube Explorer directory
  if FileExists(filename) then
  begin
    try
       SetLength(PruningCentP,450906912);//64430*2187*16/5, 8/5 bits per state
    except
      Application.MessageBox(PChar(Err[35]),'',MB_ICONWARNING);
      Form1.ProgressLabel.Visible:=false;
      Form1.Progressbar.Visible:=false;
      Form1.FixCenterFacelets.Checked:=false;
      Exit;
    end;
    try

      fs := TFileStream.Create(filename, fmOpenRead);
      Form1.SetUpProgressBar(0,2187,'Loading '+filename+' (430 MB)');
      Application.ProcessMessages;
      for i:= 0 to 2187-1 do
      begin
        fs.ReadBuffer(PruningCentP[i*206176],206176);
        Form1.ProgressBar.Position:=i;
        Application.ProcessMessages;
      end;

      fs.Free;
      Form1.ProgressBar.Visible:= false;
      Form1.ProgressLabel.Visible:=false;
    except
      fs.Free;
      Application.MessageBox(PChar(Err[36]),'',MB_ICONWARNING);
      Form1.ProgressLabel.Visible:=false;
      Form1.Progressbar.Visible:=false;
      SetLength(PruningCentP,0);
      Form1.FixCenterFacelets.Checked:=false;
      Exit;
    end;
  end
  else
  begin
    Application.ProcessMessages;
    try
      SetLength(PruningCent,64430*2187);//two bits per state: Integer has 32 bits
    except
      Application.MessageBox(PChar(Err[35]),'',MB_ICONWARNING);
      Form1.ProgressLabel.Visible:=false;
      Form1.Progressbar.Visible:=false;
      Form1.FixCenterFacelets.Checked:=false;
      Exit;
    end;
    Form1.ProgressLabel.Caption:='';
    if Application.MessageBox(PChar(Err[37]),'',MB_ICONWARNING or MB_YESNO)<>IDYES then
    begin
      PruningCent:=nil;//release memory
      Form1.FixCenterFacelets.Checked:=false;
      Form1.ProgressLabel.Visible:=false;
      Form1.Progressbar.Visible:=false;
      Exit;
    end;
    flipBackward:=false;//flip to backward search if true
    c:=CubieCube.Create;
    d:=CubieCube.Create;

    SetLength(SymState,64430);//16 bits in each word, set bit j (0<=j<=15)
                              //if the coordinate has symmety S(j)
    Form1.SetUpProgressBar(0,64430-1,'Analyzing...');
//Symmetrien des SymCoordinate berechnen
    for i:= 0 to 64430-1 do
    begin
      Form1.ProgressBar.Position:=i;
      if i and $ff =0 then Application.ProcessMessages;
      z:= FlipUDSliceToRawFlipUDSlice[i];
      c.InvUDSliceCoord(z div 2048);
      c.InvEdgeOriCoord(z mod 2048);//c now is a representant

      for j:= 0 to 15 do
      begin
        EdgeMult(EdgeSym[InvIdx[j]],c.PEdge^,prod);
        EdgeMult(prod,EdgeSym[j],d.PEdge^);
        if d.IsFlipUDSLiceCoordRep then //so we got c again, class has symmetry j
        begin
          b:= 1 shl j;
          SymState[i]:=SymState[i] or b;//store symmetry information
        end;
      end;
    end;

    Form1.ProgressBar.Position:=0;
    Form1.SetUpProgressBar(0,14,'Creating '+filename+' (430 MB)');  //????????????????????????
    for i:=0 to 64430*2187-1 do
    begin
      PruningCent[i]:=-1;
      if (i and $8ffff)=0 then Application.ProcessMessages;
    end;
    SetPruningCent(0,0);
    done:=1;
    depth:=-1;
    realDepth:=-1;
    while (done<>Int64(64430)*2187*16)do
    begin
      if realdepth=10 then flipBackward:=true;
      Inc(realDepth);
      Form1.ProgressBar.Position:=realDepth;
      Inc(depth);
      depth:= depth mod 3;
     // for i:=0 to 788*2048-1 do
      for i:=0 to 64430*16-1 do
      begin
        if i and $ff =0 then Application.ProcessMessages;
        idx:=Int64(i)*2187;// ((0..64430-1)*16+(0..16-1))*2187+twist
        match:=true;//any value
        for k:=0 to 2187-1 do
        begin
          case flipBackward of
            true: match:= GetPruningCent(idx)=3;//not occupied yet
            false: match:= GetPruningCent(idx)=depth;
          end;

          if match then
          begin
            twist0:= k;
            cent0:= i mod 16;
            FlipUDSlice0:= i div 16;//0..64430-1
            for m:= Ux1 to Fsx3 do
            begin
              if (not sliceMode) and (m=Usx1) then break;
              {$IF QTM}
                case m of
                Ux2,Rx2,Fx2,Dx2,Lx2,Bx2,Usx2,Rsx2,Fsx2:continue;
                end;
              {$IFEND}
              flipUDSlice:= flipSliceMove[flipUDSlice0,Ord(m)];
              twist:= TwistMove[twist0,m];
              cent:= CentOriRFLBMod2Move[cent0,m];
              sym:= flipUDSlice and 15;
              flipUDSlice:= flipUDSlice shr 4;

              twist:= TwistConjugate[twist,sym];//sym*UDTwist*sym^-1
              cent:= CentOriRFLBMod2Conjugate[cent,sym];
              index:= (Int64(flipUDSlice)*16 + cent)*2187+twist;

              case flipBackward of
                false:
                begin
                  if GetPruningCent(index)=3 then
                  begin
                    SetPruningCent(index,(depth+1) mod 3);
                    Inc(done);
                    sym:= SymState[flipUDSlice];
                    if sym<>1 then //symmetric position has many representations
                    begin
                      for j:= 1 to 15 do
                      begin
                        sym:= sym shr 1;
                        if sym and 1 = 1 then
                        begin
                          altCent:= CentOriRFLBMod2Conjugate[cent,j];
                          altTwist:= TwistConjugate[twist,j];
                          index:= (Int64(flipUDSlice)*16 + altCent)*2187+altTwist;
                          if GetPruningCent(index)=3 then
                          begin
                            SetPruningCent(index,(depth+1) mod 3);
                            Inc(done);
                          end;
                        end;
                      end;
                    end;//if
                  end;
                end;
                true:
                begin
                  if GetPruningCent(index)= depth then
                  begin
                    SetPruningCent(idx,(depth+1) mod 3);
                    Inc(done);
                    goto nextK;
                  end;
                end;
              end;
            end;
          end;
          nextK:
          Inc(idx);
        end;
      end;
    end;
    Form1.ProgressBar.Position:=12;   //????????????????????????????????????????????????????

    fs := TFileStream.Create(filename, fmCreate);
    Form1.SetUpProgressBar(0,450906912 div 2187,'Writing '+filename);
    done:=0;
    Form1.ProgressBar.Position:=done;
    try
      for i:= 0 to 450906912 - 1  do //64430*16*2187/5
      begin
        n:=1;
        value:=0;
        for j:= 0 to 3 do
        begin
          index:= Int64(i)*4 + j;
          value:=value+n*GetPruningCent(index);
          n:=n*3;
        end;
        value:=value+n*GetPruningCent(Int64(450906912)*4+i);
        buf[i mod 2187]:=Byte(value);//2187 divides 450906912
        if i mod 2187 = 2187-1 then
        begin
          fs.WriteBuffer(buf[0],2187);
          Inc(done);
          Form1.ProgressBar.Position:=done;
          Application.ProcessMessages;
        end;
      end;
    except
      Application.MessageBox(PChar(Err[38]),'',MB_ICONWARNING);
      fs.Free;
      fs:=nil;
      if FileExists(PChar(filename)) then DeleteFile(PChar(filename));//delete incomplete file
      Form1.ProgressLabel.Visible:=false;
      Form1.Progressbar.Visible:=false;
      Form1.FixCenterFacelets.Checked:=false;
      Finalize(PruningCent);
      Exit;
    end;
    fs.Free;
    Finalize(PruningCent);
    c.Free;
    d.Free;
    SetLength(PruningCentP,450906912);
    try
      fs := TFileStream.Create(filename, fmOpenRead);
      Form1.SetUpProgressBar(0,2187,'Loading '+filename+' (430 MB)');
      Application.ProcessMessages;
      for i:= 0 to 2187-1 do
      begin
        fs.ReadBuffer(PruningCentP[i*206176],206176);
        Form1.ProgressBar.Position:=i;
        Application.ProcessMessages;
      end;
      fs.Free;
    except
      fs.Free;
      Application.MessageBox(PChar(Err[36]),'',MB_ICONWARNING);
      Form1.ProgressLabel.Visible:=false;
      Form1.Progressbar.Visible:=false;
      Form1.FixCenterFacelets.Checked:=false;
      Exit;
    end;
    Form1.ProgressBar.Visible:= false;
    Form1.ProgressLabel.Visible:=false;
  end;
end;
//++++++++++++++++++End Create cent pruning table++++++++++++++++++++++++++++++++



//++++++++++++++++++Create phase 1 pruning table++++++++++++++++++++++++++++++++
procedure CreateFlipUDSlicePruningTable;
var i,j,n,done,depth,realDepth,flipUDSlice,flipUDSlice0,
    UDTwist,UDTwist0,altUDTwist,z,sym,index,value: Integer;
    c,d: CubieCube; prod: EdgeCubie; prod1:CornerCubie;
    b: Word;  m: Move;
    SymState: array of Word;
    fs: TFileStream;
    flipBackward,match:Boolean;
    fn: String;


    buf: array[0..2187-1] of Byte;
{$IF not QTM}
 const filename1 = 'phase1PF.prun';
 const filename2 = 'phase1PFs.prun';
{$ELSE}
 const filename1 = 'phase1PQ.prun';
 const filename2 = 'phase1PQs.prun';
{$IFEND}
label nextI;
begin
  if sliceMode then fn:=filename2
  else fn:=filename1;
  if FileExists(fn) then
  begin
    SetLength(PruningP,64430*2187 div 5);//file loadable from disk?
    Application.ProcessMessages;
    fs := TFileStream.Create(fn, fmOpenRead);
    fs.ReadBuffer(PruningP[0],64430*2187 div 5);
    fs.Free;
    Form1.ProgressBar.Position:=80;
  end
  else
  begin
    SetLength(Pruning,64430*2187 div 16 + 1);
    flipBackward:=false;//flip to backward search if true
    c:=CubieCube.Create;
    d:=CubieCube.Create;
    SetLength(SymState,64430);//16 bits in each word, set bit j (0<=j<=15)
                              //if the coordinate has symmety S(j)
    Form1.SetUpProgressBar(0,64430-1,'Analyzing...');
//Symmetrien des SymCoordinate berechnen
    for i:= 0 to 64430-1 do
    begin
      Form1.ProgressBar.Position:=i;
      if i and $ff =0 then Application.ProcessMessages;
      z:= FlipUDSliceToRawFlipUDSlice[i];
      c.InvUDSliceCoord(z div 2048);
      c.InvEdgeOriCoord(z mod 2048);//c now is a representant

      for j:= 0 to 15 do
      begin
        EdgeMult(EdgeSym[InvIdx[j]],c.PEdge^,prod);
        EdgeMult(prod,EdgeSym[j],d.PEdge^);
        if d.IsFlipUDSLiceCoordRep then //so we got c again, class has symmetry j
        begin
          b:= 1 shl j;
          SymState[i]:=SymState[i] or b;//store symmetry information
        end;
      end;
    end;



    for i:=0 to 64430*2187 div 16 do Pruning[i]:=-1;
    SetPruning(0,0);
    done:=1;
    depth:=-1;
    realDepth:=-1;

    Form1.SetUpProgressBar(0,13,'Creating '+fn+' (26.8 MB)');
    while (done<>64430*2187)do
    begin
{$IF not QTM}
      if realdepth=8 then flipBackward:=true;
{$ELSE}
      if realdepth=9 then flipBackward:=true;
{$IFEND}

      Inc(realDepth);
      Form1.ProgressBar.Position:=realDepth;
      Inc(depth);
      depth:= depth mod 3;
      for i:=0 to 64430*2187-1 do
      begin
        if i and $3ffff =0 then Application.ProcessMessages;

        match:=true;//any value
        case flipBackward of
          true: match:= GetPruning(i)=3;//not occupied yet
          false: match:= GetPruning(i)=depth;
        end;

        if match then
        begin
          flipUDSlice0:= i div 2187;
          UDTwist0:= i mod 2187;
          for m:= Ux1 to Fsx3 do
          begin
           if (not sliceMode) and (m=Usx1) then break;
           {$IF QTM}
           case m of
              Ux2,Rx2,Fx2,Dx2,Lx2,Bx2,Usx2,Rsx2,Fsx2: continue
            end;
            {$IFEND}

            flipUDSlice:= flipSliceMove[flipUDSlice0,Ord(m)];
            UDTwist:= TwistMove[UDTwist0,m];
            sym:= flipUDSlice and 15;
            flipUDSlice:= flipUDSlice shr 4;

            UDTwist:= TwistConjugate[UDTwist,sym];//sym*UDTwist*sym^-1
            index:= 2187*flipUDSlice+UDTwist;

            case flipBackward of
              false:
              begin
                if GetPruning(index)=3 then
                begin
                  SetPruning(index,(depth+1) mod 3);
                  Inc(done);
                  sym:= SymState[flipUDSlice];
                  if sym<>1 then //symmetric position has many representations
                  begin
                    for j:= 1 to 15 do
                    begin
                      sym:= sym shr 1;
                      if sym and 1 = 1 then
                      begin
                        altUDTwist:= TwistConjugate[UDTwist,j];
                        index:= 2187*flipUDSlice+altUDTwist;
                        if GetPruning(index)=3 then
                        begin
                          SetPruning(index,(depth+1) mod 3);
                          Inc(done);
                        end;
                      end;
                    end;//j
                  end;//if
                end;
              end;
              true:
              begin
                if GetPruning(index)= depth then
                begin
                  SetPruning(i,(depth+1) mod 3);
                  Inc(done);
                  break;
                end;
              end;
            end;
          end;
        end;
        nextI:
      end;
    end;

    Form1.ProgressBar.Position:=12;

    fs := TFileStream.Create(fn, fmCreate);
    Form1.SetUpProgressBar(0,64430 div 5,'Writing '+fn);
    done:=0;
    Form1.ProgressBar.Position:=done;
    for i:= 0 to (64430 div 5)*2187 - 1 do
    begin
      n:=1;
      value:=0;
      for j:= 0 to 3 do
      begin
        value:=value+n*GetPruning(4*i+j);//we want to use mod 4 arithmetic
        n:=n*3;                          //and not mod 5
      end;
      value:=value+n*GetPruning((64430 div 5)*2187*4+i);

      buf[i mod 2187]:=Byte(value);//buffering increases writing speed
      if i mod 2187 = 2186 then
      begin
        fs.WriteBuffer(buf[0],2187);
        Inc(done);
        Form1.ProgressBar.Position:=done;
        Application.ProcessMessages;
      end;
    end;
    fs.Free;
    Finalize(Pruning);
    c.Free;
    d.Free;

    SetLength(PruningP,64430*2187 div 5);
    Application.ProcessMessages;
    fs := TFileStream.Create(fn, fmOpenRead);
    fs.ReadBuffer(PruningP[0],64430*2187 div 5);
    Form1.ProgressBar.Position:=80;
    fs.Free;

    Form1.SetUpProgressBar(0,100,'Loading...');
  end;
end;

{*
procedure CreateFlipUDSlicePruningTable;
var i,j,n,done,depth,realDepth,flipUDSlice,flipUDSlice0,
    UDTwist,UDTwist0,altUDTwist,z,sym,index,value: Integer;
    c,d: CubieCube; prod: EdgeCubie; prod1:CornerCubie;
    b: Word;  m: Move;
    SymState: array of Word;
    fs: TFileStream;
    flipBackward,match:Boolean;
    fn: String;
    buf: array[0..2187-1] of Byte;

 const filename1 = 'phase1PQ.prun';
 const filename2 = 'phase1PQs.prun';

label nextI;
begin
  if sliceMode then fn:=filename2
  else fn:=filename1;
  if FileExists(fn) then
  begin
    SetLength(PruningP,64430*2187 div 5);//file loadable from disk?
    Application.ProcessMessages;
    fs := TFileStream.Create(fn, fmOpenRead);
    fs.ReadBuffer(PruningP[0],64430*2187 div 5);
    fs.Free;
    Form1.ProgressBar.Position:=80;
  end
  else
  begin
    SetLength(Pruning,64430*2187 div 16 + 1);
    flipBackward:=false;//flip to backward search if true
    c:=CubieCube.Create;
    d:=CubieCube.Create;
    SetLength(SymState,64430);//16 bits in each word, set bit j (0<=j<=15)
                              //if the coordinate has symmety S(j)
    Form1.SetUpProgressBar(0,64430-1,'Analyzing...');
//Symmetrien des SymCoordinate berechnen
    for i:= 0 to 64430-1 do
    begin
      Form1.ProgressBar.Position:=i;
      if i and $ff =0 then Application.ProcessMessages;
      z:= FlipUDSliceToRawFlipUDSlice[i];
      c.InvUDSliceCoord(z div 2048);
      c.InvEdgeOriCoord(z mod 2048);//c now is a representant

      for j:= 0 to 15 do
      begin
        EdgeMult(EdgeSym[InvIdx[j]],c.PEdge^,prod);
        EdgeMult(prod,EdgeSym[j],d.PEdge^);
        if d.IsFlipUDSLiceCoordRep then //so we got c again, class has symmetry j
        begin
          b:= 1 shl j;
          SymState[i]:=SymState[i] or b;//store symmetry information
        end;
      end;
    end;


    for i:=0 to 64430*2187 div 16 do Pruning[i]:=-1;
    SetPruning(0,0);
    done:=1;
    depth:=-1;
    realDepth:=-1;

    Form1.SetUpProgressBar(0,13,'Creating '+fn+' (26.8 MB)');
    while (done<>64430*2187)do
    begin
      if realdepth=9 then flipBackward:=true;
      Inc(realDepth);
      Form1.ProgressBar.Position:=realDepth;
      Inc(depth);
      depth:= depth mod 3;
      for i:=0 to 64430*2187-1 do
      begin
        if i and $3ffff =0 then Application.ProcessMessages;

        match:=true;//any value
        case flipBackward of
          true: match:= GetPruning(i)=3;//not occupied yet
          false: match:= GetPruning(i)=depth;
        end;

        if match then
        begin
          flipUDSlice0:= i div 2187;
          UDTwist0:= i mod 2187;
          for m:= Ux1 to Fsx3 do
          begin
           if (not sliceMode) and (m=Usx1) then break;
           case m of
              Ux2,Rx2,Fx2,Dx2,Lx2,Bx2,Usx2,Rsx2,Fsx2: continue
            end;

            flipUDSlice:= flipSliceMove[flipUDSlice0,Ord(m)];
            UDTwist:= TwistMove[UDTwist0,m];
            sym:= flipUDSlice and 15;
            flipUDSlice:= flipUDSlice shr 4;

            UDTwist:= TwistConjugate[UDTwist,sym];//sym*UDTwist*sym^-1
            index:= 2187*flipUDSlice+UDTwist;

            case flipBackward of
              false:
              begin
                if GetPruning(index)=3 then
                begin
                  SetPruning(index,(depth+1) mod 3);
                  Inc(done);
                  sym:= SymState[flipUDSlice];
                  if sym<>1 then //symmetric position has many representations
                  begin
                    for j:= 1 to 15 do
                    begin
                      sym:= sym shr 1;
                      if sym and 1 = 1 then
                      begin
                        altUDTwist:= TwistConjugate[UDTwist,j];
                        index:= 2187*flipUDSlice+altUDTwist;
                        if GetPruning(index)=3 then
                        begin
                          SetPruning(index,(depth+1) mod 3);
                          Inc(done);
                        end;
                      end;
                    end;//j
                  end;//if
                end;
              end;
              true:
              begin
                if GetPruning(index)= depth then
                begin
                  SetPruning(i,(depth+1) mod 3);
                  Inc(done);
                  break;
                end;
              end;
            end;
          end;
        end;
        nextI:
      end;
    end;

    Form1.ProgressBar.Position:=12;

    fs := TFileStream.Create(fn, fmCreate);
    Form1.SetUpProgressBar(0,64430 div 5,'Writing '+fn);
    done:=0;
    Form1.ProgressBar.Position:=done;
    for i:= 0 to (64430 div 5)*2187 - 1 do
    begin
      n:=1;
      value:=0;
      for j:= 0 to 3 do
      begin
        value:=value+n*GetPruning(4*i+j);//we want to use mod 4 arithmetic
        n:=n*3;                          //and not mod 5
      end;
      value:=value+n*GetPruning((64430 div 5)*2187*4+i);

      buf[i mod 2187]:=Byte(value);//buffering increases writing speed
      if i mod 2187 = 2186 then
      begin
        fs.WriteBuffer(buf[0],2187);
        Inc(done);
        Form1.ProgressBar.Position:=done;
        Application.ProcessMessages;
      end;
    end;
    fs.Free;
    Finalize(Pruning);
    c.Free;
    d.Free;

    SetLength(PruningP,64430*2187 div 5);
    Application.ProcessMessages;
    fs := TFileStream.Create(fn, fmOpenRead);
    fs.ReadBuffer(PruningP[0],64430*2187 div 5);
    Form1.ProgressBar.Position:=80;
    fs.Free;

    Form1.SetUpProgressBar(0,100,'Loading...');
  end;
end;
*}


//+++++++++++++++++++++End Create phase 1 pruning table+++++++++++++++++++++++++

//++++++++++++++++++Create phase 2 pruning table++++++++++++++++++++++++++++++++
{$IF not QTM}
procedure CreatePhase2PruningTable;
var i,j,n,done,depth,realDepth,edge8Pos,edge8PosConj,edge8Pos0,cornPos0,
    symCornPos,symCornPos0,sym,index,altEdge8Pos,value:Integer; z,b:Word;
    SymState: array of Word; c,d:CubieCube; prod: CornerCubie;
    fs: TFileStream;
    m: Move;
    flipBackward,match:Boolean;
    buf: array[0..2768-1] of Byte;
    fn: String;
const filename1 = 'phase2PF.prun';
const filename2 = 'phase2PFs.prun';

label nextI;
begin
  if sliceMode then fn:=filename2 else fn:=filename1;
  if FileExists(fn) then
  begin
    SetLength(PruningPhase2P,2768*40320 div 5);
    Application.ProcessMessages;
    fs := TFileStream.Create(fn, fmOpenRead);
    fs.ReadBuffer(PruningPhase2P[0],2768*40320 div 5);
    Form1.ProgressBar.Position:=90;
    fs.Free;
  end
  else
  begin
    SetLength(PruningPhase2,2768*40320 div 16 + 1);
    flipBackward:=false;//flip to backward search if true
    c:=CubieCube.Create;
    d:=CubieCube.Create;
    SetLength(SymState,2768);
    Form1.SetUpProgressBar(0,2768-1,'Analyzing...');
    for i:= 0 to 2768-1 do
    begin
      Form1.ProgressBar.Position:=i;
      if i and $ff =0 then Application.ProcessMessages;
      z:= SymCornPosToCornPos[i];//symmetry part is 0
      c.InvCornPermCoord(z);

      for j:= 0 to 15 do
      begin
        CornMult(CornSym[InvIdx[j]],c.PCorn^,prod);
        CornMult(prod,CornSym[j],d.PCorn^);
        if CornPosToSymCornPos[d.CornPermCoord] and $f = 0 then
        begin
          b:= 1 shl j;
          SymState[i]:=SymState[i] or b;
        end;
      end;
    end;

    for i:=0 to 2768*40320 div 16 do PruningPhase2[i]:=-1;
    SetPruningPhase2(0,0);
    done:=1;
    depth:=-1;
    realDepth:=-1;
    Form1.SetUpProgressBar(0,18,'Creating '+fn+' (21.2 MB)');
    while (done<>2768*40320)do
    begin
      if realdepth=12 then flipBackward:=true;
      Inc(realDepth);
      Form1.ProgressBar.Position:=realDepth;
      Inc(depth);
      depth:= depth mod 3;

      for i:=0 to 2768*40320-1 do
      begin
        if i and $3ffff =0 then Application.ProcessMessages;

        match:=true;//any value
        case flipBackward of
          true: match:= GetPruningPhase2(i)=3;//not occupied yet
          false: match:= GetPruningPhase2(i)=depth;
        end;

        if match then
        begin
          edge8Pos0:= i div 2768;
          symCornPos0:= i mod 2768;
          cornPos0:=SymCornPosToCornPos[symCornPos0];
          for m:= Ux1 to Fsx3 do
          begin
            if (not sliceMode) and (m=Usx1) then break;
            case m of
              Rx1,Rx3,Fx1,Fx3,Lx1,Lx3,Bx1,Bx3,Rsx1,Rsx3,Fsx1,Fsx3:continue;
            end;
            symCornPos:= CornPosToSymCornPos[CornPermMove[cornPos0,m]];
            edge8Pos:= Edge8PermMove[Edge8Pos0,m];
            sym:= symCornPos and 15;
            SymCornPos:= symCornPos shr 4;
            edge8PosConj:= Edge8PosConjugate[edge8Pos,sym];//
            index:= 2768*edge8PosConj+SymCornPos;

            case flipBackward of
              false:
              begin
                if GetPruningPhase2(index)=3 then
                begin
                  SetPruningPhase2(index,(depth+1) mod 3);
                  Inc(done);
                  sym:= SymState[SymCornPos];
                  if sym<>1 then //symmetric position has many representations
                  begin
                    for j:= 1 to 15 do
                    begin
                      sym:= sym shr 1;
                      if sym and 1 = 1 then
                      begin
                        altEdge8Pos:= Edge8PosConjugate[edge8PosConj,j];//
                        index:= 2768*altEdge8Pos+SymCornPos;
                        if GetPruningPhase2(index)=3 then
                        begin
                          SetPruningPhase2(index,(depth+1) mod 3);
                          Inc(done);
                        end;
                      end;
                    end;
                  end;//if
                end;
              end;
              true:
              begin
                if GetPruningPhase2(index)= depth then
                begin
                  SetPruningPhase2(i,(depth+1) mod 3);
                  Inc(done);
                    break;
                end;
              end;
            end;

          end;//for m
        end;//if match
      end;//for i
    end;//while done...
    Form1.ProgressBar.Position:=18;
    fs := TFileStream.Create(fn, fmCreate);
    Form1.SetUpProgressBar(0,40320 div 5,'Writing '+fn);
    done:=0;
    Form1.ProgressBar.Position:=done;
    for i:= 0 to (40320 div 5)*2768 - 1 do //compression
    begin
      n:=1;
      value:=0;
      for j:= 0 to 3 do
      begin
        value:=value+n*GetPruningPhase2(4*i+j);
        n:=n*3;
      end;
      value:=value+n*GetPruningPhase2((40320 div 5)*2768*4+i);

      buf[i mod 2768]:=Byte(value);//buffering increases writing speed
      if i mod 2768 = 2768-1 then
      begin
        fs.WriteBuffer(buf[0],2768);
        Inc(done);
        Form1.ProgressBar.Position:=done;
        Application.ProcessMessages;
      end;
    end;
    fs.Free;
    Finalize(PruningPhase2);
    c.Free;
    d.Free;

    SetLength(PruningPhase2P,2768*40320 div 5);
    Application.ProcessMessages;
    fs := TFileStream.Create(fn, fmOpenRead);
    fs.ReadBuffer(PruningPhase2P[0],2768*40320 div 5);
    Form1.ProgressBar.Position:=90;
    fs.Free;

    Form1.SetUpProgressBar(0,100,'Loading...');
  end;
end;

{$ELSE}


procedure CreatePhase2PruningTable;
var i,j,n,done,depth,edge8Pos,edge8PosConj,edge8Pos0,cornPos0,
    symCornPos,symCornPos0,sym,index,altEdge8Pos,value:Integer; z,b:Word;
    SymState: array of Word; c,d:CubieCube; prod: CornerCubie;
    fs: TFileStream;
    m: Move;
    buf: array[0..2768-1] of Byte;
    buffer:array of Byte;
    fn: String;
const filename1 = 'phase2Q.prun';
const filename2 = 'phase2Qs.prun';

label nextI;
begin
  if sliceMode then fn:=filename1 else fn:=filename1; //slice mode not possible in QTM
  if FileExists(fn) then
  begin
    SetLength(PruningPhase2Q,2768*40320 div 2+2768);
    Application.ProcessMessages;
    fs := TFileStream.Create(fn, fmOpenRead);
    fs.ReadBuffer(PruningPhase2Q[0],2768*40320 div 2+2768);
    Form1.ProgressBar.Position:=90;
    fs.Free;
  end
  else
  begin
    SetLength(PruningPhase2Q,2768*40320);
    c:=CubieCube.Create;
    d:=CubieCube.Create;
    SetLength(SymState,2768);
    Form1.SetUpProgressBar(0,2768-1,'Analyzing...');
    for i:= 0 to 2768-1 do
    begin
      Form1.ProgressBar.Position:=i;
      if i and $ff =0 then Application.ProcessMessages;
      z:= SymCornPosToCornPos[i];//symmetry part is 0
      c.InvCornPermCoord(z);

      for j:= 0 to 15 do
      begin
        CornMult(CornSym[InvIdx[j]],c.PCorn^,prod);
        CornMult(prod,CornSym[j],d.PCorn^);
        if CornPosToSymCornPos[d.CornPermCoord] and $f = 0 then
        begin
          b:= 1 shl j;
          SymState[i]:=SymState[i] or b;
        end;
      end;
    end;

    for i:=0 to 2768*40320-1 do PruningPhase2Q[i]:=255;
    PruningPhase2Q[0]:=0;


   //   PruningPhase2Q[0]:= PruningPhase2Q[0] or (13 shl (4 ));



    done:=1;
    depth:=-1;
    Form1.SetUpProgressBar(0,30,'Creating '+fn+' (53.2 MB)');
    while (done<>2768*40320)do
    begin
      Form1.ProgressBar.Position:=depth;
      Inc(depth);

      for i:=0 to 2768*40320-1 do  //hier erst mal nur mit den Drehungen der Länge 1
      begin
        if i and $3ffff =0 then Application.ProcessMessages;

        if PruningPhase2Q[i]=depth then
        begin
          edge8Pos0:= i div 2768;
          symCornPos0:= i mod 2768;
          cornPos0:=SymCornPosToCornPos[symCornPos0];
          for m:= Ux1 to Bx3 do//Usx3 do//slice mode funktioniert nicht mit Komprimierung, da Usx etc die Parität nicht ändert
          begin
            if (not sliceMode) and (m=Usx1) then break;
            case m of
               Ux2,Rx1,Rx2,Rx3,Fx1,Fx2,Fx3,Dx2,Lx1,Lx2,Lx3,Bx1,Bx2,Bx3,Usx2:continue;//only Ux1,Ux3,Dx1,Dx3,Usx1,Usx3
            end;
            symCornPos:= CornPosToSymCornPos[CornPermMove[cornPos0,m]];
            edge8Pos:= Edge8PermMove[Edge8Pos0,m];
            sym:= symCornPos and 15;
            SymCornPos:= symCornPos shr 4;
            edge8PosConj:= Edge8PosConjugate[edge8Pos,sym];//
            index:= 2768*edge8PosConj+SymCornPos;


                if PruningPhase2Q[index]=255 then
                begin
                 PruningPhase2Q[index]:=depth+1;
                  Inc(done);
                  sym:= SymState[SymCornPos];
                  if sym<>1 then //symmetric position has many representations
                  begin
                    for j:= 1 to 15 do
                    begin
                      sym:= sym shr 1;
                      if sym and 1 = 1 then
                      begin
                        altEdge8Pos:= Edge8PosConjugate[edge8PosConj,j];
                        index:= 2768*altEdge8Pos+SymCornPos;
                        if PruningPhase2Q[index]=255 then
                        begin
                          PruningPhase2Q[index]:=depth+1;
                          Inc(done);
                        end;
                      end;
                    end;
                  end;//if
                end;



          end;//for m
        end;//if Pruning
      end;//for i


    if depth>0 then
    begin
      for i:=0 to 2768*40320-1 do  //hier mit den Drehungen der Länge 2
      begin
        if i and $3ffff =0 then Application.ProcessMessages;


        if PruningPhase2Q[i]=depth-1 then
        begin
          edge8Pos0:= i div 2768;
          symCornPos0:= i mod 2768;
          cornPos0:=SymCornPosToCornPos[symCornPos0];
          for m:= Ux1 to Bx3 do//to Fsx3 do //Komprimierung in slice mode versagt
          begin
            if (not sliceMode) and (m=Usx1) then break;
            case m of
              Ux1,Ux2,Ux3,Rx1,Rx3,Fx1,Fx3,Dx1,Dx2,Dx3,Lx1,Lx3,Bx1,Bx3,Usx1,Usx2,Usx3,Rsx1,Rsx3,Fsx1,Fsx3:continue;//only Rx2,Fx2,Lx2,Bx2,Rsx2,Fsx2
            end;
            symCornPos:= CornPosToSymCornPos[CornPermMove[cornPos0,m]];
            edge8Pos:= Edge8PermMove[Edge8Pos0,m];
            sym:= symCornPos and 15;
            SymCornPos:= symCornPos shr 4;
            edge8PosConj:= Edge8PosConjugate[edge8Pos,sym];//
            index:= 2768*edge8PosConj+SymCornPos;


                if PruningPhase2Q[index]=255 then
                begin
                  PruningPhase2Q[index]:=depth+1;
                  Inc(done);
                  sym:= SymState[SymCornPos];
                  if sym<>1 then //symmetric position has many representations
                  begin
                    for j:= 1 to 15 do
                    begin
                      sym:= sym shr 1;
                      if sym and 1 = 1 then
                      begin
                        altEdge8Pos:= Edge8PosConjugate[edge8PosConj,j];//
                        index:= 2768*altEdge8Pos+SymCornPos;
                        if PruningPhase2Q[index]=255 then
                        begin
                          PruningPhase2Q[index]:=depth+1;
                          Inc(done);
                        end;
                      end;
                    end;
                  end;//if
                end;

          end;//for m
        end;//if Pruning
      end;//for i
  end//if depth>0

    end;//while done...

    SetLength(depthmod2Remain,2768);
    for i:= 0 to 2768-1 do
      depthmod2Remain[i]:= PruningPhase2Q[i] mod 2;//ob gerade oder ungerade Tiefe hängt nur von der symcornpos ab
    SetLength(buffer,2768*40320 div 2);
    For i:=0 to 2768*40320 div 2 -1 do buffer[i]:=0;
    // die Werte jetzt packen
    for i:=0 to 2768*40320 div 2 -1  do
    begin
      buffer[i]:= (PruningPhase2Q[2*i] div 2) or  ((PruningPhase2Q[2*i+1] div 2) shl 4);//Werte<=15
    end;
    Finalize(PruningPhase2Q);
    Application.ProcessMessages;
    fs := TFileStream.Create(fn, fmCreate);
    fs.WriteBuffer(buffer[0],2768*40320 div 2);
    fs.WriteBuffer(depthmod2remain[0],2768);
    Form1.ProgressBar.Position:=90;
    fs.Free;
    c.Free;
    d.Free;
    Finalize(depthmod2Remain);

    SetLength(PruningPhase2Q,2768*40320 div 2+2768);  //in komprimierter Form neu laden
    Application.ProcessMessages;
    fs := TFileStream.Create(fn, fmOpenRead);
    fs.ReadBuffer(PruningPhase2Q[0],2768*40320 div 2+2768);
    fs.Free;

    Form1.SetUpProgressBar(0,100,'Loading...');
  end;
end;
{$IFEND}


//++++++++++++++++++End Create phase 2 pruning table++++++++++++++++++++++++++++

//++++++++++++++++++Create full corner table++++++++++++++++++++++++++++++++
procedure CreateFullCornerPruningTable(useSlice:Boolean);
var i,j,n,done,depth,realDepth,cori,coriConj,cori0,cPerm0,
    symCPerm,symCPerm0,sym,index,altCori,value:Integer; z,b:Word;
    SymState: array of Word; c,d:CubieCube; prod: CornerCubie;
    fs: TFileStream;
    m: Move;
    flipBackward,match:Boolean;
    buf: array[0..2768-1] of Byte;
    filename: String;

label nextI;
begin
{$IF not QTM}
  if useSlice then filename := 'fullCornerFs.prun' else filename := 'fullCornerF.prun';
{$ELSE}
  if useSlice then filename := 'fullCornerQs.prun' else filename := 'fullCornerQ.prun';
{$IFEND}
  if FileExists(filename) then
  begin
    SetLength(PruningFullCorner,2768*2187 div 16 + 1);
    Application.ProcessMessages;
    fs := TFileStream.Create(filename, fmOpenRead);
    fs.ReadBuffer(PruningFullCorner[0],1513408);//  (2768*2187 div 16 + 1)*4
    Form1.ProgressBar.Position:=90;//evtl ändern!!!
    fs.Free;
  end
  else
  begin
    SetLength(PruningFullCorner,2768*2187 div 16 + 1);
    flipBackward:=false;//flip to backward search if true
    c:=CubieCube.Create;
    d:=CubieCube.Create;
    SetLength(SymState,2768);
    Form1.SetUpProgressBar(0,2768-1,'Analyzing...');
    for i:= 0 to 2768-1 do
    begin
      Form1.ProgressBar.Position:=i;
      if i and $ff =0 then Application.ProcessMessages;
      z:= SymCornPosToCornPos[i];//symmetry part is 0
      c.InvCornPermCoord(z);

      for j:= 0 to 15 do
      begin
        CornMult(CornSym[InvIdx[j]],c.PCorn^,prod);
        CornMult(prod,CornSym[j],d.PCorn^);
        if CornPosToSymCornPos[d.CornPermCoord] and $f = 0 then
        begin
          b:= 1 shl j;
          SymState[i]:=SymState[i] or b;
        end;
      end;
    end;

    for i:=0 to 2768*2187 div 16 do PruningFullCorner[i]:=-1;
    SetPruningFullCorner(0,0);
    done:=1;
    depth:=-1;
    realDepth:=-1;
    Form1.SetUpProgressBar(0,11,'Creating '+filename+' (1.4 MB)');
    while (done<>2768*2187)do
    begin
      if realdepth=8 then flipBackward:=true;
      Inc(realDepth);
      Form1.ProgressBar.Position:=realDepth;
      Inc(depth);
      depth:= depth mod 3;

      for i:=0 to 2768*2187-1 do
      begin
        if i and $3ffff =0 then Application.ProcessMessages;

        match:=true;//any value
        case flipBackward of
          true: match:= GetPruningFullCorner(i)=3;//not occupied yet
          false: match:= GetPruningFullCorner(i)=depth;
        end;

        if match then
        begin
          //edge8Pos0:= i div 2768;
          cori0:= i div 2768;
          symCPerm0:= i mod 2768;
          cPerm0:=SymCornPosToCornPos[symCPerm0];
          for m:= Ux1 to Fsx3 do //slice moves ergänzt
          begin
          if (not useSlice) and (m=Usx1) then break;
          {$IF QTM}
                case m of
                Ux2,Rx2,Fx2,Dx2,Lx2,Bx2,Usx2,Rsx2,Fsx2:continue;
                end;
          {$IFEND}
            symCPerm:= CornPosToSymCornPos[CornPermMove[cPerm0,m]];
            cori:= TwistMove[cori0,m];
            sym:= symCPerm and 15;
            SymCPerm:= symCPerm shr 4;
            coriConj:= TwistConjugate[cori,sym];//
            index:= 2768*coriConj+SymCPerm;

            case flipBackward of
              false:
              begin
                if GetPruningFullCorner(index)=3 then
                begin
                  SetPruningFullCorner(index,(depth+1) mod 3);
                  Inc(done);
                  sym:= SymState[SymCPerm];
                  if sym<>1 then //symmetric position has many representations
                  begin
                    for j:= 1 to 15 do
                    begin
                      sym:= sym shr 1;
                      if sym and 1 = 1 then
                      begin
                        altCori:= TwistConjugate[coriConj,j];//
                        index:= 2768*altCori+SymCPerm;
                        if GetPruningFullCorner(index)=3 then
                        begin
                          SetPruningFullCorner(index,(depth+1) mod 3);
                          Inc(done);
                        end;
                      end;
                    end;
                  end;//if
                end;
              end;
              true:
              begin
                if GetPruningFullCorner(index)= depth then
                begin
                  SetPruningFullCorner(i,(depth+1) mod 3);
                  Inc(done);
                    break;
                end;
              end;
            end;

          end;//for m
        end;//if match
      end;//for i
    end;//while done...
    Form1.ProgressBar.Position:=12;
    Application.ProcessMessages;

    fs := TFileStream.Create(filename, fmCreate);
    fs.WriteBuffer(PruningFullCorner[0],1513408);
    Form1.ProgressBar.Position:=90;//evtl ändern!!!
    fs.Free;
    c.Free;
    d.Free;
  end;
end;
//++++++++++++++++++End Create full corner pruning table++++++++++++++++++++++++++++



//++++++++++++++++++++++Create big pruning table++++++++++++++++++++++++++++++++
procedure CreateBigPruningTable;
var i,j,n,k,depth,realDepth,UDSliceSortedSym,UDSliceSortedSym0,
    twist,twist0,flip,flip0,altTwist,altFlip,z,sym,value: Integer;
    c,d: CubieCube;
    b: Word;  m: Move;
    SymState: array of Word;
    fs: TFileStream;
    done,index,idx:Cardinal;
    x:Integer;
    flipBackward,match:Boolean;
    buf: array[0..3379-1] of Byte;

    filename:String;

label nextK;

begin
{$IF not QTM}
  if sliceMode then filename:= 'bigPFs.prun'   else filename:='bigPF.prun';
{$ELSE}
  if sliceMode then filename:= 'bigPQs.prun'   else filename:='bigPQ.prun';
{$IFEND}
  Form1.SetUpProgressBar(0,788,'Initializing memory. Please wait...');
  Form1.ProgressLabel.Visible:=true;
  Form1.Progressbar.Visible:=true;
  fs:=nil;
  SetCurrentDir(ExtractFilePath(Paramstr(0)));//Cube Explorer directory
  if FileExists(filename) then
  begin
    try
       SetLength(PruningBigP,705886618);//788*2187*2048 div 5 + 1 (=766*921523)
    except
      Application.MessageBox(PChar(Err[17]),'',MB_ICONWARNING);
      Form1.ProgressLabel.Visible:=false;
      Form1.Progressbar.Visible:=false;
      USES_BIG:=false;
      OptOptionForm.CheckUseHuge.Checked:=false;
      Exit;
    end;
    try
      fs := TFileStream.Create(filename, fmOpenRead);
      Form1.SetUpProgressBar(0,766,'Loading '+filename+' (673 MB)');
      Application.ProcessMessages;
      for i:= 0 to 766-1 do
      begin
        fs.ReadBuffer(PruningBigP[i*921523],921523);
        Form1.ProgressBar.Position:=i;
        Application.ProcessMessages;
      end;
      fs.Free;
      Form1.ProgressBar.Visible:= false;
      Form1.ProgressLabel.Visible:=false;
    except
      fs.Free;
      Application.MessageBox(PChar(Err[18]),'',MB_ICONWARNING);
      Form1.ProgressLabel.Visible:=false;
      Form1.Progressbar.Visible:=false;
      Finalize(PruningBigP);
      USES_BIG:=false;//not necessary here
      OptOptionForm.CheckUseHuge.Checked:=false;//also sets USES_BIG
      Exit;
    end;
  end
  else
  begin
    Application.ProcessMessages;
    {$IF not QTM}
    SetLength(PruningPhase2P,0);//Gibt es in QTM nicht
    {$IFEND}

    SetLength(PruningP,0);
    try
      SetLength(PruningBig,788*2187*128 + 1);
    except
      Application.MessageBox(PChar(Err[17]),'',MB_ICONWARNING);
      Form1.ProgressLabel.Visible:=false;
      Form1.Progressbar.Visible:=false;
      USES_BIG:=false;
      OptOptionForm.CheckUseHuge.Checked:=false;
      CreateFlipUDSlicePruningTable;
      CreatePhase2PruningTable;
      Exit;
    end;
    Form1.ProgressLabel.Caption:='';
    if Application.MessageBox(PChar(Err[20]),'',MB_ICONWARNING or MB_YESNO)<>IDYES then
    begin
      PruningBig:=nil;//release memory
      USES_BIG:=false;
      OptOptionForm.CheckUseHuge.Checked:=false;
      Form1.ProgressLabel.Visible:=false;
      Form1.Progressbar.Visible:=false;
      Exit;
    end;
    flipBackward:=false;//flip to backward search if true
    c:=CubieCube.Create;
    d:=CubieCube.Create;
    SetLength(SymState,788);
    for i:= 0 to 788-1 do
    begin
      z:= UDSliceSortedSymToUDSliceSorted[i];
      c.InvUDSliceSortedCoord(z);
      for j:= 0 to 15 do
      begin
        EdgeMult(EdgeSym[InvIdx[j]],c.PEdge^,c.PEdgeTemp^);
        EdgeMult(c.PEdgeTemp^,EdgeSym[j],d.PEdge^);
        if d.IsUDSliceSortedCoordRep then //so we got c agian
        begin
          b:= 1 shl j;
          SymState[i]:=SymState[i] or b;
        end;
      end;
    end;
    Form1.ProgressBar.Position:=0;
    Form1.SetUpProgressBar(0,14,'Creating '+filename+' (673 MB)');
    for i:=0 to 788*2187*128 do
    begin
      PruningBig[i]:=-1;
      if (i and $8ffff)=0 then Application.ProcessMessages;
    end;
    SetPruningBig(0,0);
    done:=1;
    depth:=-1;
    realDepth:=-1;
    while (done<>Int64(788)*2187*2048)do
    begin
      {$IF not QTM}
      if realdepth=9 then flipBackward:=true;
      {$ELSE}
      if realdepth=10 then flipBackward:=true;
      {$IFEND}
      Inc(realDepth);
      Form1.ProgressBar.Position:=realDepth;
      Inc(depth);
      depth:= depth mod 3;
      for i:=0 to 788*2048-1 do
      begin
        if i and $ff =0 then Application.ProcessMessages;
        idx:=Int64(i)*2187;
        match:=true;//any value
        for k:=0 to 2187-1 do
        begin
          case flipBackward of
            true: match:= GetPruningBig(idx)=3;//not occupied yet
            false: match:= GetPruningBig(idx)=depth;
          end;

          if match then
          begin
            twist0:= k;
            flip0:= i mod 2048;
            UDSliceSortedSym0:= i div 2048;//0..788-1
            for m:= Ux1 to Fsx3 do
            begin
              if (not sliceMode) and (m=Usx1) then break;
              {$IF QTM}
                case m of
                Ux2,Rx2,Fx2,Dx2,Lx2,Bx2,Usx2,Rsx2,Fsx2:continue;
                end;
              {$IFEND}
              UDSliceSortedSym:= UDSliceSortedSymMove[UDSliceSortedSym0,m];
              flip:= FlipMove[flip0,m];
              twist:= TwistMove[twist0,m];
              sym:= UDSliceSortedSym and 15;
              UDSliceSortedSym:= UDSliceSortedSym shr 4;

              flip:= FlipConjugate[flip,sym,UDSliceSortedSym];//modified Version
              twist:= TwistConjugate[twist,sym];//sym*UDTwist*sym^-1
              index:= (Int64(UDSliceSortedSym)*2048 +flip)*2187+twist;

              case flipBackward of
                false:
                begin
                  if GetPruningBig(index)=3 then
                  begin
                    SetPruningBig(index,(depth+1) mod 3);
                    Inc(done);
                    sym:= SymState[UDSliceSortedSym];
                    if sym<>1 then //symmetric position has many representations
                    begin
                      for j:= 1 to 15 do
                      begin
                        sym:= sym shr 1;
                        if sym and 1 = 1 then
                        begin
                          altflip:= FlipConjugate[flip,j,UDSliceSortedSym];
                          altTwist:= TwistConjugate[twist,j];
                          index:= (Int64(UDSliceSortedSym)*2048 +altFlip)*2187+altTwist;
                          if GetPruningBig(index)=3 then
                          begin
                            SetPruningBig(index,(depth+1) mod 3);
                            Inc(done);
                          end;
                        end;
                      end;
                    end;//if
                  end;
                end;
                true:
                begin
                  if GetPruningBig(index)= depth then
                  begin
                    SetPruningBig(idx,(depth+1) mod 3);
                    Inc(done);
                    goto nextK;
                  end;
                end;
              end;



            end;
          end;
          nextK:
          Inc(idx);
        end;
      end;
    end;
    Form1.ProgressBar.Position:=12;

    fs := TFileStream.Create(filename, fmCreate);
    Form1.SetUpProgressBar(0,705886618 div 3379,'Writing '+filename);
    done:=0;
    Form1.ProgressBar.Position:=done;
    try
      for i:= 0 to 705886618 - 1 - 2 do //compression, last two bytes special handling
      begin                             // because no 5. entry there
        n:=1;
        value:=0;
        for j:= 0 to 3 do
        begin
          index:= Int64(i)*4 + j;
          value:=value+n*GetPruningBig(index);
          n:=n*3;
        end;
        value:=value+n*GetPruningBig(Int64(705886618)*4+i);
        buf[i mod 3379]:=Byte(value);//3379 divides 705886618-2
        if i mod 3379 = 3379-1 then
        begin
          fs.WriteBuffer(buf[0],3379);
          Inc(done);
          Form1.ProgressBar.Position:=done;
          Application.ProcessMessages;
        end;
      end;
      for i:= 705886618 - 1 - 1 to 705886618 - 1 do //special handling
      begin
        n:=1;
        value:=0;
        for j:= 0 to 3 do
        begin
          index:= Int64(i)*4 + j;
          value:=value+n*GetPruningBig(index);
          n:=n*3;
        end;
        fs.WriteBuffer(value,1);
      end;
    except
      Application.MessageBox(PChar(Err[19]),'',MB_ICONWARNING);
      fs.Free;
      if FileExists(PChar(filename)) then DeleteFile(PChar(filename));//delete incomplete file
      Form1.ProgressLabel.Visible:=false;
      Form1.Progressbar.Visible:=false;
      USES_BIG:=false;//not necessary here
      OptOptionForm.CheckUseHuge.Checked:=false;//also sets USES_BIG
      Finalize(PruningBig);
      CreateFlipUDSlicePruningTable;//load again
      CreatePhase2PruningTable;
      Exit;
    end;
    fs.Free;
    Finalize(PruningBig);
    c.Free;
    d.Free;
    SetLength(PruningBigP,705886618);
    try
      fs := TFileStream.Create(filename, fmOpenRead);
      Form1.SetUpProgressBar(0,766,'Loading '+filename+' (673 MB)');
      Application.ProcessMessages;
      for i:= 0 to 766-1 do
      begin
        fs.ReadBuffer(PruningBigP[i*921523],921523);
        Form1.ProgressBar.Position:=i;
        Application.ProcessMessages;
      end;
      fs.Free;
    except
      fs.Free;
      Application.MessageBox(PChar(Err[18]),'',MB_ICONWARNING);
      Form1.ProgressLabel.Visible:=false;
      Form1.Progressbar.Visible:=false;
      USES_BIG:=false;//not necessary here
      OptOptionForm.CheckUseHuge.Checked:=false;//also sets USES_BIG
      CreateFlipUDSlicePruningTable;//load again
      CreatePhase2PruningTable;
      Exit;
    end;
    Form1.ProgressBar.Visible:= false;
    Form1.ProgressLabel.Visible:=false;
    CreateFlipUDSlicePruningTable;//load tables again again
    CreatePhase2PruningTable;
  end;
end;
//++++++++++++++++++End Create big pruning table++++++++++++++++++++++++++++++++

//Create Table for conjugation of corner orientation coordinate with symmetry+++
procedure CreateTwistConjugateTable;
var c1,c2: CubieCube; prodC: CornerCubie; i,j: Integer;
begin
  c1:= CubieCube.Create;
  c2:= CubieCube.Create;
  Application.ProcessMessages;
  for i:=0 to 2187-1 do
  begin
    c1.InvCornOriCoord(i);
    for j:= 0 to 15 do
    begin
      CornMult(CornSym[j],c1.PCorn^,prodC);
      CornMult(prodC,CornSym[InvIdx[j]],c2.PCorn^);
      TwistConjugate[i,j]:= c2.CornOriCoord;
    end;
  end;
  c1.free;
  c2.free;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//Create Table for conjugation of FRLB  center Twist coordinate by symmetry+++++
procedure CreateCentOriRFLBMod2ConjugateTable;
var c1,c2: CubieCube; prodCn: CenterCubie; i,j: Integer;
begin
  c1:= CubieCube.Create;
  c2:= CubieCube.Create;
  Application.ProcessMessages;
  for i:=0 to 16-1 do
  begin
    c1.InvCentOriRFLBMod2Coord(i);
    for j:= 0 to 15 do
    begin
      CentMult(CentSym[j],c1.PCent^,prodCn);
      CentMult(prodCn,CentSym[InvIdx[j]],c2.PCent^);
      CentOriRFLBMod2Conjugate[i,j]:= c2.CentOriRFLBMod2Coord;
    end;
  end;
  c1.free;
  c2.free;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

{
//Create Table for conjugation of UDslice coordinate with symmetry++++++++++++++
procedure CreateUDSliceConjugateTable;
var c1,c2: CubieCube; prodE: EdgeCubie; i,j: Integer;
begin
  c1:= CubieCube.Create;
  c2:= CubieCube.Create;
  Application.ProcessMessages;
  for i:=0 to 495-1 do
  begin
    c1.InvUDSliceCoord(i);
    for j:= 0 to 15 do
    begin
      EdgeMult(EdgeSym[j],c1.PEdge^,prodE);
      EdgeMult(prodE,EdgeSym[InvIdx[j]],c2.PEdge^);
      UDSliceConjugate[i,j]:= c2.UDSliceCoord;
    end;
  end;
  c1.free;
  c2.free;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
}


//Create Table for conjugation of tetraeder coordinate with symmetry+++
procedure CreateTetraConjugateTable;
var c1,c2: CubieCube; prodC: CornerCubie; i,j: Integer;
begin
  c1:= CubieCube.Create;
  c2:= CubieCube.Create;
  Application.ProcessMessages;
  for i:=0 to 70-1 do
  begin
    c1.InvTetraCoord(i);
    for j:= 0 to 15 do
    begin
      CornMult(CornSym[j],c1.PCorn^,prodC);
      CornMult(prodC,CornSym[InvIdx[j]],c2.PCorn^);
      TetraConjugate[i,j]:= c2.TetraCoord;
    end;
  end;
  c1.free;
  c2.free;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


//Create Table for conjugation of edge orientation coordinate with symmetry+++++
procedure CreateFlipConjugateTable;
//with the "usual" definition of the orientations you need information
//about the position of the UD-slice edges for correct conjugation
//we use the classindex of UDSliceSortedSym for this
var c1,c2,c3: CubieCube; i,j,k,m: Integer;
begin
  SetLength(FlipConjugate,2048,16,788);
  c1:= CubieCube.Create;
  c2:= CubieCube.Create;
  c3:= CubieCube.Create;
  Form1.SetUpProgressBar(0,788,'Analyzing...');
  for k:=0 to 788-1 do
  begin
    Form1.ProgressBar.Position:=k;
    Application.ProcessMessages;
    m:= UDSliceSortedSymToUDSliceSorted[k];//maps class index to representant
    c1.InvUDSliceSortedCoord(m);
    for j:= 0 to 15 do
    begin
      EdgeMult(EdgeSym[InvIdx[j]],c1.PEdge^,c1.PEdgeTemp^);//we use it in search
      EdgeMult(c1.PEdgeTemp^,EdgeSym[j],c2.PEdge^);
      for i:=0 to 2048-1 do
      begin
        c2.InvEdgeOriCoord(i);
        EdgeMult(EdgeSym[j],c2.PEdge^,c2.PEdgeTemp^);
        EdgeMult(c2.PEdgeTemp^,EdgeSym[InvIdx[j]],c3.PEdge^);
        FlipConjugate[i,j,k]:= c3.EdgeOriCoord;
      end;
    end;
  end;
  c1.free;
  c2.free;
  c3.free;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//Create Table for conjugation of the the phase2 edge permutation coordinate++++
procedure CreateEdge8PosConjugateTable;
var c1,c2: CubieCube; prodE: EdgeCubie; i,j: Integer;
begin
  c1:= CubieCube.Create;
  c2:= CubieCube.Create;
  for i:=0 to 40320-1 do
  begin
    if i and $fff=0 then Application.ProcessMessages;
    c1.InvPhase2EdgePermCoord(i);
    for j:= 0 to 15 do
    begin
      EdgeMult(EdgeSym[j],c1.PEdge^,prodE);
      EdgeMult(prodE,EdgeSym[InvIdx[j]],c2.PEdge^);
      Edge8PosConjugate[i,j]:= c2.Phase2EdgePermCoord;
    end;
  end;
  c1.free;
  c2.free;
  Form1.ProgressBar.Position:=80;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//Create Table for conjugation of the the phase2 slice coordinate++++
procedure CreateUDSliceSortedConjugateTable;
var c1,c2: CubieCube; prodE: EdgeCubie; i,j: Integer;
begin
  c1:= CubieCube.Create;
  c2:= CubieCube.Create;
  for i:=0 to 24-1 do
  begin
    if i and $fff=0 then Application.ProcessMessages;
    c1.InvUDSliceSortedCoord(i);
    for j:= 0 to 15 do
    begin
      EdgeMult(EdgeSym[j],c1.PEdge^,prodE);
      EdgeMult(prodE,EdgeSym[InvIdx[j]],c2.PEdge^);
      UDSliceSortedConjugate[i,j]:= c2.UDSliceSortedCoord;
      Assert(UDSliceSortedConjugate[i,j]<24);
    end;
  end;
  c1.free;
  c2.free;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


//Create Table for conjugation of corner permutation coordinate with symmetry+++
procedure CreateCornPermConjugateTable;
var c1,c2: CubieCube; prodC: CornerCubie; i,j: Integer;
begin
  c1:= CubieCube.Create;
  c2:= CubieCube.Create;
  Application.ProcessMessages;
  for i:=0 to 40320-1 do
  begin
    c1.InvCornPermCoord(i);
    for j:= 0 to 15 do
    begin
      CornMult(CornSym[j],c1.PCorn^,prodC);
      CornMult(prodC,CornSym[InvIdx[j]],c2.PCorn^);
      CornPermConjugate[i,j]:= c2.CornPermCoord;
    end;
  end;
  c1.free;
  c2.free;
end;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
procedure CreateConjugateTables;
begin
  CreateTwistConjugateTable;
  CreateTetraConjugateTable;
  CreateEdge8PosConjugateTable;
  CreateUDSliceSortedConjugateTable;
  CreateCornPermConjugateTable;
  CreateCentOriRFLBMod2ConjugateTable;
//  CreateUDSliceConjugateTable;
end;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
procedure CreatePruningTables;
begin
  CreateCornPermPh2PruningTable;
  CreateFlipUDSlicePruningTable; //phase 1 standard
  CreatePhase2PruningTable;//phase 2 standard

   if ( OptOptionForm.CheckUseHuge.Checked=true) then
    {$IF UHUGE}
    CreateUltraBigPruningTable;
 //   CreateCenTwistUDSliceSortedPruningTable;
    {$ELSE}
    CreateBigPruningTable;
//    CreateCenTwistUDSliceSortedPruningTable;
    {$IFEND}



  CreateFullCornerPruningTable(true); //mit slice moves
  CreateFullCornerPruningTable(false); //ohne slice moves

end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++Do phase 2 move on coordinate level+++++++++++++++++++++++++++++++
procedure CoordCube.DoMovePhase2(m: Move);
var m1: Move;
begin
  edge8Pos:= Edge8PermMove[edge8Pos,m];
  cornPos:= CornPermMove[cornPos,m];
  UDSliceSorted:= UDSliceSortedMove[UDSliceSorted,m];
  m1:= SymMove[16,m];
  RLSliceSorted:= UDSliceSortedMove[RLSliceSorted,m1];
  m1:= SymMove[16,m1];
  FBSliceSorted:= UDSliceSortedMove[FBSliceSorted,m1];
  Assert(GetEdge8Perm[RLSliceSorted,FBSliceSorted mod 24]=edge8Pos);

  if (m=Ux1) or (m=Ux3) or (m=Rx1) or (m=Rx3) or (m=Fx1) or (m=Fx3) or
     (m=Dx1) or (m=Dx3) or (m=Lx1) or (m=Lx3) or (m=Bx1) or (m=Bx3) then
     parityEven:= not parityEven;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++++++++++Do phase 1 move on coordinate level++++++++++++++++++++++++++
procedure CoordCube.DoMove(m: Move);
var m1: Move;
begin
  UDTwist:= TwistMove[UDTwist,m];
  cornPos:= CornPermMove[cornPos,m];

  //s^-1ns*m=s^-1n(sms^-1)s=s^-1(nm1)s=s^-1(s'^-1n's')s=(s's)^-1n'(s's),
  //where m1:=sms^-1 and s'^-1n's':=nm1

  m1:= SymMove[flipUDSLice.s,m];
  flipUDSlice.n:=flipSliceMove[flipUDSlice.n,Ord(m1)];
  flipUDSlice.s:=SymMult[flipUDSlice.n and 15,flipUDSlice.s];
  flipUDSlice.n:=flipUDSlice.n shr 4;

  m:= SymMove[16,m];//because we look from a different perspective now
  RLTwist:= TwistMove[RLTwist,m];

  m1:= SymMove[flipRLSLice.s,m];
  flipRLSlice.n:=flipSliceMove[flipRLSlice.n,Ord(m1)];
  flipRLSlice.s:=SymMult[flipRLSlice.n and 15,flipRLSlice.s];
  flipRLSlice.n:=flipRLSlice.n shr 4;

  m:= SymMove[16,m];
  FBTwist:= TwistMove[FBTwist,m];

  m1:= SymMove[flipFBSLice.s,m];
  flipFBSlice.n:=flipSliceMove[flipFBSlice.n,Ord(m1)];
  flipFBSlice.s:=SymMult[flipFBSlice.n and 15,flipFBSlice.s];
  flipFBSlice.n:=flipFBSlice.n shr 4;

  if (m=Ux1) or (m=Ux3) or (m=Rx1) or (m=Rx3) or (m=Fx1) or (m=Fx3) or
     (m=Dx1) or (m=Dx3) or (m=Lx1) or (m=Lx3) or (m=Bx1) or (m=Bx3) then
     parityEven:= not parityEven;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++Find the Phase 1 and optimal solver initial pruning value+++++++++++++
Function CoordCube.GetPrun(direction:Integer):Integer;
var depth,depthMod3,flipSlice0,flipSlice1,Twist0,Twist1,sym,index: Integer;
    m: Move;
begin
  flipSlice0:=0;
  Twist0:=0;
  case direction of
    0:
    begin
      flipSlice0:= flipUDSlice.n;
      sym:= flipUDSlice.s;
      Twist0:= TwistConjugate[UDTwist,sym];
    end;
    1:
    begin
      flipSlice0:= flipRLSlice.n;
      sym:= flipRLSlice.s;
      Twist0:= TwistConjugate[RLTwist,sym];
    end;
    2:
    begin
      flipSlice0:= flipFBSlice.n;
      sym:= flipFBSlice.s;
      Twist0:= TwistConjugate[FBTwist,sym];
    end;
  end;
  depth:=0;
  While (Twist0<>0) or (flipSlice0<>0) do
  begin
    depthMod3:= GetPruningP(2187*flipSlice0+Twist0);
    if depthMod3=0 then depthMod3:=3;
     for m:= Ux1 to Fsx3 do
     begin
      if (not sliceMode) and (m=Usx1) then break;
     {$IF QTM}
       case m of
         Ux2,Rx2,Fx2,Dx2,Lx2,Bx2,Usx2,Rsx2,Fsx2: continue
       end;
     {$IFEND}
       flipSlice1:= flipSliceMove[flipSlice0,Ord(m)];
       Twist1:= TwistMove[Twist0,m];
       sym:= flipSlice1 and 15;
       flipSlice1:= flipSlice1 shr 4;
       Twist1:=TwistConjugate[Twist1,sym];
       index:= 2187*flipSlice1+Twist1;
       if GetPruningP(index)= depthMod3-1 then //closer to start
       begin
         Inc(Depth);
         flipSlice0:=flipSlice1;
         Twist0:=Twist1;
         break;
       end;
       if not sliceMode then Assert(m<>Bx3) else Assert(m<>Fsx3) ;//we did not get closer to start else
     end;
  end;
  Result:= depth;
end;
//++++++++End Find the Phase 1 and optimal solver initial pruning value+++++++++


//++Find the cent-Phase 1 and cent-optimal solver initial pruning value+++++++++
Function CoordCube.GetCentPrun(direction:Integer):Integer;
var depth,depthMod3,flipSlice0,flipSlice1,Twist0,Twist1,
    cent0,cent1,sym: Integer;
    index:Cardinal;
    m: Move;
begin

  flipSlice0:=0; //else warnings
  Twist0:=0;
  cent0:=0;
  case direction of
    0:
    begin
      flipSlice0:= flipUDSlice.n;
      sym:= flipUDSlice.s;
      Twist0:= TwistConjugate[UDTwist,sym];
      cent0:=CentOriRFLBMod2Conjugate[UDCentRFLBMod2Twist,sym];
    end;
    1:
    begin
      flipSlice0:= flipRLSlice.n;
      sym:= flipRLSlice.s;
      Twist0:= TwistConjugate[RLTwist,sym];
      cent0:=CentOriRFLBMod2Conjugate[RLCentRFLBMod2Twist,sym];
    end;
    2:
    begin
      flipSlice0:= flipFBSlice.n;
      sym:= flipFBSlice.s;
      Twist0:= TwistConjugate[FBTwist,sym];
      cent0:=CentOriRFLBMod2Conjugate[FBCentRFLBMod2Twist,sym];
    end;
  end;
  depth:=0;
  While (Twist0<>0) or (flipSlice0<>0) or (cent0<>0) do
  begin
    depthMod3:= GetPruningCentP((Int64(flipSlice0)*16 + cent0)*2187+Twist0);
    if depthMod3=0 then depthMod3:=3;
     for m:= Ux1 to Fsx3 do
     begin
       if (not sliceMode) and (m=Usx1) then break;
       {$IF QTM}
                case m of
                Ux2,Rx2,Fx2,Dx2,Lx2,Bx2,Usx2,Rsx2,Fsx2:continue;
                end;
       {$IFEND}
       flipSlice1:= flipSliceMove[flipSlice0,Ord(m)];
       Twist1:= TwistMove[Twist0,m];
       cent1:= CentOriRFLBMod2Move[cent0,m];
       sym:= flipSlice1 and 15;
       flipSlice1:= flipSlice1 shr 4;
       Twist1:=TwistConjugate[Twist1,sym];
       cent1:=CentOriRFLBMod2Conjugate[cent1,sym];
       index:= (Int64(flipSlice1)*16 + cent1)*2187+twist1;
       if GetPruningCentP(index)= depthMod3-1 then //closer to start
       begin
         Inc(Depth);
         flipSlice0:=flipSlice1;
         Twist0:=Twist1;
         cent0:=cent1;
         break;
       end;
      if not sliceMode then Assert(m<>Bx3) else Assert(m<>Fsx3);//we did not get closer to start else
     end;
  end;
  Result:= depth;
end;
//++End Find the cent-Phase 1 and cent-optimal solver initial pruning value+++++


//++++++++++++++++++++++Find the Phase 2 initial pruning value++++++++++++++++++
{$IF not QTM}
function GetPrunPhase2(cPos,e8Pos:Integer):Integer;
var symCPos,cPos0,cPos1,e8Pos0,e8Pos1,sym,depth,depthMod3,index: Integer;
    m: Move;
begin
  cPos0:=cPos;
  SymCPos:= CornPosToSymCornPos[cPos0];;
  sym:= SymCPos and $f;
  SymCPos:=SymCPos shr 4;
  e8Pos0:=e8Pos;
  depth:=0;
  While (e8Pos0<>0) or (cPos0<>0) do
  begin
    depthMod3:= GetPruningPhase2P(2768*edge8PosConjugate[e8Pos0,sym]+SymCPos);
    if depthMod3=0 then depthMod3:=3;
    for m:= Ux1 to Fsx3 do
    begin
      if (not sliceMode) and (m=Usx1) then break;
      if (m=Rx1) or (m=Rx3) or (m=Fx1) or (m=Fx3)
      or (m=Lx1) or (m=Lx3) or (m=Bx1) or (m=Bx3)
      or (m=Rsx1) or (m=Rsx3) or (m=Fsx1) or (m=Fsx3) then Continue;
      cPos1:= CornPermMove[cPos0,m];
      symCPos:= CornPosToSymCornPos[cPos1];;
      sym:= symCPos and $f;
      symCPos:=symCPos shr 4;
      e8Pos1:= Edge8PermMove[e8Pos0,m];
      index:= 2768*Edge8PosConjugate[e8Pos1,sym]+symCPos;
      if GetPruningPhase2P(index)= depthMod3-1 then //closer to start
      begin
        Inc(Depth);
        e8Pos0:=e8Pos1;
        cPos0:= cPos1;
        break;
      end;
      if not sliceMode then Assert(m<>Bx2) else Assert(m<>Fsx2);//we did not get closer to start else
    end;
  end;
  Result:= depth;
end;
{$IFEND}
//++++++++++++++++++++++Find the Phase 2 initial pruning value++++++++++++++++++

//++++++++++++++++++++++Find the full Corner initial pruning value++++++++++++++++++
function GetPrunFullCorner(cPos,cOri:Integer):Integer;
var symCPos,cPos0,cPos1,cOri0,cOri1,sym,depth,depthMod3,index: Integer;
    m: Move;
begin
  cPos0:=cPos;
  SymCPos:= CornPosToSymCornPos[cPos0];;
  sym:= SymCPos and $f;
  SymCPos:=SymCPos shr 4;
  cOri0:=cOri;
  depth:=0;
  While (cOri0<>0) or (cPos0<>0) do
  begin
    depthMod3:= GetPruningFullCorner(2768*TwistConjugate[cOri0,sym]+SymCPos);
    if depthMod3=0 then depthMod3:=3;
    for m:= Ux1 to Fsx3 do
    begin
      if (not useSlices) and (m=Usx1) then break;
      {$IF QTM}
                case m of
                Ux2,Rx2,Fx2,Dx2,Lx2,Bx2,Usx2,Rsx2,Fsx2:continue;
                end;
      {$IFEND}
      cPos1:= CornPermMove[cPos0,m];
      symCPos:= CornPosToSymCornPos[cPos1];;
      sym:= symCPos and $f;
      symCPos:=symCPos shr 4;
      cOri1:= TwistMove[cOri0,m];
      index:= 2768*TwistConjugate[cOri1,sym]+symCPos;
      if GetPruningFullCorner(index)= depthMod3-1 then //closer to start
      begin
        Inc(Depth);
        cOri0:=cOri1;
        cPos0:= cPos1;
        break;
      end;
     if not useSlices then Assert(m<>Bx3) else Assert(m<>Fsx3);//we did not get closer to start else
    end;
  end;
  Result:= depth;
end;
//++++++++++++++++++++++Find the full Corner initial pruning value++++++++++++++++++






//+++++++++++++++++++Find the Big optimal solvers initial pruning value+++++++++
function CoordCube.GetPrunBig(direction: Integer):Integer;
var depth,depthMod3,SliceSortedSym_0,SliceSortedSym_1,
    Twist_0,Twist_1,Flip_0,Flip_1,sym: Integer;
    index:Cardinal;
    m: Move;

begin
   SliceSortedSym_0:=0;
   Flip_0:=0;
   Twist_0:=0;
 case direction of
    0:
    begin
      SliceSortedSym_0:=UDSliceSortedSym.n;
      sym:= UDSliceSortedSym.s;
      Flip_0:=FlipConjugate[UDFlip,sym,SliceSortedSym_0];
      Twist_0:=TwistConjugate[UDTwist,sym];

    end;
    1:
    begin
      SliceSortedSym_0:=RLSliceSortedSym.n;
      sym:= RLSliceSortedSym.s;
      Flip_0:=FlipConjugate[RLFlip,sym,SliceSortedSym_0];
      Twist_0:=TwistConjugate[RLTwist,sym];
    end;
    2:
    begin
      SliceSortedSym_0:=FBSliceSortedSym.n;
      sym:= FBSliceSortedSym.s;
      Flip_0:=FlipConjugate[FBFlip,sym,SliceSortedSym_0];
      Twist_0:=TwistConjugate[FBTwist,sym];
    end;
  end;
  depth:=0;

  While (SliceSortedSym_0<>0) or (Flip_0<>0) or (Twist_0<>0) do
  begin
    depthMod3:=GetPruningBigP((Int64(SliceSortedSym_0)*2048 +flip_0)*2187+twist_0);
    if depthMod3=0 then depthMod3:=3;
     for m:= Ux1 to Fsx3 do
     begin
       if (not sliceMode) and (m=Usx1) then break;
       {$IF QTM}
                case m of
                Ux2,Rx2,Fx2,Dx2,Lx2,Bx2,Usx2,Rsx2,Fsx2:continue;
                end;
       {$IFEND}
       SliceSortedSym_1:= UDSliceSortedSymMove[SliceSortedSym_0,m];
       Flip_1:= FlipMove[Flip_0,m];
       Twist_1:=TwistMove[Twist_0,m];
       sym:= SliceSortedSym_1 and 15;
       SliceSortedSym_1:= SliceSortedSym_1 shr 4;
       Flip_1:=FlipConjugate[Flip_1,sym,SliceSortedSym_1];
       Twist_1:=TwistConjugate[Twist_1,sym];
       index:= (Int64(SliceSortedSym_1)*2048 +flip_1)*2187+twist_1;
       if GetPruningBigP(index)= depthMod3-1 then
       begin
         Inc(Depth);
         SliceSortedSym_0:=SliceSortedSym_1;
         flip_0:=flip_1;
         twist_0:=twist_1;
         break;
       end;
       if not sliceMode then Assert(m<>Bx3) else Assert(m<>Fsx3);//we did not get closer to start else
     end;
  end;
  Result:= depth;
end;
//++++++++++++++End Find the Big optimal solvers initial pruning value++++++++++


//+++++++++++++++++++Find the UltraBig optimal solvers initial pruning value+++++++++
function CoordCube.GetPrunUBig(direction: Integer):Integer;
var depth,depthMod3,flipSlice0,flipSlice1,Twist0,Twist1,Tetra0,Tetra1,sym,index:Integer;
    m: Move;
begin
  flipSlice0:=0;
  Twist0:=0;
  Tetra0:=0;
  case direction of
    0:
    begin
      flipSlice0:= flipUDSlice.n;
      sym:= flipUDSlice.s;
      Twist0:= TwistConjugate[UDTwist,sym];
      Tetra0:= TetraConjugate[UDTetra,sym];
    end;
    1:
    begin
      flipSlice0:= flipRLSlice.n;
      sym:= flipRLSlice.s;
      Twist0:= TwistConjugate[RLTwist,sym];
      Tetra0:= TetraConjugate[RLTetra,sym];
    end;
    2:
    begin
      flipSlice0:= flipFBSlice.n;
      sym:= flipFBSlice.s;
      Twist0:= TwistConjugate[FBTwist,sym];
      Tetra0:= TetraConjugate[FBTetra,sym];
    end;
  end;
  depth:=0;
  While (Twist0<>0) or (flipSlice0<>0) or (Tetra0<>0) do
  begin
    depthMod3:= GetPruningUBigP(2187*flipSlice0+Twist0,@PruningUBigP[Tetra0]);   //PPPPPPP
    if depthMod3=0 then depthMod3:=3;
     for m:= Ux1 to Fsx3 do
     begin
       if (not sliceMode) and (m=Usx1) then break;
       {$IF QTM}
                case m of
                Ux2,Rx2,Fx2,Dx2,Lx2,Bx2,Usx2,Rsx2,Fsx2:continue;
                end;
       {$IFEND}
       flipSlice1:= flipSliceMove[flipSlice0,Ord(m)];
       Twist1:= TwistMove[Twist0,m];
       Tetra1:= TetraMove[Tetra0,m];
       sym:= flipSlice1 and 15;
       flipSlice1:= flipSlice1 shr 4;
       Twist1:=TwistConjugate[Twist1,sym];
       Tetra1:=TetraConjugate[Tetra1,sym];
       index:= 2187*flipSlice1+Twist1;
       if GetPruningUBigP(index,@PruningUBigP[Tetra1])= depthMod3-1 then //closer to start
       begin
         Inc(Depth);
         flipSlice0:=flipSlice1;
         Twist0:=Twist1;
         Tetra0:=Tetra1;
         break;
       end;  
       if not sliceMode then Assert(m<>Bx3) else Assert(m<>Fsx3);//we did not get closer to start else
     end;
  end;
  Result:= depth;
end;
//++++++++++++++End Find the UltraBig optimal solvers initial pruning value++++++++++


//+++++++GetPacked[i,j] extracts value for entry j from byte value i++++++++++++
procedure CreateGetPackedTable;
var i,j,k,l: Integer;
begin
  for i:= 0 to 243-1 do//the packed byte
  for j:= 0 to 4 do //the index within
  begin
    l:= i;
    for k:= 1 to j do l:= l div 3;
    GetPacked[i,j]:= l mod 3;
  end;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++++++++++++++++Print some coordinates for debugging+++++++++++++++++++
procedure CoordCube.Print(c: TCanvas; x, y: Integer);
begin
  c.Brush.Color:=clWhite;
  c.TextOut(x,y,'                                  ');
  c.TextOut(x,y,'cornPos: '+IntToStr(cornPos));
  c.TextOut(x,y+20,'                                  ');
  c.TextOut(x,y+20,'UDTwist: '+IntToStr(UDTwist));
  c.TextOut(x,y+40,'                                        ');
  c.TextOut(x,y+40,'flipUDSlice: ' + IntToStr(flipUDSlice.n) +'|'+ IntToStr(flipUDSlice.s));
  c.TextOut(x,y+60,'                                  ');
  c.TextOut(x,y+60,'RLTwist: '+IntToStr(RLTwist));
  c.TextOut(x,y+80,'                                        ');
  c.TextOut(x,y+80,'flipRLSlice: ' + IntToStr(flipRLSlice.n) +'|'+ IntToStr(flipRLSlice.s));
  c.TextOut(x,y+100,'                                  ');
  c.TextOut(x,y+100,'FBTwist: '+IntToStr(FBTwist));
  c.TextOut(x,y+120,'                                        ');
  c.TextOut(x,y+120,'flipFBSlice: ' + IntToStr(flipFBSlice.n) +'|'+ IntToStr(flipFBSlice.s));
  c.TextOut(x,y+140,'                                        ');
  c.TextOut(x,y+140,'edge8Pos: ' + IntToStr(edge8Pos));
  c.TextOut(x,y+160,'                                        ');
  c.TextOut(x,y+160,'UDSliceSorted: ' + IntToStr(UDSliceSorted));
  c.TextOut(x,y+180,'                                        ');
  c.TextOut(x,y+180,'RLSliceSorted: ' + IntToStr(RLSliceSorted));
  c.TextOut(x,y+200,'                                        ');
  c.TextOut(x,y+200,'FBSliceSorted: ' + IntToStr(FBSliceSorted));
  c.TextOut(x,y+220,'                                                   ');
  c.TextOut(x,y+220,'UDSliceSortedSym: ' + IntToStr(UDSLiceSortedSym.n) +'|'+ IntToStr(UDSLiceSortedSym.s));
  c.TextOut(x,y+240,'                                                   ');
  c.TextOut(x,y+240,'RLSliceSortedSym: ' + IntToStr(RLSliceSortedSym.n) +'|'+ IntToStr(RLSliceSortedSym.s));
  c.TextOut(x,y+260,'                                                   ');
  c.TextOut(x,y+260,'FBSliceSortedSym: ' + IntToStr(FBSliceSortedSym.n) +'|'+ IntToStr(FBSliceSortedSym.s));
  c.TextOut(x,y+280,'                                  ');
//  c.TextOut(x,y+280,'Depth: '+IntToStr(GetPrunBig(2)));
//  c.TextOut(x,y+300,'                                  ');
   c.TextOut(x,y+200,'Corn8Perm: ' + IntToStr(GetCorn8Perm[cornPos]));
   c.TextOut(x,y+220,'                                                   ');
end;
//+++++++++++++++++End Print some coordinates for debugging+++++++++++++++++++++



//++++++++++++++++++++++Create big pruning table++++++++++++++++++++++++++++++++
procedure CreateUltraBigPruningTable;
var i,j,n,k,t,depth,realDepth,Tetra, Tetra0,UDtwist,UDtwist0,flipUDSlice,flipUDSlice0,
    altUDTwist,altTetra,z,sym,value: Integer;
    c,d: CubieCube;

    b: Word;  m: Move;
    SymState: array of Word;
    curArray: array of Integer;
    fs: TFileStream;
    index,idx:Cardinal;
    done: Int64;
    x:Integer;
    flipBackward,match:Boolean;
{$IF STATISTICS}
    TwistSymstate: array [0..2187-1] of Word;
    TetraSymstate: array [0..70-1] of Word;
    totalSym:Word;
    positions, positionsM, internal: array[0..15] of Int64;
{$IFEND}

    buf: array[0..2187-1] of Byte;  // Chunks der Länge 2187 Byte
    filename:String;

label nextI;

begin
{$IF not QTM}
  if sliceMode then fileName:= 'ubigPFs.prun' else fileName:= 'ubigPF.prun';
{$ELSE}
  if sliceMode then fileName:= 'ubigPQs.prun' else fileName:= 'ubigPQ.prun';
{$IFEND}
  Form1.SetUpProgressBar(0,70,'Initializing memory. Please wait...'); //????????????????
  Form1.ProgressLabel.Visible:=true;
  Form1.Progressbar.Visible:=true;
  fs:=nil;
  SetCurrentDir(ExtractFilePath(Paramstr(0)));//Cube Explorer directory
 //Finalize(PruningUBigP);
       for i:= 0 to 69 do
         SetLength(PruningUBigP[i],0); //Speicherplatz evtl. freigeben

  if FileExists(filename) then
  begin
    try
       for i:= 0 to 69 do
         SetLength(PruningUBigP[i],28181682); //2187*64430/5 für alle 70 tetraCoords;
    except
      Application.MessageBox(PChar(Err[17]),'',MB_ICONWARNING);
      Form1.ProgressLabel.Visible:=false;
      Form1.Progressbar.Visible:=false;
      USES_BIG:=false;
      OptOptionForm.CheckUseHuge.Checked:=false;
      Exit;
    end;
    try
      fs := TFileStream.Create(filename, fmOpenRead);
      Form1.SetUpProgressBar(0,70,'Loading '+filename+' (1881 MB)');
      Application.ProcessMessages;
      for i:= 0 to 70-1 do
      begin
        for j:= 0 to 34-1 do // 2187*64430/5/34=828873 Bytes in Buffer
        begin
          fs.ReadBuffer(PruningUBigP[i][j*828873],828873);
        end;
       Form1.ProgressBar.Position:=i;
       Application.ProcessMessages;
      end;
      fs.Free;
      Form1.ProgressBar.Visible:= false;
      Form1.ProgressLabel.Visible:=false;
    except
      fs.Free;
      Application.MessageBox(PChar(Err[18]),'',MB_ICONWARNING);
      Form1.ProgressLabel.Visible:=false;
      Form1.Progressbar.Visible:=false;
      Finalize(PruningUBigP);// evtl auch arrayelemente einzeln!!
      USES_BIG:=false;//not necessary here
      OptOptionForm.CheckUseHuge.Checked:=false;//also sets USES_BIG
      Exit;
    end;
  end
  else
  begin
    Application.ProcessMessages;
    try
      for i:= 0 to 69 do
         SetLength(PruningUBig[i],8806776); //2187*64430 div 16 +1 für alle 70 tetraCoords;
    except
      Application.MessageBox(PChar(Err[17]),'',MB_ICONWARNING);
      Form1.ProgressLabel.Visible:=false;
      Form1.Progressbar.Visible:=false;
      USES_BIG:=false;
      OptOptionForm.CheckUseHuge.Checked:=false;
      Exit;
    end;
    Form1.ProgressLabel.Caption:='';
    if Application.MessageBox(PChar(Err[20]),'',MB_ICONWARNING or MB_YESNO)<>IDYES then
    begin
      for i:= 0 to 69 do  PruningUBig[i]:=nil;//release memory
      USES_BIG:=false;
      OptOptionForm.CheckUseHuge.Checked:=false;
      Form1.ProgressLabel.Visible:=false;
      Form1.Progressbar.Visible:=false;
      Exit;
    end;
    flipBackward:=false;//flip to backward search if true
    c:=CubieCube.Create;
    d:=CubieCube.Create;

    SetLength(SymState,64430);//16 bits in each word, set bit j (0<=j<=15)
                              //if the coordinate has symmety S(j)
    Form1.SetUpProgressBar(0,64430-1,'Analyzing...');
    for i:= 0 to 64430-1 do
    begin
      Form1.ProgressBar.Position:=i;
      if i and $ff =0 then Application.ProcessMessages;
      z:= FlipUDSliceToRawFlipUDSlice[i];
      c.InvUDSliceCoord(z div 2048);
      c.InvEdgeOriCoord(z mod 2048);//c now is a representant

      for j:= 0 to 15 do
      begin
        EdgeMult(EdgeSym[InvIdx[j]],c.PEdge^,c.PEdgeTemp^);
        EdgeMult(c.PEdgeTemp^,EdgeSym[j],d.PEdge^);
        if d.IsFlipUDSLiceCoordRep then //so we got c again, class has symmetry j
        begin
          b:= 1 shl j;
          SymState[i]:=SymState[i] or b;//store symmetry information
        end;
      end;
    end;

    for t:= 0 to 70-1 do
    for i:=0 to 8806776-1 do PruningUBig[t][i]:=-1;
    SetPruningUBig(0,0,0);//3. Parameter ist die Tetra Koordinate
    done:=1;
    depth:=-1;
    realDepth:=-1;
    Form1.ProgressBar.Position:=0;

   Form1.SetUpProgressBar(0,13,'Creating '+filename+' (1881 MB)');


    while (done<>Int64(64430)*2187*70)do
    begin
      if realdepth=10 then flipBackward:=true;//evtl. auch 9 nehmen
      Inc(realDepth);
      Form1.ProgressBar.Position:=realDepth;
      Inc(depth);
      depth:= depth mod 3;

      for t:= 0 to 70-1 do
      for i:=0 to 64430*2187-1 do
      begin
        if i and $3ffff =0 then Application.ProcessMessages;

        match:=true;//any value
        case flipBackward of
          true: match:= GetPruningUBig(i,@PruningUBig[t])=3;//not occupied yet
          false: match:= GetPruningUBig(i,@PruningUBig[t])=depth;
        end;

        if match then
        begin
          flipUDSlice0:= i div 2187;
          UDTwist0:= i mod 2187;
          Tetra0:=t;
          for m:= Ux1 to Fsx3 do
          begin
            if (not sliceMode) and (m=Usx1) then break;
            {$IF QTM}
                case m of
                Ux2,Rx2,Fx2,Dx2,Lx2,Bx2,Usx2,Rsx2,Fsx2:continue;
                end;
            {$IFEND}
            flipUDSlice:= flipSliceMove[flipUDSlice0,Ord(m)];
            UDTwist:= TwistMove[UDTwist0,m];
            tetra:= TetraMove[Tetra0,m];
            sym:= flipUDSlice and 15;
            flipUDSlice:= flipUDSlice shr 4;

            UDTwist:= TwistConjugate[UDTwist,sym];//sym*UDTwist*sym^-1
            tetra:=TetraConjugate[Tetra,sym];
            index:= 2187*flipUDSlice+UDTwist;//Index in der Tetra-Tabelle
            case flipBackward of
              false:
              begin
                if GetPruningUBig(index,@PruningUBig[tetra])=3 then
                begin
                  SetPruningUBig(index,(depth+1) mod 3,tetra);
                  Inc(done);
                  sym:= SymState[flipUDSlice];
                  if sym<>1 then //symmetric position has more than one representation
                  begin          //fill this internal states in the pruning table
                    for j:= 1 to 15 do
                    begin
                      sym:= sym shr 1;
                      if sym and 1 = 1 then
                      begin
                        altUDTwist:= TwistConjugate[UDTwist,j];
                        altTetra:=TetraConjugate[tetra,j];
                        index:= 2187*flipUDSlice+altUDTwist;
                        if GetPruningUBig(index,@PruningUBig[altTetra])=3 then
                        begin
                          SetPruningUBig(index,(depth+1) mod 3,altTetra);
                          Inc(done);
                        end;
                      end;
                    end;//j
                  end;//if
                end;
              end;
              true:
              begin
                if GetPruningUBig(index,@PruningUBig[tetra])= depth then
                begin
                  SetPruningUBig(i,(depth+1) mod 3,t);
                  Inc(done);
                  goto NextI;
                 // break;//verlässt nur m-Schleife, eigentlich kann man aber
                end;    //das nächste i aufrufen!
              end;
            end;
          end;//for m
        end;//if match
  nextI:
      end;//for i
    end;//while

  //  Form1.ProgressBar.Position:=12;

    fs := TFileStream.Create(filename, fmCreate);
    Form1.SetUpProgressBar(0,70,'Writing '+filename);
    done:=0;
    Form1.ProgressBar.Position:=done;
    try
      for t:= 0 to 70-1 do //jeden der 70 Array komprimieren
      begin
        for i:= 0 to (64430 div 5)*2187 - 1 do
        begin
          n:=1;
          value:=0;
          for j:= 0 to 3 do
          begin
            value:=value+n*GetPruningUBig(4*i+j,@PruningUBig[t]);//we want to use mod 4 arithmetic
            n:=n*3;                          //and not mod 5
          end;
          value:=value+n*GetPruningUBig((64430 div 5)*2187*4+i,@PruningUBig[t]);

          buf[i mod 2187]:=Byte(value);//buffering increases writing speed
          if i mod 2187 = 2186 then
          begin
            fs.WriteBuffer(buf[0],2187);
            Application.ProcessMessages;
          end;
        end;
        Inc(done);
        Form1.ProgressBar.Position:=done;
      end;
    except
      Application.MessageBox(PChar(Err[19]),'',MB_ICONWARNING);
      fs.Free;
      fs:=nil;
      if FileExists(PChar(filename)) then DeleteFile(PChar(filename));//delete incomplete file
      Form1.ProgressLabel.Visible:=false;
      Form1.Progressbar.Visible:=false;
      USES_BIG:=false;//not necessary here
      OptOptionForm.CheckUseHuge.Checked:=false;//also sets USES_BIG
      Finalize(PruningUBig);
      Exit;
    end;
    fs.Free;
    Finalize(PruningUBig);//gibt den gesamten Speicher wieder frei
    c.Free;
    d.Free;

    try
       for i:= 0 to 69 do
         SetLength(PruningUBigP[i],64430*2187 div 5); //2187*64430/5 für alle 70 tetraCoords;
    except
      Application.MessageBox(PChar(Err[17]),'',MB_ICONWARNING);
      Form1.ProgressLabel.Visible:=false;
      Form1.Progressbar.Visible:=false;
      USES_BIG:=false;
      OptOptionForm.CheckUseHuge.Checked:=false;
      Exit;
    end;

    try
      fs := TFileStream.Create(filename, fmOpenRead);
      Form1.SetUpProgressBar(0,70,'Loading '+filename+' (1881 MB)');
      Application.ProcessMessages;
      for i:= 0 to 70-1 do
      begin
        for j:= 0 to 34-1 do // 64430*2187/5/34=828873 Bytes in Buffer
        begin
          fs.ReadBuffer(PruningUBigP[i][j*828873],828873);
        end;
       Form1.ProgressBar.Position:=i;
       Application.ProcessMessages;
      end;
      fs.Free;
      Form1.ProgressBar.Visible:= false;
      Form1.ProgressLabel.Visible:=false;
    except
      fs.Free;
      Application.MessageBox(PChar(Err[18]),'',MB_ICONWARNING);
      Form1.ProgressLabel.Visible:=false;
      Form1.Progressbar.Visible:=false;
      Finalize(PruningUBigP);// evtl auch arrayelemente einzeln!!
      USES_BIG:=false;//not necessary here
      OptOptionForm.CheckUseHuge.Checked:=false;//also sets USES_BIG
      Exit;
    end;
    Form1.ProgressBar.Visible:= false;
    Form1.ProgressLabel.Visible:=false;
  end;//else
end;
//++++++++++++++++++End Create ultrabig pruning table++++++++++++++++++++++++++++++++


end.
