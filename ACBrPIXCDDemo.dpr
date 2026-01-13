program ACBrPIXCDDemo;

uses
  Vcl.Forms,
  unt.view.principal in 'src\view\unt.view.principal.pas' {frmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
