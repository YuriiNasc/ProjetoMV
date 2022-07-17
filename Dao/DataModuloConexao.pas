{----------------------------------------------------------------------}
//     Projeto:    Projeto MV
//     Unit:       DataModuloConexao
//     Criado por: yuri.borges
//     Data:       16/07/2022 18:41:19
//     Versão:     1.0.0.0
{----------------------------------------------------------------------}
unit DataModuloConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Phys.PGDef, FireDAC.Stan.Intf,
  FireDAC.Phys, FireDAC.Phys.PG, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, ModelDepartamento, ModelEmpregado;

type
  TStatusConexao = class
    private
    FConexaoLoginPrompt: Boolean;
    FConexaoPort: string;
    FConexaoDatabase: string;
    FConexaoPassWord: string;
    FConexaUserName: string;
    FConexaoServer: string;
    procedure SetConexaoDatabase(const Value: string);
    procedure SetConexaoLoginPrompt(const Value: Boolean);
    procedure SetConexaoPassWord(const Value: string);
    procedure SetConexaoPort(const Value: string);
    procedure SetConexaoServer(const Value: string);
    procedure SetConexaUserName(const Value: string);
    public
    property ConexaoLoginPrompt: Boolean read FConexaoLoginPrompt write SetConexaoLoginPrompt;
    property ConexaoDatabase: string read FConexaoDatabase write SetConexaoDatabase;
    property ConexaUserName: string read FConexaUserName write SetConexaUserName;
    property ConexaoPassWord: string read FConexaoPassWord write SetConexaoPassWord;
    property ConexaoServer: string read FConexaoServer write SetConexaoServer;
    property ConexaoPort: string read FConexaoPort write SetConexaoPort;
  end;

type
  TModGeral = class(TDataModule)
    DriverLink: TFDPhysPgDriverLink;
    Conexao: TFDConnection;
    qryPesquisarDepartamento: TFDQuery;
    qryPesquisarDepartamentoid_departamento: TIntegerField;
    qryPesquisarDepartamentonm_departamento: TWideStringField;
    qryPesquisarDepartamentolocal: TWideStringField;
    qryInserirDepartamento: TFDQuery;
    qryAlterarDepartamento: TFDQuery;
    qryExcluirDepartamento: TFDQuery;
    qryPesquisarEmpregado: TFDQuery;
    qryInserirEmpregados: TFDQuery;
    qryAlterarEmpregado: TFDQuery;
    qryExcluirEmpregado: TFDQuery;
    qryPesquisarEmpregadoid_empregado: TIntegerField;
    qryPesquisarEmpregadonm_departamento: TWideStringField;
    qryPesquisarEmpregadonm_empregado: TWideStringField;
    qryPesquisarEmpregadodata_admissao: TDateField;
    qryPesquisarEmpregadosalario: TFMTBCDField;
    qryPesquisarEmpregadocomissao: TFMTBCDField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    //Métodos de conexão
    function VerificaConexaoServidor(oStatusConexao: TStatusConexao;  out Erro: string): Boolean;

    //Métodos Form Principal
    procedure RefreshDepartamento;
    procedure RefreshEmpregado;

    //Métodos Gerais
    function gerarID(Tipo: string): integer;

    //Métodos Departamento
    procedure CarregarDepartamento(oDepartamento: TDepartamento; ID: Integer);
    function IncluirDepartamento(oDepartamento: TDepartamento; out Erro: string): Boolean;
    function AlterarDepartamento(oDepartamento: TDepartamento; out Erro: string): Boolean;
    function ExcluirDepartamento(Id: integer; out Erro: string): Boolean;

    //Métodos Empregado
    procedure CarregarEmpregado(oEmpregado: TEmpregado; ID: Integer);
    function IncluirEmpregado(oEmpregado: TEmpregado; out Erro: string): Boolean;
    function AlterarEmpregado(oEmpregado: TEmpregado; out Erro: string): Boolean;
    function ExcluirEmpregado(Id: integer; out Erro: string): Boolean;
    { Public declarations }
  end;

var
  ModGeral: TModGeral;

