unit CubeDefs;

interface

uses Graphics,syncobjs;


const QTM = false;//Für HTM auf false setzen

const SPECIAL4 = false;//Spezielle Version für Phase3 von 4x4x4 Würfel

{$IF QTM}
const vers='QTM';
{$ELSE}
const vers='HTM';
{$IFEND}
const curVersion = 'Cube Explorer 5.15 '+vers;



const copyright = '(c) H.Kociemba 2019';
const UHUGE = True;//Ultrahuge solver, jetzt Standardversion

const BatchTimeInverval  = 1000;//Abstände bei Autorun, default 1000
const OptimalMax = 27; //Höchstzahl der Züge beim optimalen Solver, default bei twophase MAXNODES

//const picAdr = '<img src="faces/';   dies bedeutet lokal vom Server
const picAdr = '<img src="http://home.t-online.de/home/Kociemba/faces/';

//instead of Face-Turn-Metric. But keep in mind, that the
//Two-Phase-Algorithm is best suited for the FTM.
//const USE_INDY = true;

//const STATISTICS = false;//Statistiken erzeugen, normalerweise false
const FULLPHASE2 = false;//Code für die Analyse von Phase2, normalerweise false setzen!
const PRIVAT = false;//normalerweise false, für spezielle Routinen die nicht öffentlich sind
const CUBE20STUFF = true;//Für spezielle Berechnungen des cube20 Projekts

type
  TurnAxis =(U,R,F,D,L,B,Us,Rs,Fs,E,M,S);//Hoffentlich keine Komplikationen mit EMS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  Move=(Ux1,Ux2,Ux3,Rx1,Rx2,Rx3,Fx1,Fx2,Fx3,Dx1,Dx2,Dx3,Lx1,Lx2,Lx3,Bx1,Bx2,Bx3,
  Usx1,Usx2,Usx3,Rsx1,Rsx2,Rsx3,Fsx1,Fsx2,Fsx3);
  ColorIndex = (UCol,RCol,FCol,DCol,LCol,BCol,NoCol,
  UColA,RColA,FColA,DColA,LColA,BColA,OriCol);//noch erweitern

  Corner = (URF,UFL,ULB,UBR,DFR,DLF,DBL,DRB,NNN);
  OrientedCorner = record c:Corner; o: ShortInt; end;
  Edge = (UR,UF,UL,UB,DR,DF,DL,DB,FR,FL,BL,BR,NN);
  OrientedEdge = record e:Edge; o: ShortInt; end;
  OrientedCenter = record c:TurnAxis; o: ShortInt; end;
  Face =
(U1,U2,U3,U4,U5,U6,U7,U8,U9,R1,R2,R3,R4,R5,R6,R7,R8,R9,F1,F2,F3,F4,F5,F6,F7,F8,F9,
 D1,D2,D3,D4,D5,D6,D7,D8,D9,L1,L2,L3,L4,L5,L6,L7,L8,L9,B1,B2,B3,B4,B5,B6,B7,B8,B9);
  IncompleteCase = (BOTHACCELS,DFACE,EIGHTCORN,DEFAULT,NOTHING);
  ConstructorMode = (TableMode,SearchMode,SwitchMode);
  SingleFace = array[1..9] of ColorIndex;
  Symmetry = (S_URF3,S_F2,S_U4,S_LR2,S_R4,S_F4);
  SymIdx = 0..47;

  CornerColorIndex = array [URF..DRB,0..2] of ColorIndex;
  CornerFacelet = array [URF..DRB,0..2] of Face;
  CornerAxis = array [URF..DRB,0..2] of TurnAxis;
  EdgeColorIndex = array [UR..BR,0..1] of ColorIndex;
  EdgeFacelet = array [UR..BR,0..1] of Face;
  EdgeAxis = array [UR..BR,0..1] of TurnAxis;
  FaceletColor = array [U1..B9] of ColorIndex;
  EdgeNeighbour=array[UR..BR,0..1] of Corner;

  Facelet = array [U1..B9] of Face;
  CornerCubie = array [URF..DRB] of OrientedCorner;
  EdgeCubie = array [UR..BR] of OrientedEdge;
  CenterCubie = array [U..B] of OrientedCenter;
  Axis = array[U..B] of TurnAxis;



  CenterTwist = array[U..B] of Byte;


  procedure CornMult(a,b:CornerCubie;var prod:CornerCubie);
  procedure EdgeMult(a,b:EdgeCubie;var prod:EdgeCubie);
  procedure CentMult(a,b:CenterCubie;var prod:CenterCubie);
  procedure AxisMult(a,b:Axis;var prod:Axis);
  procedure CornInv(a:CornerCubie;var inv:CornerCubie);
  procedure EdgeInv(a:EdgeCubie;var inv:EdgeCubie);
  procedure CentInv(a:CenterCubie;var inv:CenterCubie);
