unit FaceCube;

interface
uses CubeDefs,Windows,Graphics,extctrls;
type
//++++++++++++++Classe for Cube on the Facelet Level++++++++++++++++++++++++++++
  FaceletCube = Class
  private
    function isPossibleCorner(fc:Face;c:Corner):Integer;
  public
    Face1,Face2,FaceOrig,FaceOrigOpt: FaceletColor;
    PFace,PFaceTemp,swap: ^FaceletColor;
    size: Integer;//3*size gives pixelnumber for one square in cube picture
    isOriented: Boolean;
    cenTwist: CenterTwist;
    x,y: Integer;
    cv:TCanvas;//
    tripSearch: TObject;//for the two phase search;
    optSearch: TObject;// for the optimal search
    running,solver,runOptimal,selected:Boolean;
    patName,maneuver,optManeuver,hintInfo{,addInfo}: string;
    optStartTime,optStopTime,optIdleTime:TDateTime;//for measuring optimal solver time
    optLength:Integer;//Length of optimal Maneuver
    phase2Length:Integer;//Initial length of loaded maneuver
    paintType: Integer;//0:all, 1:only corners, 2:only edges


    procedure Move(x:TurnAxis);
    procedure Conjugate(s:Symmetry);
    procedure DrawCube(xOff,yOff:Integer);
    procedure Empty;
    procedure Clean;
    procedure SetFacelets(cCube:TObject);//cannot declare cCube as CubieCube here
    //because we cannot put CubiCube into the "uses"-section of interface part
    function Check(fc:Face;auto:Boolean):Boolean;
    function InverseManeuver:String;
    function InverseOptManeuver:String;
    function IsIsomorphic(f:FaceletCube;onlyCorners,onlyNormal,alsoInverse:Boolean):Boolean;
    function TwistOk:Boolean;
    function FlipOk:Boolean;

    constructor Create(cvas:TCanvas);overload;
    constructor Create(fc:FaceletCube;cvas:TCanvas;x,y,size:Integer;t:Integer);overload;
    constructor Create(fc:FaceletCube;cvas:TCanvas;x,y,size:Integer;
                        t:Integer;ctw:Centertwist);overload;
//    constructor Create(man:String;cvas:TCanvas);overload;
    end;

    function ToRyanHeise(man:String): String;
implementation

//+++++++++ FaceletCube +++++++++

uses  classes,SysUtils,RubikMain,CubiCube,Forms,Symmetries,Search; //!!!SEARCH wegen MAXNODES



//+++++++++++++++++++++Draw parallelogram type 1 in cube picture++++++++++++++++
procedure drawPara1(c:TCanvas;x,y,l:Longint);
var p: Array[1..4] of TPoint;
begin
  p[1].X:=x;p[1].Y:=y;p[2].X:=x+3*l;p[2].Y:=y;p[3].X:=p[2].x-2*l;p[3].y:=p[2].y+2*l;
  p[4].X:=p[3].X -3*l;p[4].Y:=p[3].Y;
  SetBkMode(c.Handle, OPAQUE); //to set the hatched background
  SetBkColor(C.Handle, clBlack);
  c.Polygon(p);
  SetBkMode(c.Handle, TRANSPARENT);
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++draw parralelogram type 2 in cube picture+++++++++++++
procedure drawPara2(c:TCanvas;x,y,l:Longint);
var p: Array[1..4] of TPoint;
begin
  p[1].X:=x;p[1].Y:=y;p[2].X:=x+2*l;p[2].Y:=y-2*l;p[3].X:=p[2].x;p[3].y:=p[2].y+3*l;
  p[4].X:=p[1].X;p[4].Y:=p[1].Y+3*l;
  SetBkMode(c.Handle, OPAQUE);
  SetBkColor(C.Handle, clBlack);
  c.Polygon(p);
  SetBkMode(c.Handle, TRANSPARENT);
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++draw square in cube picture+++++++++++++++++++++++++++++++++
procedure drawSquare(c:TCanvas;x,y,l:Longint);
var p: Array[1..4] of TPoint;
begin
  p[1].X:=x;p[1].Y:=y;p[2].X:=x+3*l;p[2].Y:=y;p[3].X:=p[2].x;p[3].y:=p[2].y+3*l;
  p[4].X:=p[3].X -3*l;p[4].Y:=p[3].Y;
  SetBkMode(c.Handle, OPAQUE);
  SetBkColor(C.Handle, clBlack);
  c.Polygon(p);
  SetBkMode(c.Handle, TRANSPARENT);
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++Constructor saves Canvas where the faceletcube draws itself+++++++++++++
constructor FaceletCube.Create(cvas:TCanvas);
var i: TurnAxis;
begin
  isOriented:=false;
  for i:= U to B do cenTwist[i]:=0;
  cv:=cvas;//pb:=pbox;
  PFace:= @Face1;
  PFaceTemp:=@Face2;
  Clean;
  size:=10;
  x:=0;
  y:=0;
  tripSearch:=nil;
  optSearch:=nil;
  runOptimal:=false;
  selected:=false;
  phase2Length:=MAXNODES;

  optManeuver:='Status: Not Running';
  optLength:= 30;//will allways be shorter
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++Move on the facelet level+++++++++++++++++++++++++++++++++
procedure FaceletCube.Move(x: TurnAxis);  //fehlerhaft
var i: Face; tmp: Integer; tmpCol:TColor;
begin
  swap:= PFace; PFace:= PFaceTemp; PFaceTemp:=swap;
  for i:=U1 to B9 do
    PFace^[FaceletMove[x,i]]:=PFaceTemp^[i];

  if x<=B then cenTwist[x]:=  (cenTwist[x]+1) and 3
