unit VendasDados;

interface

uses
  SysUtils
  , Classes
  , DadosCadastro
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
  , DB
  , DBClient
  , UITypes
  ;

type
  TDMVendas = class(TdmCadastro)
    QyDetalhe: TFDQuery;
    dsProviderDetalhe: TDataSetProvider;
    cdsDetalhe: TClientDataSet;
    cdsPrincipalID_PED: TIntegerField;
    cdsPrincipalNUMERO: TIntegerField;
    cdsPrincipalDTEMISSAO: TDateField;
    cdsPrincipalCLIENTE: TStringField;
    QyDetalheID_PED: TIntegerField;
    QyDetalheID_ITEMSEQ: TIntegerField;
    QyDetalheID_ITEM: TIntegerField;
    QyDetalheDESC_ITEM: TStringField;
    QyDetalheQUANTIDADE: TFloatField;
    QyDetalheVALORUNIT: TFloatField;
    cdsDetalheID_ITEMSEQ: TIntegerField;
    cdsDetalheID_ITEM: TIntegerField;
    cdsDetalheDESC_ITEM: TStringField;
    cdsDetalheQUANTIDADE: TFloatField;
    cdsDetalheVALORUNIT: TFloatField;
    QyProduto: TFDQuery;
    QyProdutoID_ITEM: TIntegerField;
    QyProdutoDESC_ITEM: TStringField;
    cdsDetalheID_PED: TIntegerField;
    QyDetalheVALORTOTAL: TFloatField;
    cdsDetalheVALORTOTAL: TFloatField;
    TabelaPrincipalID_PED: TIntegerField;
    TabelaPrincipalNUMERO: TIntegerField;
    TabelaPrincipalDTEMISSAO: TDateField;
    TabelaPrincipalCLIENTE: TStringField;
    procedure cdsPrincipalAfterInsert(DataSet: TDataSet);
    procedure cdsDetalheAfterPost(DataSet: TDataSet);
    procedure cdsDetalheNewRecord(DataSet: TDataSet);
    procedure cdsDetalheID_ITEMValidate(Sender: TField);
    procedure cdsDetalheQUANTIDADEChange(Sender: TField);
    procedure cdsDetalheVALORUNITChange(Sender: TField);
  private
    UltimoItem: Integer;
    function GetUltimoItem: Integer;
    function PesquisarProduto(Busca, CampoTabela: string; const UsarTelaPesquisa: Boolean): string;
  public
    procedure FecharTabelas; override;

    procedure Novo; override;
    procedure Gravar; override;

    procedure AbrirDetalhe;
    procedure Pesquisar(Busca: string; const UsarTelaPesquisa: Boolean); override;
  end;

var
  DMVendas: TDMVendas;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UnitDados, Vcl.Dialogs;

{$R *.dfm}

{ TdmVendas }

procedure TDMVendas.AbrirDetalhe;
begin
  cdsDetalhe.Close;
  QyDetalhe.Close;
  QyDetalhe.ParamByName('ID_PED').AsInteger := cdsPrincipalID_PED.AsInteger;
  QyDetalhe.Open;
  cdsDetalhe.Open;
  cdsDetalhe.Insert;

  UltimoItem := GetUltimoItem;
  cdsDetalhe.Last;
end;

procedure TDMVendas.cdsDetalheAfterPost(DataSet: TDataSet);
begin
  inherited;
  if cdsDetalheID_ITEMSEQ.AsInteger > UltimoItem then
    UltimoItem := cdsDetalheID_ITEMSEQ.AsInteger;
end;

procedure TDMVendas.cdsDetalheID_ITEMValidate(Sender: TField);
begin
  inherited;
  if ((QyProdutoID_ITEM.AsString = Sender.AsString)
  and (cdsDetalheDESC_ITEM.AsString = QyProdutoDESC_ITEM.AsString)) then
    Exit;

  PesquisarProduto(Sender.AsString, 'ID_ITEM', false);

  if QyProduto.IsEmpty then
  begin
    MessageDlg(Format('Produto %S não encontrado.', [Sender.AsString]), mtError, [mbOK], 0);
    exit;
  end;

  cdsDetalheDESC_ITEM.AsString := QyProdutoDESC_ITEM.AsString;
  cdsDetalheID_ITEM.AsString := QyProdutoID_ITEM.AsString;
end;

procedure TDMVendas.cdsDetalheNewRecord(DataSet: TDataSet);
begin
  inherited;
  cdsDetalheID_PED.AsInteger := cdsPrincipalID_PED.AsInteger;
  cdsDetalheID_ITEMSEQ.AsInteger := UltimoItem + 1;
  cdsDetalheQUANTIDADE.AsInteger := 1;
