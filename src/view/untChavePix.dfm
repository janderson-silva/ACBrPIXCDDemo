object frmChavePix: TfrmChavePix
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Chave PIX'
  ClientHeight = 541
  ClientWidth = 944
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poOwnerFormCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  TextHeight = 17
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 944
    Height = 70
    Align = alTop
    BevelOuter = bvNone
    Color = 2829099
    ParentBackground = False
    TabOrder = 2
    object shpIcone: TShape
      Left = 20
      Top = 15
      Width = 40
      Height = 40
      Brush.Color = 3947580
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
      Caption = #63186
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -27
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Layout = tlCenter
    end
    object lblTitulo: TLabel
      Left = 70
      Top = 18
      Width = 189
      Height = 21
      Caption = 'Gerenciamento de Contas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
    end
    object lblSubtitulo: TLabel
      Left = 70
      Top = 42
      Width = 219
      Height = 15
      Caption = 'Visualize e gerencie suas contas banc'#225'rias'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12895428
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 496
    Width = 944
    Height = 45
    Align = alBottom
    BevelOuter = bvNone
    Color = 16448250
    ParentBackground = False
    TabOrder = 0
    object btnNovo: TButton
      AlignWithMargins = True
      Left = 20
      Top = 3
      Width = 100
      Height = 39
      Margins.Left = 20
      Align = alLeft
      Caption = 'Novo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnNovoClick
      ExplicitTop = 7
      ExplicitHeight = 31
    end
    object btnEditar: TButton
      AlignWithMargins = True
      Left = 126
      Top = 3
      Width = 100
      Height = 39
      Align = alLeft
      Caption = 'Editar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnEditarClick
      ExplicitLeft = 133
      ExplicitTop = 7
      ExplicitHeight = 31
    end
    object btnExcluir: TButton
      AlignWithMargins = True
      Left = 232
      Top = 3
      Width = 100
      Height = 39
      Align = alLeft
      Caption = 'Excluir'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      ExplicitLeft = 246
      ExplicitTop = 7
      ExplicitHeight = 31
    end
  end
  object PanelGrid: TPanel
    Left = 0
    Top = 70
    Width = 944
    Height = 426
    Align = alClient
    BevelOuter = bvNone
    Color = 16448250
    ParentBackground = False
    TabOrder = 1
    object DBGridChavePix: TDBGrid
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
      DataSource = dsChavePix
      DrawingStyle = gdsClassic
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Segoe UI Semibold'
      TitleFont.Style = []
    end
  end
  object qrChavePix: TFDQuery
    Connection = frmDmConexao.FDConnection
    SQL.Strings = (
      'select'
      '    *'
      'from chave_pix')
    Left = 417
    Top = 183
    object qrChavePixID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 8
      FieldName = 'ID'
      Origin = 'ID'
    end
    object qrChavePixRAZAO_SOCIAL: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      DisplayWidth = 40
      FieldName = 'RAZAO_SOCIAL'
      Origin = 'RAZAO_SOCIAL'
      Size = 255
    end
    object qrChavePixCEP: TStringField
      DisplayWidth = 12
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 10
    end
    object qrChavePixCIDADE: TStringField
      DisplayLabel = 'Cidade'
      DisplayWidth = 25
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 255
    end
    object qrChavePixUF: TStringField
      DisplayWidth = 5
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
    object qrChavePixTIPO_CHAVE: TStringField
      DisplayLabel = 'Tipo de Chave'
      DisplayWidth = 15
      FieldName = 'TIPO_CHAVE'
      Origin = 'TIPO_CHAVE'
      Size = 15
    end
    object qrChavePixCHAVE: TStringField
      DisplayLabel = 'Chave PIX'
      DisplayWidth = 35
      FieldName = 'CHAVE'
      Origin = 'CHAVE'
      Size = 100
    end
    object qrChavePixPSP_CONFIGURADO: TIntegerField
      DisplayLabel = 'PSP Configurado'
      DisplayWidth = 15
      FieldName = 'PSP_CONFIGURADO'
      Origin = 'PSP_CONFIGURADO'
    end
    object qrChavePixPSP: TStringField
      DisplayWidth = 20
      FieldName = 'PSP'
      Origin = 'PSP'
      Size = 50
    end
    object qrChavePixAMBIENTE: TStringField
      DisplayLabel = 'Ambiente'
      DisplayWidth = 15
      FieldName = 'AMBIENTE'
      Origin = 'AMBIENTE'
      Size = 50
    end
    object qrChavePixTIMEOUT: TIntegerField
      DisplayLabel = 'Timeout'
      DisplayWidth = 10
      FieldName = 'TIMEOUT'
      Origin = 'TIMEOUT'
    end
    object qrChavePixCLIENT_ID: TStringField
      DisplayLabel = 'Client ID'
      DisplayWidth = 30
      FieldName = 'CLIENT_ID'
      Origin = 'CLIENT_ID'
      Size = 255
    end
    object qrChavePixCLIENT_SECRET: TStringField
      DisplayLabel = 'Client Secret'
      DisplayWidth = 30
      FieldName = 'CLIENT_SECRET'
      Origin = 'CLIENT_SECRET'
      Size = 255
    end
    object qrChavePixSECRET_KEY: TStringField
      DisplayLabel = 'Secret Key'
      DisplayWidth = 30
      FieldName = 'SECRET_KEY'
      Origin = 'SECRET_KEY'
      Size = 255
    end
    object qrChavePixACCESS_KEY: TStringField
      DisplayLabel = 'Access Key'
      DisplayWidth = 30
      FieldName = 'ACCESS_KEY'
      Origin = 'ACCESS_KEY'
      Size = 255
    end
    object qrChavePixACCESS_TOKEN: TStringField
      DisplayLabel = 'Access Token'
      DisplayWidth = 30
      FieldName = 'ACCESS_TOKEN'
      Origin = 'ACCESS_TOKEN'
      Size = 255
    end
    object qrChavePixTOKEN: TStringField
      DisplayLabel = 'Token'
      DisplayWidth = 30
      FieldName = 'TOKEN'
      Origin = 'TOKEN'
      Size = 255
    end
    object qrChavePixDEVELOPER_APPLICATION_KEY: TStringField
      DisplayLabel = 'Developer Application Key'
      DisplayWidth = 35
      FieldName = 'DEVELOPER_APPLICATION_KEY'
      Origin = 'DEVELOPER_APPLICATION_KEY'
      Size = 255
    end
    object qrChavePixCONSUMER_KEY: TStringField
      DisplayLabel = 'Consumer Key'
      DisplayWidth = 30
      FieldName = 'CONSUMER_KEY'
      Origin = 'CONSUMER_KEY'
      Size = 255
    end
    object qrChavePixCONSUMER_SECRET: TStringField
      DisplayLabel = 'Consumer Secret'
      DisplayWidth = 30
      FieldName = 'CONSUMER_SECRET'
      Origin = 'CONSUMER_SECRET'
      Size = 255
    end
    object qrChavePixACCOUNT_ID: TStringField
      DisplayLabel = 'Account ID'
      DisplayWidth = 25
      FieldName = 'ACCOUNT_ID'
      Origin = 'ACCOUNT_ID'
      Size = 255
    end
    object qrChavePixAUTHENTICATION_API: TStringField
      DisplayLabel = 'Authentication API'
      DisplayWidth = 30
      FieldName = 'AUTHENTICATION_API'
      Origin = 'AUTHENTICATION_API'
      Size = 255
    end
    object qrChavePixAUTHENTICATION_KEY: TStringField
      DisplayLabel = 'Authentication Key'
      DisplayWidth = 30
      FieldName = 'AUTHENTICATION_KEY'
      Origin = 'AUTHENTICATION_KEY'
      Size = 255
    end
    object qrChavePixSECRET_KEY_HMAC: TStringField
      DisplayLabel = 'Secret Key HMAC'
      DisplayWidth = 30
      FieldName = 'SECRET_KEY_HMAC'
      Origin = 'SECRET_KEY_HMAC'
      Size = 255
    end
    object qrChavePixMEDIATOR_FEE: TFMTBCDField
      DisplayLabel = 'Taxa Mediador'
      DisplayWidth = 15
      FieldName = 'MEDIATOR_FEE'
      Origin = 'MEDIATOR_FEE'
      Precision = 18
      Size = 2
    end
    object qrChavePixARQUIVO_PFX: TBlobField
      DisplayLabel = 'Arquivo PFX'
      DisplayWidth = 20
      FieldName = 'ARQUIVO_PFX'
      Origin = 'ARQUIVO_PFX'
    end
    object qrChavePixSENHA_PFX: TStringField
      DisplayLabel = 'Senha PFX'
      DisplayWidth = 20
      FieldName = 'SENHA_PFX'
      Origin = 'SENHA_PFX'
      Size = 255
    end
    object qrChavePixARQUIVO_CHAVE_PRIVADA: TBlobField
      DisplayLabel = 'Arquivo Chave Privada'
      DisplayWidth = 25
      FieldName = 'ARQUIVO_CHAVE_PRIVADA'
      Origin = 'ARQUIVO_CHAVE_PRIVADA'
    end
    object qrChavePixARQUIVO_CERTIFICADO: TBlobField
      DisplayLabel = 'Arquivo Certificado'
      DisplayWidth = 25
      FieldName = 'ARQUIVO_CERTIFICADO'
      Origin = 'ARQUIVO_CERTIFICADO'
    end
    object qrChavePixARQUIVO_CERTIFICADO_ROOT: TBlobField
      DisplayLabel = 'Arquivo Certificado Root'
      DisplayWidth = 30
      FieldName = 'ARQUIVO_CERTIFICADO_ROOT'
      Origin = 'ARQUIVO_CERTIFICADO_ROOT'
    end
    object qrChavePixAPI_VERSAO: TStringField
      DisplayLabel = 'Vers'#227'o da API'
      DisplayWidth = 15
      FieldName = 'API_VERSAO'
      Origin = 'API_VERSAO'
      Size = 50
    end
  end
  object dsChavePix: TDataSource
    DataSet = qrChavePix
    Left = 417
    Top = 241
  end
end
