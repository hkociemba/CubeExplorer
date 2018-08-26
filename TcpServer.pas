unit TcpServer;

interface

uses   ScktComp,SysUtils,StrUtils,CubeDefs;


type

TTcpServerThread = class(TServerClientThread)
public
  gmRequestIn: String;
  gmRequestOut: String;
  nOut:Integer;
  procedure ClientExecute; override;
  procedure getManeuverS;//Aufruf in Synchronize
end;


implementation

uses RubikMain,Classes,Forms,Windows,Messages,TripSearch;

//++++++++++++++++++++++Webserver returns a gif image+++++++++++++++++++++++++++
function getGif(request:String):String;
var gif:String; ms: TMemoryStream;
begin
  ms:=TMemoryStream.Create;
  ms.LoadFromFile(request);
  SetLength(gif,ms.Size);
  ms.Read(gif[1],Length(gif));
  Result:='HTTP/1.0 200 OK'#13#10+'Last-Modified: Mon, 15 Jan 2004 11:11:11 GMT'#13#10#13#10+gif;
  ms.Free;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function cIndex(c:char):Integer;
begin
  case c of
   'u':Result:=0;
   'r':Result:=1;
   'f':Result:=2;
   'd':Result:=3;
   'l':Result:=4;
   'b':Result:=5;
  end;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++Compute maneuver for given request String+++++++++++++++++
function getManeuver1(request:String):String;
var i,rb,count:Integer; f:Face; answer:String; chktemp:boolean;

begin
  fcube.Empty;
  i:=1;
  rb:=length(request);
  while (i<rb) and (request[i]<>'?')do
   Inc(i);
  if request[i]='?' then
  begin
    count:=0;
    repeat
      Inc(i);Inc(count);
      case request[i] of
        'u','U': fCube.PFace^[face(count-1)]:=UCol;
        'r','R': fCube.PFace^[face(count-1)]:=RCol;
        'f','F': fCube.PFace^[face(count-1)]:=FCol;
        'd','D': fCube.PFace^[face(count-1)]:=DCol;
        'l','L': fCube.PFace^[face(count-1)]:=LCol;
        'b','B': fCube.PFace^[face(count-1)]:=BCol;
        #13:break;
        #10:break;
      else
        Dec(count);
      end;
    until
      (count=54) or (i=rb)
  end;

  for f:=U1 to B9 do
  begin
    case f of
      U5,R5,F5,D5,L5,B5: continue;
    end;
    fCube.Check(f,true); //auto modus
    answer:='';
  end;

  Form1.FacePaint.Invalidate;

  answer:='';
  for f:= U1 to B9 do if fCube.PFace^[f]=NoCol then
  begin answer:=Err[24]; break; end;
  if answer='' then
  begin
    chktemp:= checkisomorphics;
    checkisomorphics:=false;
    Form1.AddCube(fCube,true,true,false,0,false);//solver, start search, don't ask for isos, paint all, no center orientation
 //   n:=fcN-1;
    checkisomorphics:= chktemp;
  end;
  Result:=answer;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
procedure TTcpServerThread.getManeuverS;
begin
  gmRequestOut:=getManeuver1(gmRequestIn);
  nOut:=fcN-1;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
procedure TTcpServerThread.ClientExecute;
var
  Data: array[0..5000] of char;
  request,answer: String;
  SocketStream: TWinSocketStream;
  fs: TFileStream;
// ms: TMemoryStream;
  ss: TSTringStream;
  p,n:Integer;
//  testData,x: String;
  valid:Boolean;
  freq,time1,time2: TLargeInteger;
  k: Face;
