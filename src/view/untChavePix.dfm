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
  Position = poDefault
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
    object btCadastrar: TButton
      AlignWithMargins = True
      Left = 20
      Top = 7
      Width = 100
      Height = 31
      Margins.Left = 20
      Margins.Top = 7
      Margins.Bottom = 7
      Align = alLeft
      Caption = 'Novo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object btEditar: TButton
      AlignWithMargins = True
      Left = 133
      Top = 7
      Width = 100
      Height = 31
      Margins.Left = 10
      Margins.Top = 7
      Margins.Bottom = 7
      Align = alLeft
      Caption = 'Editar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object btExcluir: TButton
      AlignWithMargins = True
      Left = 246
      Top = 7
      Width = 100
      Height = 31
      Margins.Left = 10
      Margins.Top = 7
      Margins.Bottom = 7
      Align = alLeft
      Caption = 'Excluir'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
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
    object DBGridContaBancaria: TDBGrid
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
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
    Active = True
    Connection = frmDmConexao.FDConnection
    SQL.Strings = (
      'select'
      '    *'
      'from chave_pix')
    Left = 417
    Top = 183
    object qrChavePixID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
    end
    object qrChavePixRAZAO_SOCIAL: TStringField
      DisplayWidth = 30
      FieldName = 'RAZAO_SOCIAL'
      Origin = 'RAZAO_SOCIAL'
      Size = 255
    end
    object qrChavePixCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Visible = False
      Size = 10
    end
    object qrChavePixCIDADE: TStringField
      DisplayWidth = 30
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Visible = False
      Size = 255
    end
    object qrChavePixUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
    object qrChavePixTIPO_CHAVE: TStringField
      FieldName = 'TIPO_CHAVE'
      Origin = 'TIPO_CHAVE'
      Size = 15
    end
    object qrChavePixCHAVE: TStringField
      DisplayWidth = 30
      FieldName = 'CHAVE'
      Origin = 'CHAVE'
      Size = 100
    end
    object qrChavePixPSP_CONFIGURADO: TIntegerField
      FieldName = 'PSP_CONFIGURADO'
      Origin = 'PSP_CONFIGURADO'
    end
    object qrChavePixPSP: TStringField
      FieldName = 'PSP'
      Origin = 'PSP'
      Size = 50
    end
    object qrChavePixAMBIENTE: TStringField
      FieldName = 'AMBIENTE'
      Origin = 'AMBIENTE'
      Size = 50
    end
    object qrChavePixTIMEOUT: TIntegerField
      FieldName = 'TIMEOUT'
      Origin = 'TIMEOUT'
      Visible = False
    end
    object qrChavePixCLIENT_ID: TStringField
      FieldName = 'CLIENT_ID'
      Origin = 'CLIENT_ID'
      Visible = False
      Size = 255
    end
    object qrChavePixCLIENT_SECRET: TStringField
      FieldName = 'CLIENT_SECRET'
      Origin = 'CLIENT_SECRET'
      Visible = False
      Size = 255
    end
    object qrChavePixSECRET_KEY: TStringField
      FieldName = 'SECRET_KEY'
      Origin = 'SECRET_KEY'
      Visible = False
      Size = 255
    end
    object qrChavePixACCESS_KEY: TStringField
      FieldName = 'ACCESS_KEY'
      Origin = 'ACCESS_KEY'
      Visible = False
      Size = 255
    end
    object qrChavePixACCESS_TOKEN: TStringField
      FieldName = 'ACCESS_TOKEN'
      Origin = 'ACCESS_TOKEN'
      Visible = False
      Size = 255
    end
    object qrChavePixTOKEN: TStringField
      FieldName = 'TOKEN'
      Origin = 'TOKEN'
      Visible = False
      Size = 255
    end
    object qrChavePixDEVELOPER_APPLICATION_KEY: TStringField
      FieldName = 'DEVELOPER_APPLICATION_KEY'
      Origin = 'DEVELOPER_APPLICATION_KEY'
      Visible = False
      Size = 255
    end
    object qrChavePixCONSUMER_KEY: TStringField
      FieldName = 'CONSUMER_KEY'
      Origin = 'CONSUMER_KEY'
      Visible = False
      Size = 255
    end
    object qrChavePixCONSUMER_SECRET: TStringField
      FieldName = 'CONSUMER_SECRET'
      Origin = 'CONSUMER_SECRET'
      Visible = False
      Size = 255
    end
    object qrChavePixACCOUNT_ID: TStringField
      FieldName = 'ACCOUNT_ID'
      Origin = 'ACCOUNT_ID'
      Visible = False
      Size = 255
    end
    object qrChavePixAUTHENTICATION_API: TStringField
      FieldName = 'AUTHENTICATION_API'
      Origin = 'AUTHENTICATION_API'
      Visible = False
      Size = 255
    end
    object qrChavePixAUTHENTICATION_KEY: TStringField
      FieldName = 'AUTHENTICATION_KEY'
      Origin = 'AUTHENTICATION_KEY'
      Visible = False
      Size = 255
    end
    object qrChavePixSECRET_KEY_HMAC: TStringField
      FieldName = 'SECRET_KEY_HMAC'
      Origin = 'SECRET_KEY_HMAC'
      Visible = False
      Size = 255
    end
    object qrChavePixMEDIATOR_FEE: TFMTBCDField
      FieldName = 'MEDIATOR_FEE'
      Origin = 'MEDIATOR_FEE'
      Visible = False
      Precision = 18
      Size = 2
    end
    object qrChavePixARQUIVO_PFX: TBlobField
      FieldName = 'ARQUIVO_PFX'
      Origin = 'ARQUIVO_PFX'
      Visible = False
    end
    object qrChavePixSENHA_PFX: TStringField
      FieldName = 'SENHA_PFX'
      Origin = 'SENHA_PFX'
      Visible = False
      Size = 255
    end
    object qrChavePixARQUIVO_CHAVE_PRIVADA: TBlobField
      FieldName = 'ARQUIVO_CHAVE_PRIVADA'
      Origin = 'ARQUIVO_CHAVE_PRIVADA'
      Visible = False
    end
    object qrChavePixARQUIVO_CERTIFICADO: TBlobField
      FieldName = 'ARQUIVO_CERTIFICADO'
      Origin = 'ARQUIVO_CERTIFICADO'
      Visible = False
    end
    object qrChavePixARQUIVO_CERTIFICADO_ROOT: TBlobField
      FieldName = 'ARQUIVO_CERTIFICADO_ROOT'
      Origin = 'ARQUIVO_CERTIFICADO_ROOT'
      Visible = False
    end
    object qrChavePixAPI_VERSAO: TStringField
      FieldName = 'API_VERSAO'
      Origin = 'API_VERSAO'
      Visible = False
      Size = 50
    end
  end
  object dsChavePix: TDataSource
    DataSet = qrChavePix
    Left = 417
    Top = 241
  end
end
