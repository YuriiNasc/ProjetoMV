{----------------------------------------------------------------------}
//     Projeto:    ProjetoMV
//     Unity:      UViewDepartamento
//     Criado por: yuri.borges
//     Data:       16/07/2022 20:49:45
//     Versão:     1.0.0.0
{----------------------------------------------------------------------}
unit UViewDepartamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, ModelDepartamento, ControllerDepartamento;

type
  TOperacaoDepartamento = (opIncluir, OpAlterar); // Tipo de Operação.

  TViewDepartamento = class(TForm)
    pnPrincipal: TPanel;
    pnRodape: TPanel;
    btCancelar: TSpeedButton;
    btConfirmar: TSpeedButton;
    lbCodigo: TLabel;
    lbDescricao: TLabel;
    lbLocal: TLabel;
    edCodigo: TEdit;
    edDescricao: TEdit;
    edLocal: TEdit;
    procedure btCancelarClick(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
  FOperacao: TOperacaoDepartamento;
    { Private declarations }
  public
    IDAlterar: integer;
    procedure Movimento(Tipo: string; IDDepartamento: Integer); // Define o modo da tela.
    procedure CarregarDepartamento;
    procedure Alterar;
    procedure CriarMovimento(Tipo: string);
    procedure DestruirMovimento(Tipo: string);
    procedure Incluir;
    procedure Gravar;
    { Public declarations }
  end;

var
  ViewDepartamento: TViewDepartamento;
  oDepartamento: TDepartamento;
  oDepartamentoController: TDepartamentoController;

implementation

{$R *.dfm}

{ TDepartamento }

procedure TViewDepartamento.Movimento(Tipo: string; IDDepartamento: Integer);
begin
  if Tipo = 'Incluir' then
    FOperacao := OpIncluir
  else
  begin
    FOperacao := OpAlterar;
    IDAlterar := IDDepartamento;
  end;
end;

procedure TViewDepartamento.Alterar;
var
  Erro: string;
begin
  CriarMovimento('Todos');

  try
    with oDepartamento do
    begin
      DepartamentoID := StrToIntDef(edCodigo.Text, 0);
      DepartamentoDescricao := edDescricao.Text;
      DepartamentoLocal := edLocal.Text;
    end;

    if not oDepartamentoController.Alterar(oDepartamento, Erro) then
      raise Exception.Create(Erro);
  finally
    DestruirMovimento('Todos');
  end;
end;

procedure TViewDepartamento.btCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TViewDepartamento.btConfirmarClick(Sender: TObject);
begin
  Gravar;
  Close;
end;

procedure TViewDepartamento.CarregarDepartamento;
begin
  CriarMovimento('Todos');

  try
    oDepartamentoController.CarregaDepartamento(oDepartamento, IDAlterar);
    with oDepartamento do
    begin
      edCodigo.Text := IntToStr(DepartamentoId);
      edDescricao.Text := DepartamentoDescricao;
      edLocal.Text := DepartamentoLocal;
    end;
  finally
    DestruirMovimento('Todos');
  end;
end;

procedure TViewDepartamento.CriarMovimento(Tipo: string);
begin
  if (Tipo = 'Todos') or (Tipo = 'Departamentro') then
    oDepartamento := TDepartamento.Create;

  if (Tipo = 'Todos') or (Tipo = 'Controller') then
    oDepartamentoController := TDepartamentoController.Create;
end;

procedure TViewDepartamento.DestruirMovimento;
begin
  if (Tipo = 'Todos') or (Tipo = 'Departamentro') then
    FreeAndNil(oDepartamento);

  if (Tipo = 'Todos') or (Tipo = 'Controller') then
    FreeAndNil(oDepartamentoController);
end;

procedure TViewDepartamento.edDescricaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TViewDepartamento.FormShow(Sender: TObject);
begin
  if FOperacao = OpAlterar then
    CarregarDepartamento;
end;

procedure TViewDepartamento.Gravar;
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

procedure TViewDepartamento.Incluir;
var
  Erro: string;
begin
  CriarMovimento('Todos');
  try
    with oDepartamento do
    begin
      DepartamentoID := 0;
      DepartamentoDescricao := edDescricao.Text;
      DepartamentoLocal := edLocal.Text;
    end;

    if not oDepartamentoController.Incluir(oDepartamento, Erro) then
      raise Exception.Create(Erro)
  finally
    DestruirMovimento('Todos');
  end;
end;

end.
