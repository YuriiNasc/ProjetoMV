object ViewDepartamento: TViewDepartamento
  Left = 69
  Top = 77
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro de Departamento'
  ClientHeight = 125
  ClientWidth = 534
  Color = clWhite
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
    Width = 534
    Height = 89
    Align = alTop
    ParentBackground = False
    TabOrder = 0
    object lbCodigo: TLabel
      Left = 26
      Top = 9
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'digo:'
    end
    object lbDescricao: TLabel
      Left = 13
      Top = 35
      Width = 50
      Height = 13
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o:'
    end
    object lbLocal: TLabel
      Left = 35
      Top = 62
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Local:'
    end
    object edCodigo: TEdit
      Left = 73
      Top = 6
      Width = 121
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object edDescricao: TEdit
      Left = 73
      Top = 32
      Width = 458
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 1
      OnKeyDown = edDescricaoKeyDown
    end
    object edLocal: TEdit
      Left = 73
      Top = 59
      Width = 458
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 2
      OnKeyDown = edDescricaoKeyDown
    end
  end
  object pnRodape: TPanel
    Left = 0
    Top = 91
    Width = 534
    Height = 34
    Align = alBottom
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 95
    object btCancelar: TSpeedButton
      Left = 439
      Top = 1
      Width = 93
      Height = 33
      Caption = 'Cancelar'
      OnClick = btCancelarClick
    end
    object btConfirmar: TSpeedButton
      Left = 352
      Top = 1
      Width = 93
      Height = 33
      Caption = 'Confirmar'
      OnClick = btConfirmarClick
    end
  end
end