//Sonderbehandlung für Züge, die die Mitten verändern
  else if x=E then
  begin
    cenTwist[U]:= (cenTwist[U]+1) and 3;cenTwist[D]:= (cenTwist[D]+3) and 3;
    tmp:=cenTwist[R]; cenTwist[R]:= cenTwist[F]; cenTwist[F]:= cenTwist[L];
    cenTwist[L]:= cenTwist[B]; cenTwist[B]:= tmp;
    for i:=U1 to B9 do
    case PFace^[i] of
      UCol: PFaceTemp^[i]:= UCol;
      DCol: PFaceTemp^[i]:= DCol;
      FCol: PFaceTemp^[i]:= RCol;//F-Center geht nach R-Center
      RCol: PFaceTemp^[i]:= BCol;
      BCol: PFaceTemp^[i]:= LCol;
      LCol: PFaceTemp^[i]:= FCol;
      UColA: PFaceTemp^[i]:= UColA;
      DColA: PFaceTemp^[i]:= DColA;
      FColA: PFaceTemp^[i]:= RColA;
      RColA: PFaceTemp^[i]:= BColA;
      BColA: PFaceTemp^[i]:= LColA;
      LColA: PFaceTemp^[i]:= FColA;
      NoCol: PFaceTemp^[i]:= NoCol;
      OriCol: PFaceTemp^[i]:= OriCol;
    end;
    swap:= PFace; PFace:= PFaceTemp; PFaceTemp:=swap;
    //jetzt noch die Farben ändern
    tmpCol:=Color[FCol];
    Color[FCol]:= Color[LCol];//F nimmt die Farbe von L an
    Color[LCol]:= Color[BCol];
    Color[BCol]:= Color[RCol];
    Color[RCol]:= tmpCol;
  end
  else if x=M then
  begin cenTwist[R]:= (cenTwist[R]+1) and 3;cenTwist[L]:= (cenTwist[L]+3) and 3;
    tmp:=cenTwist[U]; cenTwist[U]:= cenTwist[B]; cenTwist[B]:= cenTwist[D];
    cenTwist[D]:= cenTwist[F]; cenTwist[F]:= tmp;
    for i:=U1 to B9 do
    case PFace^[i] of
      RCol: PFaceTemp^[i]:= RCol;
      LCol: PFaceTemp^[i]:= LCol;
      UCol: PFaceTemp^[i]:= FCol;//U-Center geht nach F-Center
      FCol: PFaceTemp^[i]:= DCol;
      DCol: PFaceTemp^[i]:= BCol;
      BCol: PFaceTemp^[i]:= UCol;
      RColA: PFaceTemp^[i]:= RColA;
      LColA: PFaceTemp^[i]:= LColA;
      UColA: PFaceTemp^[i]:= FColA;//U-Center geht nach F-Center
      FColA: PFaceTemp^[i]:= DColA;
      DColA: PFaceTemp^[i]:= BColA;
      BColA: PFaceTemp^[i]:= UColA;
      NoCol: PFaceTemp^[i]:= NoCol;
      OriCol: PFaceTemp^[i]:= OriCol;
    end;
    swap:= PFace; PFace:= PFaceTemp; PFaceTemp:=swap;
    //jetzt noch die Farben ändern
    tmpCol:=Color[UCol];
    Color[UCol]:= Color[BCol];//U nimmt die Farbe von B an
    Color[BCol]:= Color[DCol];
    Color[DCol]:= Color[FCol];
    Color[FCol]:= tmpCol;
  end
  else if x=S then
  begin cenTwist[F]:= (cenTwist[F]+3) and 3;cenTwist[B]:= (cenTwist[B]+1) and 3;
    tmp:=cenTwist[U]; cenTwist[U]:= cenTwist[L]; cenTwist[L]:= cenTwist[D];
    cenTwist[D]:= cenTwist[R]; cenTwist[R]:= tmp;
    for i:=U1 to B9 do
    case PFace^[i] of
      FCol: PFaceTemp^[i]:= FCol;
      BCol: PFaceTemp^[i]:= BCol;
      UCol: PFaceTemp^[i]:= RCol;//U-Center geht nach R-Center
      RCol: PFaceTemp^[i]:= DCol;
      DCol: PFaceTemp^[i]:= LCol;
      LCol: PFaceTemp^[i]:= UCol;
      FColA: PFaceTemp^[i]:= FColA;
      BColA: PFaceTemp^[i]:= BColA;
      UColA: PFaceTemp^[i]:= RColA;//U-Center geht nach R-Center
      RColA: PFaceTemp^[i]:= DColA;
      DColA: PFaceTemp^[i]:= LColA;
      LColA: PFaceTemp^[i]:= UColA;
      NoCol: PFaceTemp^[i]:= NoCol;
      OriCol: PFaceTemp^[i]:= OriCol;
    end;
    swap:= PFace; PFace:= PFaceTemp; PFaceTemp:=swap;
    //jetzt noch die Farben ändern
    tmpCol:=Color[UCol];
    Color[UCol]:= Color[LCol];//U nimmt die Farbe von L an
    Color[LCol]:= Color[DCol];
    Color[DCol]:= Color[RCol];
    Color[RCol]:= tmpCol;
  end
  else if x=Us then//x-Move
  begin
    tmp:=cenTwist[U]; cenTwist[U]:= cenTwist[F]; cenTwist[F]:= cenTwist[D];
    cenTwist[D]:= cenTwist[B]; cenTwist[B]:= tmp;
    for i:=U1 to B9 do
    case PFace^[i] of
      RCol: PFaceTemp^[i]:= RCol;
      LCol: PFaceTemp^[i]:= LCol;
      UCol: PFaceTemp^[i]:= BCol;//U-Center geht nach B-Center
      BCol: PFaceTemp^[i]:= DCol;
      DCol: PFaceTemp^[i]:= FCol;
      FCol: PFaceTemp^[i]:= UCol;
      RColA: PFaceTemp^[i]:= RColA;
      LColA: PFaceTemp^[i]:= LColA;
      UColA: PFaceTemp^[i]:= BColA;//U-Center geht nach B-Center
      BColA: PFaceTemp^[i]:= DColA;
      DColA: PFaceTemp^[i]:= FColA;
      FColA: PFaceTemp^[i]:= UColA;
      NoCol: PFaceTemp^[i]:= NoCol;
      OriCol: PFaceTemp^[i]:= OriCol;
    end;
    swap:= PFace; PFace:= PFaceTemp; PFaceTemp:=swap;
    //jetzt noch die Farben ändern
    tmpCol:=Color[UCol];
    Color[UCol]:= Color[FCol];//U nimmt die Farbe von F an
    Color[FCol]:= Color[DCol];
    Color[DCol]:= Color[BCol];
    Color[BCol]:= tmpCol;
  end
  else if x=Rs then//y-Move
  begin
    tmp:=cenTwist[R]; cenTwist[R]:= cenTwist[B]; cenTwist[B]:= cenTwist[L];
    cenTwist[L]:= cenTwist[F]; cenTwist[F]:= tmp;
    for i:=U1 to B9 do
    case PFace^[i] of
      UCol: PFaceTemp^[i]:= UCol;
      DCol: PFaceTemp^[i]:= DCol;
      RCol: PFaceTemp^[i]:= FCol;//R-Center geht nach F-Center
      FCol: PFaceTemp^[i]:= LCol;
      LCol: PFaceTemp^[i]:= BCol;
      BCol: PFaceTemp^[i]:= RCol;
      UColA: PFaceTemp^[i]:= UColA;
      DColA: PFaceTemp^[i]:= UColA;
      RColA: PFaceTemp^[i]:= FColA;//R-Center geht nach F-Center
      FColA: PFaceTemp^[i]:= LColA;
      LColA: PFaceTemp^[i]:= BColA;
      BColA: PFaceTemp^[i]:= RColA;
      NoCol: PFaceTemp^[i]:= NoCol;
      OriCol: PFaceTemp^[i]:= OriCol;
    end;
    swap:= PFace; PFace:= PFaceTemp; PFaceTemp:=swap;
    //jetzt noch die Farben ändern
    tmpCol:=Color[FCol];
    Color[FCol]:= Color[RCol];//F nimmt die Farbe von R an
    Color[RCol]:= Color[BCol];
    Color[BCol]:= Color[LCol];
    Color[LCol]:= tmpCol;
  end
  else if x=Fs then//z-Move
  begin
   tmp:=cenTwist[U]; cenTwist[U]:= cenTwist[L]; cenTwist[L]:= cenTwist[D];
   cenTwist[D]:= cenTwist[R]; cenTwist[R]:= tmp;
    for i:=U1 to B9 do
    case PFace^[i] of
      FCol: PFaceTemp^[i]:= FCol;
      BCol: PFaceTemp^[i]:= BCol;
      UCol: PFaceTemp^[i]:= RCol;//U-Center geht nach R-Center
      RCol: PFaceTemp^[i]:= DCol;
      DCol: PFaceTemp^[i]:= LCol;
      LCol: PFaceTemp^[i]:= UCol;
      FColA: PFaceTemp^[i]:= FColA;
      BColA: PFaceTemp^[i]:= BColA;
      UColA: PFaceTemp^[i]:= RColA;//U-Center geht nach R-Center
      RColA: PFaceTemp^[i]:= DColA;
      DColA: PFaceTemp^[i]:= LColA;
      LColA: PFaceTemp^[i]:= UColA;
      NoCol: PFaceTemp^[i]:= NoCol;
      OriCol: PFaceTemp^[i]:= OriCol;
    end;
    swap:= PFace; PFace:= PFaceTemp; PFaceTemp:=swap;
    //jetzt noch die Farben ändern
    tmpCol:=Color[UCol];
    Color[UCol]:= Color[LCol];//U nimmt die Farbe von L an
    Color[LCol]:= Color[DCol];
    Color[DCol]:= Color[RCol];
    Color[RCol]:= tmpCol;
  end


