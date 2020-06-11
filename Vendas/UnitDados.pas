unit UnitDados;

interface

uses
  SysUtils
  , Classes
  , FireDAC.Stan.Intf
  , FireDAC.Stan.Option
  , FireDAC.Stan.Error
  , FireDAC.UI.Intf
  , FireDAC.Phys.Intf
  , FireDAC.Stan.Def
  , FireDAC.Stan.Pool
  , FireDAC.Stan.Async
  , FireDAC.Phys
  , FireDAC.Phys.FB
  , FireDAC.Phys.FBDef
  , FireDAC.VCLUI.Wait
  , FireDAC.Phys.IBBase
  , DB
  , FireDAC.Comp.Client
  , FireDAC.Stan.Param
  , FireDAC.DatS
  , FireDAC.DApt.Intf
  , FireDAC.DApt
  , FireDAC.Comp.DataSet
  ;

type
  TdmDados = class(TDataModule)
    FDConnection: TFDConnection;
    FDPhysFBDriverLink: TFDPhysFBDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure ConectarBancoDados;
  public
    function Pesquisar(Query: TFDQuery; Tabela, busca, CampoTabela, LegendaForm: string; FieldRetorno: integer):string;
  end;

var
  dmDados: TdmDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  UnitPesquisar
  , System.UITypes
  ;

{$R *.dfm}

{ TdmDados }

procedure TdmDados.ConectarBancoDados;
begin
  FDPhysFBDriverLink.VendorLib := GetCurrentDir + '\fbclient.dll';
  FDConnection.Close;
  FDConnection.Params.Values['Database'] := GetCurrentDir + '\DADOS\DADOS.FDB';
  try
    FDConnection.Open;
  except
    on E : Exception do
    begin
      raise Exception.Create('Exception message = '+E.Message);
    end;
  end;
end;

procedure TdmDados.DataModuleCreate(Sender: TObject);
begin
  ConectarBancoDados;
end;

function TdmDados.Pesquisar(Query: TFDQuery; Tabela, busca, CampoTabela,
  LegendaForm: string; FieldRetorno: integer): string;
var
  F: TFormPesquisar;
begin

  Result := '';

  F := TFormPesquisar.Create(Self);
  try
    F.CDS := Query;
    F.Tabela := Tabela;
    F.CampoBusca := busca;
    F.CampoChave := CampoTabela;
    F.LegendaGrouBox := LegendaForm;

    F.ShowModal;

    if F.CDS.IsEmpty then
      Exit;

    if F.ModalResult <> mrOk then
      Exit;

    Result := F.GrdPesquisa.columns.items[FieldRetorno].field.text;

  finally
    F.Free;
  end;
end;

end.
