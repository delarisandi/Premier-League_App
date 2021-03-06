unit uLoading;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, ComCtrls, StdCtrls, pngimage;

type
  TfFormLoading = class(TForm)
    TimerLoading: TTimer;
    LoadingBar: TProgressBar;
    PL: TImage;
    TimerBlend: TTimer;
    procedure TimerLoadingTimer(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure TimerBlendTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fFormLoading: TfFormLoading;

implementation

uses uFormLogin;

{$R *.dfm}

procedure TfFormLoading.TimerBlendTimer(Sender: TObject);
begin
fFormLoading.AlphaBlendValue:=fFormLoading.AlphaBlendValue+1;
 if fFormLoading.AlphaBlendValue=255 then
  begin
    TimerBlend.Enabled:=false;
    TimerLoading.Enabled:=true;
  end;
end;

procedure TfFormLoading.TimerLoadingTimer(Sender: TObject);
begin
 if LoadingBar.Position=100 then
  begin
    fFormLoading.Hide;
    fFormLogin.Show;
    TimerLoading.Enabled:=false;
  end
else
 begin
    LoadingBar.Position:=LoadingBar.Position+3;
  end;
end;

procedure TfFormLoading.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
resize:=false;
end;



end.
