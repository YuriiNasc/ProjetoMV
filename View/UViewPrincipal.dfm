object Principal: TPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Projeto MV'
  ClientHeight = 390
  ClientWidth = 801
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
    Width = 801
    Height = 390
    Align = alClient
    ParentBackground = False
    TabOrder = 0
    object gbDepartamento: TGroupBox
      Left = 12
      Top = 11
      Width = 773
      Height = 179
      Caption = 'DEPARTAMENTO '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object GradeDepartamento: TDBGrid
        Left = 74
        Top = 28
        Width = 687
        Height = 127
        DataSource = dsDepartamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'id_departamento'
            Title.Caption = 'C'#211'DIGO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nm_departamento'
            Title.Caption = 'DEPARTAMENTO'
            Width = 320
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'local'
            Title.Caption = 'LOCAL'
            Width = 257
            Visible = True
          end>
      end
      object btExcluiItem: TBitBtn
        Tag = 2
        Left = 12
        Top = 112
        Width = 53
        Height = 42
        Cursor = crHandPoint
        Caption = 'Excluir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Glyph.Data = {
          E6000000424DE60000000000000076000000280000000E0000000E0000000100
          0400000000007000000000000000000000001000000000000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3300333333333333330033333333333333003333333333333300333333333333
          330033333333333333003300000000003300330FFFFFFFF03300330000000000
          3300333333333333330033333333333333003333333333333300333333333333
          33003333333333333300}
        Layout = blGlyphTop
        ParentFont = False
        TabOrder = 1
        OnClick = btExcluiItemClick
      end
      object btAlterarItem: TBitBtn
        Tag = 1
        Left = 12
        Top = 70
        Width = 53
        Height = 42
        Cursor = crHandPoint
        Caption = 'Alterar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Glyph.Data = {
          E6000000424DE60000000000000076000000280000000E0000000E0000000100
          0400000000007000000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33003333333333333300300000000333330000B7B7B7B03333000B0B7B7B7B03
          33000BB0B7B7B7B033000FBB0000000033000BFB0B0B0B0333000FBFBFBFB003
          33000BFBFBF00033330030BFBF03333333003800008333333300333333333333
          33003333333333333300}
        Layout = blGlyphTop
        ParentFont = False
        TabOrder = 2
        OnClick = btAlterarItemClick
      end
      object btIncluir: TBitBtn
        Left = 12
        Top = 28
        Width = 53
        Height = 42
        Cursor = crHandPoint
        Caption = 'Incluir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Glyph.Data = {
          E6000000424DE60000000000000076000000280000000E0000000E0000000100
          0400000000007000000000000000000000001000000000000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3300333333333333330033333333333333003333300033333300333330F03333
          3300333330F033333300330000F000033300330FFFFFFF033300330000F00003
          3300333330F033333300333330F0333333003333300033333300333333333333
          33003333333333333300}
        Layout = blGlyphTop
        ParentFont = False
        TabOrder = 3
        OnClick = btIncluirClick
      end
    end
    object gbEmpregado: TGroupBox
      Left = 12
      Top = 196
      Width = 773
      Height = 179
      Caption = ' EMPREGADO '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object GradeEmpregado: TDBGrid
        Left = 74
        Top = 28
        Width = 687
        Height = 127
        DataSource = dsEmpregado
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'id_empregado'
            Title.Caption = 'C'#211'DIGO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nm_empregado'
            Title.Caption = 'EMPREGADO'
            Width = 292
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nm_departamento'
            Title.Caption = 'DEPARTAMENTO'
            Width = 230
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'data_admissao'
            Title.Alignment = taCenter
            Title.Caption = 'ADMISS'#195'O'
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'salario'
            Title.Alignment = taRightJustify
            Title.Caption = 'SALARIO'
            Width = 106
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'comissao'
            Title.Alignment = taRightJustify
            Title.Caption = 'COMISS'#195'O'
            Width = 104
            Visible = True
          end>
      end
      object btExcluirEmpregado: TBitBtn
        Left = 12
        Top = 112
        Width = 53
        Height = 42
        Cursor = crHandPoint
        Caption = 'Excluir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Glyph.Data = {
          E6000000424DE60000000000000076000000280000000E0000000E0000000100
          0400000000007000000000000000000000001000000000000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3300333333333333330033333333333333003333333333333300333333333333
          330033333333333333003300000000003300330FFFFFFFF03300330000000000
          3300333333333333330033333333333333003333333333333300333333333333
          33003333333333333300}
        Layout = blGlyphTop
        ParentFont = False
        TabOrder = 1
        OnClick = btExcluirEmpregadoClick
      end
      object btAlterarEmpregado: TBitBtn
        Left = 12
        Top = 70
        Width = 53
        Height = 42
        Cursor = crHandPoint
        Caption = 'Alterar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Glyph.Data = {
          E6000000424DE60000000000000076000000280000000E0000000E0000000100
          0400000000007000000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33003333333333333300300000000333330000B7B7B7B03333000B0B7B7B7B03
          33000BB0B7B7B7B033000FBB0000000033000BFB0B0B0B0333000FBFBFBFB003
          33000BFBFBF00033330030BFBF03333333003800008333333300333333333333
          33003333333333333300}
        Layout = blGlyphTop
        ParentFont = False
        TabOrder = 2
        OnClick = btAlterarEmpregadoClick
      end
      object btIncluirEmpregado: TBitBtn
        Left = 12
        Top = 28
        Width = 53
        Height = 42
        Cursor = crHandPoint
        Caption = 'Incluir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Glyph.Data = {
          E6000000424DE60000000000000076000000280000000E0000000E0000000100
          0400000000007000000000000000000000001000000000000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3300333333333333330033333333333333003333300033333300333330F03333
          3300333330F033333300330000F000033300330FFFFFFF033300330000F00003
          3300333330F033333300333330F0333333003333300033333300333333333333
          33003333333333333300}
        Layout = blGlyphTop
        ParentFont = False
        TabOrder = 3
        OnClick = btIncluirEmpregadoClick
      end
    end
  end
  object dsEmpregado: TDataSource
    DataSet = ModGeral.qryPesquisarEmpregado
    Left = 723
    Top = 294
  end
  object dsDepartamento: TDataSource
    DataSet = ModGeral.qryPesquisarDepartamento
    Left = 716
    Top = 115
  end
end