implementation

uses
  UviewConectaBanco;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TModGeral }

function TModGeral.AlterarDepartamento(oDepartamento: TDepartamento;
  out Erro: string): Boolean;
begin
  with qryAlterarDepartamento, oDepartamento do
  begin
    Params[0].AsString := DepartamentoDescricao;
    Params[1].AsString := DepartamentoLocal;
    Params[2].AsInteger := DepartamentoId;
    Try
      ExecSQL();
      Result := True;
    Except on E:Exception do
      begin
        Erro := 'Erro ao alterar o departamento.' + e.Message;
        Result := False;
      end;
    end;
  end;
end;

function TModGeral.AlterarEmpregado(oEmpregado: TEmpregado;
  out Erro: string): Boolean;
begin
  with qryAlterarEmpregado, oEmpregado do
  begin
    Params[0].AsInteger := EmpregadoCodigoDepartamento;
    Params[1].AsString := EmpregadoNome;
    Params[2].AsDate := StrToDate(EmpregadoDataAdmissao);
    Params[3].AsFloat := EmpregadoSalario;
    Params[4].AsFloat := EmpregadoComissao;
    Params[5].AsInteger := EmpregadoID;
    Try
      ExecSQL();
      Result := True;
    Except on E:Exception do
      begin
        Erro := 'Erro ao alterar o Empregado.' + e.Message;
        Result := False;
      end;
    end;
  end;
end;

procedure TModGeral.CarregarDepartamento(oDepartamento: TDepartamento;
  ID: Integer);
var
  qry: TFDQuery;
begin
  qry := TFDQuery.Create(nil);
  try
    with qry do
    begin
      Connection := ModGeral.Conexao;
      SQL.Text := 'Select * from DEPARTAMENTOS Where id_Departamento = ' + IntToStr(ID);
      Open;

      with oDepartamento do
      begin
        DepartamentoID := FieldByName('id_Departamento').AsInteger;
        DepartamentoDescricao := FieldByName('nm_departamento').AsString;
        DepartamentoLocal := FieldByName('local').AsString;
      end;
    end;
  finally
    FreeAndNil(qry);
  end;
end;

procedure TModGeral.CarregarEmpregado(oEmpregado: TEmpregado; ID: Integer);
var
  qry: TFDQuery;
begin
  qry := TFDQuery.Create(nil);
  try
    with qry do
    begin
      Connection := ModGeral.Conexao;
      SQL.Text := 'Select * from Empregados Where id_Empregado = ' + IntToStr(ID);
      Open;

      with oEmpregado do
      begin
        EmpregadoID := FieldByName('ID_Empregado').AsInteger;
        EmpregadoCodigoDepartamento := FieldByName('cod_Departamento').AsInteger;
        EmpregadoNome := FieldByName('nm_Empregado').AsString;
        EmpregadoDataAdmissao := FormatDateTime('DD/MM/YYYY', FieldByName('Data_Admissao').AsDateTime);
        EmpregadoSalario := FieldByName('Salario').AsFloat;
        EmpregadoComissao := FieldByName('Comissao').AsFloat;
      end;
    end;
  finally
    FreeAndNil(qry);
  end;
end;

procedure TModGeral.DataModuleCreate(Sender: TObject);
begin
  ViewConectaBanco := TViewConectaBanco.Create(Self);
  ViewConectaBanco.ShowModal;
  ViewConectaBanco.Free;
end;

function TModGeral.ExcluirDepartamento(Id: integer; out Erro: string): Boolean;
begin
  with qryExcluirDepartamento do
  begin
    Params[0].AsInteger := ID;
    Try
      ExecSQL();
      Result := True;
    Except on E:Exception do
      begin
        Erro := 'Erro ao excluir o Departamento.' + e.Message;
        Result := False;
      end;
    end;
  end;
end;

function TModGeral.ExcluirEmpregado(Id: integer; out Erro: string): Boolean;
begin
  with qryExcluirEmpregado do
  begin
    Params[0].AsInteger := ID;
    Try
      ExecSQL();
      Result := True;
    Except on E:Exception do
      begin
        Erro := 'Erro ao excluir o empregado.' + e.Message;
        Result := False;
      end;
    end;
  end;
