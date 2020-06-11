inherited FormVendas: TFormVendas
  Caption = 'Vendas'
  ClientHeight = 320
  ClientWidth = 716
  ExplicitWidth = 732
  ExplicitHeight = 359
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 7
    Top = 8
    Width = 32
    Height = 13
    Caption = 'Pedido'
  end
  object Label2: TLabel [1]
    Left = 78
    Top = 8
    Width = 37
    Height = 13
    Caption = 'Numero'
  end
  object Label3: TLabel [2]
    Left = 149
    Top = 8
    Width = 23
    Height = 13
    Caption = 'Data'
  end
  object Label4: TLabel [3]
    Left = 8
    Top = 54
    Width = 33
    Height = 13
    Caption = 'Cliente'
  end
  object Label5: TLabel [4]
    Left = 10
    Top = 97
    Width = 25
    Height = 13
    Caption = 'Itens'
  end
  object edPedido_ID: TEdit [5]
    Left = 7
    Top = 27
    Width = 65
    Height = 21
    ReadOnly = True
    TabOrder = 5
  end
  object edNumero: TEdit [6]
    Left = 78
    Top = 27
    Width = 65
    Height = 21
    ReadOnly = True
    TabOrder = 1
  end
  object dtpData: TDateTimePicker [7]
    Left = 149
    Top = 27
    Width = 97
    Height = 21
    Date = 43989.000000000000000000
    Time = 0.502934513890068000
    Enabled = False
    TabOrder = 2
  end
  object edCliente: TEdit [8]
    Left = 8
    Top = 70
    Width = 588
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    MaxLength = 100
    ReadOnly = True
    TabOrder = 3
    ExplicitWidth = 599
  end
  object grdProdutos: TDBGrid [9]
    Left = 10
    Top = 116
    Width = 586
    Height = 196
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsDetalhe
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnColEnter = grdProdutosColEnter
    OnEnter = grdProdutosEnter
    OnExit = grdProdutosExit
    OnKeyPress = grdProdutosKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_ITEMSEQ'
        Title.Caption = 'SEQ'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_ITEM'
        Title.Caption = 'PRODUTO'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_ITEM'
        Title.Caption = 'DESCRI'#199#195'O'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTIDADE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALORUNIT'
        Title.Caption = 'VALOR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALORTOTAL'
        Title.Caption = 'TOTAL'
        Visible = True
      end>
  end
  inherited PnBotoes: TPanel
    Left = 608
    Height = 320
    ExplicitLeft = 513
    ExplicitTop = 0
    ExplicitHeight = 320
    inherited BtFechar: TBitBtn
      Top = 284
      ExplicitTop = 284
    end
  end
  inherited dsLocal: TDataSource
    Left = 304
    Top = 16
  end
  object dsDetalhe: TDataSource
    AutoEdit = False
    DataSet = DMVendas.cdsDetalhe
    Left = 144
    Top = 176
  end
end
