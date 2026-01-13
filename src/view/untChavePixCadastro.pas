unit untChavePixCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Samples.Spin, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList,
  ACBrPIXCD, TypInfo, FireDAC.Comp.Client, FireDAC.Stan.Param, ACBrUtil.Base, ACBrUtil.Strings,
  ACBrBase, ACBrOpenSSLUtils, DB;

type
  TfrmChavePixCadastro = class(TForm)
    pnlHeader: TPanel;
    shpIcone: TShape;
    lblIcone: TLabel;
    lblTitulo: TLabel;
    lblSubtitulo: TLabel;
    ScrollBox1: TScrollBox;
    gbDadosBasicos: TGroupBox;
    pnlRazaoSocial: TPanel;
    lblRazaoSocial: TLabel;
    edtRazaoSocial: TEdit;
    pnlCEP: TPanel;
    lblCEP: TLabel;
    edtCEP: TEdit;
    pnlCidade: TPanel;
    lblCidade: TLabel;
    edtCidade: TEdit;
    pnlUF: TPanel;
    lblUF: TLabel;
    cbxUF: TComboBox;
    pnlTipoChave: TPanel;
    lblTipoChave: TLabel;
    cbxTipoChave: TComboBox;
    pnlChave: TPanel;
    lblChave: TLabel;
    edtChave: TEdit;
    gbPSP: TGroupBox;
    pnPSP: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    cbxPSPAtual: TComboBox;
    cbxAmbiente: TComboBox;
    seTimeout: TSpinEdit;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    pnlConfig4: TPanel;
    lblTitulo4: TLabel;
    edtConfig4: TEdit;
    pnlConfig5: TPanel;
    lblTitulo5: TLabel;
    edtConfig5: TEdit;
    pnlConfig6: TPanel;
    lblTitulo6: TLabel;
    edtConfig6: TEdit;
    pnlConfig1: TPanel;
    lblTitulo1: TLabel;
    edtConfig1: TEdit;
    pnlConfig2: TPanel;
    lblTitulo2: TLabel;
    edtConfig2: TEdit;
    pnlConfig3: TPanel;
    lblTitulo3: TLabel;
    edtConfig3: TEdit;
    tsCertificado: TTabSheet;
    pnlCertificados: TPanel;
    lblCertificados: TLabel;
    pnlArquivoPFX: TPanel;
    lblArquivoPFX: TLabel;
    edtArquivoPFX: TEdit;
    btnArquivoPFX: TButton;
    pnlSenhaPFX: TPanel;
    lblSenhaPFX: TLabel;
    edtSenhaPFX: TEdit;
    pnlArquivoChavePrivada: TPanel;
    lblArquivoChavePrivada: TLabel;
    edtArquivoChavePrivada: TEdit;
    btnArquivoChavePrivada: TButton;
    pnlArquivoCertificado: TPanel;
    lblArquivoCertificado: TLabel;
    edtArquivoCertificado: TEdit;
    btnArquivoCertificado: TButton;
    OpenDialog: TOpenDialog;
    img_icon_preto_pgc: TImageList;
    PanelBotao: TPanel;
    bgravar: TButton;
    pnlExtrairChaveCertificado: TPanel;
    btnExtrairChaveCertificado: TButton;
    ACBrOpenSSLUtils1: TACBrOpenSSLUtils;
    procedure btnArquivoPFXClick(Sender: TObject);
    procedure btnArquivoChavePrivadaClick(Sender: TObject);
    procedure btnArquivoCertificadoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbxPSPAtualChange(Sender: TObject);
    procedure bgravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtArquivoPFXChange(Sender: TObject);
    procedure edtSenhaPFXChange(Sender: TObject);
    procedure btnExtrairChaveCertificadoClick(Sender: TObject);
  private
    { Private declarations }
    FCodigoChavePix: String;
    FModoEdicao: Boolean;
    procedure InicializarComponentesDefault;
    procedure ConfigurarCamposPorPSP(IndicePSP: Integer);
    procedure OcultarTodosCampos;
    procedure SalvarConfiguracaoPSP;
    procedure CarregarConfiguracaoPSP;
    procedure LimparFormulario;
    procedure CarregarDados;
    procedure ValidarBotaoExtrairChave;
    function ExportarBlobParaArquivo(AField: TField; const ANomeArquivo, APSP: string): string;
  public
    { Public declarations }
    property CodigoChavePix: String read FCodigoChavePix write FCodigoChavePix;
    property ModoEdicao: Boolean read FModoEdicao write FModoEdicao;
  end;

var
  frmChavePixCadastro: TfrmChavePixCadastro;

implementation

uses untDmConexao;

{$R *.dfm}

procedure TfrmChavePixCadastro.btnArquivoCertificadoClick(Sender: TObject);
begin
  OpenDialog.Filter := 'Certificado|*.pem;*.crt;*.cer|Todos os arquivos|*.*';
  OpenDialog.FileName := '';
  if OpenDialog.Execute then
    edtArquivoCertificado.Text := OpenDialog.FileName;
end;

procedure TfrmChavePixCadastro.btnArquivoChavePrivadaClick(Sender: TObject);
begin
  OpenDialog.Filter := 'Chave Privada|*.key;*.pem|Todos os arquivos|*.*';
  OpenDialog.FileName := '';
  if OpenDialog.Execute then
    edtArquivoChavePrivada.Text := OpenDialog.FileName;
end;

procedure TfrmChavePixCadastro.btnArquivoPFXClick(Sender: TObject);
begin
  OpenDialog.Filter := 'Certificado PFX/P12|*.pfx;*.p12|Todos os arquivos|*.*';
  OpenDialog.FileName := '';
  if OpenDialog.Execute then
    edtArquivoPFX.Text := OpenDialog.FileName;
end;

