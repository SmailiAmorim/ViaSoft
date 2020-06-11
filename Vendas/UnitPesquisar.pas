unit UnitPesquisar;

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
  , Grids
  , DBGrids
  , StdCtrls
  , Buttons
  , FireDAC.Stan.Intf
  , FireDAC.Stan.Option
  , FireDAC.Stan.Param
  , FireDAC.Stan.Error
  , FireDAC.DatS
  , FireDAC.Phys.Intf
  , FireDAC.DApt.Intf
  , FireDAC.Stan.Async
  , FireDAC.DApt
  , Data.DB
  , FireDAC.Comp.DataSet
  , FireDAC.Comp.Client
  , UnitDados
  ;

type

  TOperacao = (opIgual, opMenor, opMenorIgual, opMaior, opMaiorIgual, opDiferente);

  TFormPesquisar = class(TForm)
    edPesquisa: TEdit;
    GrdPesquisa: TDBGrid;
    btnOK: TBitBtn;
    btnCancelar: TBitBtn;
    BtPesquisar: TBitBtn;
    CBCampoPesq: TComboBox;
    DSPesquisa: TDataSource;
    label2: TLabel;
    Label3: TLabel;
    procedure FormShow(Sender: TObject);
    procedure edPesquisaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtPesquisarClick(Sender: TObject);
    procedure GrdPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GrdPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure GrdPesquisaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure GrdPesquisaEnter(Sender: TObject);
    procedure GrdPesquisaExit(Sender: TObject);
    procedure GrdPesquisaTitleClick(Column: TColumn);
  private
    ConsultaSQL: string;
    WhereIsNull: string;
    WhereParametro : string;
    _Tabela: TFDQuery;
    Ascendente: Boolean;
    procedure pesquisar;
    procedure Inicializa;
  public
    CDS : TFDQuery;
    SQL : string;
    Tabela: string;
    CampoBusca: string;
    CampoChave: string;
    LegendaGrouBox : string;
  end;

implementation

{$R *.dfm}

procedure TFormPesquisar.BtPesquisarClick(Sender: TObject);
begin
  pesquisar;
end;

procedure TFormPesquisar.edPesquisaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key in [VK_UP, VK_DOWN]) and not (CDS.IsEmpty) then
    GrdPesquisa.SetFocus;

  if Key = VK_RETURN then
    begin
      pesquisar;
    end;
end;

procedure TFormPesquisar.FormShow(Sender: TObject);
var
  I: Integer;
begin
  dsPesquisa.DataSet := CDS;
  if (LegendaGrouBox <> '') then
    Caption := LegendaGrouBox
  else
    Caption := 'Pesquisar';

  if SQL.IsEmpty then
    ConsultaSQL := Format('SELECT * FROM %S ', [tabela])
  else
    ConsultaSQL := SQL;
  WhereIsNull := Format(' WHERE %S IS NULL', [CampoChave]);
  WhereParametro := Format(' WHERE UPPER(%S) LIKE :P', [edPesquisa.Text]);

  CDS.Close;
  CDS.sql.Text := ConsultaSQL + WhereIsNull;
  CDS.Open;

  _Tabela := CDS;

  CBCampoPesq.Items.Clear;
  for I := 0 to _Tabela.FieldCount - 1 do
  begin
    if _Tabela.Fields[I].FieldKind in [fkData,fkInternalCalc] then
      CBCampoPesq.Items.Append( CDS.Fields[I].DisplayLabel );
  end;

  Inicializa;

  if edPesquisa.Text <> '' then
    pesquisar;
end;

procedure TFormPesquisar.GrdPesquisaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Cor: TColor;
begin
  Cor := clBlack;
  if not (gdSelected in State) then
    GrdPesquisa.Canvas.Font.Color := Cor
  else
  begin
    GrdPesquisa.Canvas.Font.Color := clWhite;
    GrdPesquisa.Canvas.Brush.Color := Cor;
  end;

  GrdPesquisa.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

procedure TFormPesquisar.GrdPesquisaEnter(Sender: TObject);
begin
  KeyPreview := True;
end;

procedure TFormPesquisar.GrdPesquisaExit(Sender: TObject);
begin
  KeyPreview := True;
end;

procedure TFormPesquisar.GrdPesquisaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 46) then
    Key := 0;
end;

procedure TFormPesquisar.GrdPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    if btnOk.Enabled then
      btnOK.Click;
  end;
end;

procedure TFormPesquisar.GrdPesquisaTitleClick(Column: TColumn);
begin
  Ascendente:= not Ascendente ;
  If Ascendente then
    CDS.IndexFieldNames := Column.FieldName + ':A'
  else
    CDS.IndexFieldNames := Column.FieldName + ':D';
end;

procedure TFormPesquisar.Inicializa;
begin
  Ascendente := False;
  edPesquisa.Text := CampoBusca;
  CBCampoPesq.ItemIndex := CBCampoPesq.Items.IndexOf(CampoChave);
end;

procedure TFormPesquisar.pesquisar;
begin
  WhereParametro := Format(' WHERE UPPER(%S) LIKE UPPER(%S)'
    , [CBCampoPesq.Items[CBCampoPesq.ItemIndex], QuotedStr(edPesquisa.Text + '%')]);

  CDS.Close;
  CDS.sql.Text := ConsultaSQL + WhereParametro;
  CDS.Open;

  if not CDS.IsEmpty then
      GrdPesquisa.SetFocus
    else
      edPesquisa.SetFocus;

  btnOK.Enabled := not CDS.IsEmpty;
end;

end.
