object frmExibirQrCodePIX: TfrmExibirQrCodePIX
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'QrCode PIX'
  ClientHeight = 600
  ClientWidth = 800
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poOwnerFormCenter
  OnShow = FormShow
  TextHeight = 13
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 800
    Height = 80
    Align = alTop
    BevelOuter = bvNone
    Color = 2829099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 12895428
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object shpIconePIX: TShape
      Left = 24
      Top = 20
      Width = 40
      Height = 40
      Brush.Color = 3947580
      Pen.Style = psClear
      Shape = stCircle
    end
    object lblIconePIX: TLabel
      Left = 24
      Top = 20
      Width = 40
      Height = 40
      Alignment = taCenter
      AutoSize = False
      Caption = 'PIX'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      Layout = tlCenter
    end
    object lblTituloPrincipal: TLabel
      Left = 75
      Top = 20
      Width = 119
      Height = 23
      Caption = 'Pagamento PIX'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -17
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSubtitulo: TLabel
      Left = 75
      Top = 46
      Width = 242
      Height = 15
      Caption = 'Escaneie o QR Code ou copie o c'#243'digo abaixo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12895428
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
  end
  object pnlCobranca: TPanel
    Left = 0
    Top = 80
    Width = 800
    Height = 470
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      800
      470)
    object pnlCentralizar: TPanel
      Left = 140
      Top = 90
      Width = 520
      Height = 350
      Anchors = []
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object Label1: TLabel
        Left = 280
        Top = 60
        Width = 220
        Height = 100
        AutoSize = False
        Caption = 
          'Abra o aplicativo do seu banco, acesse a '#225'rea PIX e escaneie o Q' +
          'R Code ao lado. O pagamento '#233' instant'#226'neo e seguro.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5395026
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object lblCopiaECola: TLabel
        AlignWithMargins = True
        Left = 20
        Top = 280
        Width = 86
        Height = 15
        Caption = 'PIX Copia e Cola'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 3355443
        Font.Height = -12
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object pnlQrCode: TPanel
        Left = 20
        Top = 20
        Width = 250
        Height = 250
        BevelKind = bkFlat
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        object imgQRCode: TImage
          AlignWithMargins = True
          Left = 10
          Top = 10
          Width = 226
          Height = 226
          Margins.Left = 10
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          Align = alClient
          Center = True
          Constraints.MinHeight = 140
          Proportional = True
          Stretch = True
          ExplicitLeft = -65
          ExplicitTop = -209
          ExplicitWidth = 250
          ExplicitHeight = 250
        end
      end
      object edtCopiaECola: TEdit
        AlignWithMargins = True
        Left = 20
        Top = 300
        Width = 350
        Height = 28
        Margins.Right = 30
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 3355443
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object btnCopiaECola: TButton
        Left = 376
        Top = 294
        Width = 124
        Height = 38
        Caption = 'Copiar C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5395026
        Font.Height = -12
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = btnCopiaEColaClick
      end
    end
    object pnlStatus: TPanel
      AlignWithMargins = True
      Left = 30
      Top = 20
      Width = 740
      Height = 60
      Margins.Left = 30
      Margins.Top = 20
      Margins.Right = 30
      Margins.Bottom = 0
      Align = alTop
      BevelOuter = bvNone
      Caption = 'AGUARDANDO PAGAMENTO'
      Color = 16771797
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3355443
      Font.Height = -19
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
    end
  end
  object pnlBotao: TPanel
    Left = 0
    Top = 550
    Width = 800
    Height = 50
    Align = alBottom
    BevelOuter = bvNone
    Color = 16448250
    ParentBackground = False
    TabOrder = 2
    object btnConfirmar: TButton
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 170
      Height = 44
      Align = alLeft
      Caption = 'Pagamento Efetuado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5395026
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Visible = False
      OnClick = btnConfirmarClick
    end
    object btnCancelar: TButton
      AlignWithMargins = True
      Left = 179
      Top = 3
      Width = 160
      Height = 44
      Align = alLeft
      Caption = 'Cancelar Cobran'#231'a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5395026
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
  object tmConsultarPagto: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = tmConsultarPagtoTimer
    Left = 104
    Top = 476
  end
  object ACBrPixCD1: TACBrPixCD
    Recebedor.UF = 'SP'
    Recebedor.CEP = '18272230'
    Recebedor.CodCategoriaComerciante = 0
    DadosAutomacao.NomeSoftwareHouse = 'Projeto ACBr'
    DadosAutomacao.CNPJSoftwareHouse = '18760540000139'
    DadosAutomacao.NomeAplicacao = 'ACBrPIXCDTeste'
    DadosAutomacao.VersaoAplicacao = '1.0'
    PSP = ACBrPSPBancoDoBrasil1
    Left = 40
    Top = 432
  end
  object ACBrPSPSantander1: TACBrPSPSantander
    Scopes = [scCobWrite, scCobRead, scPixWrite, scPixRead]
    Left = 68
    Top = 432
  end
  object ACBrPSPBancoDoBrasil1: TACBrPSPBancoDoBrasil
    ACBrPixCD = ACBrPixCD1
    Scopes = [scCobWrite, scCobRead, scPixWrite, scPixRead]
    BBAPIVersao = apiVersao2
    Left = 96
    Top = 432
  end
  object ACBrPSPItau1: TACBrPSPItau
    Scopes = [scCobWrite, scCobRead, scPixWrite, scPixRead]
    Left = 124
    Top = 432
  end
  object ACBrPSPShipay1: TACBrPSPShipay
    Scopes = [scCobWrite, scCobRead, scPixWrite, scPixRead]
    URLSandBox = 'https://api-staging.shipay.com.br'
    URLProducao = 'https://api.shipay.com.br'
    Left = 152
    Top = 432
  end
  object ACBrPSPSicredi1: TACBrPSPSicredi
    Scopes = [scCobWrite, scCobRead, scPixWrite, scPixRead]
    Left = 184
    Top = 432
  end
  object ACBrPSPSicoob1: TACBrPSPSicoob
    Scopes = [scCobWrite, scCobRead, scPixWrite, scPixRead]
    Left = 216
    Top = 432
  end
  object ACBrPSPPagSeguro1: TACBrPSPPagSeguro
    Scopes = [scCobWrite, scCobRead, scPixWrite, scPixRead]
    Left = 246
    Top = 432
  end
  object ACBrPSPGerenciaNet1: TACBrPSPGerenciaNet
    Scopes = [scCobWrite, scCobRead, scPixWrite, scPixRead]
    Left = 277
    Top = 432
  end
  object ACBrPSPBradesco1: TACBrPSPBradesco
    Scopes = [scCobWrite, scCobRead, scPixWrite, scPixRead]
    Left = 307
    Top = 432
  end
  object ACBrPSPPixPDV1: TACBrPSPPixPDV
    Scopes = [scCobWrite, scCobRead, scPixWrite, scPixRead]
    APIVersao = apiVersao1
    Left = 339
    Top = 432
  end
  object ACBrPSPInter1: TACBrPSPInter
    Scopes = [scCobWrite, scCobRead, scPixWrite, scPixRead]
    Left = 371
    Top = 432
  end
  object ACBrPSPAilos1: TACBrPSPAilos
    Scopes = [scCobWrite, scCobRead, scPixWrite, scPixRead]
    Left = 402
    Top = 432
  end
  object ACBrPSPMatera1: TACBrPSPMatera
    Scopes = [scCobWrite, scCobRead, scPixWrite, scPixRead]
    Left = 434
    Top = 432
  end
  object ACBrPSPCielo1: TACBrPSPCielo
    Scopes = [scCobWrite, scCobRead, scPixWrite, scPixRead]
    Left = 464
    Top = 432
  end
  object ACBrPSPMercadoPago1: TACBrPSPMercadoPago
    Scopes = [scCobWrite, scCobRead, scPixWrite, scPixRead]
    Left = 496
    Top = 432
  end
  object ACBrPSPGate2All1: TACBrPSPGate2All
    Scopes = [scCobWrite, scCobRead, scPixWrite, scPixRead]
    Left = 528
    Top = 432
  end
  object ACBrPSPBanrisul1: TACBrPSPBanrisul
    Scopes = [scCobWrite, scCobRead, scPixWrite, scPixRead]
    Left = 560
    Top = 432
  end
  object ACBrPSPC6Bank1: TACBrPSPC6Bank
    Scopes = [scCobWrite, scCobRead, scPixWrite, scPixRead]
    Left = 592
    Top = 432
  end
  object ACBrPSPAppLess1: TACBrPSPAppLess
    Scopes = [scCobWrite, scCobRead, scPixWrite, scPixRead]
    Left = 622
    Top = 432
  end
  object ACBrOpenSSLUtils1: TACBrOpenSSLUtils
    Left = 40
    Top = 477
  end
  object qrConfigPSP: TFDQuery
    Connection = frmDmConexao.FDConnection
    Left = 72
    Top = 476
  end
  object tmIniciar: TTimer
    Enabled = False
    Interval = 100
    OnTimer = tmIniciarTimer
    Left = 136
    Top = 478
  end
end