//  procedure CreateCornerCubieMoveExTable;
//  procedure CreateEdgeCubieMoveExTable;


const
 CornerToString: array [URF..DRB] of String =
 ('URF','UFL','ULB','UBR','DFR','DLF','DBL','DRB');
 EdgeToString: array [UR..BR] of String =
 ('UR','UF','UL','UB','DR','DF','DL','DB','FR','FL','BL','BR');
 AxisToString: array [U..B] of String =
 ('U','R','F','D','L','B');
 SliceToString: array [U..F] of String =
 ('E','M','S');
 SingmasterToFace: array [0..47] of Face =
 (U8,F2,U6,R2,U2,B2,U4,L2,D2,F8,D6,R8,D8,B8,D4,L8,F6,R4,F4,L6,B4,R6,B6,L4,
  U9,F3,R1,U3,R3,B1,U1,B3,L1,U7,L3,F1,D3,R7,F9,D1,F7,L9,D7,L7,B9,D9,B7,R9);
  
  DefaultColor: array [U1..B9] of ColorIndex =
  (UCol,UCol,UCol,UCol,UCol,UCol,UCol,UCol,UCol,RCol,RCol,RCol,RCol,RCol,
   RCol,RCol,RCol,RCol,FCol,FCol,FCol,FCol,FCol,FCol,FCol,FCol,FCol,DCol,
   DCol,DCol,DCol,DCol,DCol,DCol,DCol,DCol,LCol,LCol,LCol,LCol,LCol,LCol,
   LCol,LCol,LCol,BCol,BCol,BCol,BCol,BCol,BCol,BCol,BCol,BCol);

//+++++++Symmetries of the TImageList diagrams

  ImageSym: array [0..34] of Int64 =
  (281474976710655{O_h},93824992236885{O},168884986026393{T_d},
   39621677884425{D_3d},56294995342131{T_h},38655295497{C_3v},
   18764998447377{T},65535{D_4h},4402408653825{D_3},21845{D_4},39321{D_2d(face)},
   255{C_4v},43605{C_4h},26265{D_2h(edge)},52275{D_2d(edge)},35189204000769{S_6},
   13107{D_2h(face)},153{C_2v(a1)},1665{C_2v(b)},9225{C_2h(b)},17425{D_2(edge)},85{C_4},4369{D_2(face)},
   34833{S_4},8721{C_2h(a)},51{C_2v(a2)},4295032833{C_3},129{C_s(b)},1025{C_2(b)},17{C_2(a)},
   513{C_s(a)},8193{C_i},1{C_1},3{Cs(a)*},9{Cs(b)*});
   //* ist für Antisymmetrie, die hier andere Orientierung hat, siehe TImageList

   ImageSymNames: array [0..34] of String =
   ('Oh','O','Td','D3d','Th','C3v','T','D4h','D3','D4','D2d(face)','C4v','C4h',
   'D2h(edge)','D2d(edge)','S6','D2h(face)','C2v(a1)','C2v(b)','C2h(b)',
   'D2(edge)','C4','D2(face)','S4','C2h(a)','C2v(a2)','C3','Cs(b)','C2(b)',
   'C2(a)','Cs(a)','Ci','C1','Cs(a)','Cs(b)');

//+++++++++++++the colors of the corner cubies++++++++++++++++++++++++++++++++++
  CCI: CornerColorIndex =
  ((UCol,RCol,FCol),(UCol,FCol,LCol),(UCol,LCol,BCol),(UCol,BCol,RCol),
  (DCol,FCol,RCol),(DCol,LCol,FCol),(DCol,BCol,LCol),(DCol,RCol,BCol));

//+++++++++++++the involved facelets of the corner cubies+++++++++++++++++++++++
  CF: CornerFacelet =
  ((U9,R1,F3),(U7,F1,L3),(U1,L1,B3),(U3,B1,R3),
   (D3,F9,R7),(D1,L9,F7),(D7,B9,L7),(D9,R9,B7));

//+++++++++++++the involved facelets of the corner cubies+++++++++++++++++++++++
  CA: CornerAxis =
  ((U,R,F),(U,F,L),(U,L,B),(U,B,R),(D,F,R),(D,L,F),(D,B,L),(D,R,B));

//+++++++++++++++++++++++the colors of the edge cubies++++++++++++++++++++++++++
  ECI: EdgeColorIndex =
  ((UCol,RCol),(UCol,FCol),(UCol,LCol),(UCol,BCol),(DCol,RCol),(DCol,FCol),
   (DCol,LCol),(DCol,BCol),(FCol,RCol),(FCol,LCol),(BCol,LCol),(BCol,RCol));

//+++++++++++++++++++the involved facelets of the edge cubies+++++++++++++++++++
  EF: EdgeFacelet =
  ((U6,R2),(U8,F2),(U4,L2),(U2,B2),(D6,R8),(D2,F8),
   (D4,L8),(D8,B8),(F6,R4),(F4,L6),(B6,L4),(B4,R6));

