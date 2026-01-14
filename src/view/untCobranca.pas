unit untCobranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.Client, FireDAC.Stan.Param, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TfrmCobranca = class(TForm)
    pnlHeader: TPanel;
    shpIcone: TShape;
    lblIcone: TLabel;
    lblTitulo: TLabel;
    lblSubtitulo: TLabel;
    pnlGrid: TPanel;
    DBGridMovimentoPix: TDBGrid;
    qrMovimentoPix: TFDQuery;
    dsMovimentoPix: TDataSource;
    pnlFooter: TPanel;
    btnAtualizar: TButton;
    btnFechar: TButton;
    qrMovimentoPixID: TIntegerField;
    qrMovimentoPixTXID: TStringField;
    qrMovimentoPixE2E: TStringField;
    qrMovimentoPixSTATUS_PIX: TStringField;
    qrMovimentoPixDATA_CRIACAO_PIX: TDateField;
    qrMovimentoPixDATA_VENCIMENTO_PIX: TDateField;
    qrMovimentoPixDATA_PAGAMENTO_PIX: TDateField;
    qrMovimentoPixDATA_CANCELAMENTO_PIX: TDateField;
    qrMovimentoPixQR_CODE_COPIA_COLA: TBlobField;
    qrMovimentoPixLOCATION_ID: TIntegerField;
    qrMovimentoPixLOCATION_URL: TStringField;
    qrMovimentoPixREVISAO: TIntegerField;
    qrMovimentoPixVALOR_ORIGINAL: TFMTBCDField;
    qrMovimentoPixVALOR_PAGO: TFMTBCDField;
    qrMovimentoPixVALOR_JUROS: TFMTBCDField;
    qrMovimentoPixVALOR_MULTA: TFMTBCDField;
    qrMovimentoPixVALOR_DESCONTO: TFMTBCDField;
    qrMovimentoPixSTATUS_DEVOLUCAO: TStringField;
    qrMovimentoPixVALOR_DEVOLVIDO: TFMTBCDField;
    qrMovimentoPixID_DEVOLUCAO: TStringField;
    qrMovimentoPixRTR_ID: TStringField;
    qrMovimentoPixDATA_DEVOLUCAO: TDateField;
    qrMovimentoPixMOTIVO_DEVOLUCAO: TStringField;
    qrMovimentoPixPAGADOR_NOME: TStringField;
    qrMovimentoPixPAGADOR_CPF: TStringField;
    qrMovimentoPixPAGADOR_CNPJ: TStringField;
    qrMovimentoPixPSP_UTILIZADO: TStringField;
    qrMovimentoPixCHAVE_PIX_UTILIZADA: TStringField;
    qrMovimentoPixAMBIENTE: TStringField;
    qrMovimentoPixEXPIRACAO_SEGUNDOS: TIntegerField;
    qrMovimentoPixPERMITE_ALTERAR_VALOR: TStringField;
    qrMovimentoPixSOLICITACAO_PAGADOR: TStringField;
    qrMovimentoPixINFO_ADICIONAL: TStringField;
    qrMovimentoPixPROBLEMA_TITULO: TStringField;
    qrMovimentoPixPROBLEMA_DETALHE: TStringField;
    btnEstornar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnEstornarClick(Sender: TObject);
  private
    { Private declarations }
    procedure CarregarMovimentos;
  public
    { Public declarations }
  end;

var
  frmCobranca: TfrmCobranca;

implementation

uses untDmConexao, untExibirDevolucaoPIX;

{$R *.dfm}

procedure TfrmCobranca.FormCreate(Sender: TObject);
begin
  CarregarMovimentos;
end;