end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++conjugation by basic symmetry+++++++++++++++++++++++++
procedure FaceletCube.Conjugate(s: Symmetry);
var i: Face;j: TurnAxis;
    reColor: array[UCol..BCol] of ColorIndex;
    ctTemp: CenterTwist;
begin
  swap:= PFace;PFace:= PFaceTemp;PFaceTemp:=swap;
  for j:= U to B do ctTemp[j]:= cenTwist[j];
  case s of
  S_URF3:
  begin
  reColor[UCol]:=RCol;reColor[RCol]:=FCol;reColor[FCol]:=UCol;
  reColor[DCol]:=LCol;reColor[LCol]:=BCol;reColor[BCol]:=DCol;
  for i:=U1 to B9 do PFace^[FaceletSym[s,i]]:= reColor[PFaceTemp^[i]];
  cenTwist[U]:= ctTemp[F]; cenTwist[R]:= ctTemp[U]; cenTwist[F]:= ctTemp[R];
  cenTwist[D]:= ctTemp[B]; cenTwist[L]:= ctTemp[D]; cenTwist[B]:= ctTemp[L];
  end;
  S_F2:
  begin
  reColor[UCol]:=DCol;reColor[RCol]:=LCol;reColor[FCol]:=FCol;
  reColor[DCol]:=UCol;reColor[LCol]:=RCol;reColor[BCol]:=BCol;
  for i:=U1 to B9 do PFace^[FaceletSym[s,i]]:= reColor[PFaceTemp^[i]];
  cenTwist[U]:= ctTemp[D]; cenTwist[R]:= ctTemp[L]; cenTwist[F]:= ctTemp[F];
  cenTwist[D]:= ctTemp[U]; cenTwist[L]:= ctTemp[R]; cenTwist[B]:= ctTemp[B];
  end;
  S_U4:
  begin
  reColor[UCol]:=UCol;reColor[RCol]:=FCol;reColor[FCol]:=LCol;
  reColor[DCol]:=DCol;reColor[LCol]:=BCol;reColor[BCol]:=RCol;
  for i:=U1 to B9 do PFace^[FaceletSym[s,i]]:= reColor[PFaceTemp^[i]];
  cenTwist[U]:= ctTemp[U]; cenTwist[R]:= ctTemp[B]; cenTwist[F]:= ctTemp[R];
  cenTwist[D]:= ctTemp[D]; cenTwist[L]:= ctTemp[F]; cenTwist[B]:= ctTemp[L];
  end;
  S_LR2:
  begin
  reColor[UCol]:=UCol;reColor[RCol]:=LCol;reColor[FCol]:=FCol;
  reColor[DCol]:=DCol;reColor[LCol]:=RCol;reColor[BCol]:=BCol;
  for i:=U1 to B9 do PFace^[FaceletSym[s,i]]:= reColor[PFaceTemp^[i]];
  cenTwist[U]:= (4-ctTemp[U]) mod 4;cenTwist[R]:= (4-ctTemp[L]) mod 4;
  cenTwist[F]:= (4-ctTemp[F]) mod 4;cenTwist[D]:= (4-ctTemp[D]) mod 4;
  cenTwist[L]:= (4-ctTemp[R]) mod 4;cenTwist[B]:= (4-ctTemp[B]) mod 4;
  end;
  end;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++++++++draw Cube on canvas++++++++++++++++++++++++++++++++++++++++++++
procedure FaceletCube.DrawCube(xOff,yOff:Integer);
var a,b,d:Integer;
    c:TCanvas;
    i:Face;