//+++++++++++++++++++the involved facelets of the edge cubies+++++++++++++++++++
  EA: EdgeAxis =
  ((U,R),(U,F),(U,L),(U,B),(D,R),(D,F),(D,L),(D,B),(F,R),(F,L),(B,L),(B,R));

//+++++++++++++++++++++the neighbour corners of the edges+++++++++++++++++++++++
  EN: EdgeNeighbour =
  ((URF,UBR),(UFL,URF),(ULB,UFL),(UBR,ULB),(DRB,DFR),(DFR,DLF),
   (DLF,DBL),(DBL,DRB),(URF,DFR),(DLF,UFL),(DBL,ULB),(UBR,DRB));

//++++++++++++the transformation of the axis' by Cube rotations C_U..C_B
 AxisMove: array[U..B] of  Axis =  //is carried to representation!
 (
 (U,F,L,D,B,R), //C_U
 (B,R,U,F,L,D), //C_R
 (R,D,F,L,U,B), //C_F
 (U,B,R,D,F,L), //C_D
 (F,R,D,B,L,U), //C_L
 (L,U,F,R,D,B)  //C_B
 );

//+++++++++++++++the permutations of the facelets by faceturns++++++++++++++++++
  //FaceletMove: array [U..B] of Facelet =  //is carried to representation
  FaceletMove: array [U..S] of Facelet =  //is carried to representation
(
(U3,U6,U9,U2,U5,U8,U1,U4,U7,F1,F2,F3,R4,R5,R6,R7,R8,R9,L1,L2,L3,F4,F5,F6,F7,F8,F9, //U
 D1,D2,D3,D4,D5,D6,D7,D8,D9,B1,B2,B3,L4,L5,L6,L7,L8,L9,R1,R2,R3,B4,B5,B6,B7,B8,B9),
(U1,U2,B7,U4,U5,B4,U7,U8,B1,R3,R6,R9,R2,R5,R8,R1,R4,R7,F1,F2,U3,F4,F5,U6,F7,F8,U9, //R
 D1,D2,F3,D4,D5,F6,D7,D8,F9,L1,L2,L3,L4,L5,L6,L7,L8,L9,D9,B2,B3,D6,B5,B6,D3,B8,B9),
(U1,U2,U3,U4,U5,U6,R1,R4,R7,D3,R2,R3,D2,R5,R6,D1,R8,R9,F3,F6,F9,F2,F5,F8,F1,F4,F7, //F
 L3,L6,L9,D4,D5,D6,D7,D8,D9,L1,L2,U9,L4,L5,U8,L7,L8,U7,B1,B2,B3,B4,B5,B6,B7,B8,B9),
(U1,U2,U3,U4,U5,U6,U7,U8,U9,R1,R2,R3,R4,R5,R6,B7,B8,B9,F1,F2,F3,F4,F5,F6,R7,R8,R9, //D
 D3,D6,D9,D2,D5,D8,D1,D4,D7,L1,L2,L3,L4,L5,L6,F7,F8,F9,B1,B2,B3,B4,B5,B6,L7,L8,L9),
(F1,U2,U3,F4,U5,U6,F7,U8,U9,R1,R2,R3,R4,R5,R6,R7,R8,R9,D1,F2,F3,D4,F5,F6,D7,F8,F9, //L
 B9,D2,D3,B6,D5,D6,B3,D8,D9,L3,L6,L9,L2,L5,L8,L1,L4,L7,B1,B2,U7,B4,B5,U4,B7,B8,U1),
(L7,L4,L1,U4,U5,U6,U7,U8,U9,R1,R2,U1,R4,R5,U2,R7,R8,U3,F1,F2,F3,F4,F5,F6,F7,F8,F9, //B
 D1,D2,D3,D4,D5,D6,R9,R6,R3,D7,L2,L3,D8,L5,L6,D9,L8,L9,B3,B6,B9,B2,B5,B8,B1,B4,B7),
(B9,B8,B7,B6,B5,B4,B3,B2,B1,R3,R6,R9,R2,R5,R8,R1,R4,R7,U1,U2,U3,U4,U5,U6,U7,U8,U9, //x
 F1,F2,F3,F4,F5,F6,F7,F8,F9,L7,L4,L1,L8,L5,L2,L9,L6,L3,D9,D8,D7,D6,D5,D4,D3,D2,D1),
(U3,U6,U9,U2,U5,U8,U1,U4,U7,F1,F2,F3,F4,F5,F6,F7,F8,F9,L1,L2,L3,L4,L5,L6,L7,L8,L9, //y
 D7,D4,D1,D8,D5,D2,D9,D6,D3,B1,B2,B3,B4,B5,B6,B7,B8,B9,R1,R2,R3,R4,R5,R6,R7,R8,R9),
(R3,R6,R9,R2,R5,R8,R1,R4,R7,D3,D6,D9,D2,D5,D8,D1,D4,D7,F3,F6,F9,F2,F5,F8,F1,F4,F7, //z
 L3,L6,L9,L2,L5,L8,L1,L4,L7,U3,U6,U9,U2,U5,U8,U1,U4,U7,B7,B4,B1,B8,B5,B2,B9,B6,B3),
(U1,U2,U3,U4,U5,U6,U7,U8,U9,R1,R2,R3,B4,B5,B6,R7,R8,R9,F1,F2,F3,R4,R5,R6,F7,F8,F9, //E
 D1,D2,D3,D4,D5,D6,D7,D8,D9,L1,L2,L3,F4,F5,F6,L7,L8,L9,B1,B2,B3,L4,L5,L6,B7,B8,B9),
(U1,F2,U3,U4,F5,U6,U7,F8,U9,R1,R2,R3,R4,R5,R6,R7,R8,R9,F1,D2,F3,F4,D5,F6,F7,D8,F9, //M
 D1,B8,D3,D4,B5,D6,D7,B2,D9,L1,L2,L3,L4,L5,L6,L7,L8,L9,B1,U8,B3,B4,U5,B6,B7,U2,B9),
(U1,U2,U3,R2,R5,R8,U7,U8,U9,R1,D6,R3,R4,D5,R6,R7,D4,R9,F1,F2,F3,F4,F5,F6,F7,F8,F9,//S
 D1,D2,D3,L2,L5,L8,D7,D8,D9,L1,U6,L3,L4,U5,L6,L7,U4,L9,B1,B2,B3,B4,B5,B6,B7,B8,B9)


);

