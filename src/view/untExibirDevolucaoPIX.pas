unit untExibirDevolucaoPIX;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  ACBrPIXPSPAppLess, ACBrPIXPSPC6Bank, ACBrPIXPSPBanrisul, ACBrPIXPSPGate2All,
  ACBrPIXPSPMercadoPago, ACBrPIXPSPCielo, ACBrPIXPSPMatera, ACBrPIXPSPAilos,
  ACBrPIXPSPInter, ACBrPIXPSPPixPDV, ACBrPIXPSPBradesco, ACBrPIXPSPGerenciaNet,
  ACBrPIXPSPPagSeguro, ACBrPIXPSPSicoob, ACBrPIXPSPSicredi, ACBrPIXPSPShipay,
  ACBrPIXPSPItau, ACBrPIXPSPBancoDoBrasil, ACBrPIXCD, ACBrPIXPSPSantander,
  ACBrBase, ACBrOpenSSLUtils, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  TypInfo, ACBrUtil, ACBrPIXBase;

type
  TFluxoPagtoDados = record
    CodigoLancamento: String;
    ChavePix: String;
    TipoChave: String;
    PSP: String;
    TxID: String;
    E2E: String;
    Total: Double;
    StatusDevolucao: TACBrPIXStatusDevolucao;
    EmErro: Boolean;
    IdDevolucao: String;
  end;

type
  TfrmExibirDevolucaoPIX = class(TForm)
    pnlStatus: TPanel;
    qrConfigPSP: TFDQuery;
    ACBrOpenSSLUtils1: TACBrOpenSSLUtils;
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
    tmConsultarDevolucao: TTimer;
    tmIniciar: TTimer;
    procedure tmConsultarDevolucaoTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tmIniciarTimer(Sender: TObject);
  private
    fFluxoDados: TFluxoPagtoDados;
    fInicializado: Boolean;
    function FormatarChavePIX(const AChave, ATipoChave: string): string;
    procedure AtualizarStatus(aStatusDevolucao: TACBrPIXStatusDevolucao);
    procedure EstornarPagamento;
    function ExportarBlobParaArquivo(const ANomeCampo, ANomeArquivo, APSP: string): string;
    procedure CarrgarConfigPSP;
    procedure VerificarConfiguracao;
    procedure ConfigurarACBrPSPs;
    function ObterDiretorioLog: string;
    procedure ConsultarDevolucao;
    function AtualizarDevolucaoPIX: Boolean;
    { Private declarations }
  public
    { Public declarations }
    procedure Iniciar(ACodigoLancamento, AChavePix, APsp, ATXID, AE2E: string; AValorPago: Currency);
  end;

var
  frmExibirDevolucaoPIX: TfrmExibirDevolucaoPIX;

implementation

uses untDmConexao;

{$R *.dfm}

procedure TfrmExibirDevolucaoPIX.Iniciar(ACodigoLancamento, AChavePix, APsp, ATXID, AE2E: string;
                                         AValorPago: Currency);
begin
  // Apenas inicializar dados do fluxo
  fFluxoDados.CodigoLancamento := ACodigoLancamento;
  fFluxoDados.ChavePix := AChavePix;
  fFluxoDados.PSP := APsp;
  fFluxoDados.TxID := ATXID;
  fFluxoDados.E2E := AE2E;
  fFluxoDados.Total := AValorPago;
  fFluxoDados.StatusDevolucao := stdNENHUM;
  fFluxoDados.EmErro := False;
  fFluxoDados.IdDevolucao := '';
  fInicializado := False;
end;

function TfrmExibirDevolucaoPIX.FormatarChavePIX(const AChave, ATipoChave: string): string;
var
  ChaveFormatada: string;
