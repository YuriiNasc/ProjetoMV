object ModGeral: TModGeral
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 315
  Width = 327
  object DriverLink: TFDPhysPgDriverLink
    VendorHome = 'D:\Projeto MV\Componentes'
    Left = 57
    Top = 9
  end
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=db_mv'
      'User_Name=postgres'
      'Password=24641217'
      'DriverID=PG')
    LoginPrompt = False
    Left = 216
    Top = 10
  end
  object qryPesquisarDepartamento: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'Select * from DEPARTAMENTOS order by id_departamento')
    Left = 57
    Top = 245
    object qryPesquisarDepartamentoid_departamento: TIntegerField
      FieldName = 'id_departamento'
      Origin = 'id_departamento'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryPesquisarDepartamentonm_departamento: TWideStringField
      FieldName = 'nm_departamento'
      Origin = 'nm_departamento'
      Size = 100
    end
    object qryPesquisarDepartamentolocal: TWideStringField
      FieldName = 'local'
      Origin = '"local"'
      Size = 100
    end
  end
  object qryInserirDepartamento: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'Insert into DEPARTAMENTOS'
      'Values(:id_Departamento, :nm_departamento, :local)')
    Left = 57
    Top = 72
    ParamData = <
      item
        Name = 'ID_DEPARTAMENTO'
        ParamType = ptInput
      end
      item
        Name = 'NM_DEPARTAMENTO'
        ParamType = ptInput
      end
      item
        Name = 'LOCAL'
        ParamType = ptInput
      end>
  end
  object qryAlterarDepartamento: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      
        'update Departamentos set  nm_Departamento = :nm_Departamento, Lo' +
        'cal = :local where id_Departamento = :id_Departamento')
    Left = 57
    Top = 128
    ParamData = <
      item
        Name = 'NM_DEPARTAMENTO'
        ParamType = ptInput
      end
      item
        Name = 'LOCAL'
        ParamType = ptInput
      end
      item
        Name = 'ID_DEPARTAMENTO'
        ParamType = ptInput
      end>
  end
  object qryExcluirDepartamento: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      
        'Delete from Departamentos where id_Departamento = :id_Departamen' +
        'to')
    Left = 54
    Top = 184
    ParamData = <
      item
        Name = 'ID_DEPARTAMENTO'
        ParamType = ptInput
      end>
  end
  object qryPesquisarEmpregado: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      
        'Select a.id_Empregado, b.nm_departamento, a.nm_Empregado, a.Data' +
        '_Admissao, a.Salario, a.Comissao '
      ' from Empregados as a'
      
        ' Inner Join Departamentos as b on a.cod_departamento = b.id_depa' +
        'rtamento'
      ' Order by id_Empregado')
    Left = 215
    Top = 242
    object qryPesquisarEmpregadoid_empregado: TIntegerField
      FieldName = 'id_empregado'
      Origin = 'id_empregado'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryPesquisarEmpregadonm_departamento: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'nm_departamento'
      Origin = 'nm_departamento'
      Size = 100
    end
    object qryPesquisarEmpregadonm_empregado: TWideStringField
      FieldName = 'nm_empregado'
      Origin = 'nm_empregado'
      Size = 100
    end
    object qryPesquisarEmpregadodata_admissao: TDateField
      FieldName = 'data_admissao'
      Origin = 'data_admissao'
    end
    object qryPesquisarEmpregadosalario: TFMTBCDField
      FieldName = 'salario'
      Origin = 'salario'
      currency = True
      Precision = 64
      Size = 5
    end
    object qryPesquisarEmpregadocomissao: TFMTBCDField
      FieldName = 'comissao'
      Origin = 'comissao'
      currency = True
      Precision = 64
      Size = 5
    end
  end
  object qryInserirEmpregados: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      
        'Insert into Empregados Values(:ID_Empregado, :Cod_Departamento, ' +
        'DEFAULT, :NM_EMPREGADO, DEFAULT, :DATA_ADMISSAO, :SALARIO, :COMI' +
        'SSAO)')
    Left = 215
    Top = 69
    ParamData = <
      item
        Name = 'ID_EMPREGADO'
        ParamType = ptInput
      end
      item
        Name = 'COD_DEPARTAMENTO'
        ParamType = ptInput
      end
      item
        Name = 'NM_EMPREGADO'
        ParamType = ptInput
      end
      item
        Name = 'DATA_ADMISSAO'
        ParamType = ptInput
      end
      item
        Name = 'SALARIO'
        ParamType = ptInput
      end
      item
        Name = 'COMISSAO'
        ParamType = ptInput
      end>
  end
  object qryAlterarEmpregado: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      
        'Update EMPREGADOS set Cod_Departamento = :Cod_Departamento, nm_E' +
        'mpregado = :nm_Empregado, data_admissao = :data_admissao, salari' +
        'o = :salario, comissao = :comissao where id_empregado = :id_empr' +
        'egado')
    Left = 215
    Top = 125
    ParamData = <
      item
        Name = 'COD_DEPARTAMENTO'
        ParamType = ptInput
      end
      item
        Name = 'NM_EMPREGADO'
        ParamType = ptInput
      end
      item
        Name = 'DATA_ADMISSAO'
        ParamType = ptInput
      end
      item
        Name = 'SALARIO'
        ParamType = ptInput
      end
      item
        Name = 'COMISSAO'
        ParamType = ptInput
      end
      item
        Name = 'ID_EMPREGADO'
        ParamType = ptInput
      end>
  end
  object qryExcluirEmpregado: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'Delete from Empregados where id_empregado = :id_Empregado')
    Left = 212
    Top = 181
    ParamData = <
      item
        Name = 'ID_EMPREGADO'
        ParamType = ptInput
      end>
  end
end
