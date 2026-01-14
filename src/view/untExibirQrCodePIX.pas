unit untExibirQrCodePIX;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.Clipbrd,
  ACBrBase, ACBrUtil.Base, ACBrUtil.Strings, ACBrValidador, ACBrImage, ACBrDelphiZXingQRCode,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, ACBrOpenSSLUtils, ACBrPIXPSPAppLess, ACBrPIXPSPC6Bank,
  ACBrPIXPSPBanrisul, ACBrPIXPSPGate2All, ACBrPIXPSPMercadoPago,
  ACBrPIXPSPCielo, ACBrPIXPSPMatera, ACBrPIXPSPAilos, ACBrPIXPSPInter,
  ACBrPIXPSPPixPDV, ACBrPIXPSPBradesco, ACBrPIXPSPGerenciaNet,
  ACBrPIXPSPPagSeguro, ACBrPIXPSPSicoob, ACBrPIXPSPSicredi, ACBrPIXPSPShipay,
  ACBrPIXPSPItau, ACBrPIXPSPBancoDoBrasil, ACBrPIXCD, ACBrPIXPSPSantander, ACBrPIXBase,
  System.StrUtils, TypInfo;

type
  TFluxoPagtoDados = record
    ID: Integer;
    TxID: String;
    E2E: String;
    QRCode: String;
    Total: Double;
    StatusCobranca: TACBrPIXStatusCobranca;
    EmErro: Boolean;
    QtdConsultas: Integer;
    // Dados da transação
    ChavePix: String;
    NomeCliente: String;
    DocumentoCliente: String;
  end;

  TfrmExibirQrCodePIX = class(TForm)
    pnlTitulo: TPanel;
    pnlCobranca: TPanel;
    pnlCentralizar: TPanel;
    pnlQrCode: TPanel;
    imgQRCode: TImage;
    Label1: TLabel;
    edtCopiaECola: TEdit;
    lblCopiaECola: TLabel;
    btnCopiaECola: TButton;
    pnlBotao: TPanel;
    btnConfirmar: TButton;
    btnCancelar: TButton;
    pnlStatus: TPanel;
    shpIconePIX: TShape;
    lblIconePIX: TLabel;
    lblTituloPrincipal: TLabel;
    lblSubtitulo: TLabel;
    tmConsultarPagto: TTimer;
    ACBrPixCD1: TACBrPixCD;
    ACBrPSPSantander1: TACBrPSPSantander;
    ACBrPSPBancoDoBrasil1: TACBrPSPBancoDoBrasil;
    ACBrPSPItau1: TACBrPSPItau;
    ACBrPSPShipay1: TACBrPSPShipay;
    ACBrPSPSicredi1: TACBrPSPSicredi;
    ACBrPSPSicoob1: TACBrPSPSicoob;
    ACBrPSPPagSeguro1: TACBrPSPPagSeguro;
    ACBrPSPGerenciaNet1: TACBrPSPGerenciaNet;
    ACBrPSPBradesco1: TACBrPSPBradesco;
    ACBrPSPPixPDV1: TACBrPSPPixPDV;
    ACBrPSPInter1: TACBrPSPInter;
    ACBrPSPAilos1: TACBrPSPAilos;
    ACBrPSPMatera1: TACBrPSPMatera;
    ACBrPSPCielo1: TACBrPSPCielo;
    ACBrPSPMercadoPago1: TACBrPSPMercadoPago;
    ACBrPSPGate2All1: TACBrPSPGate2All;
    ACBrPSPBanrisul1: TACBrPSPBanrisul;
    ACBrPSPC6Bank1: TACBrPSPC6Bank;
    ACBrPSPAppLess1: TACBrPSPAppLess;
    ACBrOpenSSLUtils1: TACBrOpenSSLUtils;
    qrConfigPSP: TFDQuery;
    tmIniciar: TTimer;
    procedure btnCopiaEColaClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure tmConsultarPagtoTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tmIniciarTimer(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    fFluxoDados: TFluxoPagtoDados;
    fInicializado: Boolean;
    fPSPConfigurado: Boolean;
    fCobrancaCriada: Boolean;
    function ObterDiretorioLog: string;
    function FormatarJSON(const AJSON: String): String;
    function ExportarBlobParaArquivo(const ANomeCampo, ANomeArquivo, APSP: string): string;
    procedure CarrgarConfigPSP;
    procedure ConfigurarACBrPSPs;
    procedure VerificarConfiguracao;
    procedure AtualizarStatus(aStatus: TACBrPIXStatusCobranca);
    procedure CriarCobrancaPIX;
    procedure ConsultarCobranca;
    procedure CancelarCobranca;
    function InserirMovimentoPIX: Integer;
    function GravarTransacaoPIX: Boolean;
    function AtualizarStatusPIX(const AStatus: string): Boolean;

    //Sem configuração do PSP
    procedure CriarCobrancaEstatico;
  public
    { Public declarations }
    procedure Iniciar(AChavePix: string;
                      AValor: Currency; ANomeCliente, ADocumentoCliente: string);
  end;

var
  frmExibirQrCodePIX: TfrmExibirQrCodePIX;

implementation

uses untDmConexao;

{$R *.dfm}

procedure TfrmExibirQrCodePIX.Iniciar(AChavePix: string;
                                      AValor: Currency; ANomeCliente, ADocumentoCliente: string);
begin
  // Inicializar dados do fluxo
  fFluxoDados.ChavePix := AChavePix;
  fFluxoDados.Total := AValor;
  fFluxoDados.NomeCliente := ANomeCliente;
  fFluxoDados.DocumentoCliente := ADocumentoCliente;
  fFluxoDados.EmErro := False;
  fFluxoDados.QtdConsultas := 0;
  fFluxoDados.StatusCobranca := stcNENHUM;
  fFluxoDados.TxID := '';
  fFluxoDados.E2E := '';
  fFluxoDados.QRCode := '';
  fInicializado := False;
  fCobrancaCriada := False;
  
  // Inserir registro na tabela MOVIMENTO_PIX
  fFluxoDados.ID := InserirMovimentoPIX;
  
  if fFluxoDados.ID <= 0 then
  begin
    ShowMessage('Erro ao criar registro na tabela MOVIMENTO_PIX');
    fFluxoDados.EmErro := True;
  end;
end;

procedure TfrmExibirQrCodePIX.FormShow(Sender: TObject);
begin
  // Ativar timer para executar após a tela estar completamente renderizada
  if not fInicializado then
    tmIniciar.Enabled := True;
end;

procedure TfrmExibirQrCodePIX.tmIniciarTimer(Sender: TObject);
begin
  tmIniciar.Enabled := False;

  if not fInicializado then
  begin
    fInicializado := True;

    CarrgarConfigPSP;
    VerificarConfiguracao;

    if fPSPConfigurado then
    begin
      ConfigurarACBrPSPs;
      CriarCobrancaPIX;
    end else
      CriarCobrancaEstatico;
  end;
end;

procedure TfrmExibirQrCodePIX.CarrgarConfigPSP;
begin
  qrConfigPSP.Close;
  qrConfigPSP.SQL.Clear;
  qrConfigPSP.SQL.Add('SELECT *');
  qrConfigPSP.SQL.Add('FROM CHAVE_PIX');
  qrConfigPSP.SQL.Add('WHERE CHAVE = :CHAVE');
  qrConfigPSP.ParamByName('CHAVE').AsString := fFluxoDados.ChavePix;
  qrConfigPSP.Open;
end;

procedure TfrmExibirQrCodePIX.VerificarConfiguracao;
begin
  if qrConfigPSP.IsEmpty then
  begin
    MessageDlg('Nenhuma configuração PIX encontrada para esta conta/chave', mtWarning, [mbOK], 0);
    Abort;
  end;

  fPSPConfigurado := qrConfigPSP.FieldByName('PSP_CONFIGURADO').AsInteger = 1;

  btnConfirmar.Visible := not fPSPConfigurado;

  case fPSPConfigurado of
    True:  pnlTitulo.Caption := pnlTitulo.Caption + ' PSP ' + qrConfigPSP.FieldByName('PSP').AsString;
    False: pnlTitulo.Caption := pnlTitulo.Caption + ' SEM PSP';
  end;
end;

procedure TfrmExibirQrCodePIX.CriarCobrancaEstatico;
var
  QrCode: string;
begin
  ACBrPixCD1.Recebedor.Nome := qrConfigPSP.FieldByName('FILIAL').AsString;
  ACBrPixCD1.Recebedor.CEP := qrConfigPSP.FieldByName('CEP').AsString;
  ACBrPixCD1.Recebedor.Cidade := qrConfigPSP.FieldByName('CIDADE').AsString;
  ACBrPixCD1.Recebedor.UF := qrConfigPSP.FieldByName('UF').AsString;

  QrCode := ACBrPixCD1.GerarQRCodeEstatico(fFluxoDados.ChavePix,
                                           fFluxoDados.Total,
                                           '',
                                           '');

  edtCopiaECola.Text := QRCode;
  PintarQRCode(QrCode, imgQRCode.Picture.Bitmap, qrUTF8BOM);

  if not btnConfirmar.Visible then
    btnConfirmar.Visible := True;
end;

function TfrmExibirQrCodePIX.ExportarBlobParaArquivo(const ANomeCampo, ANomeArquivo, APSP: string): string;
var
  DiretorioTemp, CaminhoCompleto, NomePSP: string;
  BlobField: TBlobField;
  FileStream: TFileStream;
begin
  Result := '';

  // Verificar se o campo existe e não está vazio
  if qrConfigPSP.FieldByName(ANomeCampo).IsNull then
    Exit;

  // Formatar nome do PSP
  NomePSP := LowerCase(StringReplace(APSP, ' ', '', [rfReplaceAll]));

  // Criar estrutura de diretórios temp\pix\{psp} na pasta do executável
  DiretorioTemp := ExtractFilePath(ParamStr(0)) + 'temp\pix\' + NomePSP + '\';

  if not DirectoryExists(DiretorioTemp) then
    ForceDirectories(DiretorioTemp);

  // Caminho completo do arquivo
  CaminhoCompleto := DiretorioTemp + ANomeArquivo;

  // Exportar BLOB para arquivo
  try
    BlobField := qrConfigPSP.FieldByName(ANomeCampo) as TBlobField;
    
    FileStream := TFileStream.Create(CaminhoCompleto, fmCreate);
    try
      BlobField.SaveToStream(FileStream);
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

function TfrmExibirQrCodePIX.ObterDiretorioLog: string;
var
  NomePSPLog, DiretorioLog, NomeArqLog: string;
begin
  // Obter nome do PSP configurado
  NomePSPLog := 'sem_psp';
  if not qrConfigPSP.IsEmpty then
  begin
    NomePSPLog := LowerCase(StringReplace(qrConfigPSP.FieldByName('PSP').AsString, ' ', '', [rfReplaceAll]));
  end;

  // Criar estrutura de diretórios log\pix\{psp} na pasta do executável
  DiretorioLog := ExtractFilePath(ParamStr(0)) + 'log\pix\' + NomePSPLog + '\';

  if not DirectoryExists(DiretorioLog) then
    ForceDirectories(DiretorioLog);

  NomeArqLog := DiretorioLog + FormatDateTime('yyyymmdd', Now) + '.log';

  Result := NomeArqLog;
end;

procedure TfrmExibirQrCodePIX.ConfigurarACBrPSPs;
var
  PSPSelecionado: string;
  ArquivoPFX, SenhaFX, ArquivoChavePrivada, ArquivoCertificado: string;
begin
  if qrConfigPSP.IsEmpty then
    Exit;

  PSPSelecionado := qrConfigPSP.FieldByName('PSP').AsString;

  ACBrPixCD1.ArqLOG := ObterDiretorioLog;
  ACBrPixCD1.NivelLog := 4;

  // Configurar ambiente e timeout (comum para todos)
  if not qrConfigPSP.FieldByName('AMBIENTE').IsNull then
    ACBrPixCD1.Ambiente := TACBrPixCDAmbiente(GetEnumValue(TypeInfo(TACBrPixCDAmbiente), qrConfigPSP.FieldByName('AMBIENTE').AsString));

  if not qrConfigPSP.FieldByName('TIMEOUT').IsNull then
    ACBrPixCD1.Timeout := qrConfigPSP.FieldByName('TIMEOUT').AsInteger;

  // Exportar certificados dos BLOBs para arquivos temporários
  ArquivoPFX := ExportarBlobParaArquivo('ARQUIVO_PFX', 'certificado.pfx', PSPSelecionado);
  SenhaFX := qrConfigPSP.FieldByName('SENHA_PFX').AsString;
  ArquivoChavePrivada := ExportarBlobParaArquivo('ARQUIVO_CHAVE_PRIVADA', 'CertificadoKey.key', PSPSelecionado);
  ArquivoCertificado := ExportarBlobParaArquivo('ARQUIVO_CERTIFICADO', 'CertificadoPem.pem', PSPSelecionado);

  // Configurar o PSP específico
  if PSPSelecionado = 'Shipay' then
  begin
    ACBrPixCD1.PSP := ACBrPSPShipay1;
    ACBrPSPShipay1.ClientID := qrConfigPSP.FieldByName('CLIENT_ID').AsString;
    ACBrPSPShipay1.SecretKey := qrConfigPSP.FieldByName('SECRET_KEY').AsString;
    ACBrPSPShipay1.AccessKey := qrConfigPSP.FieldByName('ACCESS_KEY').AsString;
  end
  else if PSPSelecionado = 'Banco do Brasil' then
  begin
    ACBrPixCD1.PSP := ACBrPSPBancoDoBrasil1;
    ACBrPSPBancoDoBrasil1.ChavePIX := fFluxoDados.ChavePix;
    ACBrPSPBancoDoBrasil1.ClientID := qrConfigPSP.FieldByName('CLIENT_ID').AsString;
    ACBrPSPBancoDoBrasil1.ClientSecret := qrConfigPSP.FieldByName('CLIENT_SECRET').AsString;
    ACBrPSPBancoDoBrasil1.DeveloperApplicationKey := qrConfigPSP.FieldByName('DEVELOPER_APPLICATION_KEY').AsString;

    if ArquivoPFX <> '' then
    begin
      ACBrPSPBancoDoBrasil1.ArquivoPFX := ArquivoPFX;
      ACBrPSPBancoDoBrasil1.SenhaPFX := SenhaFX;
    end
    else if ArquivoChavePrivada <> '' then
    begin
      ACBrPSPBancoDoBrasil1.ArquivoChavePrivada := ArquivoChavePrivada;
      ACBrPSPBancoDoBrasil1.ArquivoCertificado := ArquivoCertificado;
    end;
  end
  else if PSPSelecionado = 'Itaú' then
  begin
    ACBrPixCD1.PSP := ACBrPSPItau1;
    ACBrPSPItau1.ChavePIX := fFluxoDados.ChavePix;
    ACBrPSPItau1.ClientID := qrConfigPSP.FieldByName('CLIENT_ID').AsString;
    ACBrPSPItau1.ClientSecret := qrConfigPSP.FieldByName('CLIENT_SECRET').AsString;
    ACBrPSPItau1.ArquivoChavePrivada := ArquivoChavePrivada;
    ACBrPSPItau1.ArquivoCertificado := ArquivoCertificado;
  end
  else if PSPSelecionado = 'Santander' then
  begin
    ACBrPixCD1.PSP := ACBrPSPSantander1;
    ACBrPSPSantander1.ChavePIX := fFluxoDados.ChavePix;
    ACBrPSPSantander1.ConsumerKey := qrConfigPSP.FieldByName('CONSUMER_KEY').AsString;
    ACBrPSPSantander1.ConsumerSecret := qrConfigPSP.FieldByName('CONSUMER_SECRET').AsString;
    ACBrPSPSantander1.ArquivoPFX := ArquivoPFX;
    ACBrPSPSantander1.SenhaPFX := SenhaFX;
  end
  else if PSPSelecionado = 'Sicredi' then
  begin
    ACBrPixCD1.PSP := ACBrPSPSicredi1;
    ACBrPSPSicredi1.ChavePIX := fFluxoDados.ChavePix;
    ACBrPSPSicredi1.ClientID := qrConfigPSP.FieldByName('CLIENT_ID').AsString;
    ACBrPSPSicredi1.ClientSecret := qrConfigPSP.FieldByName('CLIENT_SECRET').AsString;
    ACBrPSPSicredi1.ArquivoChavePrivada := ArquivoChavePrivada;
    ACBrPSPSicredi1.ArquivoCertificado := ArquivoCertificado;
  end
  else if PSPSelecionado = 'Sicoob' then
  begin
    ACBrPixCD1.PSP := ACBrPSPSicoob1;
    ACBrPSPSicoob1.ChavePIX := fFluxoDados.ChavePix;
    ACBrPSPSicoob1.ClientID := qrConfigPSP.FieldByName('CLIENT_ID').AsString;
    ACBrPSPSicoob1.TokenSandbox := qrConfigPSP.FieldByName('TOKEN').AsString;
    ACBrPSPSicoob1.ArquivoChavePrivada := ArquivoChavePrivada;
    ACBrPSPSicoob1.ArquivoCertificado := ArquivoCertificado;
  end
  else if PSPSelecionado = 'PagSeguro' then
  begin
    ACBrPixCD1.PSP := ACBrPSPPagSeguro1;
    ACBrPSPPagSeguro1.ChavePIX := fFluxoDados.ChavePix;
    ACBrPSPPagSeguro1.ClientID := qrConfigPSP.FieldByName('CLIENT_ID').AsString;
    ACBrPSPPagSeguro1.ClientSecret := qrConfigPSP.FieldByName('CLIENT_SECRET').AsString;
    ACBrPSPPagSeguro1.ArquivoChavePrivada := ArquivoChavePrivada;
    ACBrPSPPagSeguro1.ArquivoCertificado := ArquivoCertificado;
  end
  else if PSPSelecionado = 'GerenciaNet' then
  begin
    ACBrPixCD1.PSP := ACBrPSPGerenciaNet1;
    ACBrPSPGerenciaNet1.ChavePIX := fFluxoDados.ChavePix;
    ACBrPSPGerenciaNet1.ClientID := qrConfigPSP.FieldByName('CLIENT_ID').AsString;
    ACBrPSPGerenciaNet1.ClientSecret := qrConfigPSP.FieldByName('CLIENT_SECRET').AsString;
    ACBrPSPGerenciaNet1.ArquivoPFX := ArquivoPFX;
  end
  else if PSPSelecionado = 'Bradesco' then
  begin
    ACBrPixCD1.PSP := ACBrPSPBradesco1;
    ACBrPSPBradesco1.ChavePIX := fFluxoDados.ChavePix;
    ACBrPSPBradesco1.ClientID := qrConfigPSP.FieldByName('CLIENT_ID').AsString;
    ACBrPSPBradesco1.ClientSecret := qrConfigPSP.FieldByName('CLIENT_SECRET').AsString;

    if ArquivoPFX <> '' then
    begin
      ACBrPSPBradesco1.ArquivoPFX := ArquivoPFX;
      ACBrPSPBradesco1.SenhaPFX := SenhaFX;
    end
    else if ArquivoChavePrivada <> '' then
    begin
      ACBrPSPBradesco1.ArquivoChavePrivada := ArquivoChavePrivada;
      ACBrPSPBradesco1.ArquivoCertificado := ArquivoCertificado;
    end;
  end
  else if PSPSelecionado = 'PIXPDV' then
  begin
    ACBrPixCD1.PSP := ACBrPSPPixPDV1;
    ACBrPSPPixPDV1.CNPJ := qrConfigPSP.FieldByName('CLIENT_ID').AsString;
    ACBrPSPPixPDV1.Token := qrConfigPSP.FieldByName('TOKEN').AsString;
    ACBrPSPPixPDV1.ClientSecret := qrConfigPSP.FieldByName('CLIENT_SECRET').AsString;
  end
  else if PSPSelecionado = 'Inter' then
  begin
    ACBrPixCD1.PSP := ACBrPSPInter1;
    ACBrPSPInter1.ChavePIX := fFluxoDados.ChavePix;
    ACBrPSPInter1.ClientID := qrConfigPSP.FieldByName('CLIENT_ID').AsString;
    ACBrPSPInter1.ClientSecret := qrConfigPSP.FieldByName('CLIENT_SECRET').AsString;
    ACBrPSPInter1.ArquivoChavePrivada := ArquivoChavePrivada;
    ACBrPSPInter1.ArquivoCertificado := ArquivoCertificado;
  end
  else if PSPSelecionado = 'Ailos' then
  begin
    ACBrPixCD1.PSP := ACBrPSPAilos1;
    ACBrPSPAilos1.ChavePIX := fFluxoDados.ChavePix;
    ACBrPSPAilos1.ClientID := qrConfigPSP.FieldByName('CLIENT_ID').AsString;
    ACBrPSPAilos1.ClientSecret := qrConfigPSP.FieldByName('CLIENT_SECRET').AsString;
    ACBrPSPAilos1.ArquivoChavePrivada := ArquivoChavePrivada;
    ACBrPSPAilos1.ArquivoCertificado := ArquivoCertificado;
    ACBrPSPAilos1.RootCrt := qrConfigPSP.FieldByName('ARQUIVO_CERTIFICADO_ROOT').AsString;
  end
  else if PSPSelecionado = 'Matera' then
  begin
    ACBrPixCD1.PSP := ACBrPSPMatera1;
    ACBrPSPMatera1.ChavePIX := fFluxoDados.ChavePix;
    ACBrPSPMatera1.ClientID := qrConfigPSP.FieldByName('CLIENT_ID').AsString;
    ACBrPSPMatera1.ClientSecret := qrConfigPSP.FieldByName('CLIENT_SECRET').AsString;
    ACBrPSPMatera1.AccountId := qrConfigPSP.FieldByName('ACCOUNT_ID').AsString;
    ACBrPSPMatera1.SecretKey := qrConfigPSP.FieldByName('SECRET_KEY').AsString;
    ACBrPSPMatera1.MediatorFee := qrConfigPSP.FieldByName('MEDIATOR_FEE').AsFloat;
    ACBrPSPMatera1.ArquivoChavePrivada := ArquivoChavePrivada;
    ACBrPSPMatera1.ArquivoCertificado := ArquivoCertificado;
  end
  else if PSPSelecionado = 'Cielo' then
  begin
    ACBrPixCD1.PSP := ACBrPSPCielo1;
    ACBrPSPCielo1.ChavePIX := fFluxoDados.ChavePix;
    ACBrPSPCielo1.ClientID := qrConfigPSP.FieldByName('CLIENT_ID').AsString;
    ACBrPSPCielo1.ClientSecret := qrConfigPSP.FieldByName('CLIENT_SECRET').AsString;
  end
  else if PSPSelecionado = 'Mercado Pago' then
  begin
    ACBrPixCD1.PSP := ACBrPSPMercadoPago1;
    ACBrPSPMercadoPago1.ChavePIX := fFluxoDados.ChavePix;
    ACBrPSPMercadoPago1.AccessToken := qrConfigPSP.FieldByName('ACCESS_TOKEN').AsString;
  end
  else if PSPSelecionado = 'Gate2All' then
  begin
    ACBrPixCD1.PSP := ACBrPSPGate2All1;
    ACBrPSPGate2All1.AuthenticationApi := qrConfigPSP.FieldByName('AUTHENTICATION_API').AsString;
    ACBrPSPGate2All1.AuthenticationKey := qrConfigPSP.FieldByName('AUTHENTICATION_KEY').AsString;
  end
  else if PSPSelecionado = 'Banrisul' then
  begin
    ACBrPixCD1.PSP := ACBrPSPBanrisul1;
    ACBrPSPBanrisul1.ChavePIX := fFluxoDados.ChavePix;
    ACBrPSPBanrisul1.ClientID := qrConfigPSP.FieldByName('CLIENT_ID').AsString;
    ACBrPSPBanrisul1.ClientSecret := qrConfigPSP.FieldByName('CLIENT_SECRET').AsString;
    ACBrPSPBanrisul1.ArquivoPFX := ArquivoPFX;
    ACBrPSPBanrisul1.SenhaPFX := SenhaFX;
  end
  else if PSPSelecionado = 'C6 Bank' then
  begin
    ACBrPixCD1.PSP := ACBrPSPC6Bank1;
    ACBrPSPC6Bank1.ChavePIX := fFluxoDados.ChavePix;
    ACBrPSPC6Bank1.ClientID := qrConfigPSP.FieldByName('CLIENT_ID').AsString;
    ACBrPSPC6Bank1.ClientSecret := qrConfigPSP.FieldByName('CLIENT_SECRET').AsString;
    ACBrPSPC6Bank1.ArquivoChavePrivada := ArquivoChavePrivada;
    ACBrPSPC6Bank1.ArquivoCertificado := ArquivoCertificado;
  end
  else if PSPSelecionado = 'AppLess' then
  begin
    ACBrPixCD1.PSP := ACBrPSPAppLess1;
    ACBrPSPAppLess1.ClientID := qrConfigPSP.FieldByName('CLIENT_ID').AsString;
    ACBrPSPAppLess1.ClientSecret := qrConfigPSP.FieldByName('CLIENT_SECRET').AsString;
    ACBrPSPAppLess1.SecretKeyHMAC := qrConfigPSP.FieldByName('SECRET_KEY_HMAC').AsString;
  end;
end;

procedure TfrmExibirQrCodePIX.CriarCobrancaPIX;
var
  wDoc: string;
begin
  // Mostrar mensagem inicial
  pnlStatus.Color := clMenuHighlight;
  pnlStatus.Caption := 'SOLICITANDO COBRANÇA...';
  pnlStatus.Refresh;
  Application.ProcessMessages;

  try
    with ACBrPixCD1.PSP.epCob.CobSolicitada do
    begin
      Clear;
      chave := ACBrPixCD1.PSP.ChavePIX;
      calendario.expiracao := 3600;

      // Configurar devedor se informado
      if Trim(fFluxoDados.NomeCliente) <> '' then
      begin
        devedor.nome := fFluxoDados.NomeCliente;

        wDoc := OnlyNumber(fFluxoDados.DocumentoCliente);
        if wDoc = '' then
        begin
          ShowMessage('Informe o Documento');
          Exit;
        end
        else if Length(wDoc) > 11 then
          devedor.cnpj := wDoc
        else
          devedor.cpf := wDoc;
      end;

      valor.original := fFluxoDados.Total;
      valor.modalidadeAlteracao := False;
    end;

    // Criar cobrança
    if ACBrPixCD1.PSP.epCob.CriarCobrancaImediata then
    begin
      fCobrancaCriada := True;

      fFluxoDados.TxID := ACBrPixCD1.PSP.epCob.CobGerada.txId;
      fFluxoDados.QRCode := Trim(ACBrPixCD1.PSP.epCob.CobGerada.pixCopiaECola);

      if (fFluxoDados.QRCode = '') then
        fFluxoDados.QRCode := ACBrPixCD1.GerarQRCodeDinamico(ACBrPixCD1.PSP.epCob.CobGerada.location);

      //pnlTitulo.Caption := 'PIX - TxID: ' + fFluxoDados.TxID;
      edtCopiaECola.Text := fFluxoDados.QRCode;
      PintarQRCode(fFluxoDados.QRCode, imgQRCode.Picture.Bitmap, qrUTF8BOM);
      GravarTransacaoPIX;
      ConsultarCobranca;
    end
    else
    begin
      fCobrancaCriada := False;
      fFluxoDados.EmErro := True;
      ShowMessage('Erro ao criar cobrança: ' + sLineBreak +
        FormatarJSON(ACBrPixCD1.PSP.epCob.Problema.AsJSON));

      CriarCobrancaEstatico;
    end;

    tmConsultarPagto.Enabled := True;
  finally

  end;
end;

function TfrmExibirQrCodePIX.FormatarJSON(const AJSON: String): String;
begin
  // Simplificado - apenas retorna o JSON
  Result := AJSON;
end;

function TfrmExibirQrCodePIX.GravarTransacaoPIX: Boolean;
var
  qryUpdate: TFDQuery;
  LocationURL, PSP, Ambiente: string;
  Expiracao: Integer;
begin
  Result := False;

  qryUpdate := TFDQuery.Create(nil);
  try
    qryUpdate.Connection := frmDmConexao.FDConnection;

    // Obter PSP utilizado
    PSP := qrConfigPSP.FieldByName('PSP').AsString;

    // Obter ambiente (produção ou homologação)
    if ACBrPixCD1.Ambiente = ambProducao then
      Ambiente := 'PRODUCAO'
    else
      Ambiente := 'HOMOLOGACAO';

    // Obter dados da cobrança completa
    if Assigned(ACBrPixCD1.PSP) and Assigned(ACBrPixCD1.PSP.epCob) then
    begin
      if ACBrPixCD1.PSP.epCob.CobGerada.loc.id > 0 then
        LocationURL := IntToStr(ACBrPixCD1.PSP.epCob.CobGerada.loc.id);

      if ACBrPixCD1.PSP.epCob.CobGerada.calendario.expiracao > 0 then
        Expiracao := ACBrPixCD1.PSP.epCob.CobGerada.calendario.expiracao
      else
        Expiracao := 86400; // 24 horas padrão
    end
    else
      Expiracao := 86400;

    // Montar e executar UPDATE com todos os campos PIX
    qryUpdate.SQL.Text :=
      'UPDATE movimento_pix SET ' +
      '  txid = :txid, ' +
      '  status_pix = :status_pix, ' +
      '  data_criacao_pix = :data_criacao_pix, ' +
      '  qr_code_copia_cola = :qr_code_copia_cola, ' +
      '  location_url = :location_url, ' +
      '  psp_utilizado = :psp_utilizado, ' +
      '  chave_pix_utilizada = :chave_pix_utilizada, ' +
      '  ambiente = :ambiente, ' +
      '  expiracao_segundos = :expiracao_segundos ' +
      'WHERE id = :id';

    qryUpdate.ParamByName('txid').AsString := fFluxoDados.TxID;
    qryUpdate.ParamByName('status_pix').AsString := 'ATIVA';
    qryUpdate.ParamByName('data_criacao_pix').AsDateTime := Now;
    qryUpdate.ParamByName('qr_code_copia_cola').AsString := fFluxoDados.QRCode;
    qryUpdate.ParamByName('location_url').AsString := LocationURL;
    qryUpdate.ParamByName('psp_utilizado').AsString := PSP;
    qryUpdate.ParamByName('chave_pix_utilizada').AsString := fFluxoDados.ChavePix;
    qryUpdate.ParamByName('ambiente').AsString := Ambiente;
    qryUpdate.ParamByName('expiracao_segundos').AsInteger := Expiracao;
    qryUpdate.ParamByName('id').AsInteger := fFluxoDados.ID;

    qryUpdate.ExecSQL;

    Result := True;

  except
    on E: Exception do
    begin
      ShowMessage('ERRO ao gravar transação PIX: ' + E.Message);
    end;
  end;

  qryUpdate.Free;
end;

procedure TfrmExibirQrCodePIX.ConsultarCobranca;
begin
  if not fCobrancaCriada then
    Exit;

  if EstaVazio(fFluxoDados.TxID) then
  begin
    ShowMessage('Nenhum TxID para ser consultado');
    Exit;
  end;

  try
    if (not ACBrPixCD1.PSP.epCob.ConsultarCobrancaImediata(fFluxoDados.TxID)) then
    begin
      fFluxoDados.EmErro := True;
      ShowMessage('Erro ao consultar cobrança' + sLineBreak +
        ACBrPixCD1.PSP.epCob.Problema.title + sLineBreak +
        ACBrPixCD1.PSP.epCob.Problema.detail);
    end;

    if (ACBrPixCD1.PSP.epCob.CobCompleta.pix.Count > 0) then
      fFluxoDados.E2E := ACBrPixCD1.PSP.epCob.CobCompleta.pix[0].endToEndId;

    // Atualizar banco de dados se status mudou para CONCLUIDA
    if ACBrPixCD1.PSP.epCob.CobCompleta.status = stcCONCLUIDA then
    begin
      AtualizarStatusPIX('CONCLUIDA');
    end;

    AtualizarStatus(ACBrPixCD1.PSP.epCob.CobCompleta.status);
  finally

  end;
end;

function TfrmExibirQrCodePIX.AtualizarStatusPIX(const AStatus: string): Boolean;
var
  qryUpdate: TFDQuery;
begin
  Result := False;

  qryUpdate := TFDQuery.Create(nil);
  try
    qryUpdate.Connection := frmDmConexao.FDConnection;

    // Preparar dados baseado no status
    case IndexStr(UpperCase(AStatus), ['CONCLUIDA', 'REMOVIDA_PSP', 'CANCELADA']) of
      0: // CONCLUIDA
      begin
        qryUpdate.SQL.Text :=
          'UPDATE movimento_pix SET ' +
          '  status_pix = :status_pix, ' +
          '  e2e = :e2e, ' +
          '  data_pagamento_pix = :data_pagamento_pix, ' +
          '  valor_pago = :valor_pago ' +
          'WHERE id = :id';

        qryUpdate.ParamByName('status_pix').AsString := 'CONCLUIDA';
        qryUpdate.ParamByName('e2e').AsString := fFluxoDados.E2E;
        qryUpdate.ParamByName('data_pagamento_pix').AsDateTime := Now;
        qryUpdate.ParamByName('valor_pago').AsExtended := ACBrPixCD1.PSP.epCob.CobCompleta.pix[0].valor;
        qryUpdate.ParamByName('id').AsInteger := fFluxoDados.ID;
      end;

      1, 2: // REMOVIDA_PSP ou CANCELADA
      begin
        qryUpdate.SQL.Text :=
          'UPDATE movimento_pix SET ' +
          '  status_pix = :status_pix, ' +
          '  data_cancelamento_pix = :data_cancelamento_pix ' +
          'WHERE id = :id';

        qryUpdate.ParamByName('status_pix').AsString := AStatus;
        qryUpdate.ParamByName('data_cancelamento_pix').AsDateTime := Now;
        qryUpdate.ParamByName('id').AsInteger := fFluxoDados.ID;
      end;

    else // Outros status
      begin
        qryUpdate.SQL.Text :=
          'UPDATE movimento_pix SET status_pix = :status_pix WHERE id = :id';
        qryUpdate.ParamByName('status_pix').AsString := AStatus;
        qryUpdate.ParamByName('id').AsInteger := fFluxoDados.ID;
      end;
    end;

    qryUpdate.ExecSQL;

    Result := True;

  except
    on E: Exception do
    begin
      ShowMessage('ERRO ao atualizar status PIX: ' + E.Message);
    end;
  end;

  qryUpdate.Free;
end;

procedure TfrmExibirQrCodePIX.AtualizarStatus(aStatus: TACBrPIXStatusCobranca);

  procedure AtualizarPanelPrincipal(aTexto: String; aCor: TColor);
  begin
    pnlStatus.Color := aCor;
    pnlStatus.Caption := aTexto;
    pnlStatus.Refresh;
  end;

begin
  if fFluxoDados.EmErro then
  begin
    AtualizarPanelPrincipal('ERRO AO CONSULTAR', clRed);
    Exit;
  end;

  fFluxoDados.StatusCobranca := aStatus;

  case fFluxoDados.StatusCobranca of
    stcATIVA: AtualizarPanelPrincipal('AGUARDANDO PAGAMENTO', $001ADAE3);
    stcCONCLUIDA:
    begin
      AtualizarPanelPrincipal('PAGAMENTO FINALIZADO', $0009E31F);
      Sleep(1500);
      Close;
    end;
    stcREMOVIDA_PELO_USUARIO_RECEBEDOR:
    begin
      AtualizarPanelPrincipal('PAGAMENTO CANCELADO', $000600EA);
      Sleep(1500);
      Close;
    end;
    stcREMOVIDA_PELO_PSP:
    begin
      AtualizarPanelPrincipal('CANCELADO PELO PSP', $000600EA);
      Sleep(1500);
      Close;
    end;
  else
    AtualizarPanelPrincipal('VENDENDO', clMenuHighlight);
  end;
end;

procedure TfrmExibirQrCodePIX.CancelarCobranca;
begin
  tmConsultarPagto.Enabled := False;
  try
    ConsultarCobranca;
    if (fFluxoDados.StatusCobranca = stcCONCLUIDA) then
    begin
      ShowMessage('Cobrança já foi PAGA. Impossível cancelar');
      Exit;
    end;

    if Application.MessageBox('Deseja realmente Cancelar a Cobrança?', 'Atenção', MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION) = IDNO then
    begin
      tmConsultarPagto.Enabled := True;
      Exit;
    end;

    ACBrPixCD1.PSP.epCob.CobRevisada.status := stcREMOVIDA_PELO_USUARIO_RECEBEDOR;
    if ACBrPixCD1.PSP.epCob.RevisarCobrancaImediata(fFluxoDados.TxID) then
    begin
      ConsultarCobranca;
      
      // Atualizar status no banco de dados
      AtualizarStatusPIX('CANCELADA');
    end;
  finally

  end;
end;

procedure TfrmExibirQrCodePIX.tmConsultarPagtoTimer(Sender: TObject);
begin
  tmConsultarPagto.Enabled := False;
  try
    if not fCobrancaCriada then
      Exit;

    if EstaVazio(fFluxoDados.TxID) then
    begin
      ShowMessage('Nenhuma cobrança a ser consultada');
      Exit;
    end;

    ConsultarCobranca;
    fFluxoDados.QtdConsultas := fFluxoDados.QtdConsultas + 1;
  finally
    if (fFluxoDados.StatusCobranca = stcATIVA) and
       (fFluxoDados.QtdConsultas <= 720) then
      tmConsultarPagto.Enabled := True;
  end;
end;

procedure TfrmExibirQrCodePIX.btnCancelarClick(Sender: TObject);
begin
  if fPSPConfigurado and fCobrancaCriada then
    CancelarCobranca
  else
  begin
    if Application.MessageBox('Deseja realmente Cancelar a Cobrança?', 'Atenção', MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION) = IDYES then
    begin
      AtualizarStatusPIX('CANCELADA');
      Close;
    end;
  end;
end;

procedure TfrmExibirQrCodePIX.btnConfirmarClick(Sender: TObject);
begin
  if Application.MessageBox('Você confirma que o pagamento foi efetuado?', 'Atenção', MB_YESNO + MB_ICONQUESTION) = IDYES then
    Close;
end;

procedure TfrmExibirQrCodePIX.btnCopiaEColaClick(Sender: TObject);
begin
  Clipboard.AsText := edtCopiaECola.Text;
  ShowMessage('Código PIX copiado para a área de transferência!');
end;

function TfrmExibirQrCodePIX.InserirMovimentoPIX: Integer;
var
  qryInsert: TFDQuery;
  TipoPessoa: string;
begin
  Result := 0;
  qryInsert := TFDQuery.Create(nil);
  
  try
    qryInsert.Connection := frmDmConexao.FDConnection;
    
    // Determinar tipo de pessoa (CPF ou CNPJ) baseado no tamanho do documento
    if Length(fFluxoDados.DocumentoCliente) = 14 then
      TipoPessoa := 'CNPJ'
    else
      TipoPessoa := 'CPF';
    
    // Montar INSERT com RETURNING ID
    qryInsert.SQL.Text :=
      'INSERT INTO movimento_pix (' +
      '  status_pix,' +
      '  valor_original,' +
      '  pagador_nome,' +
      '  pagador_cpf,' +
      '  pagador_cnpj,' +
      '  chave_pix_utilizada' +
      ') VALUES (' +
      '  :status_pix,' +
      '  :valor_original,' +
      '  :pagador_nome,' +
      '  :pagador_cpf,' +
      '  :pagador_cnpj,' +
      '  :chave_pix_utilizada' +
      ') RETURNING id';
    
    qryInsert.ParamByName('status_pix').AsString := 'PENDENTE';
    qryInsert.ParamByName('valor_original').AsFloat := fFluxoDados.Total;
    qryInsert.ParamByName('pagador_nome').AsString := fFluxoDados.NomeCliente;
    
    // Preencher CPF ou CNPJ conforme o tipo
    if TipoPessoa = 'CNPJ' then
    begin
      qryInsert.ParamByName('pagador_cpf').Clear;
      qryInsert.ParamByName('pagador_cnpj').AsString := fFluxoDados.DocumentoCliente;
    end
    else
    begin
      qryInsert.ParamByName('pagador_cpf').AsString := fFluxoDados.DocumentoCliente;
      qryInsert.ParamByName('pagador_cnpj').Clear;
    end;
    
    qryInsert.ParamByName('chave_pix_utilizada').AsString := fFluxoDados.ChavePix;
    
    // Executar e obter o ID retornado
    qryInsert.Open;
    
    if not qryInsert.IsEmpty then
      Result := qryInsert.FieldByName('id').AsInteger;
      
  except
    on E: Exception do
    begin
      ShowMessage('ERRO ao inserir movimento PIX: ' + E.Message);
      Result := 0;
    end;
  end;
  
  qryInsert.Free;
end;

end.
