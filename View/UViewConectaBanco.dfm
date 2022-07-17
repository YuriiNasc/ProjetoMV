object ViewConectaBanco: TViewConectaBanco
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Conecta Servidor'
  ClientHeight = 189
  ClientWidth = 210
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 210
    Height = 145
    Align = alTop
    TabOrder = 0
    object lbServidor: TLabel
      Left = 19
      Top = 90
      Width = 44
      Height = 13
      Alignment = taRightJustify
      Caption = 'Servidor:'
    end
    object lbSenha: TLabel
      Left = 29
      Top = 63
      Width = 34
      Height = 13
      Alignment = taRightJustify
      Caption = 'Senha:'
    end
    object lbUsuario: TLabel
      Left = 23
      Top = 36
      Width = 40
      Height = 13
      Alignment = taRightJustify
      Caption = 'Usu'#225'rio:'
    end
    object lbPorta: TLabel
      Left = 33
      Top = 117
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Porta:'
    end
    object lbDatabase: TLabel
      Left = 13
      Top = 9
      Width = 50
      Height = 13
      Alignment = taRightJustify
      Caption = 'Database:'
    end
    object edDatabase: TEdit
      Left = 73
      Top = 6
      Width = 121
      Height = 21
      MaxLength = 50
      TabOrder = 0
      Text = 'db_mv'
    end
    object edUsuario: TEdit
      Left = 73
      Top = 33
      Width = 121
      Height = 21
      MaxLength = 50
      TabOrder = 1
      Text = 'postgres'
    end
    object edSenha: TEdit
      Left = 73
      Top = 60
      Width = 121
      Height = 21
      MaxLength = 50
      PasswordChar = '#'
      TabOrder = 2
      TextHint = 'informe a senha'
    end
  end
  object pnRodape: TPanel
    Left = 0
    Top = 150
    Width = 210
    Height = 39
    Align = alBottom
    TabOrder = 1
    object btConfirmar: TSpeedButton
      Left = 22
      Top = 3
      Width = 93
      Height = 33
      Caption = 'Confirmar'
      OnClick = btConfirmarClick
    end
    object btCancelar: TSpeedButton
      Left = 114
      Top = 3
      Width = 93
      Height = 33
      Caption = 'Cancelar'
      OnClick = btCancelarClick
    end
  end
  object edServidor: TEdit
    Left = 73
    Top = 87
    Width = 121
    Height = 21
    MaxLength = 50
    TabOrder = 2
    TextHint = 'Se for local deixe vazio'
  end
  object edPorta: TEdit
    Left = 73
    Top = 114
    Width = 121
    Height = 21
    MaxLength = 50
    TabOrder = 3
    TextHint = 'Porta - N'#227'o obrigat'#243'rio'
  end
end
