program ACBrPIXCDDemo;

uses
  Vcl.Forms,
  untPrincipal in 'src\view\untPrincipal.pas' {frmPrincipal},
  untChavePixCadastro in 'src\view\untChavePixCadastro.pas' {frmConfigPSPPix},
  untExibirDevolucaoPIX in 'src\view\untExibirDevolucaoPIX.pas' {frmExibirDevolucaoPIX},
  untExibirQrCodePIX in 'src\view\untExibirQrCodePIX.pas' {frmExibirQrCodePIX},
  untChavePix in 'src\view\untChavePix.pas' {frmLocContaBancaria},
  untDmConexao in 'src\data.module\untDmConexao.pas' {frmDmConexao: TDataModule},
  untGerarCobranca in 'src\view\untGerarCobranca.pas' {frmGerarCobranca};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmConfigPSPPix, frmConfigPSPPix);
  Application.CreateForm(TfrmExibirDevolucaoPIX, frmExibirDevolucaoPIX);
  Application.CreateForm(TfrmExibirQrCodePIX, frmExibirQrCodePIX);
  Application.CreateForm(TfrmLocContaBancaria, frmLocContaBancaria);
  Application.CreateForm(TfrmDmConexao, frmDmConexao);
  Application.CreateForm(TfrmGerarCobranca, frmGerarCobranca);
  Application.Run;
end.
