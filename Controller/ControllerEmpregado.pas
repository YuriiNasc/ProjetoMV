{----------------------------------------------------------------------}
//     Projeto:    Projeto MV
//     Unit:       ControllerEmpregado
//     Criado por: yuri.borges
//     Data:       17/07/2022 01:22:40
//     Versão:     1.0.0.0
{----------------------------------------------------------------------}
unit ControllerEmpregado;

interface

uses
  ADODB, SysUtils, StdCtrls, Messages, Dialogs, ModelEmpregado;

type
  TEmpregadoController = Class
    private
    { Private declarations }
  public
    procedure CarregaEmpregado(oEmpregado: TEmpregado; ID: Integer);
    function Incluir(oEmpregado: TEmpregado; var Erro: string): Boolean;
    function Alterar(oEmpregado: TEmpregado; var Erro: string): Boolean;
    function Excluir(Id: integer; var Erro: string): Boolean;
    { Public declarations }
  End;

implementation

uses
  DataModuloConexao;

{ TEmpregadoController }

function TEmpregadoController.Alterar(oEmpregado: TEmpregado;
  var Erro: string): Boolean;
begin
  Result := ModGeral.AlterarEmpregado(oEmpregado, Erro);
end;

procedure TEmpregadoController.CarregaEmpregado(oEmpregado: TEmpregado;
  ID: Integer);
begin
  ModGeral.CarregarEmpregado(oEmpregado, ID);
end;

function TEmpregadoController.Excluir(Id: integer; var Erro: string): Boolean;
begin
  Result := ModGeral.ExcluirEmpregado(Id, Erro);
end;

function TEmpregadoController.Incluir(oEmpregado: TEmpregado;
  var Erro: string): Boolean;
begin
  Result := ModGeral.IncluirEmpregado(oEmpregado, Erro);
end;

end.
