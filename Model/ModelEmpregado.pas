{----------------------------------------------------------------------}
//     Projeto:    Projeto MV
//     Unit:       ModelEmpregado
//     Criado por: yuri.borges
//     Data:       17/07/2022 00:46:01
//     Versão:     1.0.0.0
{----------------------------------------------------------------------}
unit ModelEmpregado;

interface

uses
  System.SysUtils;

type
  TEmpregado = class
  private
    FEmpregadoID: Integer;
    FSalario: Extended;
    FEmpregadoNome: string;
    FEmpregadoCodigoDepartamento: Integer;
    FEmpregadoSalario: Extended;
    FEmpregadoComissao: Extended;
    FEmpregadoDataAdmissao: string;
    procedure SetEmpregadoCodigoDepartamento(const Value: Integer);
    procedure SetEmpregadoID(const Value: Integer);
    procedure SetEmpregadoNome(const Value: string);
    procedure SetEmpregadoComissao(const Value: Extended);
    procedure SetEmpregadoDataAdmissao(const Value: string);
    procedure SetEmpregadoSalario(const Value: Extended);
  public
    property EmpregadoID: Integer read FEmpregadoID write SetEmpregadoID;
    property EmpregadoCodigoDepartamento: Integer read FEmpregadoCodigoDepartamento write SetEmpregadoCodigoDepartamento;
    property EmpregadoNome: string read FEmpregadoNome write SetEmpregadoNome;
    property EmpregadoDataAdmissao: string read FEmpregadoDataAdmissao write SetEmpregadoDataAdmissao;
    property EmpregadoSalario: Extended read FEmpregadoSalario write SetEmpregadoSalario;
    property EmpregadoComissao: Extended read FEmpregadoComissao write SetEmpregadoComissao;
  end;


implementation

{ TEmpregado }

procedure TEmpregado.SetEmpregadoCodigoDepartamento(const Value: Integer);
begin
  FEmpregadoCodigoDepartamento := Value;
end;

procedure TEmpregado.SetEmpregadoComissao(const Value: Extended);
begin
  FEmpregadoComissao := Value;
end;

procedure TEmpregado.SetEmpregadoDataAdmissao(const Value: string);
begin
  {Validado para informar ao menos a data de admissão}
  if (value = Emptystr) or (Value = '  /  /    ') then
    raise EArgumentException.Create('Informe a data de admissão do empregado.');

  FEmpregadoDataAdmissao := Value;
end;

procedure TEmpregado.SetEmpregadoID(const Value: Integer);
begin
  FEmpregadoID := Value;
end;

procedure TEmpregado.SetEmpregadoNome(const Value: string);
begin
  {Validado para informar ao menos o nome do empregado.}
  if value = EmptyStr then
    raise EArgumentException.Create('Informe o nome do empregado.');

  FEmpregadoNome := Value;
end;

procedure TEmpregado.SetEmpregadoSalario(const Value: Extended);
begin
  FEmpregadoSalario := Value;
end;

end.