begin
  a:=0;b:=0;
  c:=cv;//cv is initialized in the constructor
  //size:=4; //Für das zeichnen von Grafiken hier patchen 4 oder 7 nehmen
  d:=size;
  for i:=U1 to B9 do
  begin
    if PFace^[i]<UColA then
    begin c.Brush.Color:= Color[PFace^[i]]; c.Brush.Style:= bsSolid end
    else if PFace^[i]<OriCol then
    begin c.Brush.Color:= Color[ColorIndex(Ord(PFace^[i])-7)]; c.Brush.Style:= bsDiagCross end
    else begin c.Brush.Color:=Color[UCol];; c.Brush.Style:= bsBDiagonal end;

    if paintType=4 then //direkter Farbmodus
    case PFace^[i] of
      UCol: c.Brush.Color:=clRed;
      RCol: c.Brush.Color:=RGB(255,128,0);
      FCol: c.Brush.Color:=clBlue;
      DCol: c.Brush.Color:=clGreen;
      LCol: c.Brush.Color:=clYellow;
      BCol: c.Brush.Color:=clWhite;
      NoCol: c.Brush.Color:=clGray;
    end;

    if paintType=1 then//no edges
    case i of
      U2,U4,U6,U8,R2,R4,R6,R8,F2,F4,F6,F8,D2,D4,D6,D8,L2,L4,L6,L8,B2,B4,B6,B8:
       c.Brush.Color:= Color[Nocol];
    end
    else if paintType=2 then//no corners
    case i of
      U1,U3,U7,U9,R1,R3,R7,R9,F1,F3,F7,F9,D1,D3,D7,D9,L1,L3,L7,L9,B1,B3,B7,B9:
        c.Brush.Color:= Color[Nocol];
    end;

    case i of
    L1..L9: drawSquare(c,x-xOff+d*3*a,y-yOff+d*(3*b+6),d);
    F1..F9: drawSquare(c,x-xOff+d*(3*a+9),y-yOff+d*(3*b+6),d);
    D1..D9: drawSquare(c,x-xOff+d*(3*a+9),y-yOff+d*(3*b+15),d);
    U1..U9: drawPara1(c,x-xOff+d*(3*a-2*b+15),y-yOff+d*2*b,d);
    R1..R9: drawPara2(c,x-xOff+d*(2*a+18),y-yOff+d*(-2*a+3*b+6),d);
    B1..B9: drawSquare(c,x-xOff+d*(3*a+24),y-yOff+d*3*b,d);
    end;
    inc(a);
    if a mod 3= 0 then begin a:=0; inc(b); end;
    if b = 3 then b:=0;
    if isOriented then
    begin
      c.Brush.Color:=clBlack;
      case i of
        L5:
        case cenTwist[L] of
          0:c.Ellipse(x-xOff+4*d,y-yOff+9*d,x-xOff+5*d,y-yOff+10*d);
          1:c.Ellipse(x-xOff+5*d,y-yOff+10*d,x-xOff+6*d,y-yOff+11*d);
          2:c.Ellipse(x-xOff+4*d,y-yOff+11*d,x-xOff+5*d,y-yOff+12*d);
          3:c.Ellipse(x-xOff+3*d,y-yOff+10*d,x-xOff+4*d,y-yOff+11*d);
        end;
        D5:
        case cenTwist[CubeDefs.D] of
          0:c.Ellipse(x-xOff+13*d,y-yOff+18*d,x-xOff+14*d,y-yOff+19*d);
          1:c.Ellipse(x-xOff+14*d,y-yOff+19*d,x-xOff+15*d,y-yOff+20*d);
          2:c.Ellipse(x-xOff+13*d,y-yOff+20*d,x-xOff+14*d,y-yOff+21*d);
          3:c.Ellipse(x-xOff+12*d,y-yOff+19*d,x-xOff+13*d,y-yOff+20*d);
        end;
        F5:
        case cenTwist[F] of
          0:c.Ellipse(x-xOff+13*d,y-yOff+9*d,x-xOff+14*d,y-yOff+10*d);
          1:c.Ellipse(x-xOff+14*d,y-yOff+10*d,x-xOff+15*d,y-yOff+11*d);
          2:c.Ellipse(x-xOff+13*d,y-yOff+11*d,x-xOff+14*d,y-yOff+12*d);
          3:c.Ellipse(x-xOff+12*d,y-yOff+10*d,x-xOff+13*d,y-yOff+11*d);
        end;
        B5:
        case cenTwist[CubeDefs.B] of
          0:c.Ellipse(x-xOff+28*d,y-yOff+3*d,x-xOff+29*d,y-yOff+4*d);
          1:c.Ellipse(x-xOff+29*d,y-yOff+4*d,x-xOff+30*d,y-yOff+5*d);
          2:c.Ellipse(x-xOff+28*d,y-yOff+5*d,x-xOff+29*d,y-yOff+6*d);
          3:c.Ellipse(x-xOff+27*d,y-yOff+4*d,x-xOff+28*d,y-yOff+5*d);
        end;
        U5:
        case cenTwist[U] of
          0:c.Ellipse(x-xOff+33*d div 2,y-yOff+2*d,x-xOff+35*d div 2,y-yOff+3*d);
          1:c.Ellipse(x-xOff+34*d div 2,y-yOff+5*d div 2 ,x-xOff+36*d div 2,y-yOff+7*d div 2);
          2:c.Ellipse(x-xOff+31*d div 2,y-yOff+6*d div 2 ,x-xOff+33*d div 2,y-yOff+8*d div 2);
          3:c.Ellipse(x-xOff+30*d div 2,y-yOff+5*d div 2 ,x-xOff+32*d div 2,y-yOff+7*d div 2);
        end;
        R5:
        case cenTwist[R] of
          0:c.Ellipse(x-xOff+41*d div 2,y-yOff+25*d div 4,x-xOff+43*d div 2,y-yOff+29*d div 4);
          1:c.Ellipse(x-xOff+42*d div 2,y-yOff+26*d div 4,x-xOff+44*d div 2,y-yOff+30*d div 4);
          2:c.Ellipse(x-xOff+83*d div 4,y-yOff+31*d div 4,x-xOff+87*d div 4,y-yOff+35*d div 4);
          3:c.Ellipse(x-xOff+80*d div 4,y-yOff+31*d div 4,x-xOff+84*d div 4,y-yOff+35*d div 4);
        end;
      end;//case
    end;//if
  end;//for i
  c.Brush.Color:= clWhite;
end;
//++++++++++++++End draw cube on canvas+++++++++++++++++++++++++++++++++++++++++

