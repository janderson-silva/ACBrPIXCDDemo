program ACBrPIXCDDemo;

uses
  Vcl.Forms,
  untPrincipal in 'src\view\untPrincipal.pas' {frmPrincipal},
  untChavePixCadastro in 'src\view\untChavePixCadastro.pas' {frmChavePixCadastro},
  untExibirDevolucaoPIX in 'src\view\untExibirDevolucaoPIX.pas' {frmExibirDevolucaoPIX},
  untExibirQrCodePIX in 'src\view\untExibirQrCodePIX.pas' {frmExibirQrCodePIX},
  untChavePix in 'src\view\untChavePix.pas' {frmChavePix},
  untDmConexao in 'src\data.module\untDmConexao.pas' {frmDmConexao: TDataModule},
  untGerarCobranca in 'src\view\untGerarCobranca.pas' {frmGerarCobranca},
  untCobranca in 'src\view\untCobranca.pas' {frmCobranca},
  untConfigBancoDados in 'src\view\untConfigBancoDados.pas' {frmConfigBancoDados};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmDmConexao, frmDmConexao);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
