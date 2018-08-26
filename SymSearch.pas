unit SymSearch;


interface
uses
  Classes,CubeDefs,Forms,FaceCube;


type
//+++++++++++++Thread Class to do the Pattern Search++++++++++++++++++++++++++++
  SySearch = class(TThread)
  private
    { Private-Deklarationen }
  protected
    procedure FindPatterns;
    procedure Execute; override;
    procedure SetCorners(curPlace:Corner);
    procedure SetEdges(curPlace:Edge);
    procedure CubeAdd;
    procedure CheckIsoCorner;
    procedure CheckIso;
    procedure Update;
  public
    checkIsoResult,checkIsoCornerResult:Boolean;
    constructor Create;
  end;

var fc: FaceletCube;

const symInfo1 : array[0..32] of String =
   ('4','4','4','16','24','48','72','128','432','512','512','1024','1536',
   '2048','3072','7776','12288','65536','98304','98304','98304','147,456',
   '294,912','442,368','589,824','1,179,648','3,779,136','424,673,280','2,548,039,680',
   '15,288,238,080','18,345,885,696','45,864,714,240','4.3252*10^19');
   symInfo2:  array[0..32] of String =
   ('48','24','24','12','24','6','12','16','6','8','8','8','8',
   '8','8','6','8','4','4','4','4','4','4','4','4','4','3','2','2','2',
   '2','2','1');
   invOri: array[0..5] of Integer = (0,2,1,3,4,5);

implementation

uses RubikMain, Symmetries;//,FaceCube;

var  cornerUsed: array[URF..DRB] of boolean;
     edgeUsed: array[UR..BR] of boolean;
     cc,csave1,csave2:CornerCubie;
     ec,esave1,esave2:EdgeCubie;
//     fc: FaceletCube;
     alCol,maxcol: Integer;
     paintType:Integer;
     startIndexforIsoCornerCheck:Integer;
     cornerStart: array[0..2000] of Integer;//array zum Speichern des Beginnes der verschiedenen
     //Startindidizes für die Äquivalenzklassen der Eckkonfigurationen
     maxCornArrIdx: Integer; //Zeiger für den größten Eintrag in den array

constructor SySearch.Create;
begin
  inherited Create(true);
  FreeOnTerminate:=true;
  Priority := tpLower;
end;

procedure SySearch.Update;
begin
  Application.ProcessMessages;
end;

procedure SySearch.CubeAdd;
begin
  Form1.AddCube(fc,false,Form1.SymFindGenerators.Checked,false,paintType,false);
end;

procedure SySearch.CheckIsoCorner;//Methode, um nur Isomorphie der Ecken bezgl. Normalgruppe zu prüfen
var i,mx: Integer;
begin
  checkIsoCornerResult:= false;
  if cornerStart[maxCornArrIdx]=-1 then mx:=maxCornArrIdx-1 else mx:= maxCornArrIdx;
  for i:=0 to mx do
  if fc.IsIsomorphic(RubikMain.fc[cornerStart[i]],true,true,Form1.IsoInvInclude.Checked) then //es reicht, mit einem Würfel pro Eckkonf. zu vergleichen
  begin
    checkIsoCornerResult:=true;
    break;
  end;
end;

procedure SySearch.CheckIso;//Methode, um volle Isomorphie zu prüfen
var i,j,mx,mx0: Integer;
begin
  checkIsoResult:= false;
  if cornerStart[maxCornArrIdx]=-1 then mx0:=maxCornArrIdx-1 else mx0:= maxCornArrIdx;
  for i:= 0 to mx0 do
  begin
    if fc.IsIsomorphic(RubikMain.fc[cornerStart[i]],true,false,Form1.IsoInvInclude.Checked) then //volle EckIsomorphie prüfen
    begin
      if i=mx0 then mx:= fcN-1 else mx:=cornerStart[i+1]-1;
      for j:=cornerStart[i] to mx do
      begin
        if fc.IsIsomorphic(RubikMain.fc[j],false,false,Form1.IsoInvInclude.Checked) then
        begin
          checkIsoResult:=true;
          break;
        end;
      end;
    end;
    if checkIsoResult= true then break;
  end;