//++++++++++++++Clear the facelet colors++++++++++++++++++++++++++++++++++++++++
procedure FaceletCube.Empty;
var i: Face; j: TurnAxis;
begin
  for i:=U1 to U4 do PFace^[i]:=NoCol;
  for i:=R1 to R4 do PFace^[i]:=NoCol;
  for i:=F1 to F4 do PFace^[i]:=NoCol;
  for i:=D1 to D4 do PFace^[i]:=NoCol;
  for i:=L1 to L4 do PFace^[i]:=NoCol;
  for i:=B1 to B4 do PFace^[i]:=NoCol;

  for i:=U6 to U9 do PFace^[i]:=NoCol;
  for i:=R6 to R9 do PFace^[i]:=NoCol;
  for i:=F6 to F9 do PFace^[i]:=NoCol;
  for i:=D6 to D9 do PFace^[i]:=NoCol;
  for i:=L6 to L9 do PFace^[i]:=NoCol;
  for i:=B6 to B9 do PFace^[i]:=NoCol;

  for j:=U to B do cenTwist[j]:=0;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++Reset to clean cube+++++++++++++++++++++++++++++++++++++++++
procedure FaceletCube.Clean;
var i: Face;j: TurnAxis;
begin
  for i:=U1 to U9 do PFace^[i]:=UCol;
  for i:=R1 to R9 do PFace^[i]:=RCol;
  for i:=F1 to F9 do PFace^[i]:=FCol;
  for i:=D1 to D9 do PFace^[i]:=DCol;
  for i:=L1 to L9 do PFace^[i]:=LCol;
  for i:=B1 to B9 do PFace^[i]:=BCol;
  for j:=U to B do cenTwist[j]:=0;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

function FaceletCube.isPossibleCorner(fc:Face;c:Corner):Integer;
//prüft, wie oft eine bestimmte Ecke bei der aktuellen Farbbelegung prinzipiell vorkommen kann
begin

end;


//facelet editor check for consistent coloring of cube each time facelet is set+
//return false if something was change.  Wird nur bei autofix option beim manuellen editieren aufgerufen
function FaceletCube.Check(fc:Face;auto:Boolean):Boolean;
var i,j,k: Corner;
    i1,j1,k1: Edge;
    freeCol,n,m,faceletMatch,ori,t: Integer;
    ci:ColorIndex;
    cCube:CubieCube;
