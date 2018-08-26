unit PatternSearch;

interface

uses
  Classes,CubeDefs,Forms,FaceCube;
//++++++++++++++++array for the patterns++++++++++++++++++++++++++++++++++++++++
type PatArray = array [1..5,1..8] of SingleFace;
type
//+++++++++++++Thread Class to do the Pattern Search++++++++++++++++++++++++++++
  PatSearch = class(TThread)
  private
    { Private-Deklarationen }
  protected
    procedure FindPatterns;
    procedure Execute; override;
    procedure SetCorners(curPlace:Corner);
    procedure SetEdges(curPlace:Edge);
    procedure CubeAdd;
  public
    constructor Create;
  end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
var fcc:faceletCube;

implementation
uses RubikMain,CubiCube;

   var p: PatArray;
   cornerUsed: array[URF..DRB] of boolean;
   edgeUsed: array[UR..BR] of boolean;

//+++++++++++Add a found cube to the Main Window++++++++++++++++++++++++++++++++

constructor PatSearch.Create;
begin
  inherited Create(true);
  FreeOnTerminate:=true;
  Priority := tpLower;
end;

procedure PatSearch.CubeAdd;
begin
  Form1.AddCube(fcc,false,Form1.FindGenerators.Checked,false,0,false);
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
procedure PatSearch.Execute;
begin
  FindPatterns;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++rotate a pattern by 90 degrees+++++++++++++++++++++++++++++++++++++++++++
procedure RotateSingleFace(var f0,f1:SingleFace);
begin
  f1[9]:=f0[3];f1[3]:=f0[1];f1[1]:=f0[7];f1[7]:=f0[9];
  f1[8]:=f0[6];f1[6]:=f0[2];f1[2]:=f0[4];f1[4]:=f0[8];
  f1[5]:=f0[5];
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++reflection of pattern+++++++++++++++++++++++++++++++++++++++++++++++
procedure ReflectSingleFace(var f0,f1:SingleFace);
begin
  f1[1]:=f0[3];f1[3]:=f0[1];
  f1[4]:=f0[6];f1[6]:=f0[4];
  f1[7]:=f0[9];f1[9]:=f0[7];
  f1[2]:=f0[2];f1[5]:=f0[5];f1[8]:=f0[8];
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++Find the patterns+++++++++++++++++++++++++++++++++++++++++++
procedure PatSearch.FindPatterns;
var i,j:Integer; c:Corner; e:Edge; emptyPat:boolean;

begin
 for i:= 1 to 5 do
 begin
   for j:= 1 to 9 do p[i,1,j]:= ColorIndex(Square[i,j].Tag);
   RotateSingleFace(p[i,1],p[i,2]); //generate all possible isomorphic patterns
   RotateSingleFace(p[i,2],p[i,3]); //by rotating and reflecting the original
   RotateSingleFace(p[i,3],p[i,4]);
   ReflectSingleFace(p[i,1],p[i,5]);
   ReflectSingleFace(p[i,2],p[i,6]);
   ReflectSingleFace(p[i,3],p[i,7]);
   ReflectSingleFace(p[i,4],p[i,8]);
 end;
  fcc:=FaceletCube.create(nil);
  fcc.Empty;
  for c:= URF to DRB do cornerUsed[c]:=false;
  for e:= UR to BR do edgeUsed[e]:=false;
  for i:= 1 to 5 do
  begin
    emptyPat:=true;
    for j:=1 to 9 do if p[i,1,j]<>NoCol then emptyPat:=false;
    if emptyPat=true then ACheckBox[i].Checked:=false;
  end;
  setCorners(URF);//we start with URF, rest is done recursive
end;
//++++++++++++++++++Find the patterns+++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++Check if the corners of faces a and b match+++++++++++++++++++++
//+++++++++++a must be complete, b may be partially incomplete (col=noCol)++++++
function CornerMatch(a,b:singleFace):Boolean;
var i: Integer;tab,tba: array[UCol..NoCol] of ColorIndex;
begin
  Result:=true;
  i:=1;
  while i<=9 do
  begin
    if b[i]<>noCol then begin tba[b[i]]:=a[i];tab[a[i]]:=b[i] end;
    i:=i+2;
  end;
  i:=1;
  while i<=9 do
  begin
    if (b[i]<>noCol) and ((tba[b[i]]<>a[i]) or (tab[a[i]]<>b[i])) then Result:=false;
    i:=i+2;
  end;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++Return true, if corner does not fit to pattern++++++++++++++++++++++++++++
function CornerNotOk(c:Corner):Boolean;
var i,j,k:Integer; dir: TurnAxis; a:SingleFace;
    x:Face; match: Boolean;
label xxx;
begin
  x:=U1;//any value
  Result:=false;
  for i:= 0 to 2 do
  begin
    dir:=TurnAxis(CCI[c,i]);//directions to check
    case dir of
      U: x:=U1;
      R: x:=R1;
      F: x:=F1;
      D: x:=D1;
      L: x:=L1;
      B: x:=B1;
    end;
    j:=1;
    while true do
    begin a[j]:=fcc.PFace^[x];if j=9 then break; Inc(x);Inc(x);Inc(j);Inc(j);end;
    match:=false;
    for j:= 1 to 5 do
      if CheckBox[dir,j].Checked then
        for k:= 1 to 8 do if CornerMatch(p[j,k],a) then begin match:=true;goto xxx;end;
