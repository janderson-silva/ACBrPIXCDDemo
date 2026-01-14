unit untConfigBancoDados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  System.IniFiles, FireDAC.Comp.Client, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait;

type
  TfrmConfigBancoDados = class(TForm)
    pnlHeader: TPanel;
    shpIcone: TShape;
    lblIcone: TLabel;
    lblTitulo: TLabel;
    lblSubtitulo: TLabel;
    pnlContent: TPanel;
    gbConfiguracoes: TGroupBox;
    pnlCaminhoBanco: TPanel;
    lblCaminhoBanco: TLabel;
    edtCaminhoBanco: TEdit;
    btnProcurar: TButton;
    pnlServidor: TPanel;
    lblServidor: TLabel;
    edtServidor: TEdit;
    pnlPorta: TPanel;
    lblPorta: TLabel;
    edtPorta: TEdit;
    pnlUsuario: TPanel;
    lblUsuario: TLabel;
    edtUsuario: TEdit;
    pnlSenha: TPanel;
    lblSenha: TLabel;
    edtSenha: TEdit;
    pnlFooter: TPanel;
    btnTestarConexao: TButton;
    btnSalvar: TButton;
    btnCancelar: TButton;
    OpenDialog: TOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure btnProcurarClick(Sender: TObject);
    procedure btnTestarConexaoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    function GetArquivoConfig: string;
    procedure CarregarConfiguracoes;
    procedure SalvarConfiguracoes;
    function TestarConexao: Boolean;
  public
    { Public declarations }
  end;

var
  frmConfigBancoDados: TfrmConfigBancoDados;

implementation

{$R *.dfm}

function TfrmConfigBancoDados.GetArquivoConfig: string;
begin
  Result := ExtractFilePath(Application.ExeName) + 'config.ini';
end;

procedure TfrmConfigBancoDados.FormCreate(Sender: TObject);
begin
  CarregarConfiguracoes;
end;

procedure TfrmConfigBancoDados.CarregarConfiguracoes;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(GetArquivoConfig);
  try
    edtCaminhoBanco.Text := IniFile.ReadString('Database', 'CaminhoBanco', '');
    edtServidor.Text := IniFile.ReadString('Database', 'Servidor', 'localhost');
    edtPorta.Text := IniFile.ReadString('Database', 'Porta', '3050');
    edtUsuario.Text := IniFile.ReadString('Database', 'Usuario', 'SYSDBA');
    edtSenha.Text := IniFile.ReadString('Database', 'Senha', 'masterkey');
  finally
    IniFile.Free;
  end;
end;

procedure TfrmConfigBancoDados.SalvarConfiguracoes;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(GetArquivoConfig);
  try
    IniFile.WriteString('Database', 'CaminhoBanco', edtCaminhoBanco.Text);
    IniFile.WriteString('Database', 'Servidor', edtServidor.Text);
    IniFile.WriteString('Database', 'Porta', edtPorta.Text);
    IniFile.WriteString('Database', 'Usuario', edtUsuario.Text);
    IniFile.WriteString('Database', 'Senha', edtSenha.Text);
    
    Application.MessageBox('Configurações salvas com sucesso!', 'Sucesso', MB_OK + MB_ICONINFORMATION);
  finally
    IniFile.Free;
  end;
end;

procedure TfrmConfigBancoDados.btnProcurarClick(Sender: TObject);
begin
  OpenDialog.Filter := 'Banco de Dados Firebird|*.fdb;*.gdb|Todos os arquivos|*.*';
  OpenDialog.FileName := '';
  
  if OpenDialog.Execute then
    edtCaminhoBanco.Text := OpenDialog.FileName;
end;

function TfrmConfigBancoDados.TestarConexao: Boolean;
var
  Conexao: TFDConnection;
  CaminhoCompleto: string;
begin
  Result := False;
  
  // Validar campos obrigatórios
  if Trim(edtCaminhoBanco.Text) = '' then
  begin
    Application.MessageBox('Informe o caminho do banco de dados!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    edtCaminhoBanco.SetFocus;
    Exit;
  end;
  
  if Trim(edtServidor.Text) = '' then
  begin
    Application.MessageBox('Informe o servidor!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    edtServidor.SetFocus;
    Exit;
  end;
  
  if Trim(edtPorta.Text) = '' then
  begin
    Application.MessageBox('Informe a porta!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    edtPorta.SetFocus;
    Exit;
  end;
  
  if Trim(edtUsuario.Text) = '' then
  begin
    Application.MessageBox('Informe o usuário!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    edtUsuario.SetFocus;
    Exit;
  end;
  
  Conexao := TFDConnection.Create(nil);
  try
    // Configurar conexão
    Conexao.DriverName := 'FB';
    
    // Montar caminho completo
    if (edtServidor.Text = 'localhost') or (edtServidor.Text = '127.0.0.1') then
      CaminhoCompleto := edtCaminhoBanco.Text
    else
      CaminhoCompleto := edtServidor.Text + '/' + edtPorta.Text + ':' + edtCaminhoBanco.Text;
    
    Conexao.Params.Clear;
    Conexao.Params.Add('DriverID=FB');
    Conexao.Params.Add('Database=' + CaminhoCompleto);
    Conexao.Params.Add('User_Name=' + edtUsuario.Text);
    Conexao.Params.Add('Password=' + edtSenha.Text);
    Conexao.Params.Add('Port=' + edtPorta.Text);
    Conexao.Params.Add('CharacterSet=UTF8');
    
    try
      Conexao.Connected := True;
      
      if Conexao.Connected then
      begin
        Application.MessageBox('Conexão realizada com sucesso!', 'Sucesso', MB_OK + MB_ICONINFORMATION);
        Result := True;
      end;
      
      Conexao.Connected := False;
    except
      on E: Exception do
      begin
        Application.MessageBox(PChar('Erro ao conectar ao banco de dados:' + #13#10 + E.Message), 
                             'Erro', MB_OK + MB_ICONERROR);
      end;
    end;
  finally
    Conexao.Free;
  end;
end;

procedure TfrmConfigBancoDados.btnTestarConexaoClick(Sender: TObject);
begin
  TestarConexao;
end;

procedure TfrmConfigBancoDados.btnSalvarClick(Sender: TObject);
begin
  if TestarConexao then
  begin
    SalvarConfiguracoes;
    ModalResult := mrOk;
  end;
end;

procedure TfrmConfigBancoDados.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

end.