begin
  Result:= true;//alles ok
  if (Ord(fc) + Ord(fc) div 9) mod 2 = 0 then //check a corner
  begin
    for i:= URF to DRB do //get the involved corner
      if (CF[i,0]=fc) or (CF[i,1]=fc) or (CF[i,2]=fc) then break;//corner found
    //in case of ignoring orientation set the other facelets also to ignore orientation
    if (PFace^[fc]>NoCol) and (PFace^[fc]<>OriCol) then
    begin
      for n:=0 to 2 do if PFace^[CF[i,n]]<=BCol then
      begin
       PFace^[CF[i,n]]:=ColorIndex(Ord(PFace^[CF[i,n]])+7);
       Result:=false;
      end;
    end
    //if ignore place, free the other facelets
    else if PFace^[fc]=OriCol then
    begin
      for n:=0 to 2 do if (CF[i,n]<>fc) and (PFace^[CF[i,n]]<>NoCol) then
      begin
        PFace^[CF[i,n]]:= NoCol;
        Result:=false;
      end;
    end
    else if (PFace^[fc]<NoCol) then  //echte Farbe
    begin
      for n:=0 to 2 do if PFace^[CF[i,n]]>NoCol then
      begin
        PFace^[CF[i,n]]:=ColorIndex(Ord(PFace^[CF[i,n]])-7);
        Result:=false;
      end;
    end;
    //letzteres setzt ein OriCol auf NoCol, dass ist Ok
    freeCol:=0;//check how many facelets of the corner still are free
    for n:=0 to 2 do if PFace^[CF[i,n]]=NoCol then Inc(freeCol);
    case freeCol of
    1://check first, if corner exists
      begin
      for j:= URF to DRB do
        begin
          for m:=0 to 2 do
          begin
            faceletMatch:=0;
            for n:=0 to 2 do
            begin
              if (PFace^[CF[i,n]]=CCI[j,(n+m) mod 3]) then Inc(faceletMatch);
              if (PFace^[CF[i,n]]>NoCol)
               and (ColorIndex(Ord(PFace^[CF[i,n]])-7)= CCI[j,(n+m) mod 3])
               then Inc(faceletMatch);
            end;
            if faceletMatch=2 then begin ori:=m; break; end;
          end;
          if faceletMatch=2 then break;
        end;
        if faceletMatch<>2 then //clear the other(manual) or this(auto) facelets assuming something is wrong
        begin
          if not auto then
          begin
            for n:=0 to 2 do if (CF[i,n]<>fc) and (PFace^[CF[i,n]]<>noCol)
              then begin PFace^[CF[i,n]]:= noCol; Result:=false; end;
          end
          else
            begin for n:=0 to 2 do if (CF[i,n]=fc)and (PFace^[CF[i,n]]<>noCol)
              then begin PFace^[CF[i,n]]:= noCol; Result:=false; end;
          end
        end
        else //now check if there is not already another cubie like this one
        begin
          for k:= URF to DRB do
          begin
            if k=i then continue;
            for m:=0 to 2 do
            begin
              faceletMatch:=0;
              for n:=0 to 2 do
              begin
              t:=-1;
              if (PFace^[CF[i,n]]<>NoCol) and (PFace^[CF[i,n]]<>OriCol) then
                t:=Ord(PFace^[CF[i,n]])-Ord(PFace^[CF[k,(n+m) mod 3]]);
              if (t=0) or (t=7) or (t=-7)  then Inc(faceletMatch);

                if faceletMatch=2 then break;
              end;
              if faceletMatch=2 then break;
            end;
            if faceletMatch=2 then break;
          end;
         if faceletMatch=2 then //clear the other cubie(manual)
           if not auto then
           begin
             for n:=0 to 2 do
             begin
               if (PFace^[CF[k,n]]<>noCol) then begin PFace^[CF[k,n]]:= noCol;Result:=false;end;
             end;
           end
           else
           begin
             for n:=0 to 2 do
              if (CF[i,n]=fc) and (PFace^[CF[i,n]]<>noCol) then begin PFace^[CF[i,n]]:= noCol; Result:=false; end;
           end;
          if not auto then for n:=0 to 2 do
          begin
            if (PFace^[CF[i,n]]= NoCol) and (PFace^[CF[i,(n+1) mod 3]]< NoCol) //ist besetzt
             then begin PFace^[CF[i,n]]:=CCI[j,(n+ori) mod 3];Result:=false;end;//complete 3. facelet
            if (PFace^[CF[i,n]]= NoCol) and (PFace^[CF[i,(n+1) mod 3]]> NoCol) //ist besetzt
             then begin PFace^[CF[i,n]]:=ColorIndex(Ord(CCI[j,(n+ori) mod 3])+7);Result:=false;end;//complete 3. facelet
          end;
        end;
      end;//1:
    0:
      begin
        for j:= URF to DRB do
        begin
          for m:=0 to 2 do
          begin
            faceletMatch:=0;
            for n:=0 to 2 do
            begin
              if (PFace^[CF[i,n]]=CCI[j,(n+m) mod 3]) then Inc(faceletMatch);
              if (PFace^[CF[i,n]]>NoCol)
               and (ColorIndex(Ord(PFace^[CF[i,n]])-7)= CCI[j,(n+m) mod 3])
               then Inc(faceletMatch);
            end;
            if faceletMatch=3 then break;
          end;
          if faceletMatch=3 then break;
        end;
        if faceletMatch<>3 then //clear the other facelets assuming something is wrong
        begin
          if not auto then
          begin
            for n:=0 to 2 do if (CF[i,n]<>fc) and (PFace^[CF[i,n]]<>noCol)
              then begin PFace^[CF[i,n]]:= noCol;Result:=false;end;
          end
          else
          begin
            for n:=0 to 2 do if (CF[i,n]=fc) and (PFace^[CF[i,n]]<>noCol) then begin PFace^[CF[i,n]]:= noCol;Result:=false;end;
          end
        end
        else //now check if there is not already another cubie like this one
        begin

          for k:= URF to DRB do

          begin
            if k=i then continue;
            for m:=0 to 2 do
            begin
              faceletMatch:=0;
              for n:=0 to 2 do
              begin
              t:=-1;
              if (PFace^[CF[i,n]]<>NoCol) and (PFace^[CF[i,n]]<>OriCol) then
                t:=Ord(PFace^[CF[i,n]])-Ord(PFace^[CF[k,(n+m) mod 3]]);
              if (t=0) or (t=7) or (t=-7)  then Inc(faceletMatch);

                if faceletMatch=2 then break;
              end;
              if faceletMatch=2 then break;
            end;
            if faceletMatch=2 then break;
          end;

          if faceletMatch>1 then //clear the other cubie(manual)
          if not auto then
            for n:=0 to 2 do
            begin
              if PFace^[CF[k,n]]<>noCol then begin PFace^[CF[k,n]]:= noCol;Result:=false; end;
            end
          else
          begin
            for n:=0 to 2 do
              if (CF[i,n]=fc) and (PFace^[CF[i,n]]<>noCol) then begin PFace^[CF[i,n]]:= noCol;Result:=false;end;
          end
        end;
      end;
    end;//case
  end
  else //Kanten untersuchen
  begin

    for i1:= UR to BR do //get the involved edge
      if (EF[i1,0]=fc) or (EF[i1,1]=fc) then break;//edte found

     //in case of ignoring orientation set the other facelets also to ignore orientation
    if (PFace^[fc]>NoCol) and (PFace^[fc]<>OriCol) then
    begin
      for n:=0 to 1 do if PFace^[EF[i1,n]]<=BCol then
        begin PFace^[EF[i1,n]]:=ColorIndex(Ord(PFace^[EF[i1,n]])+7);Result:=false;end;
    end
    //if ignore place, free the other facelets
    else if PFace^[fc]=OriCol then
    begin
      for n:=0 to 1 do if (EF[i1,n]<>fc) and (PFace^[EF[i1,n]]<> NoCol) then
        begin PFace^[EF[i1,n]]:= NoCol;Result:=false;end;
    end
    else if (PFace^[fc]<NoCol) then
    begin
      for n:=0 to 1 do if PFace^[EF[i1,n]]>NoCol
        then begin PFace^[EF[i1,n]]:=ColorIndex(Ord(PFace^[EF[i1,n]])-7);Result:=false;end;
    end;
    //letzteres setzt ein OriCol auf NoCol, dass ist Ok

    freeCol:=0;//check how many facelets of the edge still are free
    for n:=0 to 1 do if PFace^[EF[i1,n]]=NoCol then Inc(freeCol);

    case freeCol of
    0:
      begin
        for j1:= UR to BR do
        begin
          for m:=0 to 1 do
          begin
            faceletMatch:=0;
            for n:=0 to 1 do
            begin
              if (PFace^[EF[i1,n]]=ECI[j1,(n+m) mod 2]) then Inc(faceletMatch);
              if (PFace^[EF[i1,n]]>NoCol)
               and (ColorIndex(Ord(PFace^[EF[i1,n]])-7)= ECI[j1,(n+m) mod 2])
               then Inc(faceletMatch);
            end;
            if faceletMatch=2 then break;
          end;
          if faceletMatch=2 then break;
        end;
        if faceletMatch<>2 then //clear the other facelets assuming something is wrong
        begin
          if not auto then
          begin
            for n:=0 to 1 do
              if (EF[i1,n]<>fc) and (PFace^[EF[i1,n]]<>noCol) then
               begin PFace^[EF[i1,n]]:= noCol;Result:=false;end;
          end
          else begin
            for n:=0 to 1 do if (EF[i1,n]=fc) and (PFace^[EF[i1,n]]<>noCol)
              then begin PFace^[EF[i1,n]]:= noCol;Result:=false;end;
          end
        end
        else//now check if there is not already another cubie like this one
        begin
          for k1:= UR to BR do
          begin
            if k1=i1 then continue;
            for m:=0 to 1 do
            begin
              faceletMatch:=0;
              for n:=0 to 1 do
              begin
              t:=-1;
              if (PFace^[EF[i1,n]]<>NoCol) and (PFace^[EF[i1,n]]<>OriCol) then
                t:=Ord(PFace^[EF[i1,n]])-Ord(PFace^[EF[k1,(n+m) mod 2]]);
              if (t=0) or (t=7) or (t=-7)  then Inc(faceletMatch);
                if faceletMatch=2 then break;
              end;
              if faceletMatch=2 then break;
            end;
            if faceletMatch=2 then break;
          end;
          if faceletMatch>1 then //clear the other cubie (manual mode)
          if not auto then
          begin
            for n:=0 to 1 do if PFace^[EF[k1,n]]<> noCol
              then begin PFace^[EF[k1,n]]:= noCol;Result:=false;end;
          end
          else
          begin
            for n:=0 to 1 do if (EF[i1,n]=fc) and (PFace^[EF[i1,n]]<>noCol)
              then begin PFace^[EF[i1,n]]:= noCol;Result:=false;end;
          end
        end;
      end;
    end;//case
  end;//Kanten untersuchen
  if auto and (fc < B9) then exit;//fc wird als letztes überprüft, wenn alle gecheckt werden


