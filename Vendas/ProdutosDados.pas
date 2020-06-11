unit ProdutosDados;

interface

uses
  SysUtils
  , Classes
  , DadosCadastro
  , DB
  , DBClient
  , FireDAC.Stan.Intf
  , FireDAC.Stan.Option
  , FireDAC.Stan.Param
  , FireDAC.Stan.Error
  , FireDAC.DatS
  , FireDAC.Phys.Intf
  , FireDAC.DApt.Intf
  , FireDAC.Stan.Async
  , FireDAC.DApt
  , FireDAC.Comp.DataSet
  , FireDAC.Comp.Client
  , Provider
  ;

type
  TDMProdutos = class(TdmCadastro)
    cdsPrincipalID_ITEM: TIntegerField;
    cdsPrincipalDESC_ITEM: TStringField;
    TabelaPrincipalID_ITEM: TIntegerField;
    TabelaPrincipalDESC_ITEM: TStringField;
    procedure cdsPrincipalAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    procedure Pesquisar(Busca: string; const UsarTelaPesquisa: Boolean); override;
  end;

var
  DMProdutos: TDMProdutos;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UnitDados;

{$R *.dfm}

{ TdmProdutos }

procedure TDMProdutos.cdsPrincipalAfterInsert(DataSet: TDataSet);
begin
  inherited;
  cdsPrincipalID_ITEM.AsInteger := GetGenerator('GEN_ITEM');
end;

procedure TDMProdutos.Pesquisar(Busca: string; const UsarTelaPesquisa: Boolean);
var
  Qy: TFDQuery;
  FBusca: string;
begin
  inherited;
  FBusca := Busca;
  if UsarTelaPesquisa then
  begin
    Qy := TFDQuery.Create(nil);
    try
      Qy.Connection := DMDados.FDConnection;
      Qy.SQL.Text := TabelaPrincipal.SQL.Text;
      FBusca := DMDados.Pesquisar(Qy, 'ITEM', Busca, 'DESC_ITEM', 'Pesquisar Produtos', 0);
    finally
      Qy.Free;
    end;

  end;

  if not FBusca.IsEmpty then
  begin
    cdsPrincipal.Close;
    TabelaPrincipal.Close;
    TabelaPrincipal.SQL.Text := 'SELECT ID_ITEM, DESC_ITEM FROM ITEM WHERE ID_ITEM = ' + QuotedStr(FBusca);
    TabelaPrincipal.Open;
    cdsPrincipal.Open;
  end;

end;

end.
