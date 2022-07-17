program ProjetoMV;

uses
  Vcl.Forms,
  UViewPrincipal in 'View\UViewPrincipal.pas' {Principal},
  ControllerDepartamento in 'Controller\ControllerDepartamento.pas',
  UViewDepartamento in 'View\UViewDepartamento.pas' {ViewDepartamento},
  ModelDepartamento in 'Model\ModelDepartamento.pas',
  DataModuloConexao in 'Dao\DataModuloConexao.pas' {ModGeral: TDataModule},
  UViewEmpregado in 'View\UViewEmpregado.pas' {ViewEmpregado},
  ModelEmpregado in 'Model\ModelEmpregado.pas',
  ControllerEmpregado in 'Controller\ControllerEmpregado.pas',
  UViewConectaBanco in 'View\UViewConectaBanco.pas' {ViewConectaBanco};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPrincipal, Principal);
  Application.CreateForm(TModGeral, ModGeral);
  Application.Run;
end.
