unit MathFuncs;

interface

function Cnk(n,k:Integer):Integer;
procedure RGBToHSV(r,g,b:Integer;var h,s,v:Integer);
function distance(h1,s1,v1,h2,s2,v2:Integer;cpWhite:Real):Integer;
function dist(a,b:Integer):Integer;
procedure BubbleSort(var A: array of Integer);

implementation

uses Math;
//+++++++++++++++++n choose k+++++++++++++++++++++++++++++++++++++++++++++++++++
function Cnk(n,k:Integer): Integer;
var s,j: Integer;
begin
  if n<k then Result:=0
  else
  begin
    s:=1;
    if (k>n div 2) then k:= n-k;
    for j:=1 to k do
    begin
      s:= (s*n) div j;
      n:=n-1;
    end;
    Result:= s;
  end;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++++++++++Conversion as done in Colour-Choose-Dialog+++++++++++++++++++
procedure RGBToHSV(r,g,b:Integer;var h,s,v:Integer);
var mn,mx,delta,maxVal: Integer;
    hr,sr,vr: real;
begin
  mn:= r;mx:= r;maxVal:= 0;
  if g > mx then begin mx:= g; maxVal:= 1 end;
  if b > mx then begin mx:= b; maxVal:= 2 end;
  if g < mn then mn:=g;
  if b < mn then mn:=b;

  delta:= mx - mn;
  if delta=0 then hr:=0
  else
  case maxVal of
    0: hr:= (g - b)/delta;     // yel < h < mag
    1: hr:= (b - r)/delta + 2; // cyan < h < yel
    2: hr:= (r - g)/delta + 4     // mag < h < cyan
  end;
  h:= Round(hr*40);
  if h<0 then h:= h + 240;
  if h>=240 then h:=h-240;
  vr:= (mx + mn)/2;
  v:=Round(vr*240/255);
  if mx=0 then sr:=0
  else sr:=(mx-mn)/(mx+mn);
  s:=Round(sr*240);

end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




function distance(h1,s1,v1,h2,s2,v2:Integer;cpWhite:Real):Integer;
begin
  Result:=dist(h1,h2);
end;

function dist(a,b:Integer):Integer;
begin
 if a<b then Result:= min(b-a,a+240-b) else Result:=  min(a-b,b+240-a);
end;

procedure BubbleSort(var A: array of Integer);
var
  I, J, T: Integer;
begin
  for I := High(A) downto Low(A) do
    for J := Low(A) to High(A) - 1 do
      if A[J] > A[J + 1] then
      begin
        T := A[J];
        A[J] := A[J + 1];
        A[J + 1] := T;
      end;
end;




end.
