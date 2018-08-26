unit OptimalThread;

interface

uses
  Classes,Search;

type
  OptThread = class(TThread)
  private
    idda: Ida;
  protected
    procedure Execute; override;
    procedure PrintManeuver;
  end;

implementation
uses CubiCube,CordCube,RubikMain;

procedure OptThread.Execute;
var cu: CubieCube; co:CoordCube; x:Integer;
begin
  FreeOnTerminate:=true;
  cu:=CubieCube.Create(fCube);
  co:=CoordCube.Create(cu);
  idda:= Ida.Create(co);
  x:=idda.NextSolution(31);
  Synchronize(PrintManeuver);
end;

procedure OptThread.PrintManeuver;
begin
 //idda.PrintManeuver(Form1.canvas,100,80);
end;
end.
