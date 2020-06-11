object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 'Sistema de Vendas'
  ClientHeight = 600
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu: TMainMenu
    Left = 304
    Top = 208
    object Cadastro1: TMenuItem
      Caption = '&Cadastro'
      object Produtos1: TMenuItem
        Caption = '&Produtos'
        OnClick = Produtos1Click
      end
    end
    object Movimentaes1: TMenuItem
      Caption = '&Movimenta'#231#245'es'
      object Vendas1: TMenuItem
        Caption = '&Vendas'
        OnClick = Vendas1Click
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object Produtos2: TMenuItem
        Caption = 'Produtos'
        OnClick = Produtos2Click
      end
      object Vendas2: TMenuItem
        Caption = 'Vendas'
        OnClick = Vendas2Click
      end
    end
    object Ajuda1: TMenuItem
      Caption = '&Ajuda'
      object Sobre1: TMenuItem
        Caption = '&Sobre'
      end
    end
  end
end
