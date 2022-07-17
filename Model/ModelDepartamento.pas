{----------------------------------------------------------------------}
//     Projeto:    ProjetoMV
//     Unit:       ModelDepartamento
//     Criado por: yuri.borges
//     Data:       14/07/2022 19:49:45
//     Versão:     1.0.0.0
{----------------------------------------------------------------------}
unit ModelDepartamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Dialogs, Vcl.StdCtrls;

type
  TDepartamento = class
  private
    FDepartamentoID: Integer;
    FDepartamentoLocal: string;
    FDepartamentoDescricao: string;
    procedure SetDepartamentoDescricao(const Value: string);
    procedure SetDepartamentoID(const Value: Integer);
    procedure SetDepartamentoLocal(const Value: string);
  public
    property DepartamentoID: Integer read FDepartamentoID write SetDepartamentoID;
    property DepartamentoDescricao: string read FDepartamentoDescricao write SetDepartamentoDescricao;
    property DepartamentoLocal: string read FDepartamentoLocal write SetDepartamentoLocal;
  end;

implementation

{ TDepartamento }

procedure TDepartamento.SetDepartamentoDescricao(const Value: string);
begin
  if value = EmptyStr then
    raise EArgumentException.Create('Informa a descrição do departamento.');

  FDepartamentoDescricao := Value;
end;

procedure TDepartamento.SetDepartamentoID(const Value: Integer);
begin
  FDepartamentoID := Value;
end;

procedure TDepartamento.SetDepartamentoLocal(const Value: string);
begin
  FDepartamentoLocal := Value;
end;

end.