end;

procedure TDMVendas.cdsDetalheQUANTIDADEChange(Sender: TField);
begin
  inherited;
  if Sender.AsFloat <= 0 then
    Exit;

  if cdsDetalheVALORUNIT.AsFloat <= 0 then
    Exit;

  cdsDetalheVALORTOTAL.AsFloat := Sender.AsFloat * cdsDetalheVALORUNIT.AsFloat;
end;

procedure TDMVendas.cdsDetalheVALORUNITChange(Sender: TField);
begin
  inherited;
  if Sender.AsFloat <= 0 then
    Exit;

  if cdsDetalheQUANTIDADE.AsFloat <= 0 then
    Exit;

  cdsDetalheVALORTOTAL.AsFloat := Sender.AsFloat * cdsDetalheQUANTIDADE.AsFloat;
end;

procedure TDMVendas.cdsPrincipalAfterInsert(DataSet: TDataSet);
begin
  inherited;
  cdsPrincipalID_PED.AsInteger := GetGenerator('GEN_PEDIDO');
end;

procedure TDMVendas.FecharTabelas;
begin
  inherited;
  QyDetalhe.Close;
  cdsDetalhe.Close;
end;

function TDMVendas.GetUltimoItem: Integer;
var
  BM: TBookmark;
begin
  Result := 0;
  if not cdsDetalhe.Active or cdsDetalhe.IsEmpty then
    Exit;

  BM := cdsDetalhe.GetBookmark;
  cdsDetalhe.DisableControls;
  try
    cdsDetalhe.Last;
    Result := cdsDetalheID_ITEMSEQ.AsInteger;
  finally
    cdsDetalhe.GotoBookmark(BM);
    cdsDetalhe.EnableControls;
  end;
end;

procedure TDMVendas.Gravar;
begin
  if cdsDetalhe.IsEmpty then
    raise Exception.Create('Venda sem Itens!');

  inherited;

  if cdsDetalhe.State in dsEditModes then
    cdsDetalhe.Post;
  cdsDetalhe.ApplyUpdates(0);
  cdsDetalhe.RefreshRecord;
end;

procedure TDMVendas.Novo;
begin
  inherited;
  AbrirDetalhe;
end;

function TDMVendas.PesquisarProduto(Busca, CampoTabela: string;
   const UsarTelaPesquisa: Boolean): string;
var
  Qy: TFDQuery;
  FBusca: string;
begin
  FBusca := Busca;
  if UsarTelaPesquisa then
  begin
    Qy := TFDQuery.Create(nil);
    try
      Qy.Connection := DMDados.FDConnection;
      Qy.SQL.Text := TabelaPrincipal.SQL.Text;
      FBusca := DMDados.Pesquisar(Qy, 'ITEM', Busca, CampoTabela, 'Pesquisar Produtos', 0);
    finally
      Qy.Free;
    end;

  end;

  if not FBusca.IsEmpty then
  begin
    QyProduto.Close;
    QyProduto.SQL.Text := 'SELECT ID_ITEM, DESC_ITEM FROM ITEM WHERE ID_ITEM = ' + QuotedStr(FBusca);
    QyProduto.Open;
  end;
end;

procedure TDMVendas.Pesquisar(Busca: string; const UsarTelaPesquisa: Boolean);
var
  Qy: TFDQuery;
  FBusca: string;
begin
  FBusca := Busca;
  if UsarTelaPesquisa then
  begin
    Qy := TFDQuery.Create(nil);
    try
      Qy.Connection := DMDados.FDConnection;
      Qy.SQL.Text := TabelaPrincipal.SQL.Text;
      FBusca := DMDados.Pesquisar(Qy, 'PEDIDOCAB', Busca, 'NUMERO', 'Pesquisar Produtos', 0);
    finally
      Qy.Free;
    end;

  end;

  if not FBusca.IsEmpty then
  begin
    cdsPrincipal.Close;
    TabelaPrincipal.Close;
    TabelaPrincipal.SQL.Clear;
    TabelaPrincipal.SQL.Add('SELECT ID_PED, NUMERO, DTEMISSAO, CLIENTE FROM PEDIDOCAB');
    TabelaPrincipal.SQL.Add('WHERE ID_PED = ' + QuotedStr(FBusca));
    TabelaPrincipal.Open;
    cdsPrincipal.Open;

    AbrirDetalhe;
  end;
end;

end.
