object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'ACBrPIXCDDemo - Menu Principal'
  ClientHeight = 650
  ClientWidth = 900
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 900
    Height = 120
    Align = alTop
    BevelOuter = bvNone
    Color = 2829099
    ParentBackground = False
    TabOrder = 0
    object lblTitulo: TLabel
      AlignWithMargins = True
      Left = 30
      Top = 30
      Width = 840
      Height = 37
      Margins.Left = 30
      Margins.Top = 30
      Margins.Right = 30
      Margins.Bottom = 0
      Align = alTop
      Caption = 'ACBr PIX Cobran'#231'a Direta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -27
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 313
    end
    object lblSubtitulo: TLabel
      AlignWithMargins = True
      Left = 30
      Top = 70
      Width = 840
      Height = 20
      Margins.Left = 30
      Margins.Right = 30
      Margins.Bottom = 10
      Align = alTop
      Caption = 'Sistema de gerenciamento de cobran'#231'as PIX'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 14803425
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 294
    end
  end
  object pnlMain: TPanel
    Left = 0
    Top = 120
    Width = 900
    Height = 480
    Align = alClient
    BevelOuter = bvNone
    Color = 15987699
    ParentBackground = False
    TabOrder = 1
    object pnlMenu: TPanel
      AlignWithMargins = True
      Left = 100
      Top = 70
      Width = 700
      Height = 340
      Margins.Left = 100
      Margins.Top = 70
      Margins.Right = 100
      Margins.Bottom = 70
      Align = alClient
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      ExplicitTop = 50
      ExplicitHeight = 380
      object pnlSeparator1: TPanel
        Left = 0
        Top = 95
        Width = 700
        Height = 1
        Margins.Left = 40
        Margins.Top = 0
        Margins.Right = 40
        Margins.Bottom = 0
        Align = alTop
        BevelOuter = bvNone
        Color = 15132390
        ParentBackground = False
        TabOrder = 0
      end
      object btnChavesPix: TButton
        AlignWithMargins = True
        Left = 40
        Top = 40
        Width = 620
        Height = 55
        Margins.Left = 40
        Margins.Top = 40
        Margins.Right = 40
        Margins.Bottom = 0
        Align = alTop
        Caption = #55357#56593'   Chaves PIX'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5395026
        Font.Height = -16
        Font.Name = 'Segoe UI Semibold'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btnChavesPixClick
        ExplicitTop = 111
      end
      object pnlSeparator2: TPanel
        Left = 0
        Top = 166
        Width = 700
        Height = 1
        Margins.Left = 40
        Margins.Top = 0
        Margins.Right = 40
        Margins.Bottom = 0
        Align = alTop
        BevelOuter = bvNone
        Color = 15132390
        ParentBackground = False
        TabOrder = 2
      end
      object btnGerarCobranca: TButton
        AlignWithMargins = True
        Left = 40
        Top = 111
        Width = 620
        Height = 55
        Margins.Left = 40
        Margins.Top = 15
        Margins.Right = 40
        Margins.Bottom = 0
        Align = alTop
        Caption = #55357#56562#55357#56496'   Gerar Cobran'#231'a PIX'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5395026
        Font.Height = -16
        Font.Name = 'Segoe UI Semibold'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = btnGerarCobrancaClick
        ExplicitTop = 182
      end
      object pnlSeparator3: TPanel
        Left = 0
        Top = 237
        Width = 700
        Height = 1
        Margins.Left = 40
        Margins.Top = 0
        Margins.Right = 40
        Margins.Bottom = 0
        Align = alTop
        BevelOuter = bvNone
        Color = 15132390
        ParentBackground = False
        TabOrder = 4
        ExplicitTop = 238
      end
      object btnCobrancas: TButton
        AlignWithMargins = True
        Left = 40
        Top = 182
        Width = 620
        Height = 55
        Margins.Left = 40
        Margins.Top = 15
        Margins.Right = 40
        Margins.Bottom = 0
        Align = alTop
        Caption = #55357#56496'   Cobran'#231'as'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5395026
        Font.Height = -16
        Font.Name = 'Segoe UI Semibold'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnClick = btnCobrancasClick
        ExplicitTop = 253
      end
      object btnConfiguracoes: TButton
        AlignWithMargins = True
        Left = 40
        Top = 253
        Width = 620
        Height = 55
        Margins.Left = 40
        Margins.Top = 15
        Margins.Right = 40
        Margins.Bottom = 0
        Align = alTop
        Caption = #9881#65039'   Configura'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 5395026
        Font.Height = -16
        Font.Name = 'Segoe UI Semibold'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnClick = btnConfiguracoesClick
        ExplicitTop = 323
      end
    end
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 600
    Width = 900
    Height = 50
    Align = alBottom
    BevelOuter = bvNone
    Color = 15987699
    ParentBackground = False
    TabOrder = 2
    object lblVersao: TLabel
      AlignWithMargins = True
      Left = 20
      Top = 10
      Width = 860
      Height = 30
      Margins.Left = 20
      Margins.Top = 10
      Margins.Right = 20
      Margins.Bottom = 10
      Align = alClient
      Alignment = taCenter
      Caption = 'Vers'#227'o 1.0.0 - ACBr'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 99
      ExplicitHeight = 15
    end
  end
end
