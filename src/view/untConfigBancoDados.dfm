object frmConfigBancoDados: TfrmConfigBancoDados
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Configura'#231#227'o do Banco de Dados'
  ClientHeight = 550
  ClientWidth = 700
  Color = 15987699
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  TextHeight = 15
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 700
    Height = 70
    Align = alTop
    BevelOuter = bvNone
    Color = 2829099
    ParentBackground = False
    TabOrder = 0
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
      Caption = #9881
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
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
      Width = 244
      Height = 21
      Caption = 'Configura'#231#227'o do Banco de Dados'
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
      Width = 319
      Height = 15
      Caption = 'Configure os par'#226'metros de conex'#227'o com o banco de dados'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 14211288
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
  end
  object pnlContent: TPanel
    Left = 0
    Top = 70
    Width = 700
    Height = 420
    Align = alClient
    BevelOuter = bvNone
    Color = 15987699
    ParentBackground = False
    TabOrder = 1
    object gbConfiguracoes: TGroupBox
      AlignWithMargins = True
      Left = 20
      Top = 20
      Width = 660
      Height = 380
      Margins.Left = 20
      Margins.Top = 20
      Margins.Right = 20
      Margins.Bottom = 20
      Caption = ' Configura'#231#245'es de Conex'#227'o '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object pnlCaminhoBanco: TPanel
        Left = 15
        Top = 25
        Width = 630
        Height = 65
        BevelOuter = bvNone
        Color = 15987699
        ParentBackground = False
        TabOrder = 0
        object lblCaminhoBanco: TLabel
          Left = 0
          Top = 0
          Width = 162
          Height = 15
          Caption = 'Caminho do Banco de Dados *'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5395026
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object edtCaminhoBanco: TEdit
          Left = 0
          Top = 20
          Width = 530
          Height = 25
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object btnProcurar: TButton
          Left = 540
          Top = 20
          Width = 90
          Height = 24
          Caption = 'Procurar...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btnProcurarClick
        end
      end
      object pnlServidor: TPanel
        Left = 15
        Top = 100
        Width = 400
        Height = 50
        BevelOuter = bvNone
        Color = 15987699
        ParentBackground = False
        TabOrder = 1
        object lblServidor: TLabel
          Left = 0
          Top = 0
          Width = 51
          Height = 15
          Caption = 'Servidor *'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5395026
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object edtServidor: TEdit
          Left = 0
          Top = 20
          Width = 400
          Height = 25
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = 'localhost'
        end
      end
      object pnlPorta: TPanel
        Left = 425
        Top = 100
        Width = 205
        Height = 50
        BevelOuter = bvNone
        Color = 15987699
        ParentBackground = False
        TabOrder = 2
        object lblPorta: TLabel
          Left = 0
          Top = 0
          Width = 36
          Height = 15
          Caption = 'Porta *'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5395026
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object edtPorta: TEdit
          Left = 0
          Top = 20
          Width = 205
          Height = 25
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = '3050'
        end
      end
      object pnlUsuario: TPanel
        Left = 15
        Top = 165
        Width = 400
        Height = 50
        BevelOuter = bvNone
        Color = 15987699
        ParentBackground = False
        TabOrder = 3
        object lblUsuario: TLabel
          Left = 0
          Top = 0
          Width = 48
          Height = 15
          Caption = 'Usu'#225'rio *'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5395026
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object edtUsuario: TEdit
          Left = 0
          Top = 20
          Width = 400
          Height = 25
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = 'SYSDBA'
        end
      end
      object pnlSenha: TPanel
        Left = 15
        Top = 230
        Width = 400
        Height = 50
        BevelOuter = bvNone
        Color = 15987699
        ParentBackground = False
        TabOrder = 4
        object lblSenha: TLabel
          Left = 0
          Top = 0
          Width = 40
          Height = 15
          Caption = 'Senha *'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5395026
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object edtSenha: TEdit
          Left = 0
          Top = 20
          Width = 400
          Height = 25
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          PasswordChar = '*'
          TabOrder = 0
          Text = 'masterkey'
        end
      end
    end
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 490
    Width = 700
    Height = 60
    Align = alBottom
    BevelOuter = bvNone
    Color = 15987699
    ParentBackground = False
    TabOrder = 2
    object btnTestarConexao: TButton
      Left = 340
      Top = 12
      Width = 140
      Height = 36
      Caption = 'Testar Conex'#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnTestarConexaoClick
    end
    object btnSalvar: TButton
      Left = 490
      Top = 12
      Width = 90
      Height = 36
      Caption = 'Salvar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnSalvarClick
    end
    object btnCancelar: TButton
      Left = 590
      Top = 12
      Width = 90
      Height = 36
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnCancelarClick
    end
  end
  object OpenDialog: TOpenDialog
    Left = 320
    Top = 240
  end
end
