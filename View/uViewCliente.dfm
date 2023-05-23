object fViewCliente: TfViewCliente
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Clientes'
  ClientHeight = 563
  ClientWidth = 1024
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 13
  object Label7: TLabel
    Left = 419
    Top = 12
    Width = 198
    Height = 23
    Caption = 'Clientes cadastrados'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 200
    Top = 337
    Width = 158
    Height = 19
    Caption = 'Contatos do cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtCliente: TEdit
    Left = 63
    Top = 240
    Width = 250
    Height = 21
    MaxLength = 20
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 41
    Width = 1001
    Height = 193
    DataSource = dsClientes
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
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
        Title.Caption = 'Id'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cliente'
        Title.Caption = 'Cliente'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'razao_social'
        Title.Caption = 'Raz'#227'o Social'
        Width = 350
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cnpj'
        Title.Caption = 'CNPJ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cpf'
        Title.Caption = 'CPF'
        Width = 120
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'dt_nascimento'
        Title.Alignment = taCenter
        Title.Caption = 'Nascimento'
        Width = 70
        Visible = True
      end>
  end
  object btnSalvar: TButton
    Left = 158
    Top = 274
    Width = 121
    Height = 25
    Caption = 'Salvar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = btnSalvarClick
  end
  object edtId: TEdit
    Left = 8
    Top = 240
    Width = 49
    Height = 21
    Enabled = False
    TabOrder = 0
  end
  object btnExcluir: TButton
    Left = 295
    Top = 274
    Width = 105
    Height = 25
    Caption = 'Excluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = btnExcluirClick
  end
  object btnNovo: TButton
    Left = 7
    Top = 274
    Width = 129
    Height = 25
    Caption = 'Novo cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    OnClick = btnNovoClick
  end
  object edtCNPJ: TMaskEdit
    Left = 671
    Top = 240
    Width = 120
    Height = 21
    EditMask = '99.999.999/9999-99'
    MaxLength = 18
    TabOrder = 3
    Text = '  .   .   /    -  '
    OnExit = edtCNPJExit
  end
  object edtCPF: TMaskEdit
    Left = 797
    Top = 240
    Width = 100
    Height = 21
    EditMask = '999.999.999-99'
    MaxLength = 14
    TabOrder = 4
    Text = '   .   .   -  '
    OnExit = edtCPFExit
  end
  object edtNascimento: TMaskEdit
    Left = 903
    Top = 240
    Width = 73
    Height = 21
    EditMask = '99/99/9999'
    MaxLength = 10
    TabOrder = 5
    Text = '  /  /    '
    OnExit = edtNascimentoExit
  end
  object edtRazao: TEdit
    Left = 319
    Top = 240
    Width = 346
    Height = 21
    MaxLength = 60
    TabOrder = 2
  end
  object DBGrid2: TDBGrid
    Left = 8
    Top = 362
    Width = 609
    Height = 193
    DataSource = dsContatos
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    PopupMenu = PopupMenu1
    TabOrder = 10
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id_contato'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Width = 500
        Visible = True
      end>
  end
  object mmTableClientes: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 712
    Top = 64
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
    Left = 800
    Top = 64
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 880
    Top = 424
    object optNovoContato: TMenuItem
      Caption = 'Novo Contato'
      OnClick = optNovoContatoClick
    end
    object optExcluirContato: TMenuItem
      Caption = 'Excluir Contato'
      OnClick = optExcluirContatoClick
    end
  end
  object dsContatos: TDataSource
    DataSet = mmTableContatos
    Left = 880
    Top = 288
  end
  object mmTableContatos: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 880
    Top = 352
    object mmTableContatosid_contato: TIntegerField
      FieldName = 'id_contato'
    end
    object StringField1: TStringField
      DisplayWidth = 20
      FieldName = 'nome'
      Size = 60
    end
  end
end
