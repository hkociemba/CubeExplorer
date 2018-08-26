unit Symmetries;

interface
uses CubeDefs;
//+++++++++corner and edge permutations/orientations of the 48 symmetries+++++++
var CornSym: array [SymIdx] of CornerCubie;
    EdgeSym: array [SymIdx] of EdgeCubie;
    CentSym: array [SymIdx] of CenterCubie;

//++++++++++++++++++S(Idx)*S(InvIdx[Idx])= ID+++++++++++++++++++++++++++++++++++
    InvIdx: array [SymIdx] of SymIdx;

//++++++++++++++Group table for the symmetries++++++++++++++++++++++++++++++++++
    SymMult: array[SymIdx,SymIdx] of SymIdx;

//+++++++++++conjugation S(SymIdx]*M*S(SymIdx)^-1+++++++++++++++++++++++++++++++
    SymMove: array[SymIdx,Move] of Move;

procedure CreateSymmetryTables;
function MT(m:String;sym:Symmetry):String;

implementation
uses CubiCube,SysUtils,RubikMain;

//++++++++++++++++inititalize arrays CornSym and EdgeSym++++++++++++++++++++++++
procedure CreateSymmetries;
var cCube: CubieCube; i: Corner; e: Edge; cn: TurnAxis; index,urf3,f2,u4,lr2,j,k: Integer;
    c:CornerCubie;
begin
   cCube:= CubieCube.Create;
   index:=0;
   for urf3:= 0 to 2 do //generate all 48 symmetries
   begin
     for f2:= 0 to 1 do
     begin
       for u4:= 0 to 3 do
       begin
         for lr2:= 0 to 1 do
         begin
           for i:=URF to DRB do
           begin
             CornSym[index,i].c:=cCube.PCorn^[i].c;
             CornSym[index,i].o:=cCube.PCorn^[i].o;
           end;
           for e:=UR to BR do
           begin
             EdgeSym[index,e].e:=cCube.PEdge^[e].e;
             EdgeSym[index,e].o:=cCube.PEdge^[e].o;
           end;
           for cn:=U to B do
           begin
             CentSym[index,cn].c :=cCube.PCent^[cn].c;
             CentSym[index,cn].o :=cCube.PCent^[cn].o;
           end;
           inc(index);
           cCube.SymMult(S_LR2);
         end;
         cCube.SymMult(S_U4);
       end;
       cCube.SymMult(S_F2);
     end;
     cCube.SymMult(S_URF3);
   end;
   //now find the inverse symmetries
   for j:=0 to 47 do
   for k:= 0 to 47 do
   begin
     CornMult(CornSym[j],CornSym[k],c);
     if (c[URF].c=URF) and (c[UFL].c=UFL) and (c[ULB].c=ULB) then
     begin InvIdx[j]:=k; break; end;
   end;
   cCube.Free;
end;
//++++++++++++End inititalize arrays CornSym and EdgeSym++++++++++++++++++++++++

//++++++++++++++++++++++++++++Initialize array SymMult++++++++++++++++++++++++++
procedure CreateSymmetryGroupTable;
var i,j,k: SymIdx; corn:CornerCubie;
begin
  for i:= 0 to 47 do
  for j:= 0 to 47 do
  begin
    CornMult(CornSym[i],CornSym[j],corn);
    for k:= 0 to 47 do
    begin
      if (CornSym[k,URF].c=corn[URF].c)  and (CornSym[k,UFL].c=corn[UFL].c)
          and (CornSym[k,ULB].c=corn[ULB].c)  then
      begin
        SymMult[i,j]:=k;
        break;
      end;
    end;
  end;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++++++++Check if if corners are in their place+++++++++++++++++++++++++
function IsCornID(cc:CubieCube): Boolean;
var i: Corner;
begin
  Result:=True;
  for i:=URF to DRB do
  if (cc.PCorn^[i].c<>i) or (cc.PCorn^[i].o<>0) then
  begin
    Result:=False;
    break;
  end;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++create images of the moves by conjugation with symmetries++++++++++++
procedure CreateSymMoveTable;
var c1,c2: CubieCube;prod: CornerCubie;j,m: TurnAxis;k,n: Integer;s: SymIdx;
begin
  c1:= CubieCube.Create;
  c2:= CubieCube.Create;
  for j:= U to Fs do
  begin
    for k:= 0 to 3 do
    begin
      c1.Move(j);
      if k<>3 then
      begin
        for s:= 0 to 47 do
        begin
          CornMult(CornSym[s],c1.PCorn^,prod);//conjugate
          CornMult(prod,CornSym[InvIdx[s]],c2.PCorn^);
          for m:= U to Fs do//find the move
          begin
            for n:= 0 to 3 do
            begin
              c2.Move(m);
              if n<>3 then if IsCornID(c2) then
              begin
                SymMove[s,Move(3*Ord(j)+k)]:=Move(3*Ord(m)+(2-n));
              end;
            end;
          end;


        end;
      end;
    end;
  end;
  c1.Free;
  c2.Free;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
