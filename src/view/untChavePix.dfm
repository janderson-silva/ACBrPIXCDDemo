object frmLocContaBancaria: TfrmLocContaBancaria
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Conta Banc'#225'ria'
  ClientHeight = 541
  ClientWidth = 944
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDefault
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
      Left = 10
      Top = 7
      Width = 100
      Height = 31
      Margins.Left = 10
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
      Left = 123
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
      Left = 236
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
      Left = 10
      Top = 10
      Width = 924
      Height = 406
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alClient
      DataSource = dsLocContaBancaria
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
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO'
          Title.Caption = 'C'#243'digo'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CONTA'
          Title.Caption = 'Conta'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODBANCO'
          Title.Caption = 'C'#243'd. Banco'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BANCO'
          Title.Caption = 'Banco'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AGENCIA'
          Title.Caption = 'Ag'#234'ncia'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULAR'
          Title.Caption = 'Titular'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CONTAPADRAO'
          Title.Caption = 'Conta Padr'#227'o'
          Width = 75
          Visible = True
        end>
    end
  end
  object qrLocContaBancaria: TFDQuery
    SQL.Strings = (
      'SELECT C.*,B.*,'
      
        '       CASE C.CONTA_PADRAO WHEN 1 THEN '#39'Sim'#39' ELSE '#39'N'#227'o'#39' END AS C' +
        'ONTAPADRAO'
      'FROM C000041 C'
      'INNER JOIN C000013 B ON B.NUMERO = C.CODBANCO')
    Left = 369
    Top = 71
    object qrLocContaBancariaCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 6
    end
    object qrLocContaBancariaCONTA: TStringField
      FieldName = 'CONTA'
      Size = 15
    end
    object qrLocContaBancariaCODBANCO: TStringField
      FieldName = 'CODBANCO'
      Size = 3
    end
    object qrLocContaBancariaAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Size = 10
    end
    object qrLocContaBancariaSALDO: TFloatField
      FieldName = 'SALDO'
    end
    object qrLocContaBancariaTITULAR: TStringField
      FieldName = 'TITULAR'
      Size = 30
    end
    object qrLocContaBancariaNOME_AGENCIA: TStringField
      FieldName = 'NOME_AGENCIA'
      Size = 30
    end
    object qrLocContaBancariaNUMERO: TStringField
      FieldName = 'NUMERO'
      Required = True
      Size = 6
    end
    object qrLocContaBancariaBANCO: TStringField
      FieldName = 'BANCO'
      Size = 80
    end
    object qrLocContaBancariaLOGO: TBlobField
      FieldName = 'LOGO'
    end
    object qrLocContaBancariaCARTAO_CREDITO: TIntegerField
      FieldName = 'CARTAO_CREDITO'
    end
    object qrLocContaBancariaFINANCEIRA: TIntegerField
      FieldName = 'FINANCEIRA'
    end
    object qrLocContaBancariaRESSARCIMENTO: TIntegerField
      FieldName = 'RESSARCIMENTO'
    end
    object qrLocContaBancariaPRAZO: TIntegerField
      FieldName = 'PRAZO'
    end
    object qrLocContaBancariaCOMISSAO_CREDITO: TFloatField
      FieldName = 'COMISSAO_CREDITO'
    end
    object qrLocContaBancariaCOMISSAO_DEBITO: TFloatField
      FieldName = 'COMISSAO_DEBITO'
    end
    object qrLocContaBancariaREC_DEBITO: TIntegerField
      FieldName = 'REC_DEBITO'
    end
    object qrLocContaBancariaREC_CREDITO: TIntegerField
      FieldName = 'REC_CREDITO'
    end
    object qrLocContaBancariaDIGITO: TStringField
      FieldName = 'DIGITO'
      Size = 3
    end
    object qrLocContaBancariaTAXA_CREDITO: TFloatField
      FieldName = 'TAXA_CREDITO'
    end
    object qrLocContaBancariaTAXA_DEBITO: TFloatField
      FieldName = 'TAXA_DEBITO'
    end
    object qrLocContaBancariaCONTA_PADRAO: TIntegerField
      FieldName = 'CONTA_PADRAO'
      Origin = 'CONTA_PADRAO'
    end
    object qrLocContaBancariaCONTAPADRAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CONTAPADRAO'
      Origin = 'CONTAPADRAO'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
  end
  object dsLocContaBancaria: TDataSource
    DataSet = qrLocContaBancaria
    Left = 369
    Top = 113
  end
  object qrlancamento_conta: TFDQuery
    SQL.Strings = (
      'select * from c000042')
    Left = 128
    Top = 133
    object qrlancamento_contaDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DATA'
    end
    object qrlancamento_contaDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      DisplayWidth = 13
      FieldName = 'DOCUMENTO'
      Size = 15
    end
    object qrlancamento_contaHISTORICO: TStringField
      DisplayLabel = 'Hist'#243'rico'
      DisplayWidth = 45
      FieldName = 'HISTORICO'
      Size = 255
    end
    object qrlancamento_contaVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VALOR'
      DisplayFormat = '#0.00'
    end
    object qrlancamento_contaSALDO_CUMULATIVO: TFloatField
      DisplayLabel = 'Saldo'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'SALDO_CUMULATIVO'
      DisplayFormat = '#0.00'
      Calculated = True
    end
    object qrlancamento_contaCODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Visible = False
      Size = 6
    end
    object qrlancamento_contaCODCONTACORRENTE: TStringField
      FieldName = 'CODCONTACORRENTE'
      Visible = False
      Size = 6
    end
    object qrlancamento_contaCODCONTA: TStringField
      FieldName = 'CODCONTA'
      Visible = False
      Size = 6
    end
    object qrlancamento_contaTIPO: TStringField
      FieldName = 'TIPO'
      Visible = False
      Size = 1
    end
    object qrlancamento_contaCODCONTA_ORIGEM: TStringField
      FieldName = 'CODCONTA_ORIGEM'
      Visible = False
      Size = 6
    end
    object qrlancamento_contaTRANSFERENCIA: TStringField
      FieldName = 'TRANSFERENCIA'
      Visible = False
      Size = 1
    end
    object qrlancamento_contaCONTA_RECPAG: TStringField
      FieldName = 'CONTA_RECPAG'
      Visible = False
      Size = 1
    end
  end
  object query: TFDQuery
    Left = 48
    Top = 128
  end
end
