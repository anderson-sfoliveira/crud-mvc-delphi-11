object fViewContato: TfViewContato
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Contato'
  ClientHeight = 61
  ClientWidth = 408
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object lblNome: TLabel
    Left = 16
    Top = 24
    Width = 36
    Height = 15
    Caption = 'Nome:'
  end
  object edtNome: TEdit
    Left = 58
    Top = 21
    Width = 240
    Height = 23
    MaxLength = 60
    TabOrder = 0
  end
  object btnSalvar: TButton
    Left = 317
    Top = 20
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 1
    OnClick = btnSalvarClick
  end
end