end;



procedure SySearch.Execute;
begin
 startIndexforIsoCornerCheck:=fcN;
  FindPatterns;
end;

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

    if (fc.PFace^[ef0]=fc.Pface^[cf0]) <> (fc.PFace^[ef1]=fc.Pface^[cf1])
        then begin Result:=false;break;end;
  end;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


function HasCorrectColourNumber(exact:Boolean):Boolean;
var cn: array[TurnAxis,UCol..BCol] of Integer;
    s: Integer;
    t:TurnAxis; ci: ColorIndex;
    c: Corner;
    e: Edge;
    isOk: Boolean;
begin
  for t:= U to B do
  for ci:= UCol to BCol do
    cn[t,ci]:=0;
  cn[U,UCol]:=1;cn[R,RCol]:=1;cn[F,FCol]:=1;
  cn[D,DCol]:=1;cn[L,LCol]:=1;cn[B,BCol]:=1;

  for c:= URF to DRB do if cc[c].c<>NNN then
  begin
    for s:= 0 to 2 do
      cn[CA[c,s],CCI[cc[c].c,(s+3-cc[c].o) mod 3]]:=1;
  end;
  for e:= UR to BR do if ec[e].e<>NN then
  begin
    for s:= 0 to 1 do
      cn[EA[e,s],ECI[ec[e].e,(s+ec[e].o) mod 2]]:=1;
  end;
  isOk:= true;
  for t:= U to B do
  begin
    s:=0;
    for ci:= UCol to BCol do s:=s+cn[t,ci];//Anzahl der Farben addieren
    if not exact then begin if s > maxcol then isOK:= false end
    else if not odd(alcol shr s) then isOK:= false
  end;
  if isOK then Result:= true else Result:=false;
end;

function addCOris(oriA,oriB:ShortInt): ShortInt;
var ori:ShortInt;
begin
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
    Result:=ori;
end;


procedure SySearch.FindPatterns;
var c: Corner; e: Edge; i: Integer;
begin
  for c:=URF to DRB do begin cc[c].c:=NNN;cc[c].o:=0; end;
  for e:= UR to BR  do begin ec[e].e:=NN;ec[e].o:=0; end;
  for c:= URF to DRB do cornerUsed[c]:=false;
  for e:= UR to BR do edgeUsed[e]:=false;
  fc:=FaceletCube.create(nil);fc.Empty;
  if Form1.RBAll.Checked or Form1.RBCornersE.Checked
   or Form1.RBEdgesE.Checked then paintType:=0
  else if Form1.RBCornersO.Checked then paintType:=1
  else if Form1.RBEdgesO.Checked then paintType:=2;
  alCol:=1;
  if Form1.CBn1.Checked then begin alCol:=alCol+2; maxCol:=1 end;
  if Form1.CBn2.Checked then begin alCol:=alCol+4; maxCol:=2 end;
  if Form1.CBn3.Checked then begin alCol:=alCol+8; maxCol:=3 end;
  if Form1.CBn4.Checked then begin alCol:=alCol+16; maxCol:=4 end;
  if Form1.CBn5.Checked then begin alCol:=alCol+32;maxCol:=5 end;
  if Form1.CBn6.Checked then begin alCol:=alCol+64;maxCol:=6 end;

  if alCol=1 then //no Button checked
  begin
    Form1.CBn1.Checked:=true;
    alCol:=3;
    maxCol:=1;
  end;
  maxCornArrIdx:=0;
  for i:=0 to 1999 do cornerStart[i]:=-1;//array initialisieren
  SetCorners(URF);
end;



procedure SySearch.SetCorners(curPlace: Corner);
var c,c1,c2,c3,cPlace,cCubie: Corner; i,j,s: Integer;
    setBySymmetry: array[URF..DRB] of boolean;
    o1,o2,otest: ShortInt;
    symSetOk: Boolean;