begin
  Result := AChave;

  // Se tipo de chave não foi informado, retorna a chave original
  if Trim(ATipoChave) = '' then
    Exit;

  ChaveFormatada := Trim(AChave);

  // Formatar conforme o tipo de chave
  if (ATipoChave = 'CPF/CNPJ') or (ATipoChave = 'CPF') or (ATipoChave = 'CNPJ') then
  begin
    // Remover formatação: pontos, traços, barras e espaços
    ChaveFormatada := StringReplace(ChaveFormatada, '.', '', [rfReplaceAll]);
    ChaveFormatada := StringReplace(ChaveFormatada, '-', '', [rfReplaceAll]);
    ChaveFormatada := StringReplace(ChaveFormatada, '/', '', [rfReplaceAll]);
    ChaveFormatada := StringReplace(ChaveFormatada, ' ', '', [rfReplaceAll]);
    Result := ChaveFormatada;
  end
  else if (ATipoChave = 'Celular') or (ATipoChave = 'Telefone') then
  begin
    // Remover formatação: parênteses, espaços, traços
    ChaveFormatada := StringReplace(ChaveFormatada, '(', '', [rfReplaceAll]);
    ChaveFormatada := StringReplace(ChaveFormatada, ')', '', [rfReplaceAll]);
    ChaveFormatada := StringReplace(ChaveFormatada, ' ', '', [rfReplaceAll]);
    ChaveFormatada := StringReplace(ChaveFormatada, '-', '', [rfReplaceAll]);

    // Adicionar +55 no início se não tiver
    if not ChaveFormatada.StartsWith('+55') then
    begin
      if ChaveFormatada.StartsWith('55') then
        ChaveFormatada := '+' + ChaveFormatada
      else
        ChaveFormatada := '+55' + ChaveFormatada;
    end;

    Result := ChaveFormatada;
  end
  else if (ATipoChave = 'E-mail') or (ATipoChave = 'Email') or (ATipoChave = 'Aleatória') or (ATipoChave = 'Aleatoria') then
  begin
    // Manter sem alteração
    Result := ChaveFormatada;
  end;
end;

procedure TfrmExibirDevolucaoPIX.FormShow(Sender: TObject);
begin
  // Ativar timer para executar após a tela estar completamente renderizada
  if not fInicializado then
  begin
    tmIniciar.Enabled := True;
  end;
end;

procedure TfrmExibirDevolucaoPIX.tmIniciarTimer(Sender: TObject);
begin
  tmIniciar.Enabled := False;
  
  if not fInicializado then
  begin
    fInicializado := True;
    
    try
      CarrgarConfigPSP;
      VerificarConfiguracao;
      ConfigurarACBrPSPs;
      EstornarPagamento;
    except
      on E: Exception do
      begin
        ShowMessage('Erro ao iniciar devolução: ' + E.Message);
        Close;
      end;
    end;
  end;
end;

procedure TfrmExibirDevolucaoPIX.AtualizarStatus(aStatusDevolucao: TACBrPIXStatusDevolucao);

  procedure AtualizarPanelPrincipal(aTexto: String; aCor: TColor);
  begin
    pnlStatus.Color := aCor;
    pnlStatus.Caption := aTexto;
    pnlStatus.Refresh;
    Application.ProcessMessages;
  end;

begin
  if fFluxoDados.EmErro then
  begin
    AtualizarPanelPrincipal('ERRO AO CONSULTAR', clRed);
    Exit;
  end;

  fFluxoDados.StatusDevolucao := aStatusDevolucao;

  case fFluxoDados.StatusDevolucao of
    stdDEVOLVIDO: 
    begin
      AtualizarPanelPrincipal('PAGAMENTO DEVOLVIDO', $0009E31F);
      Sleep(1500);
      Close;
    end;
    stdEM_PROCESSAMENTO: AtualizarPanelPrincipal('DEVOLUÇÃO PENDENTE', $00523C30);
    stdNAO_REALIZADO: 
    begin
      AtualizarPanelPrincipal('DEVOLUÇÃO NÃO REALIZADA', $00523C30);
      Sleep(1500);
      Close;
    end;
  else
    AtualizarPanelPrincipal('PROCESSANDO DEVOLUÇÃO...', clMenuHighlight);
  end;
end;

procedure TfrmExibirDevolucaoPIX.CarrgarConfigPSP;
begin
  qrConfigPSP.Close;
  qrConfigPSP.SQL.Clear;
  qrConfigPSP.SQL.Add('SELECT *');
  qrConfigPSP.SQL.Add('FROM CHAVE_PIX');
  qrConfigPSP.SQL.Add('WHERE CHAVE = :CHAVE');
  qrConfigPSP.ParamByName('CHAVE').AsString := fFluxoDados.ChavePix;
  qrConfigPSP.Open;

  // Carregar o tipo de chave e formatar adequadamente
  if not qrConfigPSP.IsEmpty then
  begin
    fFluxoDados.TipoChave := qrConfigPSP.FieldByName('TIPO_CHAVE').AsString;
    fFluxoDados.ChavePix := FormatarChavePIX(fFluxoDados.ChavePix, fFluxoDados.TipoChave);
  end;
end;

procedure TfrmExibirDevolucaoPIX.VerificarConfiguracao;
begin
  if qrConfigPSP.IsEmpty then
  begin
    MessageDlg('Nenhuma configuração PIX encontrada para esta conta/chave', mtWarning, [mbOK], 0);
    Abort;
  end;

  if qrConfigPSP.FieldByName('PSP_CONFIGURADO').AsInteger <> 1 then
  begin
    MessageDlg('PSP não está configurado', mtWarning, [mbOK], 0);
    Abort;
  end;
