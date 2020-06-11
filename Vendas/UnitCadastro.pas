unit UnitCadastro;

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
  , ExtCtrls
  , DadosCadastro
  , DB
  , UITypes
  , Buttons
  ;

type
  TFormCadastro = class(TForm)
    dsLocal: TDataSource;
    PnBotoes: TPanel;
    BtNovo: TBitBtn;
    BtAlterar: TBitBtn;
    BtExcluir: TBitBtn;
    BtPesquisar: TBitBtn;
    BtFechar: TBitBtn;
    BtGravar: TBitBtn;
    BtDesistir: TBitBtn;
    procedure AtualizaBotoes; dynamic;
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnDesistirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtNovoClick(Sender: TObject);
    procedure BtAlterarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtPesquisarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure BtDesistirClick(Sender: TObject);
    procedure BtFecharClick(Sender: TObject);
  private
    FDados: TDMCadastro;
    function GetDados: TDMCadastro;
    function ValidaCampos: Boolean;
    procedure LimparCampos;
  protected
    property Dados: TDMCadastro read GetDados;
    function CriarDataModule: TDMCadastro; virtual; abstract;
  public
    { Public declarations }
  end;

var
  FormCadastro: TFormCadastro;

implementation

{$R *.dfm}

{ TFormCadastro }

procedure TFormCadastro.AtualizaBotoes;
var
  Editando: Boolean;
  Aberto: Boolean;
begin
  Aberto := dsLocal.DataSet.State <> dsInactive;
  Editando := dsLocal.DataSet.State in [dsEdit, dsInsert];

  BtNovo.Enabled := not Editando;
  BtAlterar.Enabled := not Editando;
  BtExcluir.Enabled := Aberto;
  BtPesquisar.Enabled := not Editando;
  BtGravar.Enabled := Editando;
  BtDesistir.Enabled := Editando;
end;

procedure TFormCadastro.BtAlterarClick(Sender: TObject);
begin
  Dados.Alterar;
  AtualizaBotoes;
end;

procedure TFormCadastro.BtDesistirClick(Sender: TObject);
begin
  Dados.Desistir;
  LimparCampos;
  AtualizaBotoes;
end;

procedure TFormCadastro.BtExcluirClick(Sender: TObject);
begin
  if MessageDlg('Confirma a exclusão do registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Dados.Excluir;
    LimparCampos;
  end;
  AtualizaBotoes;
end;

procedure TFormCadastro.BtFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFormCadastro.BtGravarClick(Sender: TObject);
begin
  if ValidaCampos then
    Dados.Gravar;
  AtualizaBotoes;
end;

procedure TFormCadastro.btnAlterarClick(Sender: TObject);
begin
  Dados.Alterar;
  AtualizaBotoes;
end;

procedure TFormCadastro.btnDesistirClick(Sender: TObject);
begin
  Dados.Desistir;
  LimparCampos;
  AtualizaBotoes;
end;

procedure TFormCadastro.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Confirma a exclusão do registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Dados.Excluir;
    LimparCampos;
  end;
  AtualizaBotoes;
end;

procedure TFormCadastro.btnGravarClick(Sender: TObject);
begin
  if ValidaCampos then
    Dados.Gravar;
  AtualizaBotoes;
end;

procedure TFormCadastro.btnNovoClick(Sender: TObject);
begin
  Dados.Novo;
  LimparCampos;
  AtualizaBotoes;
end;

procedure TFormCadastro.BtNovoClick(Sender: TObject);
begin
  Dados.Novo;
  LimparCampos;
  AtualizaBotoes;
end;

procedure TFormCadastro.btnPesquisarClick(Sender: TObject);
begin
  Dados.Pesquisar('', true);
  AtualizaBotoes;
end;

procedure TFormCadastro.BtPesquisarClick(Sender: TObject);
begin
  Dados.Pesquisar('', true);
  AtualizaBotoes;
end;

procedure TFormCadastro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormCadastro.FormCreate(Sender: TObject);
begin
  if not Assigned(FDados) then
    FDados := CriarDataModule;

  dsLocal.DataSet := Dados.cdsPrincipal;
end;

procedure TFormCadastro.FormDestroy(Sender: TObject);
begin
  FDados.Free;
end;

procedure TFormCadastro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL,0,0);
  end;
end;

function TFormCadastro.GetDados: TDMCadastro;
begin
  Result := FDados;
end;

procedure TFormCadastro.LimparCampos;
var
  I: Integer;
begin
  for I := 0 to ComponentCount - 1 do
  begin
    if Components[I].ClassType = TEdit then
      TEdit(Components[I]).Text := '';
  end;
end;

function TFormCadastro.ValidaCampos: Boolean;
var
  I: Integer;
begin
  Result := true;
  for I := 0 to ComponentCount - 1 do
  begin
    if Components[I].ClassType = TEdit then
    begin
      if TEdit(Components[I]).Text = '' then
      begin
        TEdit(Components[I]).SetFocus;

        Result := False;
        raise Exception.Create('Campo Obrigatório');
      end;
    end;
  end;
end;

end.