procedure TfrmChavePixCadastro.btnExtrairChaveCertificadoClick(Sender: TObject);
var
  wArqPEM, wChave, wDiretorio, wNomePSP: String;
  wSL: TStringList;
begin
  if EstaVazio(edtArquivoPFX.Text) or (not FileExists(edtArquivoPFX.Text)) then
  begin
    MessageDlg(ACBrStr('Arquivo PFX não informado/existe'), mtError, [mbOK], 0);
    Exit;
  end;

  if cbxPSPAtual.ItemIndex < 0 then
  begin
    MessageDlg('Selecione um PSP!', mtError, [mbOK], 0);
    Exit;
  end;

  // Obter nome do PSP selecionado e formatar para nome de pasta
  wNomePSP := LowerCase(StringReplace(cbxPSPAtual.Text, ' ', '', [rfReplaceAll]));
  
  // Criar estrutura de diretórios C:\Atron\temp\pix\{psp}
  wDiretorio := 'C:\Atron\temp\pix\' + wNomePSP + '\';
  
  if not DirectoryExists(wDiretorio) then
    ForceDirectories(wDiretorio);

  wSL := TStringList.Create;
  try
    wChave := wDiretorio + 'CertificadoKey.key';
    wArqPEM := wDiretorio + 'CertificadoPem.pem';

    try
      ACBrOpenSSLUtils1.LoadPFXFromFile(edtArquivoPFX.Text, edtSenhaPFX.Text);
    except
      on E: Exception do
      begin
        MessageDlg(
          'Erro ao carregar o certificado PFX.' + sLineBreak + sLineBreak +
          'Possíveis causas:' + sLineBreak +
          '• Senha incorreta' + sLineBreak +
          '• Arquivo PFX corrompido ou inválido' + sLineBreak +
          '• Certificado incompatível' + sLineBreak + sLineBreak +
          'Erro técnico: ' + E.Message,
          mtError, [mbOK], 0);
        Exit;
      end;
    end;

    // Salvando arquivo Chave Privada
    wSL.Text := ACBrOpenSSLUtils1.PrivateKeyAsString;
    wSL.SaveToFile(wChave);

    // Salvando arquivo Certificado
    wSL.Text := ACBrOpenSSLUtils1.CertificateAsString;
    wSL.SaveToFile(wArqPEM);

    // Exibindo diretorio no edit
    edtArquivoChavePrivada.Text := wChave;
    edtArquivoCertificado.Text := wArqPEM;

    MessageDlg(
      'Certificados extraídos com sucesso!' + sLineBreak + sLineBreak +
      '• Chave Privada: ' + wChave + sLineBreak + sLineBreak +
      '• Certificado PEM: ' + wArqPEM,
      mtInformation, [mbOK], 0);
  finally
    wSL.Free;
  end;
end;

procedure TfrmChavePixCadastro.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  InicializarComponentesDefault;
  OcultarTodosCampos;
end;

procedure TfrmChavePixCadastro.FormShow(Sender: TObject);
begin
  CarregarDados;
  ValidarBotaoExtrairChave;
end;

procedure TfrmChavePixCadastro.cbxPSPAtualChange(Sender: TObject);
var
  PSPSelecionado: string;
  PSPsImplementados: array[0..1] of string;
  PSPValido: Boolean;
  i: Integer;
begin
  // Lista de PSPs com integração implementada
  PSPsImplementados[0] := 'AppLess';
  PSPsImplementados[1] := 'Sicoob';

  // Verificar se o PSP selecionado está implementado
  if cbxPSPAtual.ItemIndex >= 0 then
  begin
    PSPSelecionado := cbxPSPAtual.Items[cbxPSPAtual.ItemIndex];
    PSPValido := False;

    for i := Low(PSPsImplementados) to High(PSPsImplementados) do
    begin
      if PSPSelecionado = PSPsImplementados[i] then
      begin
        PSPValido := True;
        Break;
      end;
    end;

    // Se o PSP não está implementado, mostrar mensagem e limpar seleção
    if not PSPValido then
    begin
      Application.MessageBox(
        PChar('A integração com o PSP "' + PSPSelecionado + '" ainda não foi implementada no sistema.' + #13#10 +
              'Por favor, selecione AppLess ou Sicoob.'),
        'PSP Não Disponível',
        MB_OK + MB_ICONINFORMATION);
      
      cbxPSPAtual.ItemIndex := -1;
      OcultarTodosCampos;
      Exit;
    end;
  end;

  ConfigurarCamposPorPSP(cbxPSPAtual.ItemIndex);
end;