end;

procedure TfrmExibirDevolucaoPIX.ConfigurarACBrPSPs;
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

procedure TfrmExibirDevolucaoPIX.EstornarPagamento;
var
  E2E, IdDevolucao: string;
begin
  if fFluxoDados.PSP = 'AppLess' then
  begin
    if EstaVazio(fFluxoDados.TxID) then
    begin
      ShowMessage('Nenhum TxID para ser estornado');
      Exit;
    end;

    E2E := fFluxoDados.TxID;
    IdDevolucao := '';
  end else
  begin
    if EstaVazio(fFluxoDados.E2E) then
    begin
      ShowMessage('Nenhum End2End para ser estornado');
      Exit;
    end;

    E2E := fFluxoDados.E2E;
    IdDevolucao := StringReplace(E2E, 'E', 'D', [rfReplaceAll]);
  end;

  fFluxoDados.IdDevolucao := IdDevolucao;

  // Mostrar mensagem inicial
  pnlStatus.Color := clMenuHighlight;
  pnlStatus.Caption := 'SOLICITANDO DEVOLUÇÃO...';
  pnlStatus.Refresh;
  Application.ProcessMessages;

  try
    with ACBrPixCD1.PSP.epPix do
    begin
      DevolucaoSolicitada.Clear;
      DevolucaoSolicitada.valor := fFluxoDados.Total;
      DevolucaoSolicitada.natureza := ndORIGINAL;
      DevolucaoSolicitada.descricao := 'Devolucao da Venda';

      if SolicitarDevolucaoPix(E2E, IdDevolucao) then
      begin
        Sleep(1000);
        ConsultarDevolucao;

        // Se ficou em processamento OU não retornou status, continuar consultando
        if (fFluxoDados.StatusDevolucao = stdEM_PROCESSAMENTO) or 
           (fFluxoDados.StatusDevolucao = stdNENHUM) then
        begin
          tmConsultarDevolucao.Enabled := True;
        end;
      end
      else
      begin
        fFluxoDados.EmErro := True;
        AtualizarStatus(fFluxoDados.StatusDevolucao);
        ShowMessage('Falha ao Estornar: ' + sLineBreak +
          ACBrPixCD1.PSP.epPix.Problema.title + sLineBreak +
          ACBrPixCD1.PSP.epPix.Problema.detail);
      end;
    end;
  finally

  end;
end;

function TfrmExibirDevolucaoPIX.ExportarBlobParaArquivo(const ANomeCampo, ANomeArquivo, APSP: string): string;
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

  // Criar estrutura de diretórios C:\Atron\temp\pix\{psp}
  DiretorioTemp := 'C:\Atron\temp\pix\' + NomePSP + '\';

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

function TfrmExibirDevolucaoPIX.ObterDiretorioLog: string;
var
  NomePSPLog, DiretorioLog, NomeArqLog: string;
begin
  // Obter nome do PSP configurado
  NomePSPLog := 'sem_psp';
  if not qrConfigPSP.IsEmpty then
  begin
    NomePSPLog := LowerCase(StringReplace(qrConfigPSP.FieldByName('PSP').AsString, ' ', '', [rfReplaceAll]));
  end;

  // Criar estrutura de diret�rios C:\Atron\log\pix\{psp}
  DiretorioLog := 'C:\Atron\log\pix\' + NomePSPLog + '\';

  if not DirectoryExists(DiretorioLog) then
    ForceDirectories(DiretorioLog);

  NomeArqLog := DiretorioLog + FormatDateTime('yyyymmdd', Now) + '.log';

  Result := NomeArqLog;
end;

procedure TfrmExibirDevolucaoPIX.tmConsultarDevolucaoTimer(Sender: TObject);
begin
  tmConsultarDevolucao.Enabled := False;
  try
    if EstaVazio(fFluxoDados.E2E) then
    begin
      ShowMessage('Nenhum pagamento a ser consultado (E2E)');
      Exit;
    end;

    ConsultarDevolucao;
  finally
    if (fFluxoDados.StatusDevolucao = stdEM_PROCESSAMENTO) then
      tmConsultarDevolucao.Enabled := True;
  end;
end;

procedure TfrmExibirDevolucaoPIX.ConsultarDevolucao;
var
  E2E: string;
