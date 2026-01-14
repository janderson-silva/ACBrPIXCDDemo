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
    qrMovimentoPixDATA_PAGAMENTO_PIX: TDateField;
    qrMovimentoPixDATA_CANCELAMENTO_PIX: TDateField;
    qrMovimentoPixVALOR_ORIGINAL: TFMTBCDField;
    qrMovimentoPixVALOR_PAGO: TFMTBCDField;
    qrMovimentoPixPAGADOR_NOME: TStringField;
    qrMovimentoPixPAGADOR_CPF: TStringField;
    qrMovimentoPixPAGADOR_CNPJ: TStringField;
    qrMovimentoPixPSP_UTILIZADO: TStringField;
    qrMovimentoPixCHAVE_PIX_UTILIZADA: TStringField;
    qrMovimentoPixAMBIENTE: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
    procedure CarregarMovimentos;
  public
    { Public declarations }
  end;

var
  frmCobranca: TfrmCobranca;

implementation

uses untDmConexao;

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
  qrMovimentoPix.SQL.Add('  data_pagamento_pix,');
  qrMovimentoPix.SQL.Add('  data_cancelamento_pix,');
  qrMovimentoPix.SQL.Add('  valor_original,');
  qrMovimentoPix.SQL.Add('  valor_pago,');
  qrMovimentoPix.SQL.Add('  pagador_nome,');
  qrMovimentoPix.SQL.Add('  pagador_cpf,');
  qrMovimentoPix.SQL.Add('  pagador_cnpj,');
  qrMovimentoPix.SQL.Add('  psp_utilizado,');
  qrMovimentoPix.SQL.Add('  chave_pix_utilizada,');
  qrMovimentoPix.SQL.Add('  ambiente');
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

end.
