object frmChavePixCadastro: TfrmChavePixCadastro
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Chave PIX'
  ClientHeight = 700
  ClientWidth = 900
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 900
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
      Caption = #62737
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
      Width = 164
      Height = 21
      Caption = 'Cadastro de Chave PIX'
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
      Width = 265
      Height = 15
      Caption = 'Preencha os dados da chave PIX e configure o PSP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12895428
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 70
    Width = 900
    Height = 580
    VertScrollBar.Position = 130
    Align = alClient
    BorderStyle = bsNone
    Color = 15987699
    ParentColor = False
    TabOrder = 1
    ExplicitTop = 18
    DesignSize = (
      883
      580)
    object gbDadosBasicos: TGroupBox
      AlignWithMargins = True
      Left = 20
      Top = -110
      Width = 840
      Height = 170
      Margins.Left = 20
      Margins.Top = 20
      Margins.Right = 20
      Margins.Bottom = 0
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Dados B'#225'sicos '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5395026
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        840
        170)
      object pnlRazaoSocial: TPanel
        Left = 10
        Top = 25
        Width = 820
        Height = 45
        Anchors = [akLeft, akTop, akRight]
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          820
          45)
        object lblRazaoSocial: TLabel
          Left = 0
          Top = 0
          Width = 65
          Height = 15
          Caption = 'Raz'#227'o Social'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object edtRazaoSocial: TEdit
          Left = 0
          Top = 20
          Width = 820
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
      object pnlCEP: TPanel
        Left = 10
        Top = 70
        Width = 150
        Height = 45
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
        object lblCEP: TLabel
          Left = 0
          Top = 0
          Width = 21
          Height = 15
          Caption = 'CEP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object edtCEP: TEdit
          Left = 0
          Top = 20
          Width = 150
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
      object pnlCidade: TPanel
        Left = 170
        Top = 70
        Width = 560
        Height = 45
        Anchors = [akLeft, akTop, akRight]
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 2
        DesignSize = (
          560
          45)
        object lblCidade: TLabel
          Left = 0
          Top = 0
          Width = 37
          Height = 15
          Caption = 'Cidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object edtCidade: TEdit
          Left = 0
          Top = 20
          Width = 560
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
      object pnlUF: TPanel
        Left = 740
        Top = 70
        Width = 90
        Height = 45
        Anchors = [akTop, akRight]
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 3
        DesignSize = (
          90
          45)
        object lblUF: TLabel
          Left = 0
          Top = 0
          Width = 14
          Height = 15
          Anchors = [akTop, akRight]
          Caption = 'UF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object cbxUF: TComboBox
          Left = 0
          Top = 20
          Width = 90
          Height = 23
          Style = csDropDownList
          Anchors = [akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Items.Strings = (
            'AC'
            'AL'
            'AP'
            'AM'
            'BA'
            'CE'
            'DF'
            'ES'
            'GO'
            'MA'
            'MT'
            'MS'
            'MG'
            'PA'
            'PB'
            'PR'
            'PE'
            'PI'
            'RJ'
            'RN'
            'RS'
            'RO'
            'RR'
            'SC'
            'SP'
            'SE'
            'TO')
        end
      end
      object pnlTipoChave: TPanel
        Left = 10
        Top = 115
        Width = 200
        Height = 45
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 4
        object lblTipoChave: TLabel
          Left = 0
          Top = 0
          Width = 75
          Height = 15
          Caption = 'Tipo de Chave'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object cbxTipoChave: TComboBox
          Left = 0
          Top = 20
          Width = 200
          Height = 23
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Items.Strings = (
            'Nenhuma'
            'Email'
            'CPF'
            'CNPJ'
            'Celular'
            'Aleat'#243'ria')
        end
      end
      object pnlChave: TPanel
        Left = 220
        Top = 115
        Width = 610
        Height = 45
        Anchors = [akLeft, akTop, akRight]
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 5
        DesignSize = (
          610
          45)
        object lblChave: TLabel
          Left = 0
          Top = 0
          Width = 53
          Height = 15
          Caption = 'Chave PIX'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object edtChave: TEdit
          Left = 0
          Top = 20
          Width = 610
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnChange = edtChaveChange
        end
      end
    end
    object gbPSP: TGroupBox
      AlignWithMargins = True
      Left = 20
      Top = 80
      Width = 840
      Height = 80
      Margins.Left = 20
      Margins.Top = 20
      Margins.Right = 20
      Margins.Bottom = 0
      Anchors = [akLeft, akTop, akRight]
      Caption = ' Configura'#231#227'o PSP '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5395026
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      TabOrder = 1
      object pnPSP: TPanel
        Left = 10
        Top = 25
        Width = 820
        Height = 45
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        object Label16: TLabel
          Left = 0
          Top = 0
          Width = 51
          Height = 15
          Caption = 'PSP Atual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label17: TLabel
          Left = 350
          Top = 0
          Width = 52
          Height = 15
          Caption = 'Ambiente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object Label18: TLabel
          Left = 600
          Top = 0
          Width = 44
          Height = 15
          Caption = 'Timeout'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object cbxPSPAtual: TComboBox
          Left = 0
          Top = 20
          Width = 340
          Height = 23
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnChange = cbxPSPAtualChange
        end
        object cbxAmbiente: TComboBox
          Left = 350
          Top = 20
          Width = 240
          Height = 23
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object seTimeout: TSpinEdit
          Left = 600
          Top = 20
          Width = 150
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Increment = 1000
          MaxValue = 999999
          MinValue = 0
          ParentFont = False
          TabOrder = 2
          Value = 0
        end
      end
    end
    object PageControl1: TPageControl
      AlignWithMargins = True
      Left = 20
      Top = 180
      Width = 840
      Height = 400
      Margins.Left = 20
      Margins.Top = 20
      Margins.Right = 20
      Margins.Bottom = 20
      ActivePage = tsCertificado
      Anchors = [akLeft, akTop, akRight]
      Images = img_icon_preto_pgc
      TabHeight = 30
      TabOrder = 2
      object TabSheet2: TTabSheet
        Caption = 'Configura'#231#227'o PSP'
        DesignSize = (
          832
          360)
        object pnlConfig1: TPanel
          Left = 10
          Top = 10
          Width = 812
          Height = 50
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 0
          DesignSize = (
            812
            50)
          object lblTitulo1: TLabel
            Left = 0
            Top = 0
            Width = 133
            Height = 15
            Caption = 'Client ID / Consumer Key'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object edtConfig1: TEdit
            Left = 0
            Top = 20
            Width = 812
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
        end
        object pnlConfig2: TPanel
          Left = 10
          Top = 70
          Width = 812
          Height = 50
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 1
          DesignSize = (
            812
            50)
          object lblTitulo2: TLabel
            Left = 0
            Top = 0
            Width = 167
            Height = 15
            Caption = 'Client Secret / Consumer Secret'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object edtConfig2: TEdit
            Left = 0
            Top = 20
            Width = 812
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
        end
        object pnlConfig3: TPanel
          Left = 10
          Top = 130
          Width = 812
          Height = 50
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 2
          DesignSize = (
            812
            50)
          object lblTitulo3: TLabel
            Left = 0
            Top = 0
            Width = 204
            Height = 15
            Caption = 'Secret Key / Developer Application Key'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object edtConfig3: TEdit
            Left = 0
            Top = 20
            Width = 812
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
        end
        object pnlConfig4: TPanel
          Left = 10
          Top = 190
          Width = 812
          Height = 50
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 3
          DesignSize = (
            812
            50)
          object lblTitulo4: TLabel
            Left = 0
            Top = 0
            Width = 170
            Height = 15
            Caption = 'Access Key / Authentication Key'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object edtConfig4: TEdit
            Left = 0
            Top = 20
            Width = 812
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
        end
        object pnlConfig5: TPanel
          Left = 10
          Top = 250
          Width = 812
          Height = 50
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 4
          DesignSize = (
            812
            50)
          object lblTitulo5: TLabel
            Left = 0
            Top = 0
            Width = 140
            Height = 15
            Caption = 'Access Token / Account ID'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object edtConfig5: TEdit
            Left = 0
            Top = 20
            Width = 812
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
        end
        object pnlConfig6: TPanel
          Left = 10
          Top = 310
          Width = 812
          Height = 50
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 5
          DesignSize = (
            812
            50)
          object lblTitulo6: TLabel
            Left = 0
            Top = 0
            Width = 215
            Height = 15
            Caption = 'Token / Mediator Fee / Secret Key HMAC'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object edtConfig6: TEdit
            Left = 0
            Top = 20
            Width = 812
            Height = 23
            Anchors = [akLeft, akTop, akRight]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
        end
      end
      object tsCertificado: TTabSheet
        Caption = 'Certificados'
        ImageIndex = 1
        object pnlCertificados: TPanel
          Left = 0
          Top = 0
          Width = 832
          Height = 360
          Align = alClient
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 0
          DesignSize = (
            832
            360)
          object lblCertificados: TLabel
            Left = 10
            Top = 10
            Width = 144
            Height = 17
            Caption = 'CERTIFICADOS DIGITAIS'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI Semibold'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object pnlArquivoPFX: TPanel
            Left = 10
            Top = 40
            Width = 812
            Height = 50
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            Color = clWhite
            ParentBackground = False
            TabOrder = 0
            DesignSize = (
              812
              50)
            object lblArquivoPFX: TLabel
              Left = 0
              Top = 0
              Width = 134
              Height = 15
              Caption = 'Arquivo PFX (Certificado)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object edtArquivoPFX: TEdit
              Left = 0
              Top = 20
              Width = 740
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnChange = edtArquivoPFXChange
            end
            object btnArquivoPFX: TButton
              Left = 750
              Top = 20
              Width = 60
              Height = 23
              Anchors = [akTop, akRight]
              Caption = '...'
              TabOrder = 1
              OnClick = btnArquivoPFXClick
            end
          end
          object pnlSenhaPFX: TPanel
            Left = 10
            Top = 100
            Width = 812
            Height = 50
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            Color = clWhite
            ParentBackground = False
            TabOrder = 1
            DesignSize = (
              812
              50)
            object lblSenhaPFX: TLabel
              Left = 0
              Top = 0
              Width = 72
              Height = 15
              Caption = 'Senha do PFX'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object edtSenhaPFX: TEdit
              Left = 0
              Top = 20
              Width = 812
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              PasswordChar = '*'
              TabOrder = 0
              OnChange = edtSenhaPFXChange
            end
          end
          object pnlExtrairChaveCertificado: TPanel
            Left = 10
            Top = 160
            Width = 812
            Height = 50
            BevelOuter = bvNone
            Color = clWhite
            ParentBackground = False
            TabOrder = 2
            object btnExtrairChaveCertificado: TButton
              Left = 0
              Top = 10
              Width = 200
              Height = 35
              Caption = 'Extrair Chave/Certificado'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnClick = btnExtrairChaveCertificadoClick
            end
          end
          object pnlArquivoChavePrivada: TPanel
            Left = 10
            Top = 220
            Width = 812
            Height = 50
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            Color = clWhite
            ParentBackground = False
            TabOrder = 3
            DesignSize = (
              812
              50)
            object lblArquivoChavePrivada: TLabel
              Left = 0
              Top = 0
              Width = 152
              Height = 15
              Caption = 'Arquivo Chave Privada (.key)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object edtArquivoChavePrivada: TEdit
              Left = 0
              Top = 20
              Width = 740
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object btnArquivoChavePrivada: TButton
              Left = 750
              Top = 20
              Width = 60
              Height = 23
              Anchors = [akTop, akRight]
              Caption = '...'
              TabOrder = 1
              OnClick = btnArquivoChavePrivadaClick
            end
          end
          object pnlArquivoCertificado: TPanel
            Left = 10
            Top = 280
            Width = 812
            Height = 50
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            Color = clWhite
            ParentBackground = False
            TabOrder = 4
            DesignSize = (
              812
              50)
            object lblArquivoCertificado: TLabel
              Left = 0
              Top = 0
              Width = 169
              Height = 15
              Caption = 'Arquivo Certificado (.pem / .crt)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object edtArquivoCertificado: TEdit
              Left = 0
              Top = 20
              Width = 740
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object btnArquivoCertificado: TButton
              Left = 750
              Top = 20
              Width = 60
              Height = 23
              Anchors = [akTop, akRight]
              Caption = '...'
              TabOrder = 1
              OnClick = btnArquivoCertificadoClick
            end
          end
        end
      end
    end
  end
  object PanelBotao: TPanel
    Left = 0
    Top = 650
    Width = 900
    Height = 50
    Align = alBottom
    BevelOuter = bvNone
    Color = 15987699
    ParentBackground = False
    TabOrder = 2
    object bgravar: TButton
      AlignWithMargins = True
      Left = 20
      Top = 8
      Width = 120
      Height = 35
      Margins.Left = 20
      Margins.Top = 8
      Margins.Bottom = 7
      Align = alLeft
      Caption = 'Salvar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = bgravarClick
    end
  end
  object OpenDialog: TOpenDialog
    Filter = 'Certificados|*.pfx;*.p12;*.pem;*.crt;*.key|Todos os arquivos|*.*'
    Left = 800
    Top = 100
  end
  object img_icon_preto_pgc: TImageList
    ColorDepth = cd32Bit
    DrawingStyle = dsTransparent
    Height = 22
    Width = 22
    Left = 800
    Top = 150
  end
  object ACBrOpenSSLUtils1: TACBrOpenSSLUtils
    Left = 800
    Top = 200
  end
end
