{----------------------------------------------------------------------}
//     Projeto:    ProjetoMV
//     Unity:      ControllerDepartamento
//     Criado por: yuri.borges
//     Data:       14/07/2022 10:49:45
//     Versão:     1.0.0.0
{----------------------------------------------------------------------}
unit ControllerDepartamento;

interface

uses
  ADODB, SysUtils, StdCtrls, Messages, Dialogs, ModelDepartamento;


type
  TDepartamentoController = class
  private
    { Private declarations }
  public
    procedure CarregaDepartamento(oDepartamento: TDepartamento; ID: Integer);
    function Incluir(oDepartamento: TDepartamento; var Erro: string): Boolean;
    function Alterar(oDepartamento: TDepartamento; var Erro: string): Boolean;
    function Excluir(Id: integer; var Erro: string): Boolean;
    { Public declarations }
  end;

implementation

uses
  DataModuloConexao;

{ Departamento }

{ TDepartamentoController }

function TDepartamentoController.Alterar(oDepartamento: TDepartamento;
  var Erro: string): Boolean;
begin
  Result := ModGeral.AlterarDepartamento(oDepartamento, Erro);
end;

procedure TDepartamentoController.CarregaDepartamento(
  oDepartamento: TDepartamento; ID: Integer);
begin
  ModGeral.CarregarDepartamento(oDepartamento, ID);
end;

function TDepartamentoController.Excluir(Id: integer;
  var Erro: string): Boolean;
begin
  Result := ModGeral.ExcluirDepartamento(Id, Erro);
end;

function TDepartamentoController.Incluir(oDepartamento: TDepartamento;
  var Erro: string): Boolean;
begin
  Result := ModGeral.IncluirDepartamento(oDepartamento, Erro);
end;

end.
