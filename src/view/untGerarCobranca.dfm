object frmGerarCobranca: TfrmGerarCobranca
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Gerar Cobran'#231'a PIX'
  ClientHeight = 561
  ClientWidth = 800
  Color = 15987699
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 800
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
      Caption = '$'
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
      Width = 141
      Height = 21
      Caption = 'Gerar Cobran'#231'a PIX'
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
      Width = 283
      Height = 15
      Caption = 'Preencha os dados para gerar uma nova cobran'#231'a PIX'
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
    Width = 800
    Height = 431
    Align = alClient
    BevelOuter = bvNone
    Color = 15987699
    ParentBackground = False
    TabOrder = 1
    ExplicitHeight = 520
    object gbChavePix: TGroupBox
      AlignWithMargins = True
      Left = 20
      Top = 20
      Width = 760
      Height = 90
      Margins.Left = 20
      Margins.Top = 20
      Margins.Right = 20
      Margins.Bottom = 0
      Caption = ' Chave PIX '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object pnlChavePix: TPanel
        Left = 15
        Top = 25
        Width = 730
        Height = 50
        BevelOuter = bvNone
        Color = 15987699
        ParentBackground = False
        TabOrder = 0
        object lblChavePix: TLabel
          Left = 0
          Top = 0
          Width = 123
          Height = 15
          Caption = 'Selecione a Chave PIX *'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5395026
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object cbxChavePix: TComboBox
          Left = 0
          Top = 20
          Width = 730
          Height = 25
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
    end
    object gbDadosCobranca: TGroupBox
      AlignWithMargins = True
      Left = 20
      Top = 125
      Width = 760
      Height = 90
      Margins.Left = 20
      Margins.Top = 15
      Margins.Right = 20
      Margins.Bottom = 0
      Caption = ' Dados da Cobran'#231'a '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object pnlValor: TPanel
        Left = 15
        Top = 25
        Width = 300
        Height = 50
        BevelOuter = bvNone
        Color = 15987699
        ParentBackground = False
        TabOrder = 0
        object lblValor: TLabel
          Left = 0
          Top = 0
          Width = 58
          Height = 15
          Caption = 'Valor (R$) *'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5395026
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object edtValor: TEdit
          Left = 0
          Top = 20
          Width = 300
          Height = 25
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnKeyPress = edtValorKeyPress
        end
      end
    end
    object gbDadosCliente: TGroupBox
      AlignWithMargins = True
      Left = 20
      Top = 230
      Width = 760
      Height = 180
      Margins.Left = 20
      Margins.Top = 15
      Margins.Right = 20
      Margins.Bottom = 0
      Caption = ' Dados do Cliente '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object pnlNomeCliente: TPanel
        Left = 15
        Top = 25
        Width = 730
        Height = 50
        BevelOuter = bvNone
        Color = 15987699
        ParentBackground = False
        TabOrder = 0
        object lblNomeCliente: TLabel
          Left = 0
          Top = 0
          Width = 98
          Height = 15
          Caption = 'Nome do Cliente *'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5395026
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object edtNomeCliente: TEdit
          Left = 0
          Top = 20
          Width = 730
          Height = 25
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
      object pnlDocumento: TPanel
        Left = 15
        Top = 90
        Width = 730
        Height = 75
        BevelOuter = bvNone
        Color = 15987699
        ParentBackground = False
        TabOrder = 1
        object lblDocumento: TLabel
          Left = 110
          Top = 0
          Width = 29
          Height = 15
          Caption = 'CPF *'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5395026
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object lblTipoDocumento: TLabel
          Left = 0
          Top = 0
          Width = 89
          Height = 15
          Caption = 'Tipo Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5395026
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object cbxTipoDocumento: TComboBox
          Left = 0
          Top = 20
          Width = 100
          Height = 25
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ItemIndex = 0
          ParentFont = False
          TabOrder = 0
          Text = 'CPF'
          OnChange = cbxTipoDocumentoChange
          Items.Strings = (
            'CPF'
            'CNPJ')
        end
        object edtDocumento: TEdit
          Left = 110
          Top = 20
          Width = 300
          Height = 25
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          MaxLength = 11
          ParentFont = False
          TabOrder = 1
          OnKeyPress = edtDocumentoKeyPress
        end
      end
    end
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 501
    Width = 800
    Height = 60
    Align = alBottom
    BevelOuter = bvNone
    Color = 15987699
    ParentBackground = False
    TabOrder = 2
    ExplicitTop = 590
    object btnGerar: TButton
      Left = 550
      Top = 12
      Width = 110
      Height = 36
      Caption = 'Gerar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnGerarClick
    end
    object btnCancelar: TButton
      Left = 670
      Top = 12
      Width = 110
      Height = 36
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
end
