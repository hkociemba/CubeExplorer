unit CosetExp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,Search,FaceCube, StdCtrls;

type
  TCoset = class(TForm)
    ButtonStart: TButton;
    ButtonStop: TButton;
    Info: TMemo;
    ButtonAddCubes: TButton;
    ButtonExit: TButton;
    procedure ButtonStartClick(Sender: TObject);
    procedure ButtonStopClick(Sender: TObject);
    procedure ButtonAddCubesClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

  CosetSearch = class
  public
    idaCos:Ida;
    f:FaceletCube;
    curSym:Integer;
    cosetId: Int64;
    startTime: TDateTime;
    finished:Boolean;
    constructor Create(faCube:FaceletCube);
    procedure CleanupIfTerminated(Sender: TObject);
   function getCurSym:Integer;
  end;



var
  Coset: TCoset;
  udsliceSym, cornPosSym, edge8PosSym : array[0..15] of array of Word; //für die Symmetrietransformationen



implementation

uses CordCube,CubiCube,RubikMain,CubeDefs,Symmetries;

{$R *.dfm}

constructor CosetSearch.Create(faCube: FaceletCube);
var r,h,cc:CubieCube;co: CoordCube; i: Face; s,j: Integer;
    c1save,c2save:CornerCubie; e1save,e2save:EdgeCubie;
begin
  f:=FaceletCube.Create(Form1.FacePaint.Canvas) ;
  for i:=U1 to B9 do
  f.PFace^[i]:=faCube.PFace^[i];
  r:= CubieCube.Create(f);
  h:= CubieCube.Create;
  cc:=CubieCube.Create;
  co:=CoordCube.Create(r);
  idaCos:=Ida.Create(co);
  cosetId:=(2187*idaCos.n[0].UDIdx+idaCos.n[0].UDTwist)*Int64(70)+idaCos.n[0].UDTetra;
  startTime:= Now;
  idaCos.sym:=getCurSym; //muss deaktiviert werden, bis search routine verbessert ist
 // idaCos.sym:=1; //falls test ohne symmetrie
  idaCos.runCoset:=true;
  finished:=false;
  idaCos.OnTerminate:= CleanupIfTerminated;
  SetLength(BitVector,8709120);
  for s:= 0 to 15 do
  begin
    SetLength(udsliceSym[s],24);
    SetLength(edge8PosSym[s],40320);
    SetLength(cornPosSym[s],40320);
  end;
  //jetzt die Tabellen bauen
  //wenn rM = h  (M Maneuver, r Repräsentant, h Element der Targetgruppe H)
  // dann ist rs'Ms = rs'r'hs

  for j:= 0 to 40320-1 do
  begin
    h.InvCornPermCoord(j);
    if j mod 1000 = 0 then Application.ProcessMessages;
    for s:= 0 to 15 do
    begin
      if (idaCos.sym and (1 shl s))<>0 then
      begin
        CornMult(r.PCorn^,CornSym[InvIdx[s]],r.PCornTemp^);//rs'
        CornInv(r.PCorn^,c1save);//r'
        CornMult(r.PCornTemp^,c1save,c2save);//rs'r'
        CornMult(c2save,h.PCorn^,h.PCornTemp^);//rs'r'h
        CornMult(h.PCornTemp^,CornSym[s],cc.PCorn^);//rs'r'hs
        cornPosSym[s][j]:=cc.CornPermCoord;
      end;
    end;
  end;

  for j:= 0 to 40320-1 do
  begin
    h.InvPhase2EdgePermCoord(j);
    if j mod 1000 = 0 then Application.ProcessMessages;
    for s:= 0 to 15 do
    begin
      if (idaCos.sym and (1 shl s))<>0 then
      begin
        EdgeMult(r.PEdge^,EdgeSym[InvIdx[s]],r.PEdgeTemp^);//rs'
        EdgeInv(r.PEdge^,e1save);//r'
        EdgeMult(r.PEdgeTemp^,e1save,e2save);//rs'r'
        EdgeMult(e2save,h.PEdge^,h.PEdgeTemp^);//rs'r'h
        EdgeMult(h.PEdgeTemp^,EdgeSym[s],cc.PEdge^);//rs'r'hs
        edge8PosSym[s][j]:=cc.Phase2EdgePermCoord;
      end;
    end;
  end;

  for j:= 0 to 24-1 do
  begin
    h.InvUDSliceSortedCoord(j);
    for s:= 0 to 15 do
    begin
      if (idaCos.sym and (1 shl s))<>0 then
      begin
        EdgeMult(r.PEdge^,EdgeSym[InvIdx[s]],r.PEdgeTemp^);//rs'
        EdgeInv(r.PEdge^,e1save);//r'
        EdgeMult(r.PEdgeTemp^,e1save,e2save);//rs'r'
        EdgeMult(e2save,h.PEdge^,h.PEdgeTemp^);//rs'r'h
        EdgeMult(h.PEdgeTemp^,EdgeSym[s],cc.PEdge^);//rs'r'hs
        udsliceSym[s][j]:=cc.UDSliceSortedCoord;
      end;
    end;
  end;
   h.Free;r.Free;cc.Free;co.Free;
  //Thread mit resume starten, mit Suspend anhalten, mit Terminate beenden
