{----------------------------------------------------------------------}
//     Projeto:    Projeto MV
//     Unit:       ViewEmpregado
//     Criado por: yuri.borges
//     Data:       17/07/2022
//     Versão:     1.0.0.0
{----------------------------------------------------------------------}
unit UViewEmpregado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Mask, ModelEmpregado, ControllerEmpregado, Data.DB;

type
  TOperacaoEmpregado= (opIncluir, OpAlterar); // Tipo de Operação.

type
  TViewEmpregado = class(TForm)
    pnPrincipal: TPanel;
    lbCodigo: TLabel;
    Label1: TLabel;
    edCodigo: TEdit;
    edNomeEmpregado: TEdit;
    pnRodape: TPanel;
    btCancelar: TSpeedButton;
    btConfirmar: TSpeedButton;
    Label2: TLabel;
    edSalario: TEdit;
    lbSalario: TLabel;
    edComissao: TEdit;
    lbComissao: TLabel;
    mskDataAdmissao: TMaskEdit;
    lbDataEmissao: TLabel;
    cbDepartamento: TDBLookupComboBox;
    dsDepEmpregado: TDataSource;
    procedure edNomeEmpregadoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edSalarioKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure mskDataAdmissaoExit(Sender: TObject);
  private
    FOperacao: TOperacaoEmpregado;
    { Private declarations }
  public
    IDAlterar: integer;
    procedure Movimento(Tipo: string; IDEmpregado: Integer); // Define o modo da tela.
    procedure CarregarEmpregado;
    procedure Alterar;
    procedure CriarMovimento(Tipo: string);
    procedure DestruirMovimento(Tipo: string);
    procedure Incluir;
    procedure Gravar;
    procedure ValidaData(Edit: TMaskEdit);
    { Public declarations }
  end;

var
  ViewEmpregado: TViewEmpregado;
  oEmpregado: TEmpregado;
  oEmpregadoController: TEmpregadoController;

implementation

Uses
  DataModuloConexao;

{$R *.dfm}

procedure TViewEmpregado.Alterar;
var
  Erro: string;
begin
  CriarMovimento('Todos');

  try
    with oEmpregado do
    begin
      EmpregadoID := StrToIntDef(edCodigo.Text, 0);
      EmpregadoCodigoDepartamento := cbDepartamento.KeyValue;
      EmpregadoNome := edNomeEmpregado.Text;
      EmpregadoDataAdmissao := mskDataAdmissao.Text;
      EmpregadoSalario := StrToFloat(edSalario.Text);
      EmpregadoComissao := StrToFloat(edComissao.Text);
    end;

    if not oEmpregadoController.Alterar(oEmpregado, Erro) then
      raise Exception.Create(Erro);
  finally
    DestruirMovimento('Todos');
  end;
end;

procedure TViewEmpregado.btCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TViewEmpregado.btConfirmarClick(Sender: TObject);
begin
  Gravar;
  Close;
end;

procedure TViewEmpregado.CarregarEmpregado;
begin
  CriarMovimento('Todos');

  try
    oEmpregadoController.CarregaEmpregado(oEmpregado, IDAlterar);
    with oEmpregado do
    begin
      edCodigo.Text := IntToStr(EmpregadoID);
      edNomeEmpregado.Text := EmpregadoNome;
      cbDepartamento.KeyValue := EmpregadoCodigoDepartamento;
      edSalario.Text := FloatToStr(EmpregadoSalario);
      edComissao.Text := FloatToStr(EmpregadoComissao);
      mskDataAdmissao.Text := FormatDateTime('dd/mm/yyyy', StrToDate(EmpregadoDataAdmissao));
    end;
  finally
    DestruirMovimento('Todos');
  end;
end;

procedure TViewEmpregado.CriarMovimento(Tipo: string);
begin
  if (Tipo = 'Todos') or (Tipo = 'Empregado') then
    oEmpregado := TEmpregado.Create;

  if (Tipo = 'Todos') or (Tipo = 'Controller') then
    oEmpregadoController := TEmpregadoController.Create;
end;

procedure TViewEmpregado.DestruirMovimento(Tipo: string);
begin
   if (Tipo = 'Todos') or (Tipo = 'Empregado') then
    FreeAndNil(oEmpregado);

  if (Tipo = 'Todos') or (Tipo = 'Controller') then
    FreeAndNil(oEmpregadoController);
end;

procedure TViewEmpregado.edNomeEmpregadoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TViewEmpregado.edSalarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9', '.', #8, #13]) or ((Key in ['.']) and (Pos('.', TEdit(Sender).Text) > 0)) then
    key := #0;
end;

procedure TViewEmpregado.FormShow(Sender: TObject);
begin
  if FOperacao = OpAlterar then
    CarregarEmpregado;
end;

procedure TViewEmpregado.Gravar;
begin
  CriarMovimento('Controller');
  try
    case FOperacao of
      opIncluir: Incluir;
      OpAlterar: Alterar;
    end;
  finally
    DestruirMovimento('Controller')
  end;
end;

procedure TViewEmpregado.Incluir;
var
  Erro: string;
begin
  CriarMovimento('Todos');
  try
    with oEmpregado do
    begin
      EmpregadoID := 0;
      EmpregadoCodigoDepartamento := cbDepartamento.KeyValue;
      EmpregadoNome := edNomeEmpregado.Text;
      EmpregadoDataAdmissao := mskDataAdmissao.Text;
      EmpregadoSalario := StrToFloatDef(edSalario.Text, 0);
      EmpregadoComissao := StrToFloatDef(edComissao.Text, 0);
    end;

    if not oEmpregadoController.Incluir(oEmpregado, Erro) then
      raise Exception.Create(Erro)
  finally
    DestruirMovimento('Todos');
  end;

end;

procedure TViewEmpregado.Movimento(Tipo: string;
  IDEmpregado: Integer);
begin
  if Tipo = 'Incluir' then
    FOperacao := OpIncluir
  else
  begin
    FOperacao := OpAlterar;
    IDAlterar := IDEmpregado;
  end;
end;

procedure TViewEmpregado.mskDataAdmissaoExit(Sender: TObject);
begin
  if mskDataAdmissao.Text <> '  /  /    ' then
    ValidaData(mskDataAdmissao);
end;

procedure TViewEmpregado.ValidaData(Edit: TMaskEdit);
begin
  try
    StrToDate(Edit.Text);

    if Length(Trim(Edit.Text)) < 10 then
      Abort;

    if StrToDate(Edit.Text) < StrToDate('01/01/1800') then
      Abort;

  except
    MessageDlg('Data inválida.', mtInformation, [mbOK], 0);
    Edit.Clear;
    Edit.SetFocus;
  end;
end;

end.
