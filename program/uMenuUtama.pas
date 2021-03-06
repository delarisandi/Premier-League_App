unit uMenuUtama;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, pngimage, Buttons, Menus, dmatrix,
  Grids, DBGrids, Mask, DBCtrls;

type
  TfMenuUtama = class(TForm)
    Bg: TImage;
    MenuFormAwal: TMainMenu;
    GroupBoxBukuTamu: TGroupBox;
    LEDWaktu: TDotMatrix5x7;
    Timerled: TTimer;
    LEDJudul: TDotMatrix5x7;
    LogoAp1: TImage;
    btExit: TBitBtn;
    btMatchData: TBitBtn;
    btInputMatch: TBitBtn;
    btTeamData: TBitBtn;
    lblApp: TLabel;
    Menu1: TMenuItem;
    MainMenu1: TMenuItem;
    MatchdayData1: TMenuItem;
    InputMatchdayData1: TMenuItem;
    PremierLeagueTeamData1: TMenuItem;
    Exit1: TMenuItem;
    Label1: TLabel;
    Logout1: TMenuItem;
    btLogout: TBitBtn;
    About1: TMenuItem;
    About2: TMenuItem;
    procedure btExitClick(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure ExitProgram1Click(Sender: TObject);
    procedure TimerledTimer(Sender: TObject);


    procedure btInputMatchClick(Sender: TObject);
    procedure btMatchDataClick(Sender: TObject);
    procedure btTeamDataClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MatchdayData1Click(Sender: TObject);
    procedure InputMatchdayData1Click(Sender: TObject);
    procedure PremierLeagueTeamData1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure btLogoutClick(Sender: TObject);
    procedure About2Click(Sender: TObject);
  private
    { Private declarations }
    NumOfChar: integer;
  public
    { Public declarations }
  end;

var
  fMenuUtama: TfMenuUtama;

implementation

uses  uInputMatch, uMatchData,
  uTeamData, uFormLogin, uFormAbout;

{$R *.dfm}




procedure TfMenuUtama.btExitClick(Sender: TObject);
begin
if(Application.MessageBox('Exit Program?','Confirmation',MB_YesNo)=ID_Yes) then
 begin
  Application.Terminate;
 end; 
end;

procedure TfMenuUtama.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
resize:=true;
end;



procedure TfMenuUtama.ExitProgram1Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TfMenuUtama.TimerledTimer(Sender: TObject);
const
AnimatedStr ='Welcome To Premier League 2016/2017 Application';
begin
inc (NumOfChar);
LEDJudul.Value := Copy (AnimatedStr, NumOfChar, LEDJudul.NumberOfDigits);
if (NumOfChar > Length (AnimatedStr)) then
NumOfChar := 1;
LEDWaktu.Value:=FormatDateTime('dddd/dd/mmmm/yyyy',now)+' '+FormatDateTime('hh:mm:ss:AM/PM',now);
end;






procedure TfMenuUtama.btInputMatchClick(Sender: TObject);
begin
fMenuUtama.Hide;
fInputMatch.Show;
end;

procedure TfMenuUtama.btMatchDataClick(Sender: TObject);
begin
fMenuUtama.Hide;
fMatchData.Show;
end;

procedure TfMenuUtama.btTeamDataClick(Sender: TObject);
begin
fMenuUtama.Hide;
fTeamData.Show;
end;

procedure TfMenuUtama.FormShow(Sender: TObject);
var
  hMenuHandle: HMENU;
begin


  hMenuHandle:= GetSystemMenu(fMenuUtama.Handle, FALSE);
  if (hMenuHandle <> 0) then
DeleteMenu(hMenuHandle, SC_CLOSE, MF_BYCOMMAND);
end;

procedure TfMenuUtama.MatchdayData1Click(Sender: TObject);
begin
fMenuUtama.Hide;
fMatchData.Show;
end;

procedure TfMenuUtama.InputMatchdayData1Click(Sender: TObject);
begin
fMenuUtama.Hide;
fInputMatch.Show;
end;

procedure TfMenuUtama.PremierLeagueTeamData1Click(Sender: TObject);
begin
fMenuUtama.Hide;
fTeamData.Show;
end;

procedure TfMenuUtama.Exit1Click(Sender: TObject);
begin
if(Application.MessageBox('Exit Program?','Confirmation',MB_YesNo)=ID_Yes) then
 begin
  Application.Terminate;
 end;
end;

procedure TfMenuUtama.btLogoutClick(Sender: TObject);
begin
fMenuUtama.Hide;
fFormLogin.edUsername.Enabled:=true;
fFormLogin.Show;
fFormLogin.btLogoutClick(sender);
end;

procedure TfMenuUtama.About2Click(Sender: TObject);
begin
fAbout.Show;
end;

end.