procedure CreateSymmetryTables;
begin
  CreateSymmetries;
  CreateSymmetryGroupTable;
  CreateSymMoveTable;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++Transform maneuver strings according to symmetry conjugation+++++++++
function MT(m:String;sym:Symmetry):String;
var t: array[' '..'z'] of Char;s,r:String;
    mv:set of 'B'..'z';i,n:Integer;
    foundMove: Boolean;
//Kleinbuchstaben e,m,a symbolisieren  inverse Richtungen von E,M,S, a statt s wg. z.B. (17s)
//Groﬂbuchstaben X,Y,Z symbolisieren  inverse Richtungen von x,y,z
begin

  s:=m;
  mv:=['U','R','F','D','L','B','E','M','S','e','m','a','x','y','z','X','Y','Z'];
  case sym of
  S_URF3:
  begin
   t['U']:='R';t['R']:='F';t['F']:='U';t['D']:='L';t['L']:='B';t['B']:='D';
   t['E']:='M';t['M']:='a';t['S']:='e'; t['x']:='z';t['z']:='y';t['y']:='x';
  end;
  S_F2:
  begin
   t['U']:='D';t['D']:='U';t['R']:='L';t['L']:='R';t['F']:='F';t['B']:='B';
   t['E']:='e';t['M']:='m';t['S']:='S'; t['x']:='X';t['y']:='Y';t['z']:='z';
  end;
  S_U4:
  begin
   t['U']:='U';t['D']:='D';t['R']:='F';t['F']:='L';t['L']:='B';t['B']:='R';
   t['E']:='E';t['M']:='a';t['S']:='M';t['x']:='z';t['y']:='y';t['z']:='X';
  end;
  S_R4:
  begin
    t['U']:='B';t['B']:='D';t['D']:='F';t['F']:='U';t['R']:='R';t['L']:='L';
    t['E']:='S';t['M']:='M';t['S']:='e'; t['x']:='x';t['y']:='Z';t['z']:='y';
  end;
  S_F4:
  begin
    t['U']:='R';t['R']:='D';t['D']:='L';t['L']:='U';t['F']:='F';t['B']:='B';
    t['E']:='M';t['M']:='e';t['S']:='S';t['x']:='Y';t['y']:='x';t['z']:='z';
  end;
  S_LR2: //Ergebnis wird noch invertiert!
  begin
    t['U']:='U';t['D']:='D';t['R']:='L';t['L']:='R';t['F']:='F';t['B']:='B';
    t['E']:='E';t['M']:='m';t['S']:='S'; t['x']:='X';t['y']:='y';t['z']:='z';
  end;
  end;
  for i:=1 to Length(m) do //alle Achsen transformieren
    if (m[i] in mv) and (m[i]<>manSep) then s[i]:=t[m[i]] else s[i]:=m[i];

  s:=s+' ';r:='';

  if sym=S_LR2 then //change the move directions
  begin
    n:=Length(s);
    foundMove:=false;
    i:=1;
    while (i<=n) do
    begin
      case s[i] of
        'U','R','F','D','L','B','E','M','S','x','y','z','e','m','a','X','Y','Z':
         foundMove:=true;
      end;
      r:=r+s[i];
      if (foundMove) then
      begin
        case s[i+1] of
           '3','''': begin r:=r+'';Inc(i) end;
           '2': begin r:= r+'2'; Inc(i) end;
        else
           r:=r+'''';
        end;
        foundMove:=false;
      end;
      Inc(i);
    end;
    s:=r;
  end;

   r:=''; //jetzt wieder E,M,X,x,y,z substituieren
   n:=Length(s);
   foundMove:=false;
   i:=1;
   while (i<=n) do
   begin
     case s[i] of
        'e','m': begin r:=r+UpperCase(s[i]);foundMove:=true; end;
        'a':     begin r:=r+'S';foundMove:=true; end;
        'X','Y','Z': begin r:=r+LowerCase(s[i]);foundMove:=true; end;
     else
        r:=r+s[i];
     end;
     if (foundMove) then
     begin
       case s[i+1] of
          '3','''': begin r:=r+'';Inc(i) end;
          '2': begin r:= r+'2'; Inc(i) end;
       else
          r:=r+'''';
       end;
       foundMove:=false;
     end;
     Inc(i);
   end;
   Result:= trim(r);
end;
//+++++End Transform maneuver strings according to symmetry conjugation+++++++++

end.
