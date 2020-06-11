object DMRelatorio: TDMRelatorio
  OldCreateOrder = False
  Height = 358
  Width = 407
  object frxReport: TfrxReport
    Tag = 1
    Version = '6.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43498.449636122700000000
    ReportOptions.LastChange = 43993.053298680600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure RelatorioBaseOnStartReport(Sender: TfrxComponent);'
      'begin'
      '  BDDados.connected:=false;'
      '  if <CaminhoMidas> <> '#39#39' then'
      '  begin'
      '     BDDados.DatabaseName := <CaminhoMidas>;'
      '     BDDados.connected:=true;'
      '  end;'
      ''
      '  BDDadosFrigo.connected:=false;'
      '  if <CaminhoFrigo> <> '#39#39' then'
      '  begin'
      '     BDDadosFrigo.DatabaseName := <CaminhoFrigo>;'
      '     BDDadosFrigo.connected:=true;'
      '  end;'
      ''
      '  TabelaPrincipal.ParamByName('#39'NUMPEDIDO'#39').Value := <NUMPEDIDO>;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    OnStartReport = 'RelatorioBaseOnStartReport'
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 24
    Top = 16
    Datasets = <
      item
        DataSet = frxDBProdutos
        DataSetName = 'frxDBProdutos'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      OnBeforePrint = 'Page1OnBeforePrint'
      object BandaCabecalho: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 52.913420000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object mmReportTitle: TfrxMemoView
          Align = baCenter
          AllowVectorExport = True
          Left = 270.445068500000000000
          Top = 26.456710000000000000
          Width = 199.519790000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'LISTAGEM DE PRODUTOS')
          ParentFont = False
        end
        object mmNomeEmpresa: TfrxMemoView
          Align = baCenter
          AllowVectorExport = True
          Left = 288.945068500000000000
          Top = 7.559060000000000000
          Width = 162.519790000000000000
          Height = 26.456710000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Empresa Teste')
          ParentFont = False
        end
        object LinhaCabecalho: TfrxLineView
          Align = baWidth
          AllowVectorExport = True
          Top = 49.133890000000000000
          Width = 740.409927000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object BandaCabecalhoPagina: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 94.488250000000000000
        Width = 740.409927000000000000
        PrintOnFirstPage = False
        object Line3: TfrxLineView
          Align = baWidth
          AllowVectorExport = True
          Top = 19.897650000000000000
          Width = 740.409927000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object mmPageNo: TfrxMemoView
          AllowVectorExport = True
          Left = 662.000000000000000000
          Top = 1.511750000000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Folha [Page#] de [TotalPages#]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Height = 19.055040000000000000
        ParentFont = False
        Top = 219.212740000000000000
        Width = 740.409927000000000000
        DataSet = frxDBProdutos
        DataSetName = 'frxDBProdutos'
        RowCount = 0
        object frxDBDataset1ID_ITEM: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'ID_ITEM'
          DataSet = frxDBProdutos
          DataSetName = 'frxDBProdutos'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBProdutos."ID_ITEM"]')
        end
        object frxDBDataset1DESC_ITEM: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 102.047310000000000000
          Width = 627.401980000000000000
          Height = 18.897650000000000000
          DataField = 'DESC_ITEM'
          DataSet = frxDBProdutos
          DataSetName = 'frxDBProdutos'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBProdutos."DESC_ITEM"]')
        end
      end
      object BandaRodapePagina: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.495980000000000000
        Top = 343.937230000000000000
        Width = 740.409927000000000000
        object mmReportInfo: TfrxMemoView
          AllowVectorExport = True
          Left = 1.779530000000000000
          Top = 9.598330000000000000
          Width = 279.685220000000000000
          Height = 15.118120000000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Viasoft 1.0.0.0 :: [Date] [Time]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object LinhaRodapePagina: TfrxLineView
          Align = baWidth
          AllowVectorExport = True
          Top = 3.598330000000000000
          Width = 740.409927000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Height = 18.897650000000000000
        ParentFont = False
        Top = 177.637910000000000000
        Width = 740.409927000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'C'#243'digo')
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 102.047310000000000000
          Width = 627.401980000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Descri'#231#227'o')
        end
        object Line1: TfrxLineView
          Align = baWidth
          AllowVectorExport = True
          Top = 18.897650000000000000
          Width = 740.409927000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Height = 22.677180000000000000
        ParentFont = False
        Top = 260.787570000000000000
        Width = 740.409927000000000000
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 483.779840000000000000
          Top = 1.779530000000000000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'tahoma'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Total de Itens: [COUNT(MasterData1)]')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Align = baWidth
          AllowVectorExport = True
          Top = 1.000000000000000000
          Width = 740.409927000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
    end
  end
  object frxDBProdutos: TfrxDBDataset
    UserName = 'frxDBProdutos'
    CloseDataSource = False
    DataSet = QyProdutos
    BCDToCurrency = False
    Left = 120
    Top = 16
  end
  object QyProdutos: TFDQuery
    Active = True
    Connection = dmDados.FDConnection
    SQL.Strings = (
      'select ID_ITEM'
      ', DESC_ITEM'
      'from ITEM')
    Left = 216
    Top = 16
    object QyProdutosID_ITEM: TIntegerField
      FieldName = 'ID_ITEM'
      Origin = 'ID_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QyProdutosDESC_ITEM: TStringField
      FieldName = 'DESC_ITEM'
      Origin = 'DESC_ITEM'
      Size = 100
    end
  end
  object frxDBVendas: TfrxDBDataset
    UserName = 'frxDBVendas'
    CloseDataSource = False
    DataSet = QyVendas
    BCDToCurrency = False
    Left = 120
    Top = 88
  end
  object frxDBItensVenda: TfrxDBDataset
    UserName = 'frxDBItensVenda'
    CloseDataSource = False
    DataSet = QyItensVenda
    BCDToCurrency = False
    Left = 112
    Top = 166
  end
  object QyVendas: TFDQuery
    Connection = dmDados.FDConnection
    SQL.Strings = (
      'select ID_PED'
      ', NUMERO'
      ', DTEMISSAO'
      ', CLIENTE'
      'from PEDIDOCAB')
    Left = 216
    Top = 88
    object QyVendasID_PED: TIntegerField
      FieldName = 'ID_PED'
      Origin = 'ID_PED'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QyVendasNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
    end
    object QyVendasDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
      Origin = 'DTEMISSAO'
    end
    object QyVendasCLIENTE: TStringField
      FieldName = 'CLIENTE'
      Origin = 'CLIENTE'
      Size = 100
    end
  end
  object QyItensVenda: TFDQuery
    MasterSource = dsVendas
    MasterFields = 'ID_PED'
    DetailFields = 'ID_PED'
    Connection = dmDados.FDConnection
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
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
    Left = 216
    Top = 166
    ParamData = <
      item
        Name = 'ID_PED'
        DataType = ftInteger
        ParamType = ptInput
        Value = 2
      end>
    object QyItensVendaID_PED: TIntegerField
      FieldName = 'ID_PED'
      Origin = 'ID_PED'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QyItensVendaID_ITEMSEQ: TIntegerField
      FieldName = 'ID_ITEMSEQ'
      Origin = 'ID_ITEMSEQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QyItensVendaID_ITEM: TIntegerField
      FieldName = 'ID_ITEM'
      Origin = 'ID_ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QyItensVendaDESC_ITEM: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESC_ITEM'
      Origin = 'DESC_ITEM'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object QyItensVendaQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
    end
    object QyItensVendaVALORUNIT: TFloatField
      FieldName = 'VALORUNIT'
      Origin = 'VALORUNIT'
    end
    object QyItensVendaVALORTOTAL: TFloatField
      FieldName = 'VALORTOTAL'
      Origin = 'VALORTOTAL'
    end
  end
  object dsVendas: TDataSource
    DataSet = QyVendas
    Left = 304
    Top = 96
  end
end