Label conti,conti1;
begin

  if terminated then exit;
  for c1:= URF to DRB do setBySymmetry[c1]:=false;//dies sollte sonst nicht mehr nötig sein


//  begin //RBASym is checked
    for c:= URF to DRB do //durch alle unbenutzten Ecken iterieren
    begin
      if (Form1.RBEdgesE.Checked or Form1.RBEdgesO.Checked) then
        if curplace<>c then continue;//nur Ecken permutieren
      if cornerUsed[c] then continue else cornerUsed[c]:=true;
      cc[curPlace].c:=c;//Platz besetzen
      for i:= 0 to 2 do //alle Orientierungen testen
      begin
        if (Form1.RBEdgesE.Checked or Form1.RBEdgesO.Checked) then if i>0 then break;
        cc[curPlace].o:=i;
        symSetOk:=true;
        for j:=0 to 47 do
        begin
   //       if curSym[j]=1 then //Point Group G hat diese Symmetrie


        //Im Falle der Symmetrie gilt
        //B:= cc, A ist die Symmetrie
        //A B A^-1 = B, wir nehmen speziell A(curPlace).c als Element

        // A B A^-1 (A(curPlace).c).c = (A B)(A^-1(A(curPlace).c).c).c
        // = (A B)(curPlace).c  = A(B(curPlace).c).c
        //also B(A(curPlace).c).c = A(B(curPlace).c).c

        //  A B A^-1 (A(curPlace).c).o =
        // (A B)(A^-1(A(curPlace).c).c).o + A^-1(A(curPlace).c).o
        // = (A B)(curPlace).o  + A^-1(A(curPlace).c).o
        // = A(B(curPlace).c).o + B(curPlace).o    + A^-1(A(curPlace).c).o
        // also  B(A(curPlace).c).o = .....


        //Im Falle der "Anti-Symmetrie" gilt
        //A B^-1 A^-1 = B, wir nehmen speziell AB(curPlace).c als Element

        //A B^-1 A^-1 (AB(curPlace).c).c= A B^-1 A^-1 (A(B(curPlace).c).c).c
        //= A(curPlace).c
        //also B(AB(curPlace).c).c = A(curPlace).c

        //A B^-1 A^-1 (AB(curPlace).c).o =

        //A B^-1 A^-1 (AB(curPlace).c).o =  A B^-1 (A^-1 (AB(curPlace).c).c).o  + A^-1 (AB(curPlace).c).o
        // = A B^-1 (A^-1[A[B(curPlace).c].c].c).o + A^-1 (AB(curPlace).c).o
        // = A B^-1 (B(curPlace).c).o + A^-1 (AB(curPlace).c).o
        //= A(B^-1 (B(curPlace).c).c).o + B^-1(B(curPlace).c).o  + A^-1 (AB(curPlace).c).o
        //= A(curPlace).o +  B^-1(B(curPlace).c).o  + A^-1 (AB(curPlace).c).o
        //= A(curPlace).o +  B^-1(B(curPlace).c).o     + A^-1 (A(B(curPlace).c).c).o ,
        //also B(AB(curPlace).c).o= .....

        //für die inversen Orientierungen gilt:
        // B^-1B= ID gilt B^-1B(x).o = 0 = B^-1(B(x).c).0 +B(x).o
        //Kanten: B(x).o/B^-1B(x).o = 0/0, 1/1
        //Bei Ecken 0/0 1/2 2/1 3/3 4/4 5/5

            if Odd(curAsym shr j) then//AntiSymmetrie geht vor wegen selbstinvers
            begin
 //             cPlace:=CornSym[j][curPlace].c;//A(curPlace).c
 //             cCubie:=CornSym[j][cc[curPlace].c].c;//A(B(curPlace).c).c
              cPlace:=cornSym[j][cc[curPlace].c].c;// AB(curPlace).c
              cCubie:=CornSym[j][curPlace].c;//A(curPlace).c
            end
            else if curSym[j]=1  then
            begin //Symmetrie //Antisymmetrie aus Komplement zu H
 //             cPlace:=cornSym[j][cc[curPlace].c].c;// AB(curPlace).c
 //             cCubie:=CornSym[j][curPlace].c;//A(curPlace).c
              cPlace:=CornSym[j][curPlace].c;//A(curPlace).c
              cCubie:=CornSym[j][cc[curPlace].c].c;//A(B(curPlace).c).c
            end;

            if Odd(curAsym shr j) then //aus G\H
            begin
