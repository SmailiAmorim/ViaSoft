object dmDados: TdmDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 192
  Width = 286
  object FDConnection: TFDConnection
    Params.Strings = (
      'User_Name=sysdba'
      'Password=masterkey'
      'Server=127.0.0.1'
      'DriverID=FB')
    LoginPrompt = False
    Left = 40
    Top = 40
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    VendorLib = 'C:\Dev\ViaSoft\Win32\Debug\fbclient.dll'
    Left = 136
    Top = 40
  end
end
