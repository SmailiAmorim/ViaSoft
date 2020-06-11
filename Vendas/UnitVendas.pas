unit UnitVendas;

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
  , DB
  , StdCtrls
  , ExtCtrls
  , ComCtrls
  , Grids
  , DBGrids
  , DadosCadastro
  , Buttons
  ;

type
  TFormVendas = class(TFormCadastro)
    Label1: TLabel;
    edPedido_ID: TEdit;
    Label2: TLabel;
    edNumero: TEdit;
    dtpData: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    edCliente: TEdit;
    Label5: TLabel;
    grdProdutos: TDBGrid;
    dsDetalhe: TDataSource;
    procedure AtualizaBotoes; override;
    procedure grdProdutosKeyPress(Sender: TObject; var Key: Char);
    procedure grdProdutosColEnter(Sender: TObject);
    procedure grdProdutosEnter(Sender: TObject);
    procedure grdProdutosExit(Sender: TObject);
    procedure BtNovoClick(Sender: TObject);
    procedure BtPesquisarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
  private
    Campo: Integer;
  protected
    function CriarDataModule: TDMCadastro; override;
  public
    { Public declarations }
  end;

var
  FormVendas: TFormVendas;

implementation

{$R *.dfm}

uses VendasDados;

{ TFormVendas }

procedure TFormVendas.AtualizaBotoes;
begin
  inherited;
  grdProdutos.ReadOnly := not (dsLocal.State in dsEditModes);
  dtpData.Enabled := dsLocal.State in dsEditModes;
  edNumero.ReadOnly := not (dsLocal.State in dsEditModes);
  edCliente.ReadOnly := not (dsLocal.State in dsEditModes);
end;

procedure TFormVendas.BtGravarClick(Sender: TObject);
begin
  TDMVendas(Dados).cdsPrincipalNUMERO.AsInteger := StrToInt(edNumero.Text);
  TDMVendas(Dados).cdsPrincipalDTEMISSAO.AsDateTime := dtpData.DateTime;
  TDMVendas(Dados).cdsPrincipalCLIENTE.AsString := edCliente.Text;
  inherited;
end;

procedure TFormVendas.BtNovoClick(Sender: TObject);
begin
  inherited;
  edPedido_ID.Text := TDMVendas(Dados).cdsPrincipalID_PED.AsString;
  edNumero.Text := edPedido_ID.Text;
  dtpData.Date := Now;
  edCliente.SetFocus;
end;

procedure TFormVendas.BtPesquisarClick(Sender: TObject);
begin
  inherited;
  edPedido_ID.Text := TDMVendas(Dados).cdsPrincipalID_PED.AsString;
  edNumero.Text := edPedido_ID.Text;
  dtpData.Date := TDMVendas(Dados).cdsPrincipalDTEMISSAO.AsDateTime;
  edCliente.Text := TDMVendas(Dados).cdsPrincipalCLIENTE.AsString;
end;

function TFormVendas.CriarDataModule: TDMCadastro;
begin
  Result := TdmVendas.Create(self);
end;

procedure TFormVendas.grdProdutosColEnter(Sender: TObject);
begin
  inherited;
  Campo := TDBGrid(Sender).SelectedField.Index;
end;

procedure TFormVendas.grdProdutosEnter(Sender: TObject);
begin
  inherited;
  KeyPreview := False;
end;

procedure TFormVendas.grdProdutosExit(Sender: TObject);
begin
  inherited;
  KeyPreview := True;
end;

procedure TFormVendas.grdProdutosKeyPress(Sender: TObject; var Key: Char);
var
  Grid: TDBGrid;
begin
  inherited;
  Grid := TDBGrid(Sender);

  if Key = #13 then
  begin
    Key := #0;
    if Campo = Grid.DataSource.DataSet.FieldCount - 1 then
    begin
      if Grid.DataSource.DataSet.State in dsEditModes then
        Grid.DataSource.DataSet.Post;
      Grid.DataSource.DataSet.Next;
      if (not Grid.ReadOnly) and Grid.DataSource.DataSet.EOF then
        Grid.DataSource.DataSet.Append;
      Grid.SelectedField := Grid.Columns[0].Field;
    end
    else

      Grid.SelectedField := Grid.DataSource.DataSet.Fields[Campo+1];
  end
end;

end.
