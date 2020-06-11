inherited DMVendas: TDMVendas
  OldCreateOrder = True
  Height = 223
  Width = 462
  inherited cdsPrincipal: TClientDataSet
    AfterInsert = cdsPrincipalAfterInsert
    Top = 24
    object cdsPrincipalID_PED: TIntegerField
      FieldName = 'ID_PED'
      Origin = 'ID_PED'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPrincipalNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
    end
    object cdsPrincipalDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
      Origin = 'DTEMISSAO'
    end
    object cdsPrincipalCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
      Size = 100
    end
  end
  inherited DataSetProvider: TDataSetProvider
    Left = 152
    Top = 24
  end
  inherited TabelaPrincipal: TFDQuery
    SQL.Strings = (
      'select ID_PED'
      ', NUMERO'
      ', DTEMISSAO'
      ', CLIENTE'
      'from PEDIDOCAB')
    object TabelaPrincipalID_PED: TIntegerField
      FieldName = 'ID_PED'
      Origin = 'ID_PED'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TabelaPrincipalNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
    end
    object TabelaPrincipalDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
      Origin = 'DTEMISSAO'
    end
    object TabelaPrincipalCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
      Size = 100
    end
  end
  object QyDetalhe: TFDQuery
    Connection = dmDados.FDConnection
    SQL.Strings = (
      'select ID_PED'
      ', ID_ITEMSEQ'
      ', P.ID_ITEM'
      ', DESC_ITEM'
      ', QUANTIDADE'
      ', VALORUNIT'
      ', VALORTOTAL'
      'from PEDIDOITEM P'
      'left join ITEM I on (I.ID_ITEM = P.ID_ITEM)'
      'where ID_PED = :ID_PED'
      'order by ID_ITEMSEQ')
    Left = 40
    Top = 160
    ParamData = <
      item
        Name = 'ID_PED'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QyDetalheID_PED: TIntegerField
      FieldName = 'ID_PED'
      Origin = 'ID_PED'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QyDetalheID_ITEMSEQ: TIntegerField
      FieldName = 'ID_ITEMSEQ'
      Origin = 'ID_ITEMSEQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QyDetalheID_ITEM: TIntegerField
      FieldName = 'ID_ITEM'
      Origin = 'ID_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QyDetalheDESC_ITEM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESC_ITEM'
      Origin = 'DESC_ITEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object QyDetalheQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
    end
    object QyDetalheVALORUNIT: TFloatField
      FieldName = 'VALORUNIT'
      Origin = 'VALORUNIT'
    end
    object QyDetalheVALORTOTAL: TFloatField
      FieldName = 'VALORTOTAL'
      Origin = 'VALORTOTAL'
    end
  end
  object dsProviderDetalhe: TDataSetProvider
    DataSet = QyDetalhe
    Left = 144
    Top = 160
  end
  object cdsDetalhe: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsProviderDetalhe'
    AfterPost = cdsDetalheAfterPost
    OnNewRecord = cdsDetalheNewRecord
    Left = 264
    Top = 160
    object cdsDetalheID_PED: TIntegerField
      FieldName = 'ID_PED'
      Required = True
    end
    object cdsDetalheID_ITEMSEQ: TIntegerField
      FieldName = 'ID_ITEMSEQ'
      Required = True
    end
    object cdsDetalheID_ITEM: TIntegerField
      FieldName = 'ID_ITEM'
      Required = True
      OnValidate = cdsDetalheID_ITEMValidate
    end
    object cdsDetalheDESC_ITEM: TStringField
      FieldName = 'DESC_ITEM'
      Required = True
      Size = 100
    end
    object cdsDetalheQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      Required = True
      OnChange = cdsDetalheQUANTIDADEChange
    end
    object cdsDetalheVALORUNIT: TFloatField
      FieldName = 'VALORUNIT'
      Required = True
      OnChange = cdsDetalheVALORUNITChange
      DisplayFormat = '#,###0.00'
    end
    object cdsDetalheVALORTOTAL: TFloatField
      FieldName = 'VALORTOTAL'
      DisplayFormat = '#,###0.00'
    end
  end
  object QyProduto: TFDQuery
    Connection = dmDados.FDConnection
    SQL.Strings = (
      'select ID_ITEM, DESC_ITEM from ITEM where ID_ITEM = :ID')
    Left = 342
    Top = 160
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QyProdutoID_ITEM: TIntegerField
      FieldName = 'ID_ITEM'
      Origin = 'ID_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QyProdutoDESC_ITEM: TStringField
      FieldName = 'DESC_ITEM'
      Origin = 'DESC_ITEM'
      Size = 100
    end
  end
end
