object frmDmConexao: TfrmDmConexao
  Height = 263
  Width = 216
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=C:\Atron Projetos\ACBrPIXCDDemo\db\ACBRPIXCDDEMO.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'Server=localhost'
      'Port=3050'
      'DriverID=FB')
    LoginPrompt = False
    Left = 96
    Top = 32
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    VendorHome = 'C:\Atron Projetos\ACBrPIXCDDemo\bin'
    Left = 96
    Top = 96
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 96
    Top = 160
  end
end