begin
  E2E := fFluxoDados.E2E;

  if EstaVazio(E2E) then
  begin
    ShowMessage('Nenhum E2E para consultar');
    Exit;
  end;

  try
    if (not ACBrPixCD1.PSP.epPix.ConsultarPix(E2E)) then
    begin
      fFluxoDados.EmErro := True;
      ShowMessage('Erro ao consultar devolução' + sLineBreak +
        ACBrPixCD1.PSP.epPix.Problema.title + sLineBreak +
        ACBrPixCD1.PSP.epPix.Problema.detail);
      Exit;
    end;

    // Verificar se existem devoluções
    if (ACBrPixCD1.PSP.epPix.Pix.devolucoes.Count > 0) then
    begin
      AtualizarStatus(ACBrPixCD1.PSP.epPix.Pix.devolucoes[0].status);
      
      // Se foi devolvido ou não realizado, atualizar banco
      if (fFluxoDados.StatusDevolucao = stdDEVOLVIDO) or 
         (fFluxoDados.StatusDevolucao = stdNAO_REALIZADO) then
      begin
        AtualizarDevolucaoPIX;
      end;
    end
    else
    begin
      // Se não encontrou devoluções, pode ser que ainda não foi processado
      // Mantém o status como EM_PROCESSAMENTO se já estava
      if fFluxoDados.StatusDevolucao = stdNENHUM then
      begin
        fFluxoDados.StatusDevolucao := stdEM_PROCESSAMENTO;
        AtualizarStatus(stdEM_PROCESSAMENTO);
      end;
    end;
  finally

  end;
end;

function TfrmExibirDevolucaoPIX.AtualizarDevolucaoPIX: Boolean;
var
  qryUpdate: TFDQuery;
  StatusDevolucaoStr, RtrId, CodigoLancamento: string;
  ValorDevolvido: Currency;
begin
  Result := False;

  qryUpdate := TFDQuery.Create(nil);
  try
    qryUpdate.Connection := frmDmConexao.FDConnection;

    // Obter c�digo do lan�amento
    CodigoLancamento := fFluxoDados.CodigoLancamento;

    if Trim(CodigoLancamento) = '' then
    begin
      ShowMessage('Código do lançamento não encontrado');
      Exit;
    end;

    // Obter dados da devolu��o
    if (ACBrPixCD1.PSP.epPix.Pix.devolucoes.Count > 0) then
    begin
      // Converter status para string
      case fFluxoDados.StatusDevolucao of
        stdDEVOLVIDO: StatusDevolucaoStr := 'DEVOLVIDO';
        stdEM_PROCESSAMENTO: StatusDevolucaoStr := 'EM_PROCESSAMENTO';
        stdNAO_REALIZADO: StatusDevolucaoStr := 'NAO_REALIZADO';
      else
        StatusDevolucaoStr := 'DESCONHECIDO';
      end;

      ValorDevolvido := ACBrPixCD1.PSP.epPix.Pix.devolucoes[0].valor;
      RtrId := ACBrPixCD1.PSP.epPix.Pix.devolucoes[0].rtrId;
    end
    else
    begin
      StatusDevolucaoStr := 'EM_PROCESSAMENTO';
      ValorDevolvido := fFluxoDados.Total;
      RtrId := '';
    end;

    // Atualizar campos de devolu��o
    qryUpdate.SQL.Text :=
      'UPDATE C000042 SET ' +
      '  STATUS_DEVOLUCAO = :STATUS_DEVOLUCAO, ' +
      '  VALOR_DEVOLVIDO = :VALOR_DEVOLVIDO, ' +
      '  ID_DEVOLUCAO = :ID_DEVOLUCAO, ' +
      '  RTR_ID = :RTR_ID, ' +
      '  DATA_DEVOLUCAO = :DATA_DEVOLUCAO ' +
      'WHERE CODIGO = :CODIGO';

    qryUpdate.ParamByName('STATUS_DEVOLUCAO').AsString := StatusDevolucaoStr;
    qryUpdate.ParamByName('VALOR_DEVOLVIDO').AsCurrency := ValorDevolvido;
    qryUpdate.ParamByName('ID_DEVOLUCAO').AsString := fFluxoDados.IdDevolucao;
    qryUpdate.ParamByName('RTR_ID').AsString := RtrId;

    if fFluxoDados.StatusDevolucao = stdDEVOLVIDO then
      qryUpdate.ParamByName('DATA_DEVOLUCAO').AsDateTime := Now
    else
      qryUpdate.ParamByName('DATA_DEVOLUCAO').Clear;

    qryUpdate.ParamByName('CODIGO').AsString := CodigoLancamento;

    qryUpdate.ExecSQL;
    qryUpdate.Connection.Commit;

    Result := True;

  except
    on E: Exception do
    begin
      ShowMessage('Erro ao atualizar devolução PIX: ' + E.Message);
      qryUpdate.Connection.Rollback;
    end;
  end;

  qryUpdate.Free;
end;

end.