begin

  inherited FreeOnTerminate:=true;
  try
    SocketStream := TWinSocketStream.Create(ClientSocket, 10000);//TimeOut 60s geänder auf 10 s!!!!!
    try
      FillChar(Data, SizeOf(Data), 0);
      if SocketStream.Read(Data, SizeOf(Data)) = 0 then
      begin
        // If we didn't get any data after 60 seconds then close the connection
        ClientSocket.Close;
        Terminate;
      end
      else
  //    testData:=Data;
  //    if Length(testData)>0 then  //because thread may terminate later
      begin
        request := Data;
        request:=Trim(MidStr(request,Pos('GET',request)+3,Pos('HTTP',request)-Pos('GET',request)-3));
        if request[1]='/' then Delete(request,1,1); //vorsicht, wenn 1 nicht existiert!
        if (length(request)=0) or (Form1.ButtonAddSolve.Enabled=false)
           then answer:= 'HTTP/1.0 200 OK'#13#10#13#10+'<HTML><BODY>'#13#10
        +'invalid request'+#13#10'</BODY></HTML>'#13#10
        else if (Pos('gif',request)>0) and (Pos('faces',request)>0) then answer:= getGif(request)

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        else if (Pos('?getLast',request)>0) or (Pos('?getlast',request)>0) then  //read last computed maneuver
        begin
          if fcN>0 then
          begin
            if Pos('*',fc[fcN-1].optManeuver)>0 then
               answer:= fc[fcN-1].optManeuver
               else answer:= fc[fcN-1].maneuver;
            Delete(answer,Pos(' (',answer)-1,10);
          end
          else answer:=Err[26];
          answer:= 'HTTP/1.0 200 OK'#13#10#13#10+'<HTML><BODY>'#13#10
          +answer+#13#10'</BODY></HTML>'#13#10;
        end
        else if (Pos('?status',request)>0) or (Pos('?Status',request)>0) then
        begin
          answer:='';
          for k:= U1 to B9 do
            case prevCube.PFace^[k] of
               UCol: answer:=answer+'r';
               RCol: answer:=answer+'o';
               FCol: answer:=answer+'b';
               DCol: answer:=answer+'g';
               LCol: answer:=answer+'y';
               BCol: answer:=answer+'w';
            else
             answer:=answer+'x';
            end;
          answer:= 'HTTP/1.0 200 OK'#13#10#13#10+'<HTML><BODY>'#13#10
          +answer+#13#10'</BODY></HTML>'#13#10;
        end

        else if (Pos('?connect',request)>0) or (Pos('?Connect',request)>0) then     /////neu
        begin
         answer:= 'HTTP/1.0 200 OK'#13#10#13#10+'<HTML><BODY>'#13#10
         +'Done!'+#13#10'</BODY></HTML>'#13#10;
         try
         PostMessage(Form1.Handle,WM_CONNECT,StrToInt(RightStr(request,1)),0);//Thread issues
         except
          on EConvertError do
          begin
            answer:=Err[33];
            answer:= 'HTTP/1.0 200 OK'#13#10#13#10+'<HTML><BODY>'#13#10
            +answer+#13#10'</BODY></HTML>'#13#10;
          end;
         end;

        end   
        else if (Pos('?clear',request)>0) or (Pos('?Clear',request)>0) then       ////neu
        begin
          Form1.ClearMainWindow1Click(nil);
          answer:= 'HTTP/1.0 200 OK'#13#10#13#10+'<HTML><BODY>'#13#10
          +'Done!'+#13#10'</BODY></HTML>'#13#10;
        end
        else if (Pos('?scan',request)>0) then  //scan a face
        begin
          p:=Pos('?scan',request);
          valid:=false;
          case request[p+5] of
            'U','u': begin Form1.RbU.Checked:=true;valid:=true; end;
            'R','r': begin Form1.RbR.Checked:=true;valid:=true; end;
            'F','f': begin Form1.RbF.Checked:=true;valid:=true; end;
            'D','d': begin Form1.RbD.Checked:=true;valid:=true; end;
            'L','l': begin Form1.RbL.Checked:=true;valid:=true; end;
            'B','b': begin Form1.RbB.Checked:=true;valid:=true; end;
          end;
          if valid then begin Form1.BScanClick(nil);answer:='Done!';end
          else answer:=Err[27];
          answer:= 'HTTP/1.0 200 OK'#13#10#13#10+'<HTML><BODY>'#13#10
          +answer+#13#10'</BODY></HTML>'#13#10;
        end
        else if (Pos('?transfer',request)>0) then  //transfer and solve
        begin
           Form1.BTransferCamClick(nil);
          answer:= 'HTTP/1.0 200 OK'#13#10#13#10+'<HTML><BODY>'#13#10
          +globalMessage+#13#10'</BODY></HTML>'#13#10;  //globalmessage wird in RubikMain erzeugt

        end
        else
//+++++++falls Antwort über Stringeingabe wie in Dokumentation++++++++++++++++++
        begin
    {      QueryPerformanceFrequency(freq);
          QueryPerformanceCounter(time1);
          time2:=minTime*freq+time1;//5 sekunden   }
          gmRequestIn:=request;
          Synchronize(getManeuverS);
          answer:= gmRequestOut;
          if answer='' then  //Cube war ok
          begin
            n:=nOut;
            repeat
              Sleep(300);
              Application.ProcessMessages;
            until not fc[n].running;
            answer:=fc[n].maneuver; //compute at least one solution
 {
            QueryPerformanceCounter(time1);
            while (time2>time1) and((fc[n].tripSearch as TripleSearch).length <>-1)  do
            begin
              if (not fc[n].running) then
              begin
                answer:=fc[n].maneuver;
                PostMessage(Form1.Handle,WM_NEXTSEARCH,0,Integer(fc[n].tripSearch));
                fc[n].running:=true;
              end;
              Application.ProcessMessages;
              Sleep(300);
              QueryPerformanceCounter(time1);
            end;
            if fc[n].running then TripleSearch(fc[n].tripSearch).Kill
            else answer:=fc[n].maneuver;  }
            Delete(answer,Pos(' (',answer)-1,10);

            //Antwort in Datei speichern
            if writeToFile then
            begin
              EnterCriticalSection(CS);
              try
                fs := TFileStream.Create('webserv_ans.txt', fmCreate);
                fs.WriteBuffer(PChar(answer)^,Length(answer));
              finally
                fs.Free;
                LeaveCriticalSection(CS);
              end;
            end;
          end;

          answer:= 'HTTP/1.0 200 OK'#13#10#13#10+'<HTML><BODY>'#13#10
          +answer+#13#10'</BODY></HTML>'#13#10;
        end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        if ClientSocket.Connected then
        begin
          ss:=TStringStream.Create('');
          ss.WriteString(answer);
          ss.Position:=0;
          ClientSocket.SendStream(ss); //TStringStream nicht freigeben!!
        end;
      end;
    finally
      SocketStream.Free;
      ClientSocket.Close; //eigener Code
      Terminate;
    end;
  except
    on E: Exception do
    begin
      If Pos('64',E.Message)= 0 then   //kein Lesen-Fehler (Read Error) 64
      begin
        Application.MessageBox(PChar(E.Message),'');
//        testData:=Data;
//        Application.MessageBox(PChar(IntToSTr(Length(testData))+''#13#10+testData),'');
      end;
      exit;
    end;
  end;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++




end.