end;

function TModGeral.GerarID(Tipo: string): integer;
var
  BuscaID: TFDQuery;
begin
  BuscaID := TFDQuery.Create(nil);
  try
    var Query: string;

    if Tipo = 'Departamento' then
      query := 'Select Max(id_Departamento + 1) as ID from DEPARTAMENTOS'
    else
      query := 'Select max(id_empregado + 1) as ID from EMPREGADOS';

    with BuscaID do
    begin
      Connection := ModGeral.Conexao;
      SQL.Text := Query;
      Open;
      Result := FieldByName('id').AsInteger;
    end;
  finally
    FreeAndNil(BuscaID);
  end;

end;

function TModGeral.IncluirDepartamento(oDepartamento: TDepartamento;
  out Erro: string): Boolean;
begin
  with qryInserirDepartamento, oDepartamento do
  begin
    Params[0].AsInteger := gerarID('Departamento');
    Params[1].AsString := DepartamentoDescricao;
    Params[2].AsString := DepartamentoLocal;

    Params[2].Value := DefaultFields;
    Try
      ExecSQL();
      Result := True;
    Except on E:Exception do
      begin
        Erro := 'Erro ao inserir o departamento.' + e.Message;
        Result := False;
      end;
    end;
  end;
end;

function TModGeral.IncluirEmpregado(oEmpregado: TEmpregado;
  out Erro: string): Boolean;
begin
  with qryInserirEmpregados, oEmpregado do
  begin
    Params[0].AsInteger := gerarID('Empregado');
    Params[1].AsInteger := EmpregadoCodigoDepartamento;
    Params[2].AsString := EmpregadoNome;
    Params[3].AsDate := StrToDate(EmpregadoDataAdmissao);
    Params[4].AsFloat := EmpregadoSalario;
    Params[5].AsFloat := EmpregadoComissao;

    Try
      ExecSQL();
      Result := True;
    Except on E:Exception do
      begin
        Erro := 'Erro ao inserir o empregado.' + e.Message;
        Result := False;
      end;
    end;
  end;
end;

procedure TModGeral.RefreshDepartamento;
begin
  qryPesquisarDepartamento.Close;
  qryPesquisarDepartamento.Open;
end;

procedure TModGeral.RefreshEmpregado;
begin
  qryPesquisarEmpregado.Close;
  qryPesquisarEmpregado.Open;
end;

{ TStatusConexao }

procedure TStatusConexao.SetConexaoDatabase(const Value: string);
begin
  FConexaoDatabase := Value;
end;

procedure TStatusConexao.SetConexaoLoginPrompt(const Value: Boolean);
begin
  FConexaoLoginPrompt := Value;
end;

procedure TStatusConexao.SetConexaoPassWord(const Value: string);
begin
  FConexaoPassWord := Value;
end;

procedure TStatusConexao.SetConexaoPort(const Value: string);
begin
  FConexaoPort := Value;
end;

procedure TStatusConexao.SetConexaoServer(const Value: string);
begin
  FConexaoServer := Value;
end;

procedure TStatusConexao.SetConexaUserName(const Value: string);
begin
  FConexaUserName := Value;
end;

function TModGeral.VerificaConexaoServidor(oStatusConexao: TStatusConexao;  out Erro: string): Boolean;
begin
  Result := True;

  with Conexao, oStatusConexao do
  begin
    LoginPrompt := ConexaoLoginPrompt;
    Params.Values['Server'] := ConexaoServer;
    Params.Values['Database'] := ConexaoDatabase;
    Params.Values['User_Name'] := ConexaUserName;
    Params.Values['Password'] := ConexaoPassWord;
    Params.Values['Port'] := ConexaoPort;

    Try
      Connected := True;
    Except on E:Exception do
      begin
        Erro := 'Erro na comunicação com o banco. Verifique os parâmetros de conexão e tente novamente.';
        Result := False;
      end;
    end;
  end;
end;

end.
