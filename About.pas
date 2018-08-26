unit About;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
//++++++++++++++++++++++++++Help/About dialog box+++++++++++++++++++++++++++++++
  TAboutForm = class(TForm)
    Button1: TButton;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label2Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
var
  AboutForm: TAboutForm;

implementation

uses ShellAPI,CubeDefs;
{$R *.DFM}

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
procedure TAboutForm.Button1Click(Sender: TObject);
begin
  Hide;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
procedure TAboutForm.FormCreate(Sender: TObject);
begin
   Label1.Caption:=curVersion+#13+#13+copyright;
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++Send Email++++++++++++++++++++++++++++++++++++++++++++++++++
procedure TAboutForm.Label2Click(Sender: TObject);
begin
  ShellExecute(handle,'open',PChar('mailto:kociemba@t-online.de?subject='+curVersion),nil,nil,SW_SHOWNORMAL);
end;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

end.
