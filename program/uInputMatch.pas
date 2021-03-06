unit uInputMatch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, pngimage, Buttons, Menus, ComCtrls,
  Mask, RpDefine, RpRave, RpRender, RpRenderCanvas, RpRenderPreview, RpCon,
  RpConDS, DB, DBTables;

type
  TfInputMatch = class(TForm)
    Bg: TImage;
    Panel1: TPanel;
    LogoAp: TImage;
    btExit: TBitBtn;
    MainMenu1: TMainMenu;
    Menu1: TMenuItem;
    MenuUtama1: TMenuItem;
    Exit1: TMenuItem;
    MenuUtama2: TMenuItem;
    cbbHome: TComboBox;
    cbbAway: TComboBox;
    lblVs: TLabel;
    cbbDate: TDateTimePicker;
    btSimpan: TBitBtn;
    lblCode: TLabel;
    edHomeScore: TEdit;
    edAwayScore: TEdit;
    btShowData: TBitBtn;
    btSimpanEdit: TBitBtn;
    btHapus: TBitBtn;
    btReportMatchCode: TBitBtn;
    btReset: TBitBtn;
    lblMatchday: TLabel;
    lblHome: TLabel;
    lblAway: TLabel;
    lblMatchCode: TLabel;
    lblDate: TLabel;
    lblScore: TLabel;
    edHBP: TEdit;
    edABP: TEdit;
    edHS: TEdit;
    edHSO: TEdit;
    lblkurung: TLabel;
    edAS: TEdit;
    Label1: TLabel;
    edASO: TEdit;
    edHP: TEdit;
    edAP: TEdit;
    edHF: TEdit;
    edAF: TEdit;
    edHO: TEdit;
    edAO: TEdit;
    lblpersen: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lblBP: TLabel;
    lblS: TLabel;
    lblP: TLabel;
    lblF: TLabel;
    lblO: TLabel;
    btBack: TBitBtn;
    MatchdayData1: TMenuItem;
    PremierLeagueTeamData1: TMenuItem;
    cbbMatchday: TComboBox;
    lblApp: TLabel;
    TMatch: TTable;
    TMatchMatchCode: TStringField;
    TMatchMatchday: TFloatField;
    TMatchDate: TDateField;
    TMatchVenue: TStringField;
    TMatchHome: TStringField;
    TMatchAway: TStringField;
    TMatchHomeScore: TFloatField;
    TMatchAwayScore: TFloatField;
    TMatchHBP: TStringField;
    TMatchABP: TStringField;
    TMatchHS: TFloatField;
    TMatchAS: TFloatField;
    TMatchHSO: TFloatField;
    TMatchASO: TFloatField;
    TMatchHP: TStringField;
    TMatchAP: TStringField;
    TMatchHF: TFloatField;
    TMatchAF: TFloatField;
    TMatchHO: TFloatField;
    TMatchAO: TFloatField;
    TMatchResult: TStringField;
    DsMatch: TDataSource;
    RvDataSetConnection1: TRvDataSetConnection;
    RaveMatchCode: TRvProject;
    TDate: TTable;
    RaveDate: TRvProject;
    RvDataSetConnection2: TRvDataSetConnection;
    btReportDate: TBitBtn;
    Label10: TLabel;
    Logout1: TMenuItem;
    About1: TMenuItem;
    About2: TMenuItem;
    procedure FormActivate(Sender: TObject);

    procedure btExitClick(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure btDataTeamClick(Sender: TObject);
    procedure btDataMatchClick(Sender: TObject);
    procedure cbbHomeChange(Sender: TObject);
    procedure cbbAwayChange(Sender: TObject);
    procedure cbbDateChange(Sender: TObject);
    procedure edHomeScoreKeyPress(Sender: TObject; var Key: Char);
    procedure edAwayScoreKeyPress(Sender: TObject; var Key: Char);
    procedure btSimpanClick(Sender: TObject);
    procedure btShowDataClick(Sender: TObject);
    procedure btSimpanEditClick(Sender: TObject);
    procedure btResetClick(Sender: TObject);
    procedure btHapusClick(Sender: TObject);

    procedure edHBPKeyPress(Sender: TObject; var Key: Char);
    procedure edABPKeyPress(Sender: TObject; var Key: Char);
    procedure edHSKeyPress(Sender: TObject; var Key: Char);
    procedure edHSOKeyPress(Sender: TObject; var Key: Char);
    procedure edASKeyPress(Sender: TObject; var Key: Char);
    procedure edASOKeyPress(Sender: TObject; var Key: Char);
    procedure edHPKeyPress(Sender: TObject; var Key: Char);
    procedure edAPKeyPress(Sender: TObject; var Key: Char);
    procedure edHFKeyPress(Sender: TObject; var Key: Char);
    procedure edAFKeyPress(Sender: TObject; var Key: Char);
    procedure edHOKeyPress(Sender: TObject; var Key: Char);
    procedure edAOKeyPress(Sender: TObject; var Key: Char);
    procedure btReportMatchCodeClick(Sender: TObject);
    procedure btBackClick(Sender: TObject);
    procedure MenuUtama2Click(Sender: TObject);
    procedure MatchdayData1Click(Sender: TObject);
    procedure PremierLeagueTeamData1Click(Sender: TObject);
    procedure cbbMatchdayChange(Sender: TObject);
    procedure btReportDateClick(Sender: TObject);
    procedure Menu1Click(Sender: TObject);
    procedure Logout1Click(Sender: TObject);
    procedure About2Click(Sender: TObject);




  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fInputMatch: TfInputMatch;
  home,away,homecode,awaycode,venue,result :string;
  ada : boolean;

implementation

uses uFormLogin, uTeamData, uMatchData, uMenuUtama, uFormAbout;



{$R *.dfm}

procedure TfInputMatch.FormActivate(Sender: TObject);
var
  hMenuHandle: HMENU;
begin
  hMenuHandle:= GetSystemMenu(fInputMatch.Handle, FALSE);
  if (hMenuHandle <> 0) then
    DeleteMenu(hMenuHandle, SC_CLOSE, MF_BYCOMMAND);

cbbMatchday.SetFocus;
end;



procedure TfInputMatch.btExitClick(Sender: TObject);
begin
if(Application.MessageBox('Exit Program?','Confirmation',MB_YesNo)=ID_Yes) then
 begin
  Application.Terminate;
 end;
end;

procedure TfInputMatch.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
resize:=true;
end;




procedure TfInputMatch.btDataTeamClick(Sender: TObject);
begin
fMenuUtama.Hide;
fTeamData.Show;
end;

procedure TfInputMatch.btDataMatchClick(Sender: TObject);
begin
fMenuUtama.Hide;
fMatchData.Show;
end;



procedure TfInputMatch.cbbHomeChange(Sender: TObject);
begin
cbbAway.Enabled:=true;
cbbAway.SetFocus;
cbbHome.Enabled:=false;
end;

procedure TfInputMatch.cbbAwayChange(Sender: TObject);
begin
home:=cbbHome.Text;
away:=cbbAway.Text;


 if fTeamData.TTeam.FindKey([home]) then
  begin
   homecode:=fTeamData.TTeam['Team Code'];
   venue:=fTeamData.TTeam['Venue'];
  end;

 if fTeamData.TTeam.FindKey([away]) then
  begin
   awaycode:=fTeamData.TTeam['Team Code'];
  end;

lblCode.Caption:=cbbMatchday.Text+'-'+(homecode)+'v'+(awaycode);

//validasi edit//
TMatch.IndexName:='';
ada:=TMatch.FindKey([lblCode.Caption]);
 if ada then
  begin
   cbbDate.Time:=TMatch['Date'];
   edHomeScore.Text:=TMatch['Home Score'];
   edAwayScore.Text:=TMatch['Away Score'];
   edHBP.Text:=TMatch['HBP'];
   edABP.Text:=TMatch['ABP'];
   edHS.Text:=TMatch['HS'];
   edHSO.Text:=TMatch['HSO'];
   edAS.Text:=TMatch['AS'];
   edASO.Text:=TMatch['ASO'];
   edHP.Text:=TMatch['HP'];
   edAP.Text:=TMatch['AP'];
   edHF.Text:=TMatch['HF'];
   edAF.Text:=TMatch['AF'];
   edHO.Text:=TMatch['HO'];
   edAO.Text:=TMatch['AO'];
   btSimpanEdit.Enabled:=true;
   btSimpan.Enabled:=false;
   btHapus.Enabled:=true;
   cbbDate.Enabled:=true;
   edHomeScore.Enabled:=true;
   edAwayScore.Enabled:=true;
   edHBP.Enabled:=true;
   edABP.Enabled:=true;
   edHS.Enabled:=true;
   edHSO.Enabled:=true;
   edAS.Enabled:=true;
   edASO.Enabled:=true;
   edHP.Enabled:=true;
   edAP.Enabled:=true;
   edHF.Enabled:=true;
   edAF.Enabled:=true;
   edHO.Enabled:=true;
   edAO.Enabled:=true;
   Application.MessageBox('Match Data is already inputed!','Information',mb_iconinformation);
  end
 else
  begin
  edHomeScore.Clear;
edAwayScore.Clear;
   edHBP.Clear;
   edABP.Clear;
   edHS.Clear;
   edHSO.Clear;
   edAS.Clear;
   edASO.Clear;
   edHP.Clear;
   edAP.Clear;
   edHF.Clear;
   edAF.Clear;
   edHO.Clear;
   edAO.Clear;
btSimpanEdit.Enabled:=false;
btSimpan.Enabled:=false;
btHapus.Enabled:=false;
cbbMatchday.Enabled:=true;
cbbMatchday.SetFocus;
cbbDate.Enabled:=false;
edHomeScore.Enabled:=false;
edAwayScore.Enabled:=false;
   edHBP.Enabled:=false;
   edABP.Enabled:=false;
   edHS.Enabled:=false;
   edHSO.Enabled:=false;
   edAS.Enabled:=false;
   edASO.Enabled:=false;
   edHP.Enabled:=false;
   edAP.Enabled:=false;
   edHF.Enabled:=false;
   edAF.Enabled:=false;
   edHO.Enabled:=false;
   edAO.Enabled:=false;

   cbbDate.Enabled:=true;
   cbbDate.SetFocus;
   cbbAway.Enabled:=false;
   btSimpanEdit.Enabled:=false;
  end;
end;

procedure TfInputMatch.cbbDateChange(Sender: TObject);
begin
edHomeScore.Enabled:=true;
edHomeScore.SetFocus;
end;

procedure TfInputMatch.edHomeScoreKeyPress(Sender: TObject; var Key: Char);
begin
if not (key=chr(13)) then exit;
if edHomeScore.Text='' then
 begin
  Application.MessageBox('Data must be not null!','Warning!',mb_iconwarning);
  edHomeScore.SetFocus;
 end
else
 begin
  edAwayScore.Enabled:=true;
  edAwayScore.SetFocus;
 end;
 end;

procedure TfInputMatch.edAwayScoreKeyPress(Sender: TObject; var Key: Char);
begin
if not (key=chr(13)) then exit;
if edAwayScore.Text='' then
 begin
  Application.MessageBox('Data must be not null!','Warning!',mb_iconwarning);
  edAwayScore.SetFocus;
 end
else
 begin
  edHBP.Enabled:=true;
  edHBP.SetFocus;
end;
end;



procedure TfInputMatch.btSimpanClick(Sender: TObject);
begin
 if StrToInt(edHomeScore.Text)>StrToInt(edAwayScore.Text) then
  begin
   result:=cbbHome.Text+' '+'Wins';
  end
 else
 if StrToInt(edHomeScore.Text)<StrToInt(edAwayScore.Text) then
  begin
   result:=cbbAway.Text+' '+'Wins';
  end
 else
 if StrToInt(edHomeScore.Text)=StrToInt(edAwayScore.Text) then
  begin
   result:='Draw';
  end;

TMatch.Append;
TMatch['Match Code']:=lblCode.Caption;
TMatch['Matchday']:=cbbMatchday.Text;
TMatch['Date']:=cbbDate.Time;
TMatch['Venue']:=venue;
TMatch['Home']:=cbbHome.Text;
TMatch['Away']:=cbbAway.Text;
TMatch['Home Score']:=edHomeScore.Text;
TMatch['Away Score']:=edAwayScore.Text;
TMatch['HBP']:=edHBP.Text+'%';
TMatch['ABP']:=edABP.Text+'%';
TMatch['HS']:=edHS.Text;
TMatch['AS']:=edAS.Text;
TMatch['HSO']:=edHSO.Text;
TMatch['ASO']:=edASO.Text;
TMatch['HP']:=edHP.Text+'%';
TMatch['AP']:=edAP.Text+'%';
TMatch['HF']:=edHF.Text;
TMatch['AF']:=edAF.Text;
TMatch['HO']:=edHO.Text;
TMatch['AO']:=edAO.Text;
TMatch['Result']:=result;
TMatch.Post;
Application.MessageBox('Match Data Successfully Saved!','Success!',mb_iconinformation);
btResetClick(sender);
end;

procedure TfInputMatch.btShowDataClick(Sender: TObject);
begin
fInputMatch.Hide;
fMatchData.Show;
end;

procedure TfInputMatch.btSimpanEditClick(Sender: TObject);
begin
 if StrToInt(edHomeScore.Text)>StrToInt(edAwayScore.Text) then
  begin
   result:=cbbHome.Text+' '+'Wins';
  end
 else
 if StrToInt(edHomeScore.Text)<StrToInt(edAwayScore.Text) then
  begin
   result:=cbbAway.Text+' '+'Wins';
  end
 else
 if StrToInt(edHomeScore.Text)=StrToInt(edAwayScore.Text) then
  begin
   result:='Draw';
  end;

TMatch.Edit;
TMatch['Match Code']:=lblCode.Caption;
TMatch['Matchday']:=cbbMatchday.Text;
TMatch['Date']:=cbbDate.Time;
TMatch['Venue']:=venue;
TMatch['Home']:=cbbHome.Text;
TMatch['Away']:=cbbAway.Text;
TMatch['Home Score']:=edHomeScore.Text;
TMatch['Away Score']:=edAwayScore.Text;
TMatch['HBP']:=edHBP.Text+'%';
TMatch['ABP']:=edABP.Text+'%';
TMatch['HS']:=edHS.Text;
TMatch['AS']:=edAS.Text;
TMatch['HSO']:=edHSO.Text;
TMatch['ASO']:=edASO.Text;
TMatch['HP']:=edHP.Text+'%';
TMatch['AP']:=edAP.Text+'%';
TMatch['HF']:=edHF.Text;
TMatch['AF']:=edAF.Text;
TMatch['HO']:=edHO.Text;
TMatch['AO']:=edAO.Text;
TMatch['Result']:=result;
TMatch.Post;
Application.MessageBox('Match Data Successfully Edited!','Success!',mb_iconinformation);
btResetClick(sender);
end;

procedure TfInputMatch.btResetClick(Sender: TObject);
begin
cbbMatchday.Text:='';;
cbbHome.Text:='';
cbbAway.Text:='';
lblCode.Caption:='';
edHomeScore.Clear;
edAwayScore.Clear;
   edHBP.Clear;
   edABP.Clear;
   edHS.Clear;
   edHSO.Clear;
   edAS.Clear;
   edASO.Clear;
   edHP.Clear;
   edAP.Clear;
   edHF.Clear;
   edAF.Clear;
   edHO.Clear;
   edAO.Clear;
btSimpanEdit.Enabled:=false;
btSimpan.Enabled:=false;
btHapus.Enabled:=false;
cbbMatchday.Enabled:=true;
cbbMatchday.SetFocus;
cbbDate.Enabled:=false;
edHomeScore.Enabled:=false;
edAwayScore.Enabled:=false;
   edHBP.Enabled:=false;
   edABP.Enabled:=false;
   edHS.Enabled:=false;
   edHSO.Enabled:=false;
   edAS.Enabled:=false;
   edASO.Enabled:=false;
   edHP.Enabled:=false;
   edAP.Enabled:=false;
   edHF.Enabled:=false;
   edAF.Enabled:=false;
   edHO.Enabled:=false;
   edAO.Enabled:=false;
end;

procedure TfInputMatch.btHapusClick(Sender: TObject);
begin
if(Application.MessageBox('Delete Data?','Confirmation',MB_YesNo)=ID_Yes) then
 begin
TMatch.FindKey([lblCode.Caption]);
TMatch.Delete;
 end;
  Application.MessageBox('Data Successfully Deleted!','Information',mb_iconinformation);
  btResetClick(sender);
 end;



procedure TfInputMatch.edHBPKeyPress(Sender: TObject; var Key: Char);
begin
if not (key=chr(13)) then exit;
if edHBP.Text='' then
 begin
  Application.MessageBox('Data must be not null!','Warning!',mb_iconwarning);
  edHBP.SetFocus;
 end
else
 begin
  edABP.Enabled:=true;
  edABP.SetFocus;
end;
end;

procedure TfInputMatch.edABPKeyPress(Sender: TObject; var Key: Char);
begin
if not (key=chr(13)) then exit;
if edABP.Text='' then
 begin
  Application.MessageBox('Data must be not null!','Warning!',mb_iconwarning);
  edABP.SetFocus;
 end
else
 begin
  edHS.Enabled:=true;
  edHS.SetFocus;
end;
end;

procedure TfInputMatch.edHSKeyPress(Sender: TObject; var Key: Char);
begin
if not (key=chr(13)) then exit;
if edHS.Text='' then
 begin
  Application.MessageBox('Data must be not null!','Warning!',mb_iconwarning);
  edHS.SetFocus;
 end
else
 begin
  edHSO.Enabled:=true;
  edHSO.SetFocus;
end;
end;

procedure TfInputMatch.edHSOKeyPress(Sender: TObject; var Key: Char);
begin
if not (key=chr(13)) then exit;
if edHSO.Text='' then
 begin
  Application.MessageBox('Data must be not null!','Warning!',mb_iconwarning);
  edHSO.SetFocus;
 end
else
 begin
  edAS.Enabled:=true;
  edAS.SetFocus;
end;
end;

procedure TfInputMatch.edASKeyPress(Sender: TObject; var Key: Char);
begin
if not (key=chr(13)) then exit;
if edAS.Text='' then
 begin
  Application.MessageBox('Data must be not null!','Warning!',mb_iconwarning);
  edAS.SetFocus;
 end
else
 begin
  edASO.Enabled:=true;
  edASO.SetFocus;
end;
end;

procedure TfInputMatch.edASOKeyPress(Sender: TObject; var Key: Char);
begin
if not (key=chr(13)) then exit;
if edASO.Text='' then
 begin
  Application.MessageBox('Data must be not null!','Warning!',mb_iconwarning);
  edASO.SetFocus;
 end
else
 begin
  edHP.Enabled:=true;
  edHP.SetFocus;
end;
end;

procedure TfInputMatch.edHPKeyPress(Sender: TObject; var Key: Char);
begin
if not (key=chr(13)) then exit;
if edHP.Text='' then
 begin
  Application.MessageBox('Data must be not null!','Warning!',mb_iconwarning);
  edHP.SetFocus;
 end
else
 begin
  edAP.Enabled:=true;
  edAP.SetFocus;
end;
end;

procedure TfInputMatch.edAPKeyPress(Sender: TObject; var Key: Char);
begin
if not (key=chr(13)) then exit;
if edAP.Text='' then
 begin
  Application.MessageBox('Data must be not null!','Warning!',mb_iconwarning);
  edAP.SetFocus;
 end
else
 begin
  edHF.Enabled:=true;
  edHF.SetFocus;
end;
end;

procedure TfInputMatch.edHFKeyPress(Sender: TObject; var Key: Char);
begin
if not (key=chr(13)) then exit;
if edHF.Text='' then
 begin
  Application.MessageBox('Data must be not null!','Warning!',mb_iconwarning);
  edHF.SetFocus;
 end
else
 begin
  edAF.Enabled:=true;
  edAF.SetFocus;
end;
end;

procedure TfInputMatch.edAFKeyPress(Sender: TObject; var Key: Char);
begin
if not (key=chr(13)) then exit;
if edAF.Text='' then
 begin
  Application.MessageBox('Data must be not null!','Warning!',mb_iconwarning);
  edAF.SetFocus;
 end
else
 begin
  edHO.Enabled:=true;
  edHO.SetFocus;
end;
end;

procedure TfInputMatch.edHOKeyPress(Sender: TObject; var Key: Char);
begin
if not (key=chr(13)) then exit;
if edHO.Text='' then
 begin
  Application.MessageBox('Data must be not null!','Warning!',mb_iconwarning);
  edHO.SetFocus;
 end
else
 begin
  edAO.Enabled:=true;
  edAO.SetFocus;
end;
end;

procedure TfInputMatch.edAOKeyPress(Sender: TObject; var Key: Char);
begin
if not (key=chr(13)) then exit;
if edAO.Text='' then
 begin
  Application.MessageBox('Data must be not null!','Warning!',mb_iconwarning);
  edAO.SetFocus;
 end
else
 begin
  if ada then
   begin
    btSimpanEdit.SetFocus;
   end
  else
   begin
  btSimpan.Enabled:=true;
  btSimpan.SetFocus;
  end;
  end;
end;

procedure TfInputMatch.btReportMatchCodeClick(Sender: TObject);
begin
RaveMatchCode.Execute;
end;

procedure TfInputMatch.btBackClick(Sender: TObject);
begin
fInputMatch.Hide;
fMenuUtama.Show;
end;

procedure TfInputMatch.MenuUtama2Click(Sender: TObject);
begin
fInputMatch.Hide;
fMenuUtama.Show;
end;

procedure TfInputMatch.MatchdayData1Click(Sender: TObject);
begin
fInputMatch.Hide;
fMatchData.Show;
end;

procedure TfInputMatch.PremierLeagueTeamData1Click(Sender: TObject);
begin
fInputMatch.Hide;
fTeamData.Show;
end;

procedure TfInputMatch.cbbMatchdayChange(Sender: TObject);
begin
cbbHome.Enabled:=true;
cbbHome.SetFocus;
end;

procedure TfInputMatch.btReportDateClick(Sender: TObject);
begin
RaveDate.Execute;
end;

procedure TfInputMatch.Menu1Click(Sender: TObject);
begin
if(Application.MessageBox('Exit Program?','Confirmation',MB_YesNo)=ID_Yes) then
 begin
  Application.Terminate;
 end;
end;

procedure TfInputMatch.Logout1Click(Sender: TObject);
begin
fInputMatch.Hide;
fMenuUtama.btLogoutClick(sender);
end;

procedure TfInputMatch.About2Click(Sender: TObject);
begin
fAbout.Show;
end;

end.