procedure TfrmChavePixCadastro.bgravarClick(Sender: TObject);
begin
  // Validar campos obrigatórios
  if Trim(edtRazaoSocial.Text) = '' then
  begin
    Application.MessageBox('Informe a Razão Social!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    edtRazaoSocial.SetFocus;
    Exit;
  end;
  
  if cbxTipoChave.ItemIndex < 0 then
  begin
    Application.MessageBox('Selecione o Tipo de Chave!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    cbxTipoChave.SetFocus;
    Exit;
  end;
  
  if Trim(edtChave.Text) = '' then
  begin
    Application.MessageBox('Informe a Chave PIX!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    edtChave.SetFocus;
    Exit;
  end;
  
  if cbxPSPAtual.ItemIndex < 0 then
  begin
    Application.MessageBox('Selecione um PSP!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    cbxPSPAtual.SetFocus;
    Exit;
  end;

  SalvarConfiguracaoPSP;
  ModalResult := mrOk;
  Close;
end;

procedure TfrmChavePixCadastro.OcultarTodosCampos;
begin
  pnlConfig1.Visible := False;
  pnlConfig2.Visible := False;
  pnlConfig3.Visible := False;
  pnlConfig4.Visible := False;
  pnlConfig5.Visible := False;
  pnlConfig6.Visible := False;
  pnlArquivoPFX.Visible := False;
  pnlSenhaPFX.Visible := False;
  pnlExtrairChaveCertificado.Visible := False;
  btnExtrairChaveCertificado.Enabled := False;
  pnlArquivoChavePrivada.Visible := False;
  pnlArquivoCertificado.Visible := False;
end;

procedure TfrmChavePixCadastro.ConfigurarCamposPorPSP(IndicePSP: Integer);
begin
  OcultarTodosCampos;
  
  case IndicePSP of
    0: // Shipay
    begin
      lblTitulo1.Caption := 'Client ID';
      pnlConfig1.Visible := True;
      
      lblTitulo2.Caption := 'Secret Key';
      pnlConfig2.Visible := True;
      
      lblTitulo3.Caption := 'Access Key';
      pnlConfig3.Visible := True;
    end;
    
    1: // Banco do Brasil
    begin
      lblTitulo1.Caption := 'Client ID';
      pnlConfig1.Visible := True;
      
      lblTitulo2.Caption := 'Client Secret';
      pnlConfig2.Visible := True;
      
      lblTitulo3.Caption := 'Developer Application Key';
      pnlConfig3.Visible := True;
      
      pnlArquivoPFX.Visible := True;
      pnlSenhaPFX.Visible := True;
      pnlArquivoChavePrivada.Visible := True;
      pnlArquivoCertificado.Visible := True;
    end;
    
    2: // Itaú
    begin
      lblTitulo1.Caption := 'Client ID';
      pnlConfig1.Visible := True;
      
      lblTitulo2.Caption := 'Client Secret';
      pnlConfig2.Visible := True;
      
      pnlArquivoChavePrivada.Visible := True;
      pnlArquivoCertificado.Visible := True;
    end;
    
    3: // Santander
    begin
      lblTitulo1.Caption := 'Consumer Key';
      pnlConfig1.Visible := True;
      
      lblTitulo2.Caption := 'Consumer Secret';
      pnlConfig2.Visible := True;
      
      pnlArquivoPFX.Visible := True;
      pnlSenhaPFX.Visible := True;
    end;
    
    4: // Sicredi
    begin
      lblTitulo1.Caption := 'Client ID';
      pnlConfig1.Visible := True;
      
      lblTitulo2.Caption := 'Client Secret';
      pnlConfig2.Visible := True;
      
      pnlArquivoChavePrivada.Visible := True;
      pnlArquivoCertificado.Visible := True;
    end;
    
    5: // Sicoob
    begin
      lblTitulo1.Caption := 'Client ID';
      pnlConfig1.Visible := True;
      
      lblTitulo2.Caption := 'Token Sandbox';
      pnlConfig2.Visible := True;

      pnlArquivoPFX.Visible := True;
      pnlSenhaPFX.Visible := True;
      pnlExtrairChaveCertificado.Visible := True;
      pnlArquivoChavePrivada.Visible := True;
      pnlArquivoCertificado.Visible := True;
    end;
    
    6: // PagSeguro
    begin
      lblTitulo1.Caption := 'Client ID';
      pnlConfig1.Visible := True;
      
      lblTitulo2.Caption := 'Client Secret';
      pnlConfig2.Visible := True;
      
      pnlArquivoChavePrivada.Visible := True;
      pnlArquivoCertificado.Visible := True;
    end;
    
    7: // GerenciaNet
    begin
      lblTitulo1.Caption := 'Client ID';
      pnlConfig1.Visible := True;
      
      lblTitulo2.Caption := 'Client Secret';
      pnlConfig2.Visible := True;
      
      pnlArquivoPFX.Visible := True;
    end;
    
    8: // Bradesco
    begin
      lblTitulo1.Caption := 'Client ID';
      pnlConfig1.Visible := True;
      
      lblTitulo2.Caption := 'Client Secret';
      pnlConfig2.Visible := True;
      
      pnlArquivoPFX.Visible := True;
      pnlSenhaPFX.Visible := True;
      pnlArquivoChavePrivada.Visible := True;
      pnlArquivoCertificado.Visible := True;
    end;
    
    9: // PIXPDV
    begin
      lblTitulo1.Caption := 'CNPJ';
      pnlConfig1.Visible := True;
      
      lblTitulo2.Caption := 'Token';
      pnlConfig2.Visible := True;
      
      lblTitulo3.Caption := 'Client Secret (Secret Key)';
      pnlConfig3.Visible := True;
    end;
    
    10: // Inter
    begin
      lblTitulo1.Caption := 'Client ID';
      pnlConfig1.Visible := True;
      
      lblTitulo2.Caption := 'Client Secret';
      pnlConfig2.Visible := True;
      
      pnlArquivoChavePrivada.Visible := True;
      pnlArquivoCertificado.Visible := True;
    end;
    
    11: // Ailos
    begin
      lblTitulo1.Caption := 'Client ID';
      pnlConfig1.Visible := True;
      
      lblTitulo2.Caption := 'Client Secret';
      pnlConfig2.Visible := True;
      
      pnlArquivoChavePrivada.Visible := True;
      pnlArquivoCertificado.Visible := True;
    end;
    
    12: // Matera
    begin
      lblTitulo1.Caption := 'Client ID';
      pnlConfig1.Visible := True;
      
      lblTitulo2.Caption := 'Client Secret';
      pnlConfig2.Visible := True;
      
      lblTitulo3.Caption := 'Account ID';
      pnlConfig3.Visible := True;
      
      lblTitulo4.Caption := 'Secret Key';
      pnlConfig4.Visible := True;
      
      lblTitulo5.Caption := 'Mediator Fee';
      pnlConfig5.Visible := True;
      
      pnlArquivoChavePrivada.Visible := True;
      pnlArquivoCertificado.Visible := True;
    end;
    
    13: // Cielo
    begin
      lblTitulo1.Caption := 'Client ID';
      pnlConfig1.Visible := True;
      
      lblTitulo2.Caption := 'Client Secret';
      pnlConfig2.Visible := True;
    end;
    
    14: // Mercado Pago
    begin
      lblTitulo1.Caption := 'Access Token';
      pnlConfig1.Visible := True;
    end;
    
    15: // Gate2All
    begin
      lblTitulo1.Caption := 'Authentication API';
      pnlConfig1.Visible := True;
      
      lblTitulo2.Caption := 'Authentication Key';
      pnlConfig2.Visible := True;
    end;
    
    16: // Banrisul
    begin
      lblTitulo1.Caption := 'Client ID';
      pnlConfig1.Visible := True;
      
      lblTitulo2.Caption := 'Client Secret';
      pnlConfig2.Visible := True;
      
      pnlArquivoPFX.Visible := True;
      pnlSenhaPFX.Visible := True;
    end;
    
    17: // C6 Bank
    begin
      lblTitulo1.Caption := 'Client ID';
      pnlConfig1.Visible := True;
      
      lblTitulo2.Caption := 'Client Secret';
      pnlConfig2.Visible := True;
      
      pnlArquivoChavePrivada.Visible := True;
      pnlArquivoCertificado.Visible := True;
    end;
    
    18: // AppLess
    begin
      lblTitulo1.Caption := 'Client ID';
      pnlConfig1.Visible := True;
      
      lblTitulo2.Caption := 'Client Secret';
      pnlConfig2.Visible := True;
      
      lblTitulo3.Caption := 'Secret Key HMAC';
      pnlConfig3.Visible := True;
    end;
  end;
end;

procedure TfrmChavePixCadastro.edtArquivoPFXChange(Sender: TObject);
begin
  ValidarBotaoExtrairChave;
end;

procedure TfrmChavePixCadastro.edtSenhaPFXChange(Sender: TObject);
begin
  ValidarBotaoExtrairChave;
end;

procedure TfrmChavePixCadastro.InicializarComponentesDefault;
var
  j: TACBrPixCDAmbiente;
begin
  //PSP's
  cbxPSPAtual.Items.Clear;
  cbxPSPAtual.Items.Add('Shipay');
  cbxPSPAtual.Items.Add('Banco do Brasil');
  cbxPSPAtual.Items.Add('Itaú');
  cbxPSPAtual.Items.Add('Santander');
  cbxPSPAtual.Items.Add('Sicredi');
  cbxPSPAtual.Items.Add('Sicoob');
  cbxPSPAtual.Items.Add('PagSeguro');
  cbxPSPAtual.Items.Add('GerenciaNet');
  cbxPSPAtual.Items.Add('Bradesco');
  cbxPSPAtual.Items.Add('PIXPDV');
  cbxPSPAtual.Items.Add('Inter');
  cbxPSPAtual.Items.Add('Ailos');
  cbxPSPAtual.Items.Add('Matera');
  cbxPSPAtual.Items.Add('Cielo');
  cbxPSPAtual.Items.Add('Mercado Pago');
  cbxPSPAtual.Items.Add('Gate2All');
  cbxPSPAtual.Items.Add('Banrisul');
  cbxPSPAtual.Items.Add('C6 Bank');
  cbxPSPAtual.Items.Add('AppLess');

  //Ambientes
  cbxAmbiente.Items.Clear;
  for j := Low(TACBrPixCDAmbiente) to High(TACBrPixCDAmbiente) do
     cbxAmbiente.Items.Add( GetEnumName(TypeInfo(TACBrPixCDAmbiente), integer(j) ));

  //TimeOut
  seTimeout.Value := 90000;
end;

procedure TfrmChavePixCadastro.SalvarConfiguracaoPSP;
var
  qrUpdate: TFDQuery;
  SQL: TStringList;
begin
  qrUpdate := TFDQuery.Create(nil);
  SQL := TStringList.Create;
  try
    qrUpdate.Connection := frmDmConexao.FDConnection;
    
    SQL.Clear;
    
    if FModoEdicao then
    begin
      // UPDATE
      SQL.Add('UPDATE chave_pix SET');
      SQL.Add('  razao_social = :razao_social,');
      SQL.Add('  cep = :cep,');
      SQL.Add('  cidade = :cidade,');
      SQL.Add('  uf = :uf,');
      SQL.Add('  tipo_chave = :tipo_chave,');
      SQL.Add('  chave = :chave,');
      SQL.Add('  psp_configurado = 1,');
      SQL.Add('  psp = :psp,');
      SQL.Add('  ambiente = :ambiente,');
      SQL.Add('  timeout = :timeout,');
      SQL.Add('  client_id = :client_id,');
      SQL.Add('  client_secret = :client_secret,');
      SQL.Add('  secret_key = :secret_key,');
      SQL.Add('  access_key = :access_key,');
      SQL.Add('  access_token = :access_token,');
      SQL.Add('  token = :token,');
      SQL.Add('  developer_application_key = :developer_application_key,');
      SQL.Add('  consumer_key = :consumer_key,');
      SQL.Add('  consumer_secret = :consumer_secret,');
      SQL.Add('  account_id = :account_id,');
      SQL.Add('  authentication_api = :authentication_api,');
      SQL.Add('  authentication_key = :authentication_key,');
      SQL.Add('  secret_key_hmac = :secret_key_hmac,');
      SQL.Add('  mediator_fee = :mediator_fee,');
      SQL.Add('  arquivo_pfx = :arquivo_pfx,');
      SQL.Add('  senha_pfx = :senha_pfx,');
      SQL.Add('  arquivo_chave_privada = :arquivo_chave_privada,');
      SQL.Add('  arquivo_certificado = :arquivo_certificado');
      SQL.Add('WHERE id = :id');
    end
    else
    begin
      // INSERT (ID é auto incremento, não precisa informar)
      SQL.Add('INSERT INTO chave_pix (');
      SQL.Add('  razao_social,');
      SQL.Add('  cep,');
      SQL.Add('  cidade,');
      SQL.Add('  uf,');
      SQL.Add('  tipo_chave,');
      SQL.Add('  chave,');
      SQL.Add('  psp_configurado,');
      SQL.Add('  psp,');
      SQL.Add('  ambiente,');
      SQL.Add('  timeout,');
      SQL.Add('  client_id,');
      SQL.Add('  client_secret,');
      SQL.Add('  secret_key,');
      SQL.Add('  access_key,');
      SQL.Add('  access_token,');
      SQL.Add('  token,');
      SQL.Add('  developer_application_key,');
      SQL.Add('  consumer_key,');
      SQL.Add('  consumer_secret,');
      SQL.Add('  account_id,');
      SQL.Add('  authentication_api,');
      SQL.Add('  authentication_key,');
      SQL.Add('  secret_key_hmac,');
      SQL.Add('  mediator_fee,');
      SQL.Add('  arquivo_pfx,');
      SQL.Add('  senha_pfx,');
      SQL.Add('  arquivo_chave_privada,');
      SQL.Add('  arquivo_certificado');
      SQL.Add(') VALUES (');
      SQL.Add('  :razao_social,');
      SQL.Add('  :cep,');
      SQL.Add('  :cidade,');
      SQL.Add('  :uf,');
      SQL.Add('  :tipo_chave,');
      SQL.Add('  :chave,');
      SQL.Add('  1,');
      SQL.Add('  :psp,');
      SQL.Add('  :ambiente,');
      SQL.Add('  :timeout,');
      SQL.Add('  :client_id,');
      SQL.Add('  :client_secret,');
      SQL.Add('  :secret_key,');
      SQL.Add('  :access_key,');
      SQL.Add('  :access_token,');
      SQL.Add('  :token,');
      SQL.Add('  :developer_application_key,');
      SQL.Add('  :consumer_key,');
      SQL.Add('  :consumer_secret,');
      SQL.Add('  :account_id,');
      SQL.Add('  :authentication_api,');
      SQL.Add('  :authentication_key,');
      SQL.Add('  :secret_key_hmac,');
      SQL.Add('  :mediator_fee,');
      SQL.Add('  :arquivo_pfx,');
      SQL.Add('  :senha_pfx,');
      SQL.Add('  :arquivo_chave_privada,');
      SQL.Add('  :arquivo_certificado');
      SQL.Add(')');
    end;
    
    qrUpdate.SQL.Text := SQL.Text;
    
    // Setar ID apenas no UPDATE
    if FModoEdicao then
      qrUpdate.ParamByName('id').AsInteger := StrToIntDef(FCodigoChavePix, 0);
    
    // Setar dados básicos
    qrUpdate.ParamByName('razao_social').AsString := edtRazaoSocial.Text;
    qrUpdate.ParamByName('cep').AsString := edtCEP.Text;
    qrUpdate.ParamByName('cidade').AsString := edtCidade.Text;
    qrUpdate.ParamByName('uf').AsString := cbxUF.Text;
    qrUpdate.ParamByName('tipo_chave').AsString := cbxTipoChave.Text;
    qrUpdate.ParamByName('chave').AsString := edtChave.Text;
    
    // Setar o PSP selecionado e configurações gerais
    qrUpdate.ParamByName('psp').AsString := cbxPSPAtual.Text;
    qrUpdate.ParamByName('ambiente').AsString := cbxAmbiente.Text;
    qrUpdate.ParamByName('timeout').AsInteger := seTimeout.Value;
    
    // Inicializar todos os parâmetros como NULL
    qrUpdate.ParamByName('client_id').Clear;
    qrUpdate.ParamByName('client_secret').Clear;
    qrUpdate.ParamByName('secret_key').Clear;
    qrUpdate.ParamByName('access_key').Clear;
    qrUpdate.ParamByName('access_token').Clear;
    qrUpdate.ParamByName('token').Clear;
    qrUpdate.ParamByName('developer_application_key').Clear;
    qrUpdate.ParamByName('consumer_key').Clear;
    qrUpdate.ParamByName('consumer_secret').Clear;
    qrUpdate.ParamByName('account_id').Clear;
    qrUpdate.ParamByName('authentication_api').Clear;
    qrUpdate.ParamByName('authentication_key').Clear;
    qrUpdate.ParamByName('secret_key_hmac').Clear;
    qrUpdate.ParamByName('mediator_fee').Clear;
    
    // Setar parâmetros de acordo com o PSP
    case cbxPSPAtual.ItemIndex of
      0: // Shipay
      begin
        qrUpdate.ParamByName('client_id').AsString := edtConfig1.Text;
        qrUpdate.ParamByName('secret_key').AsString := edtConfig2.Text;
        qrUpdate.ParamByName('access_key').AsString := edtConfig3.Text;
      end;
      
      1: // Banco do Brasil
      begin
        qrUpdate.ParamByName('client_id').AsString := edtConfig1.Text;
        qrUpdate.ParamByName('client_secret').AsString := edtConfig2.Text;
        qrUpdate.ParamByName('developer_application_key').AsString := edtConfig3.Text;
      end;
      
      2: // Itaú
      begin
        qrUpdate.ParamByName('client_id').AsString := edtConfig1.Text;
        qrUpdate.ParamByName('client_secret').AsString := edtConfig2.Text;
      end;
      
      3: // Santander
      begin
        qrUpdate.ParamByName('consumer_key').AsString := edtConfig1.Text;
        qrUpdate.ParamByName('consumer_secret').AsString := edtConfig2.Text;
      end;
      
      4: // Sicredi
      begin
        qrUpdate.ParamByName('client_id').AsString := edtConfig1.Text;
        qrUpdate.ParamByName('client_secret').AsString := edtConfig2.Text;
      end;
      
      5: // Sicoob
      begin
        qrUpdate.ParamByName('client_id').AsString := edtConfig1.Text;
        qrUpdate.ParamByName('token').AsString := edtConfig2.Text;
      end;
      
      6: // PagSeguro
      begin
        qrUpdate.ParamByName('client_id').AsString := edtConfig1.Text;
        qrUpdate.ParamByName('client_secret').AsString := edtConfig2.Text;
      end;
      
      7: // GerenciaNet
      begin
        qrUpdate.ParamByName('client_id').AsString := edtConfig1.Text;
        qrUpdate.ParamByName('client_secret').AsString := edtConfig2.Text;
      end;
      
      8: // Bradesco
      begin
        qrUpdate.ParamByName('client_id').AsString := edtConfig1.Text;
        qrUpdate.ParamByName('client_secret').AsString := edtConfig2.Text;
      end;
      
      9: // PIXPDV
      begin
        qrUpdate.ParamByName('client_id').AsString := edtConfig1.Text;
        qrUpdate.ParamByName('token').AsString := edtConfig2.Text;
        qrUpdate.ParamByName('client_secret').AsString := edtConfig3.Text;
      end;
      
      10: // Inter
      begin
        qrUpdate.ParamByName('client_id').AsString := edtConfig1.Text;
        qrUpdate.ParamByName('client_secret').AsString := edtConfig2.Text;
      end;
      
      11: // Ailos
      begin
        qrUpdate.ParamByName('client_id').AsString := edtConfig1.Text;
        qrUpdate.ParamByName('client_secret').AsString := edtConfig2.Text;
      end;
      
      12: // Matera
      begin
        qrUpdate.ParamByName('client_id').AsString := edtConfig1.Text;
        qrUpdate.ParamByName('client_secret').AsString := edtConfig2.Text;
        qrUpdate.ParamByName('account_id').AsString := edtConfig3.Text;
        qrUpdate.ParamByName('secret_key').AsString := edtConfig4.Text;
        qrUpdate.ParamByName('mediator_fee').AsString := edtConfig5.Text;
      end;
      
      13: // Cielo
      begin
        qrUpdate.ParamByName('client_id').AsString := edtConfig1.Text;
        qrUpdate.ParamByName('client_secret').AsString := edtConfig2.Text;
      end;
      
      14: // Mercado Pago
      begin
        qrUpdate.ParamByName('access_token').AsString := edtConfig1.Text;
      end;
      
      15: // Gate2All
      begin
        qrUpdate.ParamByName('authentication_api').AsString := edtConfig1.Text;
        qrUpdate.ParamByName('authentication_key').AsString := edtConfig2.Text;
      end;
      
      16: // Banrisul
      begin
        qrUpdate.ParamByName('client_id').AsString := edtConfig1.Text;
        qrUpdate.ParamByName('client_secret').AsString := edtConfig2.Text;
      end;
      
      17: // C6 Bank
      begin
        qrUpdate.ParamByName('client_id').AsString := edtConfig1.Text;
        qrUpdate.ParamByName('client_secret').AsString := edtConfig2.Text;
      end;
      
      18: // AppLess
      begin
        qrUpdate.ParamByName('client_id').AsString := edtConfig1.Text;
        qrUpdate.ParamByName('client_secret').AsString := edtConfig2.Text;
        qrUpdate.ParamByName('secret_key_hmac').AsString := edtConfig3.Text;
      end;
    end;
    
    // Certificados - salvar arquivos como BLOB se existirem
    if (Trim(edtArquivoPFX.Text) <> '') and FileExists(edtArquivoPFX.Text) then
      qrUpdate.ParamByName('arquivo_pfx').LoadFromFile(edtArquivoPFX.Text, ftBlob)
    else
      qrUpdate.ParamByName('arquivo_pfx').Clear;

    qrUpdate.ParamByName('senha_pfx').AsString := edtSenhaPFX.Text;

    if (Trim(edtArquivoChavePrivada.Text) <> '') and FileExists(edtArquivoChavePrivada.Text) then
      qrUpdate.ParamByName('arquivo_chave_privada').LoadFromFile(edtArquivoChavePrivada.Text, ftBlob)
    else
      qrUpdate.ParamByName('arquivo_chave_privada').Clear;

    if (Trim(edtArquivoCertificado.Text) <> '') and FileExists(edtArquivoCertificado.Text) then
      qrUpdate.ParamByName('arquivo_certificado').LoadFromFile(edtArquivoCertificado.Text, ftBlob)
    else
      qrUpdate.ParamByName('arquivo_certificado').Clear;
    
    qrUpdate.ExecSQL;
    qrUpdate.Connection.Commit;
    
    if not FModoEdicao then
      Application.MessageBox('Chave PIX cadastrada com sucesso!', 'Sucesso', MB_OK + MB_ICONINFORMATION)
    else
      Application.MessageBox('Chave PIX atualizada com sucesso!', 'Sucesso', MB_OK + MB_ICONINFORMATION);
    
  finally
    SQL.Free;
    qrUpdate.Free;
  end;
end;

procedure TfrmChavePixCadastro.ValidarBotaoExtrairChave;
var
  ArquivoPFXValido: Boolean;
  SenhaPreenchida: Boolean;
begin
  // Verificar se o arquivo PFX está preenchido e existe
  ArquivoPFXValido := (Trim(edtArquivoPFX.Text) <> '') and FileExists(edtArquivoPFX.Text);

  // Verificar se a senha está preenchida
  SenhaPreenchida := Trim(edtSenhaPFX.Text) <> '';

  // Habilitar o botão apenas se ambas as condições forem verdadeiras
  btnExtrairChaveCertificado.Enabled := ArquivoPFXValido and SenhaPreenchida;
end;

function TfrmChavePixCadastro.ExportarBlobParaArquivo(AField: TField; const ANomeArquivo, APSP: string): string;
var
  DiretorioTemp, CaminhoCompleto, NomePSP: string;
  FileStream: TFileStream;
begin
  Result := '';

  // Verificar se o campo existe e não está vazio
  if (AField = nil) or AField.IsNull or (AField.AsString = '') then
    Exit;

  // Formatar nome do PSP
  NomePSP := LowerCase(StringReplace(APSP, ' ', '', [rfReplaceAll]));

  // Criar estrutura de diretórios C:\Atron\temp\pix\{psp}
  DiretorioTemp := 'C:\Atron\temp\pix\' + NomePSP + '\';

  if not DirectoryExists(DiretorioTemp) then
    ForceDirectories(DiretorioTemp);

  // Caminho completo do arquivo
  CaminhoCompleto := DiretorioTemp + ANomeArquivo;

  // Exportar BLOB para arquivo
  try
    FileStream := TFileStream.Create(CaminhoCompleto, fmCreate);
    try
      (AField as TBlobField).SaveToStream(FileStream);
      Result := CaminhoCompleto;
    finally
      FileStream.Free;
    end;
  except
    on E: Exception do
    begin
      // Se houver erro, retorna vazio
      Result := '';
    end;
  end;
end;

procedure TfrmChavePixCadastro.CarregarConfiguracaoPSP;
var
  qrSelect: TFDQuery;
  PSPSelecionado: string;
  IndicePSP: Integer;
begin
  if Trim(FCodigoChavePix) = '' then
    Exit;
    
  qrSelect := TFDQuery.Create(nil);
  try
    qrSelect.Connection := frmDmConexao.FDConnection;
    
    qrSelect.SQL.Clear;
    qrSelect.SQL.Add('SELECT * FROM CHAVE_PIX WHERE ID = :ID');
    qrSelect.ParamByName('ID').AsString := FCodigoChavePix;
    qrSelect.Open;
    
    if not qrSelect.IsEmpty then
    begin
      // Carregar dados básicos
      edtRazaoSocial.Text := qrSelect.FieldByName('RAZAO_SOCIAL').AsString;
      edtCEP.Text := qrSelect.FieldByName('CEP').AsString;
      edtCidade.Text := qrSelect.FieldByName('CIDADE').AsString;
      
      // Selecionar UF
      if not qrSelect.FieldByName('UF').IsNull then
      begin
        IndicePSP := cbxUF.Items.IndexOf(qrSelect.FieldByName('UF').AsString);
        if IndicePSP >= 0 then
          cbxUF.ItemIndex := IndicePSP;
      end;
      
      // Selecionar Tipo de Chave
      if not qrSelect.FieldByName('TIPO_CHAVE').IsNull then
      begin
        IndicePSP := cbxTipoChave.Items.IndexOf(qrSelect.FieldByName('TIPO_CHAVE').AsString);
        if IndicePSP >= 0 then
          cbxTipoChave.ItemIndex := IndicePSP;
      end;
      
      edtChave.Text := qrSelect.FieldByName('CHAVE').AsString;
      
      // Buscar o PSP salvo
      PSPSelecionado := qrSelect.FieldByName('PSP').AsString;
      
      // Selecionar o PSP no ComboBox
      if PSPSelecionado <> '' then
      begin
        IndicePSP := cbxPSPAtual.Items.IndexOf(PSPSelecionado);
        if IndicePSP >= 0 then
        begin
          cbxPSPAtual.ItemIndex := IndicePSP;
          ConfigurarCamposPorPSP(IndicePSP);
        end;
      end;
      
      // Carregar os campos de acordo com o PSP
      case cbxPSPAtual.ItemIndex of
        0: // Shipay
        begin
          edtConfig1.Text := qrSelect.FieldByName('client_id').AsString;
          edtConfig2.Text := qrSelect.FieldByName('secret_key').AsString;
          edtConfig3.Text := qrSelect.FieldByName('access_key').AsString;
        end;
        
        1: // Banco do Brasil
        begin
          edtConfig1.Text := qrSelect.FieldByName('client_id').AsString;
          edtConfig2.Text := qrSelect.FieldByName('client_secret').AsString;
          edtConfig3.Text := qrSelect.FieldByName('developer_application_key').AsString;
        end;
        
        2: // Itaú
        begin
          edtConfig1.Text := qrSelect.FieldByName('client_id').AsString;
          edtConfig2.Text := qrSelect.FieldByName('client_secret').AsString;
        end;
        
        3: // Santander
        begin
          edtConfig1.Text := qrSelect.FieldByName('consumer_key').AsString;
          edtConfig2.Text := qrSelect.FieldByName('consumer_secret').AsString;
        end;
        
        4: // Sicredi
        begin
          edtConfig1.Text := qrSelect.FieldByName('client_id').AsString;
          edtConfig2.Text := qrSelect.FieldByName('client_secret').AsString;
        end;
        
        5: // Sicoob
        begin
          edtConfig1.Text := qrSelect.FieldByName('client_id').AsString;
          edtConfig2.Text := qrSelect.FieldByName('token').AsString;
        end;
        
        6: // PagSeguro
        begin
          edtConfig1.Text := qrSelect.FieldByName('client_id').AsString;
          edtConfig2.Text := qrSelect.FieldByName('client_secret').AsString;
        end;
        
        7: // GerenciaNet
        begin
          edtConfig1.Text := qrSelect.FieldByName('client_id').AsString;
          edtConfig2.Text := qrSelect.FieldByName('client_secret').AsString;
        end;
        
        8: // Bradesco
        begin
          edtConfig1.Text := qrSelect.FieldByName('client_id').AsString;
          edtConfig2.Text := qrSelect.FieldByName('client_secret').AsString;
        end;
        
        9: // PIXPDV
        begin
          edtConfig1.Text := qrSelect.FieldByName('client_id').AsString;
          edtConfig2.Text := qrSelect.FieldByName('token').AsString;
          edtConfig3.Text := qrSelect.FieldByName('client_secret').AsString;
        end;
        
        10: // Inter
        begin
          edtConfig1.Text := qrSelect.FieldByName('client_id').AsString;
          edtConfig2.Text := qrSelect.FieldByName('client_secret').AsString;
        end;
        
        11: // Ailos
        begin
          edtConfig1.Text := qrSelect.FieldByName('client_id').AsString;
          edtConfig2.Text := qrSelect.FieldByName('client_secret').AsString;
        end;
        
        12: // Matera
        begin
          edtConfig1.Text := qrSelect.FieldByName('client_id').AsString;
          edtConfig2.Text := qrSelect.FieldByName('client_secret').AsString;
          edtConfig3.Text := qrSelect.FieldByName('account_id').AsString;
          edtConfig4.Text := qrSelect.FieldByName('secret_key').AsString;
          edtConfig5.Text := qrSelect.FieldByName('mediator_fee').AsString;
        end;
        
        13: // Cielo
        begin
          edtConfig1.Text := qrSelect.FieldByName('client_id').AsString;
          edtConfig2.Text := qrSelect.FieldByName('client_secret').AsString;
        end;
        
        14: // Mercado Pago
        begin
          edtConfig1.Text := qrSelect.FieldByName('access_token').AsString;
        end;
        
        15: // Gate2All
        begin
          edtConfig1.Text := qrSelect.FieldByName('authentication_api').AsString;
          edtConfig2.Text := qrSelect.FieldByName('authentication_key').AsString;
        end;
        
        16: // Banrisul
        begin
          edtConfig1.Text := qrSelect.FieldByName('client_id').AsString;
          edtConfig2.Text := qrSelect.FieldByName('client_secret').AsString;
        end;
        
        17: // C6 Bank
        begin
          edtConfig1.Text := qrSelect.FieldByName('client_id').AsString;
          edtConfig2.Text := qrSelect.FieldByName('client_secret').AsString;
        end;
        
        18: // AppLess
        begin
          edtConfig1.Text := qrSelect.FieldByName('client_id').AsString;
          edtConfig2.Text := qrSelect.FieldByName('client_secret').AsString;
          edtConfig3.Text := qrSelect.FieldByName('secret_key_hmac').AsString;
        end;
      end;
      
      // Carregar certificados - exportar BLOBs para arquivos temporários
      edtArquivoPFX.Text := ExportarBlobParaArquivo(
        qrSelect.FieldByName('arquivo_pfx'), 
        'certificado.pfx', 
        PSPSelecionado);
        
      edtSenhaPFX.Text := qrSelect.FieldByName('senha_pfx').AsString;
      
      edtArquivoChavePrivada.Text := ExportarBlobParaArquivo(
        qrSelect.FieldByName('arquivo_chave_privada'), 
        'CertificadoKey.key', 
        PSPSelecionado);
        
      edtArquivoCertificado.Text := ExportarBlobParaArquivo(
        qrSelect.FieldByName('arquivo_certificado'), 
        'CertificadoPem.pem', 
        PSPSelecionado);
      
      // Carregar configurações gerais
      if not qrSelect.FieldByName('AMBIENTE').IsNull then
      begin
        IndicePSP := cbxAmbiente.Items.IndexOf(qrSelect.FieldByName('AMBIENTE').AsString);
        if IndicePSP >= 0 then
          cbxAmbiente.ItemIndex := IndicePSP;
      end;
      
      if not qrSelect.FieldByName('TIMEOUT').IsNull then
        seTimeout.Value := qrSelect.FieldByName('TIMEOUT').AsInteger;
    end;
    
  finally
    qrSelect.Free;
  end;
end;

procedure TfrmChavePixCadastro.LimparFormulario;
begin
  // Limpar dados básicos
  edtRazaoSocial.Clear;
  edtCEP.Clear;
  edtCidade.Clear;
  cbxUF.ItemIndex := -1;
  cbxTipoChave.ItemIndex := -1;
  edtChave.Clear;
  
  // Limpar PSP
  cbxPSPAtual.ItemIndex := -1;
  cbxAmbiente.ItemIndex := 0; // Produção
  seTimeout.Value := 60000;
  
  // Limpar campos de configuração
  edtConfig1.Clear;
  edtConfig2.Clear;
  edtConfig3.Clear;
  edtConfig4.Clear;
  edtConfig5.Clear;
  edtConfig6.Clear;
  
  // Limpar certificados
  edtArquivoPFX.Clear;
  edtSenhaPFX.Clear;
  edtArquivoChavePrivada.Clear;
  edtArquivoCertificado.Clear;
  
  // Ocultar todos os campos
  OcultarTodosCampos;
end;

procedure TfrmChavePixCadastro.CarregarDados;
begin
  if FModoEdicao then
  begin
    lblTitulo.Caption := 'Editar Chave PIX';
    lblSubtitulo.Caption := 'Atualize as informações da chave PIX selecionada';
    CarregarConfiguracaoPSP;
  end
  else
  begin
    lblTitulo.Caption := 'Nova Chave PIX';
    lblSubtitulo.Caption := 'Cadastre uma nova chave PIX no sistema';
    LimparFormulario;
  end;
end;

end.