//              o1:= addCOris(CornSym[j][cc[curPlace].c].o,cc[curPlace].o);
//              o2:= CornSym[InvIdx[j]][cPlace].o;
//              otest:= addCOris(o1,o2);
              o1:= addCOris(CornSym[j][curPlace].o,invOri[cc[curPlace].o]);
              o2:= CornSym[InvIdx[j]][cPlace].o;
              otest:= addCOris(o1,o2);
            end
            else if curSym[j]=1 then//H
            begin
//              o1:= addCOris(CornSym[j][curPlace].o,invOri[cc[curPlace].o]);
//              o2:= CornSym[InvIdx[j]][cPlace].o;
//              otest:= addCOris(o1,o2);
              o1:= addCOris(CornSym[j][cc[curPlace].c].o,cc[curPlace].o);
              o2:= CornSym[InvIdx[j]][cPlace].o;
              otest:= addCOris(o1,o2);
            end;

            if (cc[cPlace].c=NNN) and not cornerUsed[cCubie] then //noch frei
            begin
              cornerUsed[cCubie]:=true;//dieser Stein wird gesetzt
              setBySymmetry[cPlace]:=true;//an diesen Platz
              cc[cPlace].c:= cCubie;
              cc[cPlace].o:= otest;
            end
            else //Stein schon besetzt
            begin
              if (cc[cPlace].c <> cCubie) or (cc[cPlace].o <> otest) then
              begin symSetOk:=false; break; end;
            end;
 //         end;// curSym[j]=1
        end;//for j:= 0 to 47

        if (symSetOk=false) or not hasCorrectColourNumber(false) then goto conti1; //aufräumen wichtig!

         //hier jetzt noch weitere Überprüfungen machen
        c3:=NNN;
        for c2:= URF to DRB do if cc[c2].c=NNN then begin c3:=c2; break; end;
        if c3=NNN then //alles besetzt
        begin
          s:=0;
          for c2:= URF to DRB do s:= s + cc[c2].o;
          if s mod 3 <> 0 then goto conti1;//twist falsch          /////////////////////////////////////////////

          if not Form1.CBIsomorph.Checked then
          begin
            for c1:= URF to DRB do //besetzen um isocheck zu machen
            for s:= 0 to 2 do
              fc.PFace^[CF[c1,s]]:= CCI[cc[c1].c,(s+3-cc[c1].o) mod 3];
            Synchronize(checkIsoCorner);//testen, ob isomorph in der "Normalsymmmetriegruppe"
            if checkIsoCornerResult=true then goto conti1; //Test mit allen Symmetrien, in der die Symmtriegruppe normal ist.
          end;
          if cornerStart[maxCornArrIdx]>=0 then Inc(maxCornArrIdx);//dann schon belegt

          setEdges(UR);
        end
        else setCorners(c3);//recursion
conti1:
        for c2:= URF to DRB do//aufräumen
        if setBySymmetry[c2] then
        begin
          cornerUsed[cc[c2].c]:=false;
          setBySymmetry[c2]:=false;
          cc[c2].c:=NNN;
          cc[c2].o:=0;
        end;
      end;//for i (Orientierungen)
      cornerUsed[c]:=false;
      cc[curPlace].c:=NNN;
      cc[curPlace].o:=0;
    end;//for c (unbenutzte Ecken)
//  end//RBASym is checked


end;




procedure SySearch.SetEdges(curPlace: Edge);
var e,e1,e2,e3,ePlace,eCubie: Edge; i,j,s: Integer;
    setBySymmetry: array[UR..BR] of boolean;
    o1,o2,otest: ShortInt;
    symSetOk,hasMoreSymmetry,isOdd: Boolean;
    c1,c2: Corner;
    chktemp:boolean;
    f:face;

