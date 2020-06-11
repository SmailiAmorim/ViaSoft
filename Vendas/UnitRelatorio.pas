unit UnitRelatorio;

interface

uses
  SysUtils
  , Classes
  , FireDAC.Stan.Intf
  , FireDAC.Stan.Option
  , FireDAC.Stan.Param
  , FireDAC.Stan.Error
  , FireDAC.DatS
  , FireDAC.Phys.Intf
  , FireDAC.DApt.Intf
  , FireDAC.Stan.Async
  , FireDAC.DApt
  , DB
  , FireDAC.Comp.DataSet
  , FireDAC.Comp.Client
  , frxClass
  , frxDBSet
  ;

type
  TDMRelatorio = class(TDataModule)
    frxReport: TfrxReport;
    frxDBProdutos: TfrxDBDataset;
    QyProdutos: TFDQuery;
    QyProdutosID_ITEM: TIntegerField;
    QyProdutosDESC_ITEM: TStringField;
    frxDBVendas: TfrxDBDataset;
    frxDBItensVenda: TfrxDBDataset;
    QyVendas: TFDQuery;
    QyVendasID_PED: TIntegerField;
    QyVendasNUMERO: TIntegerField;
    QyVendasDTEMISSAO: TDateField;
    QyVendasCLIENTE: TStringField;
    QyItensVenda: TFDQuery;
    QyItensVendaID_PED: TIntegerField;
    QyItensVendaID_ITEMSEQ: TIntegerField;
    QyItensVendaID_ITEM: TIntegerField;
    QyItensVendaDESC_ITEM: TStringField;
    QyItensVendaQUANTIDADE: TFloatField;
    QyItensVendaVALORUNIT: TFloatField;
    QyItensVendaVALORTOTAL: TFloatField;
    dsVendas: TDataSource;
  private
    { Private declarations }
  public
    procedure ListagemProdutos;
    procedure ListagemVendas;
  end;

var
  DMRelatorio: TDMRelatorio;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UnitDados;

{$R *.dfm}

{ TDMRelatorio }

procedure TDMRelatorio.ListagemProdutos;
begin
  frxReport.LoadFromFile(GetCurrentDir + '\Relatorios\Produtos.fr3');
  frxReport.ShowReport;
end;

procedure TDMRelatorio.ListagemVendas;
begin
  frxReport.LoadFromFile(GetCurrentDir + '\Relatorios\Vendas.fr3');
  frxReport.ShowReport;
end;

end.