procedure TfrmCobranca.CarregarMovimentos;
begin
  qrMovimentoPix.Close;
  qrMovimentoPix.SQL.Clear;
  qrMovimentoPix.SQL.Add('SELECT');
  qrMovimentoPix.SQL.Add('  id,');
  qrMovimentoPix.SQL.Add('  txid,');
  qrMovimentoPix.SQL.Add('  e2e,');
  qrMovimentoPix.SQL.Add('  status_pix,');
  qrMovimentoPix.SQL.Add('  data_criacao_pix,');
  qrMovimentoPix.SQL.Add('  data_vencimento_pix,');
  qrMovimentoPix.SQL.Add('  data_pagamento_pix,');
  qrMovimentoPix.SQL.Add('  data_cancelamento_pix,');
  qrMovimentoPix.SQL.Add('  qr_code_copia_cola,');
  qrMovimentoPix.SQL.Add('  location_id,');
  qrMovimentoPix.SQL.Add('  location_url,');
  qrMovimentoPix.SQL.Add('  revisao,');
  qrMovimentoPix.SQL.Add('  valor_original,');
  qrMovimentoPix.SQL.Add('  valor_pago,');
  qrMovimentoPix.SQL.Add('  valor_juros,');
  qrMovimentoPix.SQL.Add('  valor_multa,');
  qrMovimentoPix.SQL.Add('  valor_desconto,');
  qrMovimentoPix.SQL.Add('  status_devolucao,');
  qrMovimentoPix.SQL.Add('  valor_devolvido,');
  qrMovimentoPix.SQL.Add('  id_devolucao,');
  qrMovimentoPix.SQL.Add('  rtr_id,');
  qrMovimentoPix.SQL.Add('  data_devolucao,');
  qrMovimentoPix.SQL.Add('  motivo_devolucao,');
  qrMovimentoPix.SQL.Add('  pagador_nome,');
  qrMovimentoPix.SQL.Add('  pagador_cpf,');
  qrMovimentoPix.SQL.Add('  pagador_cnpj,');
  qrMovimentoPix.SQL.Add('  psp_utilizado,');
  qrMovimentoPix.SQL.Add('  chave_pix_utilizada,');
  qrMovimentoPix.SQL.Add('  ambiente,');
  qrMovimentoPix.SQL.Add('  expiracao_segundos,');
  qrMovimentoPix.SQL.Add('  permite_alterar_valor,');
  qrMovimentoPix.SQL.Add('  solicitacao_pagador,');
  qrMovimentoPix.SQL.Add('  info_adicional,');
  qrMovimentoPix.SQL.Add('  problema_titulo,');
  qrMovimentoPix.SQL.Add('  problema_detalhe');
  qrMovimentoPix.SQL.Add('FROM movimento_pix');
  qrMovimentoPix.SQL.Add('ORDER BY id DESC');
  qrMovimentoPix.Open;
end;

procedure TfrmCobranca.btnAtualizarClick(Sender: TObject);
begin
  CarregarMovimentos;
end;

procedure TfrmCobranca.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCobranca.btnEstornarClick(Sender: TObject);
var
  frmExibirDevolucaoPIX: TfrmExibirDevolucaoPIX;
begin
  // Validar se há registro selecionado
  if qrMovimentoPix.IsEmpty then
  begin
    Application.MessageBox('Selecione uma cobrança para estornar!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  
  // Validar se a cobrança foi paga
  if qrMovimentoPixSTATUS_PIX.AsString <> 'CONCLUIDA' then
  begin
    Application.MessageBox('Somente cobranças com status CONCLUIDA podem ser estornadas!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  
  // Validar se tem E2E
  if Trim(qrMovimentoPixE2E.AsString) = '' then
  begin
    Application.MessageBox('Cobrança sem E2E não pode ser estornada!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;
  
  // Validar se tem TXID
  if Trim(qrMovimentoPixTXID.AsString) = '' then
  begin
    Application.MessageBox('Cobrança sem TXID não pode ser estornada!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    Exit;
  end;

  frmExibirDevolucaoPIX := TfrmExibirDevolucaoPIX.Create(Self);
  try
    frmExibirDevolucaoPIX.Iniciar(
      qrMovimentoPixID.AsInteger,
      qrMovimentoPixCHAVE_PIX_UTILIZADA.AsString,
      qrMovimentoPixPSP_UTILIZADO.AsString,
      qrMovimentoPixTXID.AsString,
      qrMovimentoPixE2E.AsString,
      qrMovimentoPixVALOR_PAGO.AsCurrency
    );
    frmExibirDevolucaoPIX.ShowModal;
    
    // Atualizar a grid após fechar a tela de devolução
    CarregarMovimentos;
  finally
    FreeAndNil(frmExibirDevolucaoPIX);
  end;
end;

end.
