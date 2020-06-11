inherited DMProdutos: TDMProdutos
  OldCreateOrder = True
  Width = 342
  inherited cdsPrincipal: TClientDataSet
    AfterInsert = cdsPrincipalAfterInsert
    Left = 248
    object cdsPrincipalID_ITEM: TIntegerField
      FieldName = 'ID_ITEM'
      Origin = 'ID_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPrincipalDESC_ITEM: TStringField
      FieldName = 'DESC_ITEM'
      Origin = 'DESC_ITEM'
      Size = 100
    end
  end
  inherited TabelaPrincipal: TFDQuery
    SQL.Strings = (
      'select ID_ITEM'
      ', DESC_ITEM'
      'from ITEM')
    object TabelaPrincipalID_ITEM: TIntegerField
      FieldName = 'ID_ITEM'
      Origin = 'ID_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TabelaPrincipalDESC_ITEM: TStringField
      FieldName = 'DESC_ITEM'
      Origin = 'DESC_ITEM'
      Size = 100
    end
  end
end
