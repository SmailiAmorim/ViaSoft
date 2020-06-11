inherited FormProdutos: TFormProdutos
  Caption = 'Produtos'
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 8
    Width = 38
    Height = 13
    Caption = 'Produto'
  end
  object Label2: TLabel [1]
    Left = 88
    Top = 8
    Width = 46
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object edCodigo: TEdit [2]
    Left = 8
    Top = 27
    Width = 65
    Height = 21
    ReadOnly = True
    TabOrder = 2
  end
  object edDescricao: TEdit [3]
    Left = 88
    Top = 27
    Width = 305
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    MaxLength = 100
    ReadOnly = True
    TabOrder = 1
  end
  inherited PnBotoes: TPanel
    ExplicitLeft = 604
    ExplicitTop = 0
    ExplicitHeight = 278
    inherited BtNovo: TBitBtn
      Top = 13
      ExplicitTop = 13
    end
  end
end
