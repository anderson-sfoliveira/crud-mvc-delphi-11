object frmCadastroCliente: TfrmCadastroCliente
  Left = 0
  Top = 0
  Caption = 'Cadastro de Clientes'
  ClientHeight = 550
  ClientWidth = 724
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 13
  object Label2: TLabel
    Left = 79
    Top = 38
    Width = 33
    Height = 13
    Caption = 'Cliente'
  end
  object Label1: TLabel
    Left = 99
    Top = 8
    Width = 10
    Height = 13
    Caption = 'Id'
  end
  object Label4: TLabel
    Left = 54
    Top = 65
    Width = 60
    Height = 13
    Caption = 'Raz'#227'o Social'
  end
  object Label5: TLabel
    Left = 87
    Top = 92
    Width = 25
    Height = 13
    Caption = 'CNPJ'
  end
  object Label3: TLabel
    Left = 93
    Top = 124
    Width = 19
    Height = 13
    Caption = 'CPF'
  end
  object Label6: TLabel
    Left = 19
    Top = 143
    Width = 96
    Height = 13
    Caption = 'Data de Nascimento'
  end
  object edtCliente: TEdit
    Left = 120
    Top = 35
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 210
    Width = 545
    Height = 193
    DataSource = dsClientes
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyUp = DBGrid1KeyUp
    OnMouseUp = DBGrid1MouseUp
    Columns = <
      item
        Expanded = False
        FieldName = 'id_cliente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cliente'
        Visible = True
      end>
  end
  object btnSalvar: TButton
    Left = 134
    Top = 174
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 7
    OnClick = btnSalvarClick
  end
  object edtId: TEdit
    Left = 120
    Top = 8
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 0
  end
  object btnExcluir: TButton
    Left = 296
    Top = 174
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 8
    OnClick = btnExcluirClick
  end
  object btnNovo: TButton
    Left = 53
    Top = 174
    Width = 75
    Height = 25
    Caption = 'Novo'
    TabOrder = 9
    OnClick = btnNovoClick
  end
  object edtCNPJ: TMaskEdit
    Left = 120
    Top = 89
    Width = 120
    Height = 21
    EditMask = '99.999.999/9999-99'
    MaxLength = 18
    TabOrder = 3
    Text = '  .   .   /    -  '
  end
  object edtCPF: TMaskEdit
    Left = 120
    Top = 116
    Width = 120
    Height = 21
    EditMask = '999.999.999-99'
    MaxLength = 14
    TabOrder = 4
    Text = '   .   .   -  '
  end
  object edtNascimento: TMaskEdit
    Left = 120
    Top = 143
    Width = 120
    Height = 21
    EditMask = '99/99/9999'
    MaxLength = 10
    TabOrder = 5
    Text = '  /  /    '
  end
  object edtRazao: TEdit
    Left = 120
    Top = 62
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object mmTableClientes: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 440
    Top = 16
    object mmTableClientesid_cliente: TIntegerField
      FieldName = 'id_cliente'
    end
    object mmTableClientescliente: TStringField
      FieldName = 'cliente'
    end
    object mmTableClientesrazao_social: TStringField
      FieldName = 'razao_social'
    end
    object mmTableClientescnpj: TStringField
      FieldName = 'cnpj'
    end
    object mmTableClientescpf: TStringField
      FieldName = 'cpf'
    end
    object mmTableClientesdt_nascimento: TDateField
      FieldName = 'dt_nascimento'
    end
  end
  object dsClientes: TDataSource
    DataSet = mmTableClientes
    Left = 528
    Top = 16
  end
end
