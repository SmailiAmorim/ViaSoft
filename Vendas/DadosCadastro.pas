unit DadosCadastro;

interface

uses
  SysUtils
  , Classes
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
  , UnitDados
  ;

type
  TdmCadastro = class(TDataModule)
    cdsPrincipal: TClientDataSet;
    DataSetProvider: TDataSetProvider;
    TabelaPrincipal: TFDQuery;
    procedure cdsPrincipalAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    procedure FecharTabelas; dynamic;

    procedure Novo; dynamic;
    procedure Alterar; dynamic;
    procedure Excluir; dynamic;
    procedure Pesquisar(Busca: string; const UsarTelaPesquisa: Boolean); dynamic;

    procedure Gravar; dynamic;
    procedure Desistir; dynamic;

    function GetGenerator(GEN: String): Integer;
  end;

var
  dmCadastro: TdmCadastro;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmCadastro }

procedure TdmCadastro.Alterar;
begin
  cdsPrincipal.Edit;
end;

procedure TdmCadastro.cdsPrincipalAfterPost(DataSet: TDataSet);
begin
  cdsPrincipal.ApplyUpdates(0);
end;

procedure TdmCadastro.Desistir;
begin
  cdsPrincipal.Cancel;
  FecharTabelas;
end;

procedure TdmCadastro.Excluir;
begin
  if not cdsPrincipal.IsEmpty then
  begin
    cdsPrincipal.Delete;
    cdsPrincipal.ApplyUpdates(0);
  end;

end;

procedure TdmCadastro.FecharTabelas;
begin
  TabelaPrincipal.Close;
  cdsPrincipal.Close;
end;

function TdmCadastro.GetGenerator(GEN: String): Integer;
var
  Qy: TFDQuery;
begin
  Result := -1;

  Qy := TFDQuery.Create(nil);
  try
    Qy.Connection := dmDados.FDConnection;
    Qy.SQL.Text := 'select gen_id(' + GEN + ',1) as ID from rdb$database';
    Qy.Open;
    Result := Qy.FieldByName('ID').AsInteger;
  finally
    Qy.Free
  end;
end;

procedure TdmCadastro.Gravar;
begin
  cdsPrincipal.Post;
end;

procedure TdmCadastro.Novo;
begin
  FecharTabelas;
  cdsPrincipal.Open;
  cdsPrincipal.Append;
end;

procedure TdmCadastro.Pesquisar(Busca: string; const UsarTelaPesquisa: Boolean);
begin
  FecharTabelas;
end;

end.
