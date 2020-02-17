unit uFormAbout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtnrs, MPlayer, OleCtrls, WMPLib_TLB, ExtCtrls,
  ComCtrls, pngimage, jpeg, Buttons;

type
  TfAbout = class(TForm)
    WindowsMediaPlayer1: TWindowsMediaPlayer;
    Timer1: TTimer;
    ProgressBar1: TProgressBar;
    Image1: TImage;
    Panel1: TPanel;
    Image2: TImage;
    lblApp: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btBack: TBitBtn;
    Panel2: TPanel;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure btBackClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fAbout: TfAbout;

implementation

{$R *.dfm}



procedure TfAbout.FormShow(Sender: TObject);
begin
Timer1.Enabled:=true;
WindowsMediaPlayer1.playState;
end;

procedure TfAbout.Timer1Timer(Sender: TObject);
begin

if ProgressBar1.Position=100 then
 begin
  ProgressBar1.Visible:=false;
  WindowsMediaPlayer1.Visible:=false;
  Panel2.Visible:=false;
  end
  else
  begin
  ProgressBar1.Position:=ProgressBar1.Position+1;
  end;
end;

procedure TfAbout.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
resize:=true;
end;

procedure TfAbout.FormActivate(Sender: TObject);
var
  hMenuHandle: HMENU;
begin
  hMenuHandle:= GetSystemMenu(fAbout.Handle, FALSE);
  if (hMenuHandle <> 0) then
    DeleteMenu(hMenuHandle, SC_CLOSE, MF_BYCOMMAND);
end;

procedure TfAbout.btBackClick(Sender: TObject);
begin
fAbout.Hide;
end;

end.