label conti,conti1;
begin

  if terminated then exit;
  for e1:= UR to BR do setBySymmetry[e1]:=false;//dies sollte sonst nicht mehr nötig sein


 // else//RBASym.Checked
  //begin
    for e:= UR to BR do //durch alle unbenutzten Kanten iterieren
    begin
      if (Form1.RBCornersE.Checked or Form1.RBCornersO.Checked) then if curplace<>e then continue;

      if edgeUsed[e] then continue else edgeUsed[e]:=true;
      ec[curPlace].e:=e;//Platz besetzen
      for i:= 0 to 1 do //alle Orientierungen testen
      begin
        if (Form1.RBCornersE.Checked or Form1.RBCornersO.Checked) then if i>0 then break;
        ec[curPlace].o:=i;
        symSetOk:=true;
        for j:=0 to 47 do
        begin
 //         if curSym[j]=1 then //Permutation hat diese Symmetrie

          //B:= cc, A ist die Symmetrie
          //A B A^-1 = B, wir nehmen speziell A(curPlace).c als Element

          // A B A^-1 (A(curPlace).c).c = (A B)(A^-1(A(curPlace).c).c).c
          // = (A B)(curPlace).c  = A(B(curPlace).c).c
          //also B(A(curPlace).c).c = A(B(curPlace).c).c

          //  A B A^-1 (A(curPlace).c).o =
          // (A B)(A^-1(A(curPlace).c).c).o + A^-1(A(curPlace).c).o
          // = (A B)(curPlace).o  + A^-1(A(curPlace).c).o
          // = A(B(curPlace).c).o + B(curPlace).o    + A^-1(A(curPlace).c).o
          // also  B(A(curPlace).c).o =......


          //Im Falle der "Anti-Symmetrie" gilt
          //A B^-1 A^-1 = B, wir nehmen speziell AB(curPlace).c als Element

          //A B^-1 A^-1 (AB(curPlace).c).c= A B^-1 A^-1 (A(B(curPlace).c).c).c
          //= A(curPlace).c
          //also B(AB(curPlace).c).c = A(curPlace).c

          //A B^-1 A^-1 (AB(curPlace).c).o =

          //A B^-1 A^-1 (AB(curPlace).c).o =  A B^-1 (A^-1 (AB(curPlace).c).c).o  + A^-1 (AB(curPlace).c).o
          // = A B^-1 (A^-1[A[B(curPlace).c].c].c).o + A^-1 (AB(curPlace).c).o
          // = A B^-1 (B(curPlace).c).o + A^-1 (AB(curPlace).c).o
          //= A(B^-1 (B(curPlace).c).c).o + B^-1(B(curPlace).c).o  + A^-1 (AB(curPlace).c).o
          //= A(curPlace).o +  B^-1(B(curPlace).c).o  + A^-1 (AB(curPlace).c).o
          //= A(curPlace).o +  B^-1(B(curPlace).c).o     + A^-1 (A(B(curPlace).c).c).o ,
          //also B(AB(curPlace).c).o= .....

          //für die inversen Orientierungen gilt:
          // B^-1B= ID gilt B^-1B(x).o = 0 = B^-1(B(x).c).0 +B(x).o
          //Kanten: B(x).o/B^-1B(x).o = 0/0, 1/1
          //Bei Ecken 0/0 1/2 2/1 3/3 4/4 5/5



          //begin
            if Odd(curAsym shr j) then//Antisymmetrie aus Komplement zu H bei j=0 geht es vor
            begin
              ePlace:=EdgeSym[j][ec[curPlace].e].e;// AB(curPlace).e
              eCubie:=EdgeSym[j][curPlace].e;//A(curPlace).e
            end
            else if curSym[j]=1 then
            begin //Permutation hat die Symmetrie der Untergruppe H
              ePlace:=EdgeSym[j][curPlace].e;//A(curPlace).e
              eCubie:=EdgeSym[j][ec[curPlace].e].e;//A(B(curPlace).e).e
            end;

            if Odd(curAsym shr j) then //aus G\H
            begin
              o1:= EdgeSym[j][curPlace].o + ec[curPlace].o;//Orientierung ist selbstinvers;
              o2:= o1 + EdgeSym[InvIdx[j]][ePlace].o;
              otest:= o2 mod 2;
            end
            else if curSym[j]=1 then //aus H
            begin
              o1:= EdgeSym[j][ec[curPlace].e].o + ec[curPlace].o;
              o2:= o1 + EdgeSym[InvIdx[j]][ePlace].o;
              otest:= o2 mod 2;
            end;
            if (ec[ePlace].e=NN) and not edgeUsed[eCubie] then //noch frei
            begin
              edgeUsed[eCubie]:=true;//dieser Stein wird gesetzt
              setBySymmetry[ePlace]:=true;//an diesen Platz
              ec[ePlace].e:= eCubie;
              ec[ePlace].o:= otest;
            end
            else //Stein schon besetzt
            begin
              if (ec[ePlace].e <> eCubie) or (ec[ePlace].o <> otest) then
              begin symSetOk:=false; break; end;
            end;
          //end;// curSym[j]=1
        end;//for j
        if (symSetOk=false) or not hasCorrectColourNumber(false) then goto conti1;

        e3:=NN;
        for e2:= UR to BR do if ec[e2].e=NN then begin e3:=e2; break; end;
        if e3=NN then //alles besetzt
        begin
          s:=0;
          for e2:= UR to BR do s:= s + ec[e2].o;
          if s mod 2 <> 0 then goto conti1;//flip falsch //////////////////////////////////////////////

          for c1:= DRB downto Succ(URF) do
          for c2:= Pred(c1) downto URF do
          if cc[c2].c>cc[c1].c then Inc(s);
          for e1:= BR downto Succ(UR) do
          for e2:= Pred(e1) downto UR do
          if ec[e2].e>ec[e1].e then Inc(s);
          if odd(s) then isOdd:=true else isOdd:=false;


          //if odd(s) then isOdd:=false else isOdd:=true; //das ist falsch!  ///////////////////////////////////////////


          if isOdd and (Form1.RBAll.Checked or Form1.RBEdgesE.Checked or
            Form1.RBCornersE.Checked) then goto conti1;//Gesamtpermutation ungerade
          if not isOdd and (Form1.RBEdgesO.Checked or Form1.RBCornersO.Checked)
            then goto conti1;
          if not hasCorrectColourNumber(true) then goto conti1;//true: exakte Prüfung



          if Form1.CBExactSym.Checked then//keine höhere Symmetrie zulassen
          begin
            hasMoreSymmetry:=false;
            for s:= 0 to 47 do
            begin
               if  curSym[s]=1 then continue;//diese Symmetrie hat es sowieso
                hasMoreSymmetry:=true; //dies muss jetzt widerlegt werden!
                CornMult(CornSym[s],cc,csave1);
                CornMult(csave1,CornSym[InvIdx[s]],csave2);
                EdgeMult(EdgeSym[s],ec,esave1);
                EdgeMult(esave1,EdgeSym[InvIdx[s]],esave2);

                for c1:= URF to DRB do
                  if (csave2[c1].c<>cc[c1].c) or (csave2[c1].o<>cc[c1].o) then
                  begin
                    hasMoreSymmetry:=false;
                    break;
                  end;
                for e1:= UR to BR do
                begin
                  if not hasMoreSymmetry then break;
                  if (esave2[e1].e<>ec[e1].e) or (esave2[e1].o<>ec[e1].o) then
                  begin
                    hasMoreSymmetry:=false;
                    break;
                  end;
                end;
                if hasMoreSymmetry then break;//hat die Symmetrie s
            //  end;//if}
            end;//s
            if hasMoreSymmetry then goto conti1;
          end;//CBExact

         if Form1.CBExactAsym.Checked then//keine höheren Antisymmetrien zulassen
          begin
            hasMoreSymmetry:=false;
            for s:= 0 to 47 do
            begin
               if  Odd(curAsym shr s) then continue;//diese Asymmetrie hat es sowieso
                hasMoreSymmetry:=true; //dies muss jetzt widerlegt werden!
                CornMult(CornSym[s],cc,csave1);
                CornMult(csave1,CornSym[InvIdx[s]],csave2);
                CornMult(cc,csave2,csave1);
                EdgeMult(EdgeSym[s],ec,esave1);
                EdgeMult(esave1,EdgeSym[InvIdx[s]],esave2);
                EdgeMult(ec,esave2,esave1);

                for c1:= URF to DRB do
                  if (csave1[c1].c<>c1) or (csave1[c1].o<>0) then
                  begin
                    hasMoreSymmetry:=false;
                    break;
                  end;
                for e1:= UR to BR do
                begin
                  if not hasMoreSymmetry then break;
                  if (esave1[e1].e<>e1) or (esave1[e1].o<>0) then
                  begin
                    hasMoreSymmetry:=false;
                    break;
                  end;
                end;
                if hasMoreSymmetry then break;//hat die Symmetrie s
            //  end;//if}
            end;//s
            if hasMoreSymmetry then goto conti1;
          end;//RBExact


          if Form1.CBSelfInverse.Checked then//keine selbstinversen
          begin
            hasMoreSymmetry:=true; //dies muss jetzt widerlegt werden!
            CornMult(cc,cc,csave1);
            EdgeMult(ec,ec,esave1);
            for c1:= URF to DRB do
              if (csave1[c1].c<>c1) or (csave1[c1].o<>0) then
              begin
                hasMoreSymmetry:=false;
                break;
              end;
            for e1:= UR to BR do
            begin
              if not hasMoreSymmetry then break;
              if (esave1[e1].e<>e1) or (esave1[e1].o<>0) then
              begin
                hasMoreSymmetry:=false;
                break;
              end;
            end;
            if hasMoreSymmetry then goto conti1;
          end;//CBSelfInverse
          

          for c1:= URF to DRB do
          for s:= 0 to 2 do
            fc.PFace^[CF[c1,s]]:= CCI[cc[c1].c,(s+3-cc[c1].o) mod 3];

          for e1:= UR to BR do
          begin
            for s:= 0 to 1 do
              fc.PFace^[EF[e1,s]]:= ECI[ec[e1].e,(s+ec[e1].o) mod 2];
            if Form1.RBAll.Checked then
            if Form1.CBContinuous.Checked and not isContinuous(e1) then goto conti1;
          end;
          if Form1.RBEdgesO.Checked then
          begin
            fc.PFace^[R1]:= FCol;fc.PFace^[F3]:= LCol;
            fc.PFace^[L3]:= FCol;fc.PFace^[F1]:= RCol;
          end
          else if Form1.RBCornersO.Checked then
          begin
            fc.PFace^[R4]:= LCol;fc.PFace^[L6]:= RCol;
          end;
          if Form1.CBIsomorph.Checked then
          begin
            chktemp:= checkisomorphics;
            checkisomorphics:=false;
            Synchronize(CubeAdd);
            checkisomorphics:=chktemp;
          end
          else
          begin
            Synchronize(checkIso);
            if checkisoresult=false then //Würfel hinzufügen
            begin
              if cornerstart[maxCornArrIdx]=-1 then cornerstart[maxCornArrIdx]:=fcN;//erster cube mit der Eckkonfiguration
              chktemp:= checkisomorphics;
              checkisomorphics:=false;//wurde ja schon getestet
              Synchronize(CubeAdd);
              checkisomorphics:=chktemp;
            end;
          end;
        end
        else setEdges(e3);//recursion
conti1:
        for e2:= UR to BR do//aufräumen
          if setBySymmetry[e2] then
          begin
            edgeUsed[ec[e2].e]:=false;
            setBySymmetry[e2]:=false;
            ec[e2].e:=NN;
            ec[e2].o:=0;
          end;
      end;//for i
      edgeUsed[e]:=false;
      ec[curPlace].e:=NN;
      ec[curPlace].o:=0;
    end;//for e
  //end;

end;




end.
