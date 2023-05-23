object fMenu: TfMenu
  Left = 0
  Top = 0
  Caption = 'Embalsoft'
  ClientHeight = 600
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object ActionMainMenuBar1: TActionMainMenuBar
    Left = 0
    Top = 0
    Width = 800
    Height = 25
    UseSystemFont = False
    ActionManager = ActionManager2
    Caption = 'ActionMainMenuBar1'
    Color = clMenuBar
    ColorMap.DisabledFontColor = 7171437
    ColorMap.HighlightColor = clWhite
    ColorMap.BtnSelectedFont = clBlack
    ColorMap.UnusedColor = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Spacing = 0
    ExplicitLeft = -66
    ExplicitWidth = 694
  end
  object ActionManager2: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Items = <
              item
                Action = Action1
              end>
            Caption = '&Cadastros'
          end>
        ActionBar = ActionMainMenuBar1
      end>
    Left = 472
    Top = 104
    StyleName = 'Platform Default'
    object Action1: TAction
      Category = '&Cadastros'
      Caption = '&Cliente'
      OnExecute = Action1Execute
    end
  end
end