//+++++++++++++++the permutations by basic symmetrytransformations++++++++++++++
  FaceletSym: array [S_URF3..S_LR2] of Facelet =
(
(R9,R8,R7,R6,R5,R4,R3,R2,R1,F3,F6,F9,F2,F5,F8,F1,F4,F7,U3,U6,U9,U2,U5,U8,U1,U4,U7, //S_URF3
 L1,L2,L3,L4,L5,L6,L7,L8,L9,B7,B4,B1,B8,B5,B2,B9,B6,B3,D3,D6,D9,D2,D5,D8,D1,D4,D7),
(D9,D8,D7,D6,D5,D4,D3,D2,D1,L9,L8,L7,L6,L5,L4,L3,L2,L1,F9,F8,F7,F6,F5,F4,F3,F2,F1, //S_F2
 U9,U8,U7,U6,U5,U4,U3,U2,U1,R9,R8,R7,R6,R5,R4,R3,R2,R1,B9,B8,B7,B6,B5,B4,B3,B2,B1),
(U3,U6,U9,U2,U5,U8,U1,U4,U7,F1,F2,F3,F4,F5,F6,F7,F8,F9,L1,L2,L3,L4,L5,L6,L7,L8,L9, //S_U4
 D7,D4,D1,D8,D5,D2,D9,D6,D3,B1,B2,B3,B4,B5,B6,B7,B8,B9,R1,R2,R3,R4,R5,R6,R7,R8,R9),
(U3,U2,U1,U6,U5,U4,U9,U8,U7,L3,L2,L1,L6,L5,L4,L9,L8,L7,F3,F2,F1,F6,F5,F4,F9,F8,F7, //S_LR2
 D3,D2,D1,D6,D5,D4,D9,D8,D7,R3,R2,R1,R6,R5,R4,R9,R8,R7,B3,B2,B1,B6,B5,B4,B9,B8,B7)
 );

//+++++++++++the positional changes of the centers by faceturns+++++++++++++++++
  CenterCubieMove:  array[U..Fs] of CenterCubie=
  (((c:U;o:1),(c:R;o:0),(c:F;o:0),(c:D;o:0),(c:L;o:0),(c:B;o:0)), //U
   ((c:U;o:0),(c:R;o:1),(c:F;o:0),(c:D;o:0),(c:L;o:0),(c:B;o:0)), //R
   ((c:U;o:0),(c:R;o:0),(c:F;o:1),(c:D;o:0),(c:L;o:0),(c:B;o:0)), //F
   ((c:U;o:0),(c:R;o:0),(c:F;o:0),(c:D;o:1),(c:L;o:0),(c:B;o:0)), //D
   ((c:U;o:0),(c:R;o:0),(c:F;o:0),(c:D;o:0),(c:L;o:1),(c:B;o:0)), //L
   ((c:U;o:0),(c:R;o:0),(c:F;o:0),(c:D;o:0),(c:L;o:0),(c:B;o:1)), //B
   ((c:U;o:1),(c:R;o:0),(c:F;o:0),(c:D;o:3),(c:L;o:0),(c:B;o:0)), //Us
   ((c:U;o:0),(c:R;o:1),(c:F;o:0),(c:D;o:0),(c:L;o:3),(c:B;o:0)), //Rs
   ((c:U;o:0),(c:R;o:0),(c:F;o:1),(c:D;o:0),(c:L;o:0),(c:B;o:3)) //Fs
);

