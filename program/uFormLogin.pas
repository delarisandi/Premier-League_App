unit uFormLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, pngimage, Buttons, Menus;

type
  TfFormLogin = class(TForm)
    edUsername: TEdit;
    edPassword: TEdit;
    Bg: TImage;
    Panel1: TPanel;
    lblUsername: TLabel;
    lblPassword: TLabel;
    LogoAp: TImage;
    lblJudul: TLabel;
    btReset: TBitBtn;
    btLogin: TBitBtn;
    btExit: TBitBtn;
    MainMenu1: TMainMenu;
    Menu1: TMenuItem;
    MenuUtama1: TMenuItem;
    Exit1: TMenuItem;
    btLogout: TBitBtn;
    btMenuUtama: TBitBtn;
    MenuUtama2: TMenuItem;
    MatchdayData1: TMenuItem;
    InputMatchdayData1: TMenuItem;
    PremierLeagueTeamData1: TMenuItem;
    lblApp: TLabel;
    Logout1: TMenuItem;
    About1: TMenuItem;
    About2: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure edUsernameKeyPress(Sender: TObject; var Key: Char);
    procedure edPasswordKeyPress(Sender: TObject; var Key: Char);
    procedure btLoginClick(Sender: TObject);
    procedure btResetClick(Sender: TObject);
    procedure btExitClick(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure edPasswordChange(Sender: TObject);
    procedure edUsernameChange(Sender: TObject);
    procedure btLogoutClick(Sender: TObject);
    procedure MenuUtama2Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure btMenuUtamaClick(Sender: TObject);
    procedure MatchdayData1Click(Sender: TObject);
    procedure InputMatchdayData1Click(Sender: TObject);
    procedure PremierLeagueTeamData1Click(Sender: TObject);
    procedure Logout1Click(Sender: TObject);
    procedure About2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fFormLogin: TfFormLogin;

implementation

uses uMenuUtama, uInputMatch, uMatchData, uTeamData, uFormAbout, uLoading;



{$R *.dfm}

procedure TfFormLogin.FormActivate(Sender: TObject);
var
  hMenuHandle: HMENU;
begin
  hMenuHandle:= GetSystemMenu(fFormLogin.Handle, FALSE);
  if (hMenuHandle <> 0) then
    DeleteMenu(hMenuHandle, SC_CLOSE, MF_BYCOMMAND);

edUsername.SetFocus;
end;

procedure TfFormLogin.edUsernameKeyPress(Sender: TObject; var Key: Char);
begin
if not (key=chr(13)) then exit;
if edUsername.Text='' then
 begin
  Application.MessageBox('Data tidak boleh ada yang kosong!','Warning!',mb_iconwarning);
  edUsername.SetFocus;
  btLogin.Enabled:=false;
 end
else
 begin
  edPassword.SetFocus;
 end;
end;

procedure TfFormLogin.edPasswordKeyPress(Sender: TObject; var Key: Char);
begin
if not (key=chr(13)) then exit;
if edUsername.Text='' then
 begin
  Application.MessageBox('Data tidak boleh ada yang kosong!','Warning!',mb_iconwarning);
  edUsername.SetFocus;
  btLogin.Enabled:=false;
 end
else
if edPassword.Text='' then
 begin
  Application.MessageBox('Data tidak boleh ada yang kosong!','Warning!',mb_iconwarning);
  edPassword.SetFocus;
  btLogin.Enabled:=false;
 end
else
 begin
  btLogin.SetFocus;
 end;
end;

procedure TfFormLogin.btLoginClick(Sender: TObject);
begin
if (edUsername.Text='pl') and (edPassword.Text='2017') then
 begin
  Application.MessageBox('Login Success!','Success!',mb_iconinformation);
  edUsername.Enabled:=false;
  edPassword.Enabled:=false;
  btLogin.Enabled:=false;
  btLogout.Enabled:=true;
  btMenuUtama.Enabled:=true;
  btMenuUtama.SetFocus;
  btReset.Enabled:=false;
  MenuUtama1.Enabled:=true;
  Logout1.Enabled:=true;
 end
else
 begin
  Application.MessageBox('Username atau Password Salah!','Warning!',mb_iconwarning);
  edUsername.SetFocus;
 end;
end;


procedure TfFormLogin.btResetClick(Sender: TObject);
begin
edUsername.Enabled:=true;
edPassword.Enabled:=true;
edUsername.Text:='';
edPassword.Text:='';
btLogin.Enabled:=false;
btLogout.Enabled:=false;
btMenuUtama.Enabled:=false;
btReset.Enabled:=true;
edUsername.SetFocus;
end;

procedure TfFormLogin.btExitClick(Sender: TObject);
begin
if(Application.MessageBox('Exit Program?','Confirmation',MB_YesNo)=ID_Yes) then
 begin
  Application.Terminate;
 end;
end;

procedure TfFormLogin.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
resize:=true;
end;



procedure TfFormLogin.edPasswordChange(Sender: TObject);
begin
if (edPassword.Text='') or (edUsername.Text='') then
 begin
  btLogin.Enabled:=false;
 end
else
 begin
  btLogin.Enabled:=true;
 end;
end;

procedure TfFormLogin.edUsernameChange(Sender: TObject);
begin
if (edPassword.Text='') or (edUsername.Text='') then
 begin
  btLogin.Enabled:=false;
 end
else
 begin
  btLogin.Enabled:=true;
 end;
end;


procedure TfFormLogin.btLogoutClick(Sender: TObject);
begin
MenuUtama1.Enabled:=false;
Logout1.Enabled:=false;
btReset.Enabled:=true;
btResetClick(sender);
end;



procedure TfFormLogin.MenuUtama2Click(Sender: TObject);
begin
fFormLogin.Hide;
fMenuUtama.Show;
end;

procedure TfFormLogin.Exit1Click(Sender: TObject);
begin
if(Application.MessageBox('Exit Program?','Confirmation',MB_YesNo)=ID_Yes) then
 begin
  Application.Terminate;
 end;
end;

procedure TfFormLogin.btMenuUtamaClick(Sender: TObject);
begin
fFormLogin.Hide;
fMenuUtama.Show;
end;

procedure TfFormLogin.MatchdayData1Click(Sender: TObject);
begin
fFormLogin.Hide;
fMatchData.Show;
end;

procedure TfFormLogin.InputMatchdayData1Click(Sender: TObject);
begin
fFormLogin.Hide;
fInputMatch.Show;
end;

procedure TfFormLogin.PremierLeagueTeamData1Click(Sender: TObject);
begin
fFormLogin.Hide;
fTeamData.Show;
end;

procedure TfFormLogin.Logout1Click(Sender: TObject);
begin
btLogoutClick(sender);
end;

procedure TfFormLogin.About2Click(Sender: TObject);
begin
fAbout.Show;
end;

end.
