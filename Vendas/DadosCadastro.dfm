object dmCadastro: TdmCadastro
  OldCreateOrder = False
  Height = 150
  Width = 337
  object cdsPrincipal: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider'
    AfterPost = cdsPrincipalAfterPost
    Left = 264
    Top = 32
  end
  object DataSetProvider: TDataSetProvider
    DataSet = TabelaPrincipal
    Left = 144
    Top = 32
  end
  object TabelaPrincipal: TFDQuery
    Connection = dmDados.FDConnection
    Left = 40
    Top = 32
  end
end