//+the positional changes of the centers by basic symmetrytransformations+++++++
  CenterCubieSym: array [S_URF3..S_LR2]  of CenterCubie =
  (((c:F;o:1),(c:U;o:2),(c:R;o:1),(c:B;o:1),(c:D;o:0),(c:L;o:3)),  //S_URF3
   ((c:D;o:2),(c:L;o:2),(c:F;o:2),(c:U;o:2),(c:R;o:2),(c:B;o:2)),  //S_F2
   ((c:U;o:1),(c:B;o:0),(c:R;o:0),(c:D;o:3),(c:F;o:0),(c:L;o:0)),  //S_U4
   ((c:U;o:4),(c:L;o:4),(c:F;o:4),(c:D;o:4),(c:R;o:4),(c:B;o:4))); //S_LR2
////////////////////////////////////////////////////////////////////////////////
//++++o>=4: increment the orientation by o-4 and apply a reflection then++++++//
////////////////////////////////////////////////////////////////////////////////


//+++++++++++the positional changes of the cornercubies by faceturns++++++++++++
  CornerCubieMove: array[U..Fs] of CornerCubie =
  (((c:UBR;o:0),(c:URF;o:0),(c:UFL;o:0),(c:ULB;o:0),  //U
    (c:DFR;o:0),(c:DLF;o:0),(c:DBL;o:0),(c:DRB;o:0)),
   ((c:DFR;o:2),(c:UFL;o:0),(c:ULB;o:0),(c:URF;o:1),  //R
    (c:DRB;o:1),(c:DLF;o:0),(c:DBL;o:0),(c:UBR;o:2)),
   ((c:UFL;o:1),(c:DLF;o:2),(c:ULB;o:0),(c:UBR;o:0),  //F
    (c:URF;o:2),(c:DFR;o:1),(c:DBL;o:0),(c:DRB;o:0)),
   ((c:URF;o:0),(c:UFL;o:0),(c:ULB;o:0),(c:UBR;o:0),  //D
    (c:DLF;o:0),(c:DBL;o:0),(c:DRB;o:0),(c:DFR;o:0)),
   ((c:URF;o:0),(c:ULB;o:1),(c:DBL;o:2),(c:UBR;o:0),  //L
    (c:DFR;o:0),(c:UFL;o:2),(c:DLF;o:1),(c:DRB;o:0)),
   ((c:URF;o:0),(c:UFL;o:0),(c:UBR;o:1),(c:DRB;o:2),  //B
    (c:DFR;o:0),(c:DLF;o:0),(c:ULB;o:2),(c:DBL;o:1)),
   ((c:UBR;o:0),(c:URF;o:0),(c:UFL;o:0),(c:ULB;o:0),  //Us    PRÜFEN!!!
    (c:DRB;o:0),(c:DFR;o:0),(c:DLF;o:0),(c:DBL;o:0)),
   ((c:DFR;o:2),(c:DLF;o:1),(c:UFL;o:2),(c:URF;o:1),  //Rs
    (c:DRB;o:1),(c:DBL;o:2),(c:ULB;o:1),(c:UBR;o:2)),
   ((c:UFL;o:1),(c:DLF;o:2),(c:DBL;o:1),(c:ULB;o:2),  //Fs
    (c:URF;o:2),(c:DFR;o:1),(c:DRB;o:2),(c:UBR;o:1))
);

//+the positional changes of the cornercubies by basic symmetrytransformations++
  CornerCubieSym: array [S_URF3..S_LR2]  of CornerCubie =
(
  ((c:URF;o:1),(c:DFR;o:2),(c:DLF;o:1),(c:UFL;o:2),   //S_URF3
   (c:UBR;o:2),(c:DRB;o:1),(c:DBL;o:2),(c:ULB;o:1)),
  ((c:DLF;o:0),(c:DFR;o:0),(c:DRB;o:0),(c:DBL;o:0),   //S_F2
   (c:UFL;o:0),(c:URF;o:0),(c:UBR;o:0),(c:ULB;o:0)),
  ((c:UBR;o:0),(c:URF;o:0),(c:UFL;o:0),(c:ULB;o:0),   //S_U4
   (c:DRB;o:0),(c:DFR;o:0),(c:DLF;o:0),(c:DBL;o:0)),
  ((c:UFL;o:3),(c:URF;o:3),(c:UBR;o:3),(c:ULB;o:3),   //S_LR2
   (c:DLF;o:3),(c:DFR;o:3),(c:DRB;o:3),(c:DBL;o:3))
////////////////////////////////////////////////////////////////////////////////
//++++o>=3: increment the orientation by o-3 and apply a reflection then++++++//
////////////////////////////////////////////////////////////////////////////////
);

