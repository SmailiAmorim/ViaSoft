unit UnitProdutos;

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
  , UnitCadastro
  , StdCtrls
  , ExtCtrls
  , DB
  , DadosCadastro
  , Buttons
  ;

type
  TFormProdutos = class(TFormCadastro)
    edCodigo: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edDescricao: TEdit;
    procedure AtualizaBotoes; override;
    procedure BtNovoClick(Sender: TObject);
    procedure BtPesquisarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
  private
    { Private declarations }
  protected
    function CriarDataModule: TDMCadastro; override;
  public
    { Public declarations }
  end;

var
  FormProdutos: TFormProdutos;

implementation

{$R *.dfm}

uses ProdutosDados;

{ TFormProdutos }

procedure TFormProdutos.AtualizaBotoes;
begin
  inherited;
  edDescricao.ReadOnly := not (dsLocal.State in dsEditModes);
end;

procedure TFormProdutos.BtGravarClick(Sender: TObject);
begin
  TDMProdutos(Dados).cdsPrincipalDESC_ITEM.AsString := edDescricao.Text;
  inherited;
end;

procedure TFormProdutos.BtNovoClick(Sender: TObject);
begin
  inherited;
  edCodigo.Text := TDMProdutos(Dados).cdsPrincipalID_ITEM.AsString;
end;

procedure TFormProdutos.BtPesquisarClick(Sender: TObject);
begin
  inherited;
  edCodigo.Text := TDMProdutos(Dados).cdsPrincipalID_ITEM.AsString;
  edDescricao.Text := TDMProdutos(Dados).cdsPrincipalDESC_ITEM.AsString;
end;

function TFormProdutos.CriarDataModule: TDMCadastro;
begin
  Result := TDMProdutos.Create(self);
end;

end.
