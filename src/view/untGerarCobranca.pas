unit untGerarCobranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  FireDAC.Comp.Client, Data.DB;

type
  TfrmGerarCobranca = class(TForm)
    pnlHeader: TPanel;
    shpIcone: TShape;
    lblIcone: TLabel;
    lblTitulo: TLabel;
    lblSubtitulo: TLabel;
    pnlContent: TPanel;
    gbChavePix: TGroupBox;
    pnlChavePix: TPanel;
    lblChavePix: TLabel;
    cbxChavePix: TComboBox;
    gbDadosCobranca: TGroupBox;
    pnlValor: TPanel;
    lblValor: TLabel;
    edtValor: TEdit;
    gbDadosCliente: TGroupBox;
    pnlNomeCliente: TPanel;
    lblNomeCliente: TLabel;
    edtNomeCliente: TEdit;
    pnlDocumento: TPanel;
    lblDocumento: TLabel;
    edtDocumento: TEdit;
    lblTipoDocumento: TLabel;
    cbxTipoDocumento: TComboBox;
    pnlFooter: TPanel;
    btnGerar: TButton;
    btnCancelar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure cbxTipoDocumentoChange(Sender: TObject);
    procedure edtDocumentoKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure CarregarChavesPix;
    procedure LimparFormulario;
    function ValidarCampos: Boolean;
    procedure AplicarMascaraDocumento;
  public
    { Public declarations }
  end;

var
  frmGerarCobranca: TfrmGerarCobranca;

implementation

uses untDmConexao, untExibirQrCodePIX;

{$R *.dfm}

procedure TfrmGerarCobranca.FormCreate(Sender: TObject);
begin
  CarregarChavesPix;
  cbxTipoDocumento.ItemIndex := 0; // CPF como padrão
end;

procedure TfrmGerarCobranca.CarregarChavesPix;
var
  qrChaves: TFDQuery;
begin
  cbxChavePix.Items.Clear;
  cbxChavePix.Items.AddObject('Selecione uma chave PIX...', TObject(-1));
  
  qrChaves := TFDQuery.Create(nil);
  try
    qrChaves.Connection := frmDmConexao.FDConnection;
    qrChaves.SQL.Text := 'SELECT id, razao_social, chave FROM chave_pix WHERE psp_configurado = 1 ORDER BY razao_social';
    qrChaves.Open;
    
    while not qrChaves.Eof do
    begin
      cbxChavePix.Items.AddObject(
        qrChaves.FieldByName('razao_social').AsString + ' - ' + qrChaves.FieldByName('chave').AsString,
        TObject(qrChaves.FieldByName('id').AsInteger)
      );
      qrChaves.Next;
    end;
  finally
    qrChaves.Free;
  end;
  
  cbxChavePix.ItemIndex := 0;
end;

procedure TfrmGerarCobranca.LimparFormulario;
begin
  edtValor.Clear;
  edtNomeCliente.Clear;
  edtDocumento.Clear;
  cbxTipoDocumento.ItemIndex := 0;
  cbxChavePix.ItemIndex := 0;
  edtValor.SetFocus;
end;

function TfrmGerarCobranca.ValidarCampos: Boolean;
var
  Valor: Double;
begin
  Result := False;
  
  // Validar Chave PIX
  if cbxChavePix.ItemIndex <= 0 then
  begin
    Application.MessageBox('Selecione uma Chave PIX!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    cbxChavePix.SetFocus;
    Exit;
  end;
  
  // Validar Valor
  if Trim(edtValor.Text) = '' then
  begin
    Application.MessageBox('Informe o valor da cobrança!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    edtValor.SetFocus;
    Exit;
  end;
  
  try
    Valor := StrToFloat(StringReplace(edtValor.Text, ',', '.', [rfReplaceAll]));
    if Valor <= 0 then
    begin
      Application.MessageBox('O valor da cobrança deve ser maior que zero!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
      edtValor.SetFocus;
      Exit;
    end;
  except
    Application.MessageBox('Valor inválido!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    edtValor.SetFocus;
    Exit;
  end;
  
  // Validar Nome do Cliente
  if Trim(edtNomeCliente.Text) = '' then
  begin
    Application.MessageBox('Informe o nome do cliente!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    edtNomeCliente.SetFocus;
    Exit;
  end;
  
  // Validar Documento
  if Trim(edtDocumento.Text) = '' then
  begin
    Application.MessageBox('Informe o documento do cliente!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    edtDocumento.SetFocus;
    Exit;
  end;
  
  Result := True;
end;

procedure TfrmGerarCobranca.AplicarMascaraDocumento;
var
  Texto: string;
begin
  // Remove caracteres não numéricos
  Texto := StringReplace(edtDocumento.Text, '.', '', [rfReplaceAll]);
  Texto := StringReplace(Texto, '-', '', [rfReplaceAll]);
  Texto := StringReplace(Texto, '/', '', [rfReplaceAll]);
  
  if cbxTipoDocumento.ItemIndex = 0 then // CPF
  begin
    // Limitar a 11 dígitos
    if Length(Texto) > 11 then
      Texto := Copy(Texto, 1, 11);
  end
  else // CNPJ
  begin
    // Limitar a 14 dígitos
    if Length(Texto) > 14 then
      Texto := Copy(Texto, 1, 14);
  end;
  
  edtDocumento.Text := Texto;
end;

procedure TfrmGerarCobranca.cbxTipoDocumentoChange(Sender: TObject);
begin
  edtDocumento.Clear;
  if cbxTipoDocumento.ItemIndex = 0 then
  begin
    edtDocumento.MaxLength := 11;
    lblDocumento.Caption := 'CPF';
  end
  else
  begin
    edtDocumento.MaxLength := 14;
    lblDocumento.Caption := 'CNPJ';
  end;
end;

procedure TfrmGerarCobranca.edtDocumentoKeyPress(Sender: TObject; var Key: Char);
begin
  // Permitir apenas números
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;

procedure TfrmGerarCobranca.edtValorKeyPress(Sender: TObject; var Key: Char);
begin
  // Permitir apenas números, vírgula e ponto
  if not (Key in ['0'..'9', ',', '.', #8]) then
    Key := #0;
end;

procedure TfrmGerarCobranca.btnGerarClick(Sender: TObject);
begin
  if ValidarCampos then
  begin
    // Aqui será implementada a geração da cobrança PIX
    ShowMessage('Cobrança gerada com sucesso!');
    LimparFormulario;
  end;
end;

procedure TfrmGerarCobranca.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

end.
