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
  , Menus
  , UnitRelatorio
  ;

type
  TFormPrincipal = class(TForm)
    MainMenu: TMainMenu;
    Cadastro1: TMenuItem;
    Movimentaes1: TMenuItem;
    Ajuda1: TMenuItem;
    Produtos1: TMenuItem;
    Vendas1: TMenuItem;
    Sobre1: TMenuItem;
    Relatrios1: TMenuItem;
    Produtos2: TMenuItem;
    Vendas2: TMenuItem;
    procedure Produtos1Click(Sender: TObject);
    procedure Vendas1Click(Sender: TObject);
    procedure Produtos2Click(Sender: TObject);
    procedure Vendas2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FDMRelatorio: TDMRelatorio;
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

uses
  UnitProdutos
  , UnitVendas
  ;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
  FDMRelatorio := TDMRelatorio.Create(Self);
end;

procedure TFormPrincipal.FormDestroy(Sender: TObject);
begin
  FDMRelatorio.Free;
end;

procedure TFormPrincipal.Produtos1Click(Sender: TObject);
var
  F: TFormProdutos;
begin
  F := TFormProdutos.Create(self);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure TFormPrincipal.Produtos2Click(Sender: TObject);
begin
  FDMRelatorio.ListagemProdutos;
end;

procedure TFormPrincipal.Vendas1Click(Sender: TObject);
var
  F: TFormVendas;
begin
  F := TFormVendas.Create(self);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure TFormPrincipal.Vendas2Click(Sender: TObject);
begin
  FDMRelatorio.ListagemVendas;
end;

end.
