program Vendas;

uses
  Vcl.Forms,
  UnitPrincipal in 'UnitPrincipal.pas' {FormPrincipal},
  UnitDados in 'UnitDados.pas' {dmDados: TDataModule},
  UnitCadastro in 'UnitCadastro.pas' {FormCadastro},
  DadosCadastro in 'DadosCadastro.pas' {dmCadastro: TDataModule},
  UnitProdutos in 'UnitProdutos.pas' {FormProdutos},
  ProdutosDados in 'ProdutosDados.pas' {DMProdutos: TDataModule},
  UnitPesquisar in 'UnitPesquisar.pas' {FormPesquisar},
  UnitVendas in 'UnitVendas.pas' {FormVendas},
  VendasDados in 'VendasDados.pas' {DMVendas: TDataModule},
  UnitRelatorio in 'UnitRelatorio.pas' {DMRelatorio: TDataModule};

{$R *.res}

begin
  {$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmDados, dmDados);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
