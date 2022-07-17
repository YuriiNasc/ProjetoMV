{----------------------------------------------------------------------}
//     Projeto:    ProjetoMV
//     Unity:      UViewPrincipal
//     Criado por: yuri.borges
//     Data:       14/07/2022 20:49:45
//     Versão:     1.0.0.0
{----------------------------------------------------------------------}
unit UViewPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.PG, FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.Buttons, Vcl.ExtCtrls, ModelDepartamento,
  Vcl.Grids, Vcl.DBGrids;

type
  TPrincipal = class(TForm)
    pnPrincipal: TPanel;
    gbDepartamento: TGroupBox;
    GradeDepartamento: TDBGrid;
    btExcluiItem: TBitBtn;
    btAlterarItem: TBitBtn;
    btIncluir: TBitBtn;
    gbEmpregado: TGroupBox;
    GradeEmpregado: TDBGrid;
    btExcluirEmpregado: TBitBtn;
    btAlterarEmpregado: TBitBtn;
    btIncluirEmpregado: TBitBtn;
    dsEmpregado: TDataSource;
    dsDepartamento: TDataSource;
    procedure ExibirTela(Tipo, Movimento: string);
    procedure btIncluirClick(Sender: TObject);
    procedure btAlterarItemClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btExcluiItemClick(Sender: TObject);
    procedure btIncluirEmpregadoClick(Sender: TObject);
    procedure btAlterarEmpregadoClick(Sender: TObject);
    procedure btExcluirEmpregadoClick(Sender: TObject);
  private
    procedure ExcluirDepartamento;
    procedure ExcluirEmpregado;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Principal: TPrincipal;

implementation

Uses
  DataModuloConexao,
  UViewDepartamento, ControllerDepartamento,
  UViewEmpregado, ControllerEmpregado;

{$R *.dfm}

procedure TPrincipal.btAlterarEmpregadoClick(Sender: TObject);
begin
  if (ModGeral.qryPesquisarEmpregado.Active) and (ModGeral.qryPesquisarEmpregado.RecordCount > 0) then
    ExibirTela('Empregado', 'Alterar');
end;

procedure TPrincipal.btAlterarItemClick(Sender: TObject);
begin
  if (ModGeral.qryPesquisarDepartamento.Active) and (ModGeral.qryPesquisarDepartamento.RecordCount > 0) then
    ExibirTela('Departamento', 'Alterar');
end;

procedure TPrincipal.btExcluiItemClick(Sender: TObject);
begin
  ExcluirDepartamento;
end;

procedure TPrincipal.btExcluirEmpregadoClick(Sender: TObject);
begin
  ExcluirEmpregado;
end;

procedure TPrincipal.btIncluirClick(Sender: TObject);
begin
  ExibirTela('Departamento', 'Incluir');
end;

procedure TPrincipal.btIncluirEmpregadoClick(Sender: TObject);
begin
  ExibirTela('Empregado', 'Incluir');
end;

procedure TPrincipal.ExcluirDepartamento;
var
  oDepartamentoController: TDepartamentoController;
  Erro: string;
begin
  oDepartamentoController := TDepartamentoController.Create;

  try
    if (ModGeral.qryPesquisarDepartamento.Active) and (ModGeral.qryPesquisarDepartamento.RecordCount > 0) then
    begin
      if MessageDlg('Deseja excluir o registro?', mtInformation, [mbYes, mbNo], 0) = IDYes then
      begin
        if not oDepartamentoController.Excluir(ModGeral.qryPesquisarDepartamentoid_departamento.AsInteger, Erro) then
          raise Exception.Create(Erro);

        ModGeral.RefreshDepartamento;
      end;
    end;
  finally
    FreeAndNil(oDepartamentoController);
  end;
end;

procedure TPrincipal.ExcluirEmpregado;
var
  oEmpregadoController: TEmpregadoController;
  Erro: string;
begin
  oEmpregadoController := TEmpregadoController.Create;

  try
    if (ModGeral.qryPesquisarEmpregado.Active) and (ModGeral.qryPesquisarEmpregado.RecordCount > 0) then
    begin
      if MessageDlg('Deseja excluir o registro?', mtInformation, [mbYes, mbNo], 0) = IDYes then
      begin
        if not oEmpregadoController.Excluir(ModGeral.qryPesquisarEmpregadoid_Empregado.AsInteger, Erro) then
          raise Exception.Create(Erro);

        ModGeral.RefreshEmpregado;
      end;
    end;
  finally
    FreeAndNil(oEmpregadoController);
  end;

end;

procedure TPrincipal.ExibirTela(Tipo, Movimento: string);
begin
  if Tipo = 'Departamento' then
  begin
    ViewDepartamento := TViewDepartamento.Create(Self);

    if Movimento = 'Incluir' then
      ViewDepartamento.Movimento(Movimento, 0)
    else
      ViewDepartamento.Movimento(Movimento, ModGeral.qryPesquisarDepartamentoid_departamento.AsInteger);

    ViewDepartamento.ShowModal;
    ViewDepartamento.Free;

    ModGeral.RefreshDepartamento;
  end;

  if Tipo = 'Empregado' then
  begin
    ViewEmpregado := TViewEmpregado.Create(Self);

    if Movimento = 'Incluir' then
      ViewEmpregado.Movimento(Movimento, 0)
    else
      ViewEmpregado.Movimento(Movimento, ModGeral.qryPesquisarEmpregadoid_empregado.AsInteger);

    ViewEmpregado.ShowModal;
    ViewEmpregado.Free;

    ModGeral.RefreshEmpregado;
  end;
end;

procedure TPrincipal.FormShow(Sender: TObject);
begin
  ModGeral.RefreshDepartamento;
  ModGeral.RefreshEmpregado;
end;

end.
