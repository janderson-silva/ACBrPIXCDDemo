object frmCobranca: TfrmCobranca
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Cobran'#231'as PIX'
  ClientHeight = 541
  ClientWidth = 944
  Color = 15987699
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poOwnerFormCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  TextHeight = 15
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 944
    Height = 70
    Align = alTop
    BevelOuter = bvNone
    Color = 2829099
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 1200
    object shpIcone: TShape
      Left = 20
      Top = 15
      Width = 40
      Height = 40
      Pen.Style = psClear
      Shape = stCircle
    end
    object lblIcone: TLabel
      Left = 20
      Top = 15
      Width = 40
      Height = 40
      Alignment = taCenter
      AutoSize = False
      Caption = #8377
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 2829099
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      Layout = tlCenter
    end
    object lblTitulo: TLabel
      Left = 75
      Top = 18
      Width = 104
      Height = 21
      Caption = 'Cobran'#231'as PIX'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSubtitulo: TLabel
      Left = 75
      Top = 41
      Width = 279
      Height = 15
      Caption = 'Visualize e gerencie todas as cobran'#231'as PIX realizadas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 14211288
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
  end
  object pnlGrid: TPanel
    Left = 0
    Top = 70
    Width = 944
    Height = 426
    Align = alClient
    BevelOuter = bvNone
    Color = 15987699
    ParentBackground = False
    TabOrder = 1
    ExplicitWidth = 1200
    ExplicitHeight = 520
    object DBGridMovimentoPix: TDBGrid
      AlignWithMargins = True
      Left = 20
      Top = 20
      Width = 904
      Height = 386
      Margins.Left = 20
      Margins.Top = 20
      Margins.Right = 20
      Margins.Bottom = 20
      Align = alClient
      DataSource = dsMovimentoPix
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = [fsBold]
    end
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 496
    Width = 944
    Height = 45
    Align = alBottom
    BevelOuter = bvNone
    Color = 15987699
    ParentBackground = False
    TabOrder = 2
    object btnAtualizar: TButton
      AlignWithMargins = True
      Left = 20
      Top = 3
      Width = 110
      Height = 39
      Margins.Left = 20
      Align = alLeft
      Caption = 'Atualizar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnAtualizarClick
      ExplicitLeft = 950
      ExplicitTop = 12
      ExplicitHeight = 36
    end
    object btnFechar: TButton
      AlignWithMargins = True
      Left = 136
      Top = 3
      Width = 110
      Height = 39
      Align = alLeft
      Caption = 'Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnFecharClick
      ExplicitLeft = 1070
      ExplicitTop = 12
      ExplicitHeight = 36
    end
  end
  object qrMovimentoPix: TFDQuery
    Connection = frmDmConexao.FDConnection
    Left = 400
    Top = 200
    object qrMovimentoPixID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 8
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrMovimentoPixTXID: TStringField
      DisplayLabel = 'TxID'
      DisplayWidth = 35
      FieldName = 'TXID'
      Origin = 'TXID'
      Size = 35
    end
    object qrMovimentoPixE2E: TStringField
      DisplayWidth = 32
      FieldName = 'E2E'
      Origin = 'E2E'
      Size = 32
    end
    object qrMovimentoPixSTATUS_PIX: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 15
      FieldName = 'STATUS_PIX'
      Origin = 'STATUS_PIX'
      Size = 30
    end
    object qrMovimentoPixDATA_CRIACAO_PIX: TDateField
      DisplayLabel = 'Data Cria'#231#227'o'
      DisplayWidth = 12
      FieldName = 'DATA_CRIACAO_PIX'
      Origin = 'DATA_CRIACAO_PIX'
    end
    object qrMovimentoPixDATA_PAGAMENTO_PIX: TDateField
      DisplayLabel = 'Data Pagamento'
      DisplayWidth = 14
      FieldName = 'DATA_PAGAMENTO_PIX'
      Origin = 'DATA_PAGAMENTO_PIX'
    end
    object qrMovimentoPixDATA_CANCELAMENTO_PIX: TDateField
      DisplayLabel = 'Data Cancelamento'
      DisplayWidth = 16
      FieldName = 'DATA_CANCELAMENTO_PIX'
      Origin = 'DATA_CANCELAMENTO_PIX'
    end
    object qrMovimentoPixVALOR_ORIGINAL: TFMTBCDField
      DisplayLabel = 'Valor Original'
      DisplayWidth = 14
      FieldName = 'VALOR_ORIGINAL'
      Origin = 'VALOR_ORIGINAL'
      currency = True
      Precision = 15
      Size = 2
    end
    object qrMovimentoPixVALOR_PAGO: TFMTBCDField
      DisplayLabel = 'Valor Pago'
      DisplayWidth = 14
      FieldName = 'VALOR_PAGO'
      Origin = 'VALOR_PAGO'
      currency = True
      Precision = 15
      Size = 2
    end
    object qrMovimentoPixPAGADOR_NOME: TStringField
      DisplayLabel = 'Nome do Pagador'
      DisplayWidth = 35
      FieldName = 'PAGADOR_NOME'
      Origin = 'PAGADOR_NOME'
      Size = 100
    end
    object qrMovimentoPixPAGADOR_CPF: TStringField
      DisplayLabel = 'CPF'
      DisplayWidth = 12
      FieldName = 'PAGADOR_CPF'
      Origin = 'PAGADOR_CPF'
      Size = 11
    end
    object qrMovimentoPixPAGADOR_CNPJ: TStringField
      DisplayLabel = 'CNPJ'
      DisplayWidth = 15
      FieldName = 'PAGADOR_CNPJ'
      Origin = 'PAGADOR_CNPJ'
      Size = 14
    end
    object qrMovimentoPixPSP_UTILIZADO: TStringField
      DisplayLabel = 'PSP'
      DisplayWidth = 15
      FieldName = 'PSP_UTILIZADO'
      Origin = 'PSP_UTILIZADO'
      Size = 30
    end
    object qrMovimentoPixCHAVE_PIX_UTILIZADA: TStringField
      DisplayLabel = 'Chave PIX'
      DisplayWidth = 35
      FieldName = 'CHAVE_PIX_UTILIZADA'
      Origin = 'CHAVE_PIX_UTILIZADA'
      Size = 100
    end
    object qrMovimentoPixAMBIENTE: TStringField
      DisplayLabel = 'Ambiente'
      DisplayWidth = 12
      FieldName = 'AMBIENTE'
      Origin = 'AMBIENTE'
    end
  end
  object dsMovimentoPix: TDataSource
    DataSet = qrMovimentoPix
    Left = 480
    Top = 200
  end
end