//+++++++++++++++the positional changes of the edgecubies by faceturns++++++++++
  EdgeCubieMove: array[U..Fs] of EdgeCubie =
(
  ((e:UB;o:0),(e:UR;o:0),(e:UF;o:0),(e:UL;o:0),(e:DR;o:0),(e:DF;o:0),  //U
   (e:DL;o:0),(e:DB;o:0),(e:FR;o:0),(e:FL;o:0),(e:BL;o:0),(e:BR;o:0)),
  ((e:FR;o:0),(e:UF;o:0),(e:UL;o:0),(e:UB;o:0),(e:BR;o:0),(e:DF;o:0),  //R
   (e:DL;o:0),(e:DB;o:0),(e:DR;o:0),(e:FL;o:0),(e:BL;o:0),(e:UR;o:0)),
  ((e:UR;o:0),(e:FL;o:1),(e:UL;o:0),(e:UB;o:0),(e:DR;o:0),(e:FR;o:1),  //F
   (e:DL;o:0),(e:DB;o:0),(e:UF;o:1),(e:DF;o:1),(e:BL;o:0),(e:BR;o:0)),
  ((e:UR;o:0),(e:UF;o:0),(e:UL;o:0),(e:UB;o:0),(e:DF;o:0),(e:DL;o:0),  //D
   (e:DB;o:0),(e:DR;o:0),(e:FR;o:0),(e:FL;o:0),(e:BL;o:0),(e:BR;o:0)),
  ((e:UR;o:0),(e:UF;o:0),(e:BL;o:0),(e:UB;o:0),(e:DR;o:0),(e:DF;o:0),  //L
   (e:FL;o:0),(e:DB;o:0),(e:FR;o:0),(e:UL;o:0),(e:DL;o:0),(e:BR;o:0)),
  ((e:UR;o:0),(e:UF;o:0),(e:UL;o:0),(e:BR;o:1),(e:DR;o:0),(e:DF;o:0),  //B
   (e:DL;o:0),(e:BL;o:1),(e:FR;o:0),(e:FL;o:0),(e:UB;o:1),(e:DB;o:1)),
  ((e:UB;o:0),(e:UR;o:0),(e:UF;o:0),(e:UL;o:0),(e:DB;o:0),(e:DR;o:0),  //Us PRÜFEN
   (e:DF;o:0),(e:DL;o:0),(e:FR;o:0),(e:FL;o:0),(e:BL;o:0),(e:BR;o:0)),
  ((e:FR;o:0),(e:UF;o:0),(e:FL;o:0),(e:UB;o:0),(e:BR;o:0),(e:DF;o:0),  //Rs
   (e:BL;o:0),(e:DB;o:0),(e:DR;o:0),(e:DL;o:0),(e:UL;o:0),(e:UR;o:0)),
  ((e:UR;o:0),(e:FL;o:1),(e:UL;o:0),(e:BL;o:1),(e:DR;o:0),(e:FR;o:1),  //Fs
   (e:DL;o:0),(e:BR;o:1),(e:UF;o:1),(e:DF;o:1),(e:DB;o:1),(e:UB;o:1))
);

//++the positional changes of the edgecubies by basic symmetrytransformations+++
  EdgeCubieSym: array[S_URF3..S_LR2] of EdgeCubie =
(
  ((e:UF;o:1),(e:FR;o:0),(e:DF;o:1),(e:FL;o:0),(e:UB;o:1),(e:BR;o:0),  //S_URF3
   (e:DB;o:1),(e:BL;o:0),(e:UR;o:1),(e:DR;o:1),(e:DL;o:1),(e:UL;o:1)),
  ((e:DL;o:0),(e:DF;o:0),(e:DR;o:0),(e:DB;o:0),(e:UL;o:0),(e:UF;o:0),  //S_F2
   (e:UR;o:0),(e:UB;o:0),(e:FL;o:0),(e:FR;o:0),(e:BR;o:0),(e:BL;o:0)),
  ((e:UB;o:0),(e:UR;o:0),(e:UF;o:0),(e:UL;o:0),(e:DB;o:0),(e:DR;o:0),  //S_U4
   (e:DF;o:0),(e:DL;o:0),(e:BR;o:1),(e:FR;o:1),(e:FL;o:1),(e:BL;o:1)),
  ((e:UL;o:0),(e:UF;o:0),(e:UR;o:0),(e:UB;o:0),(e:DL;o:0),(e:DF;o:0),  //S_LR2
   (e:DR;o:0),(e:DB;o:0),(e:FL;o:0),(e:FR;o:0),(e:BR;o:0),(e:BL;o:0))
);




//++++++++++++++++++++++++++++++++Error Messages++++++++++++++++++++++++++++++++
  Err: array[1..49] of String =