//  hier muss getestet werden, ob es eine valide Konstruktion ist!!!!

//1. es dürfen keine nicht vollständigen Ecken und Kanten übrigbleiben um weiterzumachen
   for k:= URF to DRB do
   begin
     m:=0;t:=0;
     for n:=0 to 2 do
     begin
       if (PFace^[CF[k,n]]=NoCol) then Inc(m)
       else if (PFace^[CF[k,n]]<>OriCol) then Inc(t)   //echte Farbe
     end;
     if (t>0) and (m>0) then exit;
   end;

   for k1:= UR to BR do
   begin
     m:=0;t:=0;
     for n:=0 to 1 do
     begin
       if (PFace^[EF[k1,n]]=NoCol) then Inc(m)
       else if (PFace^[EF[k1,n]]<>OriCol) then Inc(t)   //echte Farbe
     end;
     if (t>0) and (m>0) then exit;
   end;

    cCube:= CubieCube.Create(fCube);
    n:= cCube.CornOriMod3;  //check orientations of corners
    if n>0 then
    begin
       if not auto then Application.MessageBox(PChar(Err[1]),'Facelet Editor',MB_ICONWARNING);
      for m:= 1 to n do
      begin
        ci:=PFace^[CF[URF,0]];
        PFace^[CF[URF,0]]:=PFace^[CF[URF,1]];
        PFace^[CF[URF,1]]:=PFace^[CF[URF,2]];
        PFace^[CF[URF,2]]:=ci;
        Result:=false;
      end;
    end;
    n:= cCube.EdgeOriMod2;  //check orientations of edges
    if n=1 then
    begin
      if not auto then Application.MessageBox(PChar(Err[2]),'Facelet Editor',MB_ICONWARNING);
      ci:=PFace^[EF[UF,0]];
      PFace^[EF[UF,0]]:=PFace^[EF[UF,1]];
      PFace^[EF[UF,1]]:=ci;
      Result:=false;
    end;
    n:=0;
    for i:= URF to DRB do if cCube.PCorn^[i].c=NNN then Inc(n);
    if n>=2 then begin cCube.Free; exit end;//bei zwei freien Plätzen keine Parity Probleme
    n:=0;
    for i1:= UR to BR do if cCube.PEdge^[i1].e=NN then Inc(n);
    if n>=2 then begin cCube.Free; exit end;

    if (cCube.EdgeParityEven and not cCube.CornParityEven) or  //check parity
       (cCube.CornParityEven and not cCube.EdgeParityEven) then
    begin
      if not auto then Application.MessageBox(PChar(Err[3]),'Facelet Editor',MB_ICONWARNING);
      ci:=PFace^[EF[UF,0]];
      PFace^[EF[UF,0]]:=PFace^[EF[DF,0]];
      PFace^[EF[DF,0]]:=ci;
      ci:=PFace^[EF[UF,1]];
      PFace^[EF[UF,1]]:=PFace^[EF[DF,1]];
      PFace^[EF[DF,1]]:=ci;
      Result:=false;
    end;
    cCube.Free;
end;
//End facelet editor check for consistent coloring of cube each time facelet is set

//+++++color facelelet cube according to a cube on the cubie level++++++++++++++
procedure FaceletCube.SetFacelets(cCube: TObject);
var cc:CubieCube; i: Corner; j: Edge; n: Integer; k: TurnAxis;
begin
  cc:= cCube as CubieCube;
  for i:= URF to DRB do
  for n:= 0 to 2 do
   PFace^[CF[i,n]]:= CCI[cc.PCorn^[i].c,(n+3-cc.PCorn^[i].o) mod 3];
  for j:= UR to BR do
  for n:= 0 to 1 do PFace^[EF[j,n]]:= ECI[cc.PEdge^[j].e,(n+cc.PEdge^[j].o) mod 2];
  for k:= U to B do cenTwist[k]:= cc.PCent^[k].o;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++++++++++++++++sort of copy-constructor+++++++++++++++++++++++++++++++
constructor FaceletCube.Create(fc: FaceletCube; cvas:TCanvas;x,y,size:Integer;t:Integer);
var i:Face; j: TurnAxis;
begin
 Create(cvas);
 for i:=U1 to B9 do PFace^[i]:=fc.PFace^[i];
 for j:= U to B do  cenTwist[j]:=fc.cenTwist[j];
 self.size:=size;self.x:=x;self.y:=y;
 runOptimal:=fc.runOptimal;
 optManeuver:=fc.optManeuver;
 maneuver:=fc.maneuver;
 patName:=fc.patName;
 phase2Length:=fc.phase2Length;
 optLength:=fc.optLength;
 paintType:=t;
 isOriented:=fc.isOriented;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

constructor FaceletCube.Create(fc: FaceletCube; cvas:TCanvas;x,y,size:Integer;
            t:Integer;ctw:CenterTwist);
var i: TurnAxis;
begin
 Create(fc,cvas,x,y,size,t);
 isOriented:=true;
 for i:= U to B do  cenTwist[i]:=ctw[i];
end;



function FaceletCube.InverseManeuver: String;
var s:String;i,n:Integer;
begin
  n:=Length(maneuver);
  if n=0 then begin Result:='';exit;end;
  for i:=n downto 1 do
  begin
    case maneuver[i] of
      'U','R','F','D','L','B','M','E','S','x','y','z': s:=s+maneuver[i];
    else
      continue;
    end;
    if i=n then s:= s+''' '
    else
    begin
      case maneuver[i+1] of
        '3','''': s:=s+' ';
        '2': s:= s+'2 ';
      else
        s:=s+''' ';
      end;
    end;
  end;

  n:=Pos('(',maneuver);
  if n>0 then s:= s+' '+Copy(maneuver,n,Pos(')',maneuver)+1-n);
  Result:= s;
end;

function FaceletCube.InverseOptManeuver: String;
var s:String;i,n:Integer;
begin
  n:=Length(optManeuver);
  if n=0 then begin Result:='';exit;end;
  if Pos('Status',optManeuver)>0 then begin Result:=optManeuver;exit;end;
  for i:=n downto 1 do
  begin
    case optManeuver[i] of
      'U','R','F','D','L','B','M','E','S','x','y','z': s:=s+optManeuver[i];
    else
      continue;
    end;
    if i=n then s:= s+''' '
    else
    begin
      case optManeuver[i+1] of
        '3','''': s:=s+' ';
        '2': s:= s+'2 ';
      else
        s:=s+''' ';
      end;
    end;
  end;
  n:=Pos('(',optManeuver);
  if n>0 then s:= s+' '+Copy(optManeuver,n,Pos(')',optManeuver)+1-n);
  Result:=s;
