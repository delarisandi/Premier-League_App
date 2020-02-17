program pProjectBesarStevan;

uses
  Forms,
  uFormLogin in 'uFormLogin.pas' {fFormLogin},
  uMenuUtama in 'uMenuUtama.pas' {fMenuUtama},
  uTeamData in 'uTeamData.pas' {fTeamData},
  uMatchData in 'uMatchData.pas' {fMatchData},
  uInputMatch in 'uInputMatch.pas' {fInputMatch},
  uLoading in 'uLoading.pas' {fFormLoading},
  uFormAbout in 'uFormAbout.pas' {fAbout};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Premier League 2016/2017 Application';
  Application.CreateForm(TfFormLoading, fFormLoading);
  Application.CreateForm(TfFormLogin, fFormLogin);
  Application.CreateForm(TfMenuUtama, fMenuUtama);
  Application.CreateForm(TfTeamData, fTeamData);
  Application.CreateForm(TfMatchData, fMatchData);
  Application.CreateForm(TfInputMatch, fInputMatch);
  Application.CreateForm(TfAbout, fAbout);
  Application.Run;
end.