(
  'Twist Error. The twist of the URF-Corner will be changed.',
  'Flip Error. The flip of the UF-Corner will be changed.',
  'Parity Error. The UF-Edge and the DF-Edge will be exchanged.',
  'The maneuver already is optimal. If you proceed you may loose optimality. Proceed?',
  'The Two-Phase-Algorithm can not find a better solution.',
  'All patterns without generators in the Output Window will be discarded. Continue anyway?',
  'Before the first run, Cube Explorer needs to create files in your Cube Explorer folder. This may take up to 15 minutes and about 65 MB of space on your harddisk. Proceed?',
  'There are less than 65 MB disk space left in your Cube Explorer folder. The program will exit.',
  'Cube Explorer is busy. Please wait.',
  'Do you want to save the cubes in the Main Window before exiting Cube Explorer?',
  'All changes to the Main Window will be discarded. Proceed?',
  'Do you want to discard the Cubes in the Main Window before loading the maneuvers?',
  'The definition of the facelet colors is incomplete!',
  'There are still undefined facelets in the Facelet Editor.',
  'You only have',
  ' MB of RAM installed on your machine. You need at least 90 MB. The program will exit.',
 {$IF UHUGE}
  'Not enough RAM. Cube Explorer needs 2600 MB. Please close all other applications.',
  'Unable to load the 1881 MB Huge Optimal Solver Table.',
  'Unable to write the 1881 MB Huge Optimal Solver Table.',
  'Cube Explorer will now create a 1881 MB file in your Cube Explorer folder. This will take up to 4 hours. Proceed?',
 {$ELSE}
  'Not enough RAM. Cube Explorer needs 850 MB. Please close all other applications.',
  'Unable to load the 673 MB Huge Optimal Solver Table.',
  'Unable to write the 673 MB Huge Optimal Solver Table.',
  'Cube Explorer will now create a 673 MB file in your Cube Explorer folder. This will take up to 4 hours. Proceed?',
 {$IFEND}
  'Could not uniquely identify the white facelets. Try to reduce the brightness!',
  'Could not resolve the colors due to wrong input.',
  'Please place a white facelet in the Web Cam center position!',
  'Cube cannot be solved. Missing or wrong facelet colors!',
  'Do you really want to quit?',
  'Buffer is empty!',
  'Wrong command!',
  'You cannot solve an incomplete cube!',
  'The search for some selected cubes already is running. Action aborted.',
  'You may not start more than 500 searches at the same time.',
  'Do you really want to close this window? All results not saved so far will be lost.',
  'Some inconsistent facelet colors have been removed. Please verify the configuration!',
  'Error. No valid capture device index!',
  'Could not initialize capture device!',
  'Not enough RAM to solve center-twisted Cubes.',
  'Unable to load the 430 MB Solver Table for center-twisted Cubes.',
  'Cube Explorer will now create a 430 MB file in your Cube Explorer folder. This will take up to 4 hours. Proceed?',
  'Unable to write the 430 MB Solver Table for center-twisted cubes.',
  'Solving center-twisted Cubes needs a 430 MB table and about 500 MB of RAM. Proceed?',
  'Could not distinguish some red and and orange facelets.',
  'Could not identify all blue facelets.',
  'Could not identify all green facelets.',
  'Could not distinguish some white and and yellow facelets.',
  'Too many blue faclets.',
  'Too many green faclets.',
  'Too many red and orange facelets.',
  'Not enough blue faclets.',
  'Not enough green faclets.',
  'Not enough red and orange facelets'
);

//++++++++++++++++++++++++++++++++Hint Messages++++++++++++++++++++++++++++++++
  Hints: array[1..8] of String =
(
  'The Web Cam has to show in your direction.',
  'Position the cube in between you and the Web Cam.',
  'So you look at the F-face, the Web Cam at the B-face.',
  'After scanning a face turn the cube as depicted to scan the next face.',
  'Before scanning:',
  '1. Adjust the brightness and white balance in the Capture Device Configuration Dialog.',
  '2. Disable all automatic settings for brightness and white balance',
  '3. Read the help file for more details!'
);

var Color: array [UCol..NoCol] of TColor; //Global colours of Cube
    stopAt,autoTime: Integer;//Two Phase Algorithm Options dialog
    useTriple:Boolean;//flag for triple search
    checkIsomorphics,USES_BIG: Boolean;//prüfen ob beim Hinzufügen auf Isomorphie geprüft wird
                                        //falls InvIsomorphics gesetzt auch die Inversen auf Isomorphie überprüfen
                                       //USES_BIG, Flag ob der Big Solver verwendet wird.


//+++++++++++the positional changes of the cornercubies by moves++++++++++++
// CornerCubieMoveEx: array[Ux1..Bx3] of CornerCubie ;
//has to be initialized
//+++++++++++the positional changes of the cornercubies by moves++++++++++++
//  EdgeCubieMoveEx: array[Ux1..Bx3] of EdgeCubie ;
//has to be initialized


implementation