end;
//++++++++++++End create facelet cube from maneuver string++++++++++++++++++++++

//+++++++++++++++++check if two faceletcubes are isomorohic+++++++++++++++++++++
//onlyCorners: Es werden nur die Ecken untersucht
//onlyNormal: Es werden nur die Symmetrien genommen, in deren Gruppe die ausgewählte Symmetriegruppe
//normal ist, d.h. x^-1Hx=H für alle in Frage kommenden Symmetrien x.
//alsoInverse führt die Untersuchung auch für inversen Cubes durch
function FaceletCube.IsIsomorphic(f: FaceletCube; onlyCorners, onlyNormal,alsoInverse:Boolean): Boolean;
var urf3,fx2,ux4,lr2,index:Integer; i:Face; isEqual:Boolean;
c: CubieCube; finv:FaceletCube;
k: TurnAxis;
ctTemp: CenterTwist;

label weiter,ende,ende2;
begin
   if isOriented xor f.isOriented then begin Result:=false; goto ende2; end;
   for i:=U1 to B9 do FaceOrig[i]:= PFace^[i];
   for k:= U to B do ctTemp[k]:= cenTwist[k];
   index:=0;
   for urf3:= 0 to 2 do //generate all 48 symmetries
   begin
     for fx2:= 0 to 1 do
     begin
       for ux4:= 0 to 3 do
       begin
         for lr2:= 0 to 1 do
         begin
           if onlyNormal and not Odd(curSymNormal shr index) then goto weiter;
           isEqual:=true;
           for i:=U1 to B9 do
           begin
             if onlyCorners then
              case i of
               U2,U4,U6,U8,R2,R4,R6,R8,F2,F4,F6,F8,D2,D4,D6,D8,L2,L4,L6,L8,B2,B4,B6,B8: continue;
              end;
              if PFace^[i]<>f.PFace^[i] then begin isEqual:=false;break;end;//nächste Symmetrie nehmen
           end;

           if isOriented
           then for k:=U to B do
             if cenTwist[k]<>f.cenTwist[k] then begin isEqual:=false;break;end;

           if isEqual  then begin Result:=true; goto ende;end;
 //          Result:=false; goto ende;//Patch, wenn nur Identische geprüft werden sollen
weiter:    Inc(index);
           Conjugate(S_LR2);
         end;
         Conjugate(S_U4);
       end;
       Conjugate(S_F2);
     end;
     Conjugate(S_URF3);
   end;
   Result:=false;
ende:
  for i:=U1 to B9 do PFace^[i]:=FaceOrig[i];//restore
  for k:= U to B do cenTwist[k]:=ctTemp[k];
  if alsoInverse and (Result=false) then //noch bzgl. der Inversen prüfen
  begin
    c:=CubieCube.Create(f);
    finv:=FaceletCube.Create(nil);
    CornInv(c.PCorn^,c.PCornTemp^);
    EdgeInv(c.PEdge^,c.PEdgeTemp^);
    CentInv(c.PCent^,c.PCentTemp^);
    c.cSwap:=c.PCorn;c.PCorn:=c.PCornTemp;c.PCornTemp:=c.cSwap;
    c.eSwap:=c.PEdge;c.PEdge:=c.PEdgeTemp;c.PEdgeTemp:=c.eSwap;
    c.cnSwap:=c.PCent;c.PCent:=c.PCentTemp;c.PCentTemp:=c.cnSwap;
    finv.SetFacelets(c);
    finv.isOriented:=f.isOriented;
    Result:=IsIsomorphic(finv,onlyCorners,onlyNormal,false);
    finv.Free;
    c.Free;
  end;
ende2:
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++check if corner twist are ok++++++++++++++++++++++++++
function FaceletCube.TwistOk: Boolean;
var ori,j: Integer; i:Corner;
begin
  ori:=0;
  for i:= URF to DRB do
    for j:= 0 to 2 do
      if (PFace^[CF[i,j]]=UCol) or (PFace^[CF[i,j]]=DCol)then
      begin ori:=ori+j;break;end;
  if ori mod 3 = 0 then Result:=true else Result:=false;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++++check if edge flip is ok++++++++++++++++++++++++++++
function FaceletCube.FlipOk: Boolean;
var ori: Integer; i:Edge;
begin
  ori:=0;
  for i:=UR to BR do
  begin
    if (PFace^[EF[i,0]]=UCol) or (PFace^[EF[i,0]]=DCol)then continue
    else if (PFace^[EF[i,1]]=UCol) or (PFace^[EF[i,1]]=DCol)then Inc(ori)
    else if (PFace^[EF[i,1]]=FCol) or (PFace^[EF[i,1]]=BCol)then Inc(ori);
  end;
  if ori mod 2 = 0 then Result:=true else Result:=false;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

function ToRyanHeise(man:String): String;
var s: String; i:Integer;
begin
  man:=man+'   ';
  for i:=1 to length(man)-3 do
  case man[i] of
  'U': if man[i+1]=' ' then s:=s+'j' else if man[i+1]='2' then s:=s+'jj' else s:=s+'f';
  'R': if man[i+1]=' ' then s:=s+'i' else if man[i+1]='2' then s:=s+'ii' else s:=s+'k';
  'F': if man[i+1]=' ' then s:=s+'h' else if man[i+1]='2' then s:=s+'hh' else s:=s+'g';
  'D': if man[i+1]=' ' then s:=s+'s' else if man[i+1]='2' then s:=s+'ss' else s:=s+'l';
  'L': if man[i+1]=' ' then s:=s+'d' else if man[i+1]='2' then s:=s+'dd' else s:=s+'e';
  'B': if man[i+1]=' ' then s:=s+'w' else if man[i+1]='2' then s:=s+'ww' else s:=s+'o';
  end;
  man:=s;
  Result:= s;
end;




end.



