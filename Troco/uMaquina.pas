unit uMaquina;

interface

uses
  uIMaquina, Classes, uTroco, SysUtils, Dialogs;

type

  TMaquinaDinheiro = class(TInterfacedObject, IMaquina)
  private
    ListaNotas: TList;
  public
    constructor Create;
    function MontarTroco(aTroco: Double): TList;
  end;

implementation

constructor TMaquinaDinheiro.Create;
begin
  ListaNotas := TList.Create;
end;

function TMaquinaDinheiro.MontarTroco(aTroco: Double): TList;
var
  Troco: TTroco;
  Saldo: Currency;
  I, Quant: Integer;
  Sub: Currency;
begin
  Saldo := aTroco;
  I := 0;
  Quant := 0;

  while ((Saldo > 0) or (Quant > 0)) do
  begin
    Sub := CValorCedula[TCedula(I)];
    if Saldo >= Sub then
    begin
      inc(Quant);
      Saldo := Saldo - Sub;
    end else if Quant > 0 then
    begin
      Troco := TTroco.Create(TCedula(I), Quant);
      if Saldo < Sub then
        inc(i);

      ListaNotas.add(Troco);
      Quant := 0;
    end else
      inc(i);
  end;

  Result := ListaNotas;
end;

end.

