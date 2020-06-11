program Troco;

uses
  Vcl.Forms,
  uIMaquina in 'uIMaquina.pas',
  uMaquina in 'uMaquina.pas',
  UnitPrincipal in 'UnitPrincipal.pas' {FormPrincipal},
  uTroco in 'uTroco.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
