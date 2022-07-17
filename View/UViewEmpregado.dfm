object ViewEmpregado: TViewEmpregado
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro Empregado'
  ClientHeight = 159
  ClientWidth = 540
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 540
    Height = 121
    Align = alTop
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 539
    object lbCodigo: TLabel
      Left = 51
      Top = 9
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'digo:'
    end
    object Label1: TLabel
      Left = 57
      Top = 37
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nome:'
    end
    object Label2: TLabel
      Left = 15
      Top = 67
      Width = 73
      Height = 13
      Alignment = taRightJustify
      Caption = 'Departamento:'
    end
    object lbSalario: TLabel
      Left = 52
      Top = 94
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Salario:'
    end
    object lbComissao: TLabel
      Left = 215
      Top = 94
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'Comiss'#227'o:'
    end
    object lbDataEmissao: TLabel
      Left = 371
      Top = 94
      Width = 89
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data de admiss'#227'o:'
    end
    object edCodigo: TEdit
      Left = 94
      Top = 6
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object edNomeEmpregado: TEdit
      Left = 94
      Top = 34
      Width = 438
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 1
      OnKeyDown = edNomeEmpregadoKeyDown
    end
    object edSalario: TEdit
      Left = 94
      Top = 91
      Width = 75
      Height = 21
      MaxLength = 9
      TabOrder = 2
      OnKeyDown = edNomeEmpregadoKeyDown
      OnKeyPress = edSalarioKeyPress
    end
    object edComissao: TEdit
      Left = 268
      Top = 91
      Width = 75
      Height = 21
      MaxLength = 9
      TabOrder = 3
      OnKeyDown = edNomeEmpregadoKeyDown
    end
    object mskDataAdmissao: TMaskEdit
      Left = 464
      Top = 91
      Width = 68
      Height = 21
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 4
      Text = '  /  /    '
      OnExit = mskDataAdmissaoExit
      OnKeyDown = edNomeEmpregadoKeyDown
    end
    object cbDepartamento: TDBLookupComboBox
      Left = 94
      Top = 63
      Width = 438
      Height = 21
      KeyField = 'id_departamento'
      ListField = 'nm_departamento'
      ListSource = dsDepEmpregado
      TabOrder = 5
    end
  end
  object pnRodape: TPanel
    Left = 0
    Top = 125
    Width = 540
    Height = 34
    Align = alBottom
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 95
    ExplicitWidth = 534
    object btCancelar: TSpeedButton
      Left = 439
      Top = -1
      Width = 93
      Height = 33
      Caption = 'Cancelar'
      OnClick = btCancelarClick
    end
    object btConfirmar: TSpeedButton
      Left = 352
      Top = -1
      Width = 93
      Height = 33
      Caption = 'Confirmar'
      OnClick = btConfirmarClick
    end
  end
  object dsDepEmpregado: TDataSource
    DataSet = ModGeral.qryPesquisarDepartamento
    Left = 496
  end
end
