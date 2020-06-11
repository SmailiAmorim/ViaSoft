unit uIMaquina;

interface

uses
  Classes, uTroco;

type

  IMaquina = interface
    ['{04D6296B-2B51-48F9-9984-35454850DD92}']
    function MontarTroco(aTroco: Double): TList;
  end;

implementation

end.