end;

procedure CosetSearch.CleanupIfTerminated(Sender: TObject);
var i: Integer;
begin
   for i:= 1 to 19 do
     if cubecount[i]>0 then Coset.Info.Lines.Add(Format('%2df: %10d',[i,cubecount[i]-cubecount[i-1]]));
  Coset.Info.Lines.Add(Format('%d Cubes with at least 20 moves left.',[278691840-bitvecdone]));
  Coset.Info.Lines.Add('Search finished '+DateTimeToStr(Now));
  Coset.Info.Lines.Add(Format('Running time %4.4f hours.',[24*(now-coSearch.startTime)]));
  Coset.ButtonStart.Enabled:=false;Coset.ButtonStop.Enabled:=false;
  Coset.ButtonExit.Enabled:=true;Coset.ButtonAddCubes.Enabled:=true;
  finished:=true;
end;

procedure TCoset.ButtonStartClick(Sender: TObject);
var i,sn: Integer; sstring: String;
begin
 ButtonStart.Enabled:=false;ButtonStop.Enabled:=true;
 ButtonExit.Enabled:=false;ButtonAddCubes.Enabled:=false;
 sn:=0;
 for i:= 0 to 15 do if (coSearch.idaCos.sym and (1 shl i))<>0 then inc(sn);
 if sn=1 then sstring:='symmetry' else sstring:='symmetries';
 Info.Lines.Add(Format('Search started for Coset %d  %s (%d %s)',
    [cosearch.cosetId,DateTimeToStr(cosearch.startTime),sn,sstring]));
 Info.Lines.Add('');
 coSearch.idaCos.Resume;
end;

procedure TCoset.ButtonStopClick(Sender: TObject);
var i: Integer; bf: Double; str:String;
begin
   coSearch.idaCos.Suspend;
   ButtonStart.Enabled:=true;ButtonStop.Enabled:=false;
    ButtonExit.Enabled:=true;ButtonAddCubes.Enabled:=true;
   Info.Lines.Add('Search stopped '+DateTimeToStr(Now));
   Info.Lines.Add('');
   for i:= 1 to 20 do
   begin
     if (i>1) and (cubecount[i-1]-cubecount[i-2]>0) then
       bf:= (cubecount[i]-cubecount[i-1])/(cubecount[i-1]-cubecount[i-2])
     else bf:=0;
     if cubecount[i]>0 then Info.Lines.Add(Format('%2df: %10d  %6.2f',[i,cubecount[i]-cubecount[i-1],bf]));
     if (cubecount[i]=0) and (cubecount[i-1]>0) //dann gerade bearbeitete Tiefe
       then Info.Lines.Add(Format('%2df: %10d (íncomplete)',[i,bitvecdone-cubecount[i-1]]));
   end;
   Info.Lines.Add('');
   Info.Lines.Add(Format('%d Cubes left.',[278691840-bitvecdone]));
   case Integer(coSearch.idaCos.n[0].axis) of
    0: str:='U';
    1: str:='R';
    2: str:='F';
    3: str:='D';
    4: str:='L';
    5: str:='B';
   end;
   Info.Lines.Add(Format('Just searching %s%d ...',
     [str,coSearch.idaCos.n[0].power]));
   Info.Lines.Add(Format('%4.4f hours running.',[24*(now-coSearch.startTime)]));
   Info.Lines.Add('');
