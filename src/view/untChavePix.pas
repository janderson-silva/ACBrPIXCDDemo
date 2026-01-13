unit untChavePix;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, DB,


  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.StdCtrls;

type
  TfrmChavePix = class(TForm)
    PanelBottom: TPanel;
    btCadastrar: TButton;
    btEditar: TButton;
    btExcluir: TButton;
    PanelGrid: TPanel;
    DBGridContaBancaria: TDBGrid;
    qrChavePix: TFDQuery;
    dsChavePix: TDataSource;
    pnlHeader: TPanel;
    shpIcone: TShape;
    lblIcone: TLabel;
    lblTitulo: TLabel;
    lblSubtitulo: TLabel;
    qrChavePixID: TIntegerField;
    qrChavePixRAZAO_SOCIAL: TStringField;
    qrChavePixCEP: TStringField;
    qrChavePixCIDADE: TStringField;
    qrChavePixUF: TStringField;
    qrChavePixTIPO_CHAVE: TStringField;
    qrChavePixCHAVE: TStringField;
    qrChavePixPSP_CONFIGURADO: TIntegerField;
    qrChavePixPSP: TStringField;
    qrChavePixAMBIENTE: TStringField;
    qrChavePixTIMEOUT: TIntegerField;
    qrChavePixCLIENT_ID: TStringField;
    qrChavePixCLIENT_SECRET: TStringField;
    qrChavePixSECRET_KEY: TStringField;
    qrChavePixACCESS_KEY: TStringField;
    qrChavePixACCESS_TOKEN: TStringField;
    qrChavePixTOKEN: TStringField;
    qrChavePixDEVELOPER_APPLICATION_KEY: TStringField;
    qrChavePixCONSUMER_KEY: TStringField;
    qrChavePixCONSUMER_SECRET: TStringField;
    qrChavePixACCOUNT_ID: TStringField;
    qrChavePixAUTHENTICATION_API: TStringField;
    qrChavePixAUTHENTICATION_KEY: TStringField;
    qrChavePixSECRET_KEY_HMAC: TStringField;
    qrChavePixMEDIATOR_FEE: TFMTBCDField;
    qrChavePixARQUIVO_PFX: TBlobField;
    qrChavePixSENHA_PFX: TStringField;
    qrChavePixARQUIVO_CHAVE_PRIVADA: TBlobField;
    qrChavePixARQUIVO_CERTIFICADO: TBlobField;
    qrChavePixARQUIVO_CERTIFICADO_ROOT: TBlobField;
    qrChavePixAPI_VERSAO: TStringField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure SelectChavePix;
  public
    { Public declarations }
  end;

var
  frmChavePix: TfrmChavePix;

implementation

uses untDmConexao;

{$R *.dfm}

{ TfrmChavePix }

procedure TfrmChavePix.FormCreate(Sender: TObject);
begin
  SelectChavePix;
end;

procedure TfrmChavePix.SelectChavePix;
begin
  qrChavePix.Close;
  qrChavePix.SQL.Clear;
  qrChavePix.SQL.Add('select');
  qrChavePix.SQL.Add('    *');
  qrChavePix.SQL.Add('from chave_pix');
  qrChavePix.Open;
end;

end.
