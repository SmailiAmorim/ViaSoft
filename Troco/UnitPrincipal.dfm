object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 242
  ClientWidth = 305
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    305
    242)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 28
    Height = 13
    Caption = 'Valor:'
  end
  object btnTroco: TButton
    Left = 206
    Top = 8
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Troco'
    TabOrder = 0
    OnClick = btnTrocoClick
    ExplicitLeft = 224
  end
  object mmTroco: TMemo
    Left = 24
    Top = 56
    Width = 257
    Height = 169
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    ExplicitWidth = 275
  end
  object edValor: TEdit
    Left = 58
    Top = 13
    Width = 121
    Height = 21
    Alignment = taRightJustify
    Anchors = [akLeft, akTop, akRight]
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    TabOrder = 2
    OnKeyPress = edValorKeyPress
  end
end