end;

procedure TCoset.ButtonAddCubesClick(Sender: TObject);
var i,j,base,index,udslice,corn8pos,edge8pos: Integer;
    cx,cy: CubieCube; f: FaceletCube;
begin

  if (278691840-bitvecdone>1000) and not coSearch.finished then
  begin
   Info.Lines.Add('There are more than 1000 cubes left. Continue the search.');
   Info.Lines.Add('');
   Exit;
  end;
  f:= FaceletCube.Create(Form1.FacePaint.Canvas);
  for i:= 0 to 24*288*40320 div 32 -1 do
  begin
  if bitvector[i]= -1 then continue;//alle bits belegt
    base:=i;
    for j:= 0 to 31 do
      if (bitvector[base] and (1 shl j))=0 then
      begin
        index:= base shl 5 + j;
        udslice:= index mod 24;
        index:= index div 24;
        corn8pos:= index mod 288;
        edge8pos:= index div 288;

        cy:=CubieCube.Create;
        cy.InvPhase2EdgePermCoord(edge8pos);
        cy.InvUDSliceSortedCoord(udslice);
        cy.InvCorn8PermCoord(corn8pos);   //muss als letztes gesetzt werden, da parity bestimmt wird

        //coSearch.f ist der Ausgangscube X, der EndCube ist Y, d.h. X*Man=Y
        //Y^-1*X*Man = Id, der gesuchte cube

        cx:=CubieCube.Create(coSearch.f);

        CornInv(cy.PCorn^,cy.PCornTemp^);
        EdgeInv(cy.PEdge^,cy.PEdgeTemp^);
        CornMult(cy.PCornTemp^,cx.PCorn^,cy.PCorn^);
        EdgeMult(cy.PEdgeTemp^,cx.PEdge^,cy.PEdge^);
        f.SetFacelets(cy);
        Form1.AddCube(f,false,false,false,0,false);
        cx.Free;
        cy.Free;
        end;
  end;
  f.Free;
end;

function CosetSearch.getCurSym:Integer;
//Symmetrien bzg. der Huge Phase1 Koordinaten bestimmen
var cu,cus: CubieCube; s,cornori,edgeori,udslice,tetra: Integer;
begin
  cu:=CubieCube.Create(f);
  cus:= CubieCube.Create;
  cornori:= cu.CornOriCoord;
  edgeori:= cu.EdgeOriCoord;
  udslice:= cu.UDSliceCoord;
  tetra:= cu.TetraCoord;
  cursym:=0;

  for s:= 0 to 15 do   //nur Symmetrien, die H invariant lassen!
  begin
    CornMult(CornSym[s],cu.PCorn^,cu.PCornTemp^);
    CornMult(cu.PCornTemp^,CornSym[InvIdx[s]],cus.PCorn^);
    EdgeMult(EdgeSym[s],cu.PEdge^,cu.PEdgeTemp^);
    EdgeMult(cu.PEdgeTemp^,EdgeSym[InvIdx[s]],cus.PEdge^);
    if (cornori=cus.CornOriCoord) and (edgeori=cus.EdgeOriCoord) and
        (udslice=cus.UDSliceCoord) and (tetra=cus.TetraCoord) then
       curSym:= curSym or ( 1 shl s)
  end;
  Result:=cursym;
end;

//nur zum Debuggen bis AddCubesClick funktioniert
procedure TCoset.Button1Click(Sender: TObject);
var fs:TFileStream;
begin
      fs := TFileStream.Create('bitvector', fmCreate);
      fs.WriteBuffer(bitvector[0],34836480);
      fs.Free;
end;

procedure TCoset.Button2Click(Sender: TObject);
var fs:TFileStream;
begin
      fs := TFileStream.Create('bitvector',fmOpenRead);
      fs.ReadBuffer(bitvector[0],34836480);
      fs.Free;
end;


//and CreatePruningUB denken!!!


end.
