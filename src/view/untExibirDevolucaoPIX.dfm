object frmExibirDevolucaoPIX: TfrmExibirDevolucaoPIX
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 50
  ClientWidth = 600
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poOwnerFormCenter
  OnShow = FormShow
  TextHeight = 13
  object pnlStatus: TPanel
    Left = 0
    Top = 0
    Width = 600
    Height = 50
    Margins.Left = 20
    Margins.Top = 0
    Margins.Right = 20
    Margins.Bottom = 0
    Align = alClient
    BevelOuter = bvNone
    Caption = 'AGUARDANDO DEVOLU'#199#195'O'
    Color = 1759971
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
  end
  object qrConfigPSP: TFDQuery
    Connection = frmDmConexao.FDConnection
    Left = 64
    Top = 12
  end
  object ACBrOpenSSLUtils1: TACBrOpenSSLUtils
    Left = 96
    Top = 12
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
    Left = 128
    Top = 12
  end
  object ACBrPSPSantander1: TACBrPSPSantander
    Scopes = [scCobWrite, scCobRead, scPixWrite, scPixRead]
    Left = 156
    Top = 12
  end
  object ACBrPSPBancoDoBrasil1: TACBrPSPBancoDoBrasil
    ACBrPixCD = ACBrPixCD1
    Scopes = [scCobWrite, scCobRead, scPixWrite, scPixRead]
    BBAPIVersao = apiVersao2
    Left = 184
    Top = 12
  end
  object ACBrPSPItau1: TACBrPSPItau
    Scopes = [scCobWrite, scCobRead, scPixWrite, scPixRead]
    Left = 212
    Top = 12
  end
  object ACBrPSPShipay1: TACBrPSPShipay
    Scopes = [scCobWrite, scCobRead, scPixWrite, scPixRead]
    URLSandBox = 'https://api-staging.shipay.com.br'
    URLProducao = 'https://api.shipay.com.br'
    Left = 240
    Top = 12
  end
  object ACBrPSPSicredi1: TACBrPSPSicredi
    Scopes = [scCobWrite, scCobRead, scPixWrite, scPixRead]
    Left = 272
    Top = 12
  end
  object ACBrPSPSicoob1: TACBrPSPSicoob
    Scopes = [scCobWrite, scCobRead, scPixWrite, scPixRead]
    Left = 304
    Top = 12
  end
  object ACBrPSPPagSeguro1: TACBrPSPPagSeguro
    Scopes = [scCobWrite, scCobRead, scPixWrite, scPixRead]
    Left = 334
    Top = 12
  end
  object ACBrPSPGerenciaNet1: TACBrPSPGerenciaNet
    Scopes = [scCobWrite, scCobRead, scPixWrite, scPixRead]
    Left = 365
    Top = 12
  end
  object ACBrPSPBradesco1: TACBrPSPBradesco
    Scopes = [scCobWrite, scCobRead, scPixWrite, scPixRead]
    Left = 395
    Top = 12
  end
  object ACBrPSPPixPDV1: TACBrPSPPixPDV
    Scopes = [scCobWrite, scCobRead, scPixWrite, scPixRead]
    APIVersao = apiVersao1
    Left = 427
    Top = 12
  end
  object ACBrPSPInter1: TACBrPSPInter
    Scopes = [scCobWrite, scCobRead, scPixWrite, scPixRead]
    Left = 459
    Top = 12
  end
  object ACBrPSPAilos1: TACBrPSPAilos
    Scopes = [scCobWrite, scCobRead, scPixWrite, scPixRead]
    Left = 490
    Top = 12
  end
  object ACBrPSPMatera1: TACBrPSPMatera
    Scopes = [scCobWrite, scCobRead, scPixWrite, scPixRead]
    Left = 522
    Top = 12
  end
  object ACBrPSPCielo1: TACBrPSPCielo
    Scopes = [scCobWrite, scCobRead, scPixWrite, scPixRead]
    Left = 548
    Top = 12
  end
  object ACBrPSPMercadoPago1: TACBrPSPMercadoPago
    Scopes = [scCobWrite, scCobRead, scPixWrite, scPixRead]
    Left = 548
    Top = 12
  end
  object ACBrPSPGate2All1: TACBrPSPGate2All
    Scopes = [scCobWrite, scCobRead, scPixWrite, scPixRead]
    Left = 548
    Top = 12
  end
  object ACBrPSPBanrisul1: TACBrPSPBanrisul
    Scopes = [scCobWrite, scCobRead, scPixWrite, scPixRead]
    Left = 548
    Top = 12
  end
  object ACBrPSPC6Bank1: TACBrPSPC6Bank
    Scopes = [scCobWrite, scCobRead, scPixWrite, scPixRead]
    Left = 548
    Top = 12
  end
  object ACBrPSPAppLess1: TACBrPSPAppLess
    Scopes = [scCobWrite, scCobRead, scPixWrite, scPixRead]
    Left = 548
    Top = 12
  end
  object tmConsultarDevolucao: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = tmConsultarDevolucaoTimer
    Left = 32
    Top = 14
  end
  object tmIniciar: TTimer
    Enabled = False
    Interval = 100
    OnTimer = tmIniciarTimer
    Left = 8
    Top = 14
  end
end
