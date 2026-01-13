unit untPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TfrmPrincipal = class(TForm)
    pnlTop: TPanel;
    lblTitulo: TLabel;
    lblSubtitulo: TLabel;
    pnlMain: TPanel;
    pnlMenu: TPanel;
    btnChavesPix: TButton;
    btnGerarCobranca: TButton;
    btnCobrancas: TButton;
    btnConfiguracoes: TButton;
    pnlFooter: TPanel;
    lblVersao: TLabel;
    pnlSeparator1: TPanel;
    pnlSeparator2: TPanel;
    pnlSeparator3: TPanel;
    procedure btnChavesPixClick(Sender: TObject);
    procedure btnGerarCobrancaClick(Sender: TObject);
    procedure btnCobrancasClick(Sender: TObject);
    procedure btnConfiguracoesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  untChavePix, untGerarCobranca, untCobranca;

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  lblVersao.Caption := 'Versão 1.0.0 - ACBr';
end;

procedure TfrmPrincipal.btnChavesPixClick(Sender: TObject);
var
  frmChavePix: TfrmChavePix;
begin
  frmChavePix := TfrmChavePix.Create(nil);
  try
    frmChavePix.ShowModal;
  finally
    frmChavePix.Free;
  end;
end;

procedure TfrmPrincipal.btnGerarCobrancaClick(Sender: TObject);
var
  frmGerarCobranca: TfrmGerarCobranca;
begin
  frmGerarCobranca := TfrmGerarCobranca.Create(nil);
  try
    frmGerarCobranca.ShowModal;
  finally
    frmGerarCobranca.Free;
  end;
end;

procedure TfrmPrincipal.btnCobrancasClick(Sender: TObject);
var
  frmCobranca: TfrmCobranca;
begin
  frmCobranca := TfrmCobranca.Create(nil);
  try
    frmCobranca.ShowModal;
  finally
    frmCobranca.Free;
  end;
end;

procedure TfrmPrincipal.btnConfiguracoesClick(Sender: TObject);
begin
  // TODO: Implementar acesso às configurações
  ShowMessage('Funcionalidade de Configurações em desenvolvimento');
end;

end.