//+++++++++++++++++++++Multiplication of corner permutations++++++++++++++++++++
procedure CornMult(a,b:CornerCubie;var prod:CornerCubie);
var co: Corner; oriA,oriB,ori: ShortInt;
begin
  ori:=0;
  for co:=URF to DRB do
  begin
    prod[co].c:= a[b[co].c].c;
    oriA:= a[b[co].c].o; oriB:= b[co].o;
    if (oriA=6) or (oriB=6) then ori:=6//6 stands for unknown orientation
    else
    if (oriA<3) and (oriB<3) then
    begin
      ori:= oriA + oriB;
      if ori >=3 then ori:=ori-3;
    end
    else
    if (oriA<3) and (oriB>=3) then//reflections involved
    begin
      ori:= oriA + oriB;
      if ori>=6 then ori:= ori-3;
    end
    else
    if (oriA>=3) and (oriB<3) then//reflections involved
    begin
      ori:= oriA - oriB;
      if ori<3 then ori:=ori+3;
    end
    else
    if (oriA>=3) and (oriB>=3) then////reflections involved
    begin
      ori:= oriA  - oriB;
      if ori<0 then ori:=ori+3;
    end;
    prod[co].o:=ori;
  end;
end;
//++++++++++++++++++End Multiplication of corner permutations+++++++++++++++++++

//+++++++++++++++++++++Multiplication of edge permutations++++++++++++++++++++++
procedure EdgeMult(a,b:EdgeCubie; var prod:EdgeCubie);
var ed: Edge; ori:ShortInt;
begin
  for ed:=UR to BR do
  begin
    prod[ed].e:= a[b[ed].e].e;
    ori:= b[ed].o+a[b[ed].e].o;
    if ori=2 then ori:=0
    else if ori>=6 then ori:=6;//unknown orientation
    prod[ed].o:=ori;
  end;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++++++++++++++Multiplication of center permutations++++++++++++++++++++
procedure CentMult(a,b:CenterCubie;var prod:CenterCubie);
var x: TurnAxis; oriA,oriB,ori: ShortInt;
begin
  ori:=0;
  for x:=U to Cubedefs.B do
  begin
    prod[x].c:= a[b[x].c].c;
    oriA:= a[b[x].c].o; oriB:= b[x].o;

    if (oriA<4) and (oriB<4) then
    begin
      ori:= oriA + oriB;
      if ori >=4 then ori:=ori-4;
    end
    else
    if (oriA<4) and (oriB>=4) then//reflections involved
    begin
      ori:= oriA + oriB;
      if ori>=8 then ori:= ori-4;
    end
    else
    if (oriA>=4) and (oriB<4) then//reflections involved
    begin
      ori:= oriA - oriB;
      if ori<4 then ori:=ori+4;
    end
    else
    if (oriA>=4) and (oriB>=4) then////reflections involved
    begin
      ori:= oriA  - oriB;
      if ori<0 then ori:=ori+4;
    end;
    prod[x].o:=ori;
  end;
end;
//++++++++++++++++++End Multiplication of center permutations+++++++++++++++++++



//+++++++++++++++++++++Multiplication of axis permutations++++++++++++++++++++
procedure AxisMult(a,b:Axis;var prod:Axis);
var x: TurnAxis;
begin
   for x:=U to Cubedefs.B do prod[x]:=b[a[x]];
end;




//++++++++++++Compute the Inverse of an Edge Permutation++++++++++++++++++++++++
procedure EdgeInv(a:EdgeCubie;var inv:EdgeCubie);
var ed: Edge;
begin
  for ed:=UR to BR do inv[a[ed].e].e:=ed;
  for ed:=UR to BR do inv[ed].o:= a[inv[ed].e].o;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++++++Compute the Inverse of a Corner Permutation++++++++++++++++++++++++
procedure CornInv(a:CornerCubie;var inv:CornerCubie);
var co: Corner; ori:ShortInt;
begin
 for co:= URF to DRB do inv[a[co].c].c:=co;
 for co:= URF to DRB do
 begin
   ori:= a[inv[co].c].o;
   if ori>=3 then  //just for completeness, we do not invert "reflection states"
     inv[co].o:=ori//in Cube Explorer
   else
   begin //the usual case;
     inv[co].o:=-ori;
     if inv[co].o<0 then inv[co].o:=inv[co].o+3;
   end;
 end;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++++++Compute the Inverse of a Center Permutation++++++++++++++++++++++++
procedure CentInv(a:CenterCubie;var inv:CenterCubie);
var cn: TurnAxis; ori:ShortInt;
begin
 for cn:= U to B do inv[a[cn].c].c:=cn;
 for cn:= U to B do
 begin
   ori:= a[inv[cn].c].o;
   if ori>=4 then  //just for completeness, we do not invert "reflection states"
     inv[cn].o:=ori//in Cube Explorer
   else
   begin //the usual case;
     inv[cn].o:=-ori;
     if inv[cn].o<0 then inv[cn].o:=inv[cn].o+4;
   end;
 end;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


end.
