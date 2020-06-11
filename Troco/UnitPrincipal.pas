unit UnitPrincipal;

interface

uses
  Windows
  , Messages
  , SysUtils
  , Variants
  , Classes
  , Graphics
  , Controls
  , Forms
  , Dialogs
  , StdCtrls
  , Mask
  , uTroco
  , uMaquina
  //, SysUtils
  ;

type
  TFormPrincipal = class(TForm)
    Label1: TLabel;
    btnTroco: TButton;
    mmTroco: TMemo;
    edValor: TEdit;
    procedure btnTrocoClick(Sender: TObject);
    procedure edValorKeyPress(Sender: TObject; var Key: Char);
  private
    function GetTroco(Cedula: TCedula): string;
    procedure GerarTroco(Valor: string);
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

procedure TFormPrincipal.btnTrocoClick(Sender: TObject);
var
  Valor: string;
begin
  mmTroco.Clear;

  Valor := edValor.Text;

  if Valor.IsEmpty then
    Exit;

  if (Length(Copy(Valor , Pos(',', Valor)+1, Length(Valor))) > 2) and (Pos(',', Valor) > 0) then
    raise Exception.Create('Só é permitido duas casas decimais!');

  GerarTroco(Valor);
end;

procedure TFormPrincipal.edValorKeyPress(Sender: TObject; var Key: Char);
begin
  if not CharInSet(key,['0'..'9',',',#8]) then
    key :=#0;
end;

procedure TFormPrincipal.GerarTroco(Valor: string);
var
  aMaquina: TMaquinaDinheiro;
  aListaNotas: TList;
  I: Integer;
begin
  aMaquina := TMaquinaDinheiro.Create;
  aListaNotas := TList.Create;
  try
    aListaNotas := aMaquina.MontarTroco(StrToCurr(Valor));
    for I := 0 to aListaNotas.Count -1 do
    Begin
      mmTroco.Lines.Add(
        IntToStr(TTroco(aListaNotas.Items[i]).GetQuantidade)
        + GetTroco(TTroco(aListaNotas[I]).GetTipo)
      );
    End;
  finally
    aMaquina.Free;
    aListaNotas.Free;
  end;

end;

function TFormPrincipal.GetTroco(Cedula: TCedula): string;
begin
  case Cedula of
    ceNota100 : Result := ' nota de 100';
    ceNota50  : Result := ' nota de 50';
    ceNota20  : Result := ' nota de 20';
    ceNota10  : Result := ' nota de 10';
    ceNota5   : Result := ' nota de 5';
    ceNota2   : Result := ' nota de 2';
    ceMoeda100: Result := ' moeda de 1';
    ceMoeda50 : Result := ' moeda de 0.50';
    ceMoeda25 : Result := ' moeda de 0.25';
    ceMoeda10 : Result := ' moeda de 0.10';
    ceMoeda5  : Result := ' moeda de 0.05';
    ceMoeda1  : Result := ' moeda de 0.01';
  end;
end;

end.