xxx:
    if match=false then begin Result:= true;break; end;
  end;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++++++++recursive procedure to set the corners+++++++++++++++++++++++++
procedure PatSearch.SetCorners(curPlace: Corner);
var c: Corner; i,j: Integer;
begin
  if terminated then exit;
  for c:= URF to DRB do
  begin
    if cornerUsed[c] then continue else cornerUsed[c]:=true;
    for i:= 0 to 2 do
    begin
      for j:= 0 to 2 do fcc.PFace^[CF[curPlace,(j+i) mod 3]]:=CCI[c,j];
      if cornerNotOk(curPlace) then continue;
      if curPlace=DRB then
      begin
       if not fcc.TwistOk then continue; /////////////////////////////////////////////////////////////////////////


      // if  fcc.TwistOk then continue;//das ist falsch//////////////////////////////////////////////////////////


       setEdges(UR);
      end //kanten setzen
      else setCorners(Succ(curPlace));//recursion
    end;
    cornerUsed[c]:=false;
    for j:= 0 to 2 do fcc.PFace^[CF[curPlace,j]]:=NoCol;//restore
  end;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++Check if the edges of faces a and b match+++++++++++++++++++++++
//+++++++++++a must be complete, b may be partially incomplete (col=noCol)++++++
function EdgeMatch(a,b:singleFace):Boolean;
var i: Integer;tab,tba: array[UCol..NoCol] of ColorIndex;
begin
  Result:=true;

  for i:=1 to 9 do if b[i]<>noCol then begin tba[b[i]]:=a[i];tab[a[i]]:=b[i] end;
  for i:= 1 to 9 do
    if (b[i]<>noCol) and ((tba[b[i]]<>a[i]) or (tab[a[i]]<>b[i])) then Result:=false;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++return true if edge does not fit++++++++++++++++++++++++++++++++++++++++
function EdgeNotOk(e:Edge):Boolean;
var i,j,k:Integer; dir: TurnAxis; a:SingleFace;
    x:Face; match: Boolean;
label xxx;
begin
  x:=U1;
  Result:=false;
  for i:= 0 to 1 do
  begin
    dir:=TurnAxis(ECI[e,i]);//directions to check
    case dir of
      U: x:=U1;
      R: x:=R1;
      F: x:=F1;
      D: x:=D1;
      L: x:=L1;
      B: x:=B1;
    end;
    j:=1;
    while true do
    begin a[j]:=fcc.PFace^[x];If j=9 then break;;Inc(j);Inc(x);end;
    match:=false;
    for j:= 1 to 5 do
      if CheckBox[dir,j].Checked then
        for k:= 1 to 8 do if EdgeMatch(p[j,k],a) then begin match:=true;goto xxx;end;
xxx:
    if match=false then begin Result:= true;break; end;
  end;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++Check if pattern is continuous++++++++++++++++++++++++++++++++
function IsContinuous(e:Edge):Boolean;//does the pattern mach along the edge?
var c:Corner;i,j:Integer;ci:colorIndex;ef0,ef1,cf0,cf1:Face;
begin
  Result:=true;
  for i:=0 to 1 do
  begin
    c:=EN[e,i];//edgeNeighbour
    ci:=ECI[e,0];//colorIndex of first face of the edge
    j:=0;
    while ci<>CCI[c,j] do Inc(j);//find face of corner with the same colorIndex
    ef0:=EF[e,0];cf0:=CF[c,j];

    ci:=ECI[e,1];//colorIndex of second face of the edge
    j:=0;
    while ci<>CCI[c,j] do Inc(j);
    ef1:=EF[e,1];cf1:=CF[c,j];

    if (fcc.PFace^[ef0]=fcc.Pface^[cf0]) <> (fcc.PFace^[ef1]=fcc.Pface^[cf1])
        then begin Result:=false;break;end;
  end;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++++++++++set the edges recursively++++++++++++++++++++++++++++++++++++
procedure PatSearch.SetEdges(curPlace: Edge);
var cCube:CubieCube;
var e: Edge;i,j: Integer;parityWrong:boolean;
begin
  if terminated then exit;
  for e:=UR to BR do
  begin
    if edgeUsed[e] then continue else edgeUsed[e]:=true;
    for i:=0 to 1 do
    begin
       for j:= 0 to 1 do fcc.PFace^[EF[curPlace,(j+i) mod 2]]:=ECI[e,j];
       if edgeNotOk(curPlace) then continue;
       if Form1.CheckBoxContinuous.Checked and not IsContinuous(curPlace) then continue;
       if curPlace=BR then
       begin
       if not fcc.FlipOk then continue;////////////////////////////////////////////////////////////////

       //if fcc.FlipOk then continue;//das ist falsch//////////////////////////////////////////////////


         cCube:= CubieCube.Create(fcc);
         parityWrong:=(cCube.EdgeParityEven and not cCube.CornParityEven) or
         (cCube.CornParityEven and not cCube.EdgeParityEven);
         cCube.Free;
         if parityWrong then continue;


      //  if not parityWrong then continue; //das ist falsch//////////////////////////////////////////////////


         Synchronize(CubeAdd);
       end
       else setEdges(Succ(curPlace));
     end;
     edgeUsed[e]:=false;
     for j:= 0 to 1 do fcc.PFace^[EF[curPlace,j]]:=NoCol;//restore
  end;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

end.
