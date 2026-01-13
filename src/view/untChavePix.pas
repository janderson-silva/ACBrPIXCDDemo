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
  TfrmLocContaBancaria = class(TForm)
    PanelBottom: TPanel;
    btCadastrar: TButton;
    btEditar: TButton;
    btExcluir: TButton;
    PanelGrid: TPanel;
    DBGridContaBancaria: TDBGrid;
    qrLocContaBancaria: TFDQuery;
    dsLocContaBancaria: TDataSource;
    qrLocContaBancariaCODIGO: TStringField;
    qrLocContaBancariaCONTA: TStringField;
    qrLocContaBancariaCODBANCO: TStringField;
    qrLocContaBancariaAGENCIA: TStringField;
    qrLocContaBancariaSALDO: TFloatField;
    qrLocContaBancariaTITULAR: TStringField;
    qrLocContaBancariaNOME_AGENCIA: TStringField;
    qrLocContaBancariaNUMERO: TStringField;
    qrLocContaBancariaBANCO: TStringField;
    qrLocContaBancariaLOGO: TBlobField;
    qrLocContaBancariaCARTAO_CREDITO: TIntegerField;
    qrLocContaBancariaFINANCEIRA: TIntegerField;
    qrLocContaBancariaRESSARCIMENTO: TIntegerField;
    qrLocContaBancariaPRAZO: TIntegerField;
    qrLocContaBancariaCOMISSAO_CREDITO: TFloatField;
    qrLocContaBancariaCOMISSAO_DEBITO: TFloatField;
    qrLocContaBancariaREC_DEBITO: TIntegerField;
    qrLocContaBancariaREC_CREDITO: TIntegerField;
    qrLocContaBancariaDIGITO: TStringField;
    qrLocContaBancariaTAXA_CREDITO: TFloatField;
    qrLocContaBancariaTAXA_DEBITO: TFloatField;
    qrlancamento_conta: TFDQuery;
    qrlancamento_contaDATA: TSQLTimeStampField;
    qrlancamento_contaDOCUMENTO: TStringField;
    qrlancamento_contaHISTORICO: TStringField;
    qrlancamento_contaVALOR: TFloatField;
    qrlancamento_contaSALDO_CUMULATIVO: TFloatField;
    qrlancamento_contaCODIGO: TStringField;
    qrlancamento_contaCODCONTACORRENTE: TStringField;
    qrlancamento_contaCODCONTA: TStringField;
    qrlancamento_contaTIPO: TStringField;
    qrlancamento_contaCODCONTA_ORIGEM: TStringField;
    qrlancamento_contaTRANSFERENCIA: TStringField;
    qrlancamento_contaCONTA_RECPAG: TStringField;
    query: TFDQuery;
    qrLocContaBancariaCONTA_PADRAO: TIntegerField;
    qrLocContaBancariaCONTAPADRAO: TStringField;
    pnlHeader: TPanel;
    shpIcone: TShape;
    lblIcone: TLabel;
    lblTitulo: TLabel;
    lblSubtitulo: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocContaBancaria: TfrmLocContaBancaria;

implementation

uses untDmConexao;

{$R *.dfm}

end.
