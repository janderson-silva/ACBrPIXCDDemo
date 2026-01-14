unit untDmConexao;

interface

uses
  System.SysUtils, System.Classes, System.IniFiles, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.IBBase, FireDAC.Phys.FB,
  Data.DB, FireDAC.Comp.Client;

type
  TfrmDmConexao = class(TDataModule)
    FDConnection: TFDConnection;
    FDPhysFBDriverLink: TFDPhysFBDriverLink;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    function GetArquivoConfig: string;
  public
    { Public declarations }
    procedure CarregarConfiguracoes;
    procedure ConectarBancoDados;
  end;

var
  frmDmConexao: TfrmDmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TfrmDmConexao.GetArquivoConfig: string;
begin
  Result := ExtractFilePath(ParamStr(0)) + 'config.ini';
end;

procedure TfrmDmConexao.CarregarConfiguracoes;
var
  IniFile: TIniFile;
  CaminhoBanco, Servidor, Porta, Usuario, Senha: string;
  CaminhoCompleto: string;
begin
  IniFile := TIniFile.Create(GetArquivoConfig);
  try
    // Ler configurações do arquivo INI
    CaminhoBanco := IniFile.ReadString('Database', 'CaminhoBanco', '');
    Servidor := IniFile.ReadString('Database', 'Servidor', 'localhost');
    Porta := IniFile.ReadString('Database', 'Porta', '3050');
    Usuario := IniFile.ReadString('Database', 'Usuario', 'SYSDBA');
    Senha := IniFile.ReadString('Database', 'Senha', 'masterkey');
    
    // Se não tiver configuração, usar padrão
    if Trim(CaminhoBanco) = '' then
    begin
      CaminhoBanco := ExtractFilePath(ParamStr(0)) + 'db\ACBRPIXCDDEMO.FDB';
    end;
    
    // Montar caminho completo
    if (Servidor = 'localhost') or (Servidor = '127.0.0.1') then
      CaminhoCompleto := CaminhoBanco
    else
      CaminhoCompleto := Servidor + '/' + Porta + ':' + CaminhoBanco;
    
    // Configurar conexão
    FDConnection.Connected := False;
    FDConnection.Params.Clear;
    FDConnection.Params.Add('DriverID=FB');
    FDConnection.Params.Add('Database=' + CaminhoCompleto);
    FDConnection.Params.Add('User_Name=' + Usuario);
    FDConnection.Params.Add('Password=' + Senha);
    FDConnection.Params.Add('Server=' + Servidor);
    FDConnection.Params.Add('Port=' + Porta);
    //FDConnection.Params.Add('CharacterSet=UTF8');
    FDConnection.LoginPrompt := False;
  finally
    IniFile.Free;
  end;
end;

procedure TfrmDmConexao.ConectarBancoDados;
begin
  try
    if not FDConnection.Connected then
      FDConnection.Connected := True;
  except
    on E: Exception do
      raise Exception.Create('Erro ao conectar ao banco de dados: ' + E.Message);
  end;
end;

procedure TfrmDmConexao.DataModuleCreate(Sender: TObject);
begin
  CarregarConfiguracoes;
end;

end.
