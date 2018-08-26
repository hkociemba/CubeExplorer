unit TripSearch;
interface
  uses FaceCube,Search,classes,CordCube;

type
//+++++class which allows to apply the Two-Phase-Algorithm in parallel in three
//directions+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  TripleSearch = class
  public
    idaU,idaR,idaF:Ida;
    idaOldU,idaOldR,idaOldF:Ida;
    coU,coR,coF: CoordCube;
    done:Integer;
    f:FaceletCube;
    length,l:Integer;
    useTrip:Boolean;
    function NextSolution:Integer;
    constructor Create(faCube:FaceletCube);
    procedure TripSearchNotify(Sender: TObject);
    procedure Kill;
  end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

implementation
 uses CubiCube,CubeDefs,Symmetries,RubikMain,SysUtils,Windows,Forms;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
constructor TripleSearch.Create(faCube: FaceletCube);
var cu:CubieCube; prodE: EdgeCubie; prodC:CornerCubie; prodCn:CenterCubie;
begin
  useTrip:=useTriple;//useTripel is a global variable
  f:=faCube;
  cu:=CubieCube.Create(faCube);//if we want A*X=B we solve B^-1* A= ID

  coR:=nil;coF:=nil;
  coU:=CoordCube.Create(cu);
  if usetrip then
  begin
  EdgeMult(EdgeSym[16],cu.PEdge^,prodE); //Apply S_URF3*X*S_URF3^-1 to edges
  EdgeMult(prodE,EdgeSym[InvIdx[16]],cu.PEdge^);
  CornMult(CornSym[16],cu.PCorn^,prodC); //Apply S_URF3*X*S_URF3^-1 to corners
  CornMult(prodC,CornSym[InvIdx[16]],cu.PCorn^);
  CentMult(CentSym[16],cu.PCent^,prodCn); //Apply S_URF3*X*S_URF3^-1 to corners
  CentMult(prodCn,CentSym[InvIdx[16]],cu.PCent^);
  coR:=CoordCube.Create(cu);

  EdgeMult(EdgeSym[16],cu.PEdge^,prodE);
  EdgeMult(prodE,EdgeSym[InvIdx[16]],cu.PEdge^);
  CornMult(CornSym[16],cu.PCorn^,prodC);
  CornMult(prodC,CornSym[InvIdx[16]],cu.PCorn^);
  CentMult(CentSym[16],cu.PCent^,prodCn);
  CentMult(prodCn,CentSym[InvIdx[16]],cu.PCent^);
  coF:=CoordCube.Create(cu);
  end;
  
  idaU:=nil;
  idaR:=niL;
  idaF:=nil;
  length:=faCube.phase2Length-1;
  cu.Free;
end;
//++++++++++++++++End constructor+++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++terminate threads+++++++++++++++++++++++++++++++++++++++
procedure TripleSearch.Kill;
begin
  if idaU<>nil then
  begin
    idaU.Terminate;
    if usetrip then
    begin
      idaR.Terminate;
      idaF.Terminate;
    end;
  end;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//+++++++++initialize and start IDA objects+++++++++++++++++++++++++++++++++++++
function TripleSearch.NextSolution: Integer;
begin
  done:=0;
  if idaU=nil then
  begin
    idaU:=Ida.Create(coU);
    if usetrip then
    begin
      idaR:=Ida.Create(coR);
      idaF:=Ida.Create(coF);
    end;
    idaOldU:=nil;idaOldR:=nil;idaOldF:=nil;

    if not Form1.FreeThreadsonTerminate1.Checked then ////////////////////////////////77
    begin
      coU.Free;coR.Free; coF.free;
      coU:=nil;coR:=nil;coF:=nil;
    end;
  end
  else
  begin
    idaOldU:=idaU;
    idaU:=Ida.Create(idaU);
    if usetrip then
    begin
      idaOldR:=idaR;
      idaOldF:=idaF;
      idaR:=Ida.Create(idaR);
      idaF:=Ida.Create(idaF);
    end;
  end;
  idaU.OnTerminate:= TripSearchNotify;
  idaU.maxLength:=length;
  if usetrip then
  begin
    idaR.OnTerminate:= TripSearchNotify;
    idaF.OnTerminate:= TripSearchNotify;
    idaR.maxLength:=length;
    idaF.maxLength:=length;
  end;
    idaU.Resume;
  if usetrip then
  begin
    idaR.Resume;
    idaF.Resume;
  end;
  Result:=0;
end;
//+++++++++End initialize and start IDA objects+++++++++++++++++++++++++++++++++

//++++++++++++++Called if execute method of thread returns++++++++++++++++++++++
procedure TripleSearch.TripSearchNotify(Sender: TObject);
var n: Integer;ia:Ida; i:Face;
begin
  Inc(done);//the routine will be called three times on triple search
  if done=1 then
  begin
    ia:= Sender as Ida;
    l:=ia.returnLength;
    if l=-1 then
    begin
 //     Application.MessageBox(PChar(Err[5]),'Maneuver Window',MB_ICONWARNING);
      length:=-1;//nothing more to find
    end;
     if (l>=0) and (l<=length) then
     begin
      Form1.dirty:=true;
 {$IF not QTM}
      length:=l-1;//new maximal length for next search
 {$ELSE}
      length:=l-2;//new maximal length for next search in QTM
 {$IFEND}

       if ia=idaU then
         f.maneuver:=ia.SolverString
       else if ia=idaR then
         f.maneuver:=MT(ia.SolverString,S_URF3)
       else if ia= idaF then
        f.maneuver:=MT(MT(ia.SolverString,S_URF3),S_URF3);
       f.phase2Length:=l;

       for i:= U1 to B9 do f.PFace^[i]:=f.faceOrig[i];//restore in case of right popup menu use
  //     auch centers zurückspielen???

       Form1.Output.Invalidate; Form1.Output.Update; //both necessary
    end;
    Kill;
    if not usetrip then done:=3;
  end;

  if done=3 then
  begin
    idaOldU.free;
    if Form1.FreeThreadsonTerminate1.Checked then idaU:=nil;  ///////////////////////////7




    if usetrip then
    begin
      idaOldR.free;
      idaOldF.free;
      if Form1.FreeThreadsonTerminate1.Checked then begin idaR:=nil;idaF:=nil;end;////////////////////
    end;

    if l>StopAt then //options menu
    PostMessage(Form1.Handle,WM_NEXTSEARCH,0,Integer(f.tripSearch))//trigger next search
    else
    begin
      f.running:=false; //stop

       for n:= 0 to MAXNUM do
      begin
        if ButRun[n].Tag>=0 then if fc[ButRun[n].Tag]=f then
        begin
          ButRun[n].Glyph:=Form1.BMRun;//display green arrow
          break;
        end;
      end;
    end;
  end;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

end.
