object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Projeto MVC com conceitos de OOP.'
  ClientHeight = 377
  ClientWidth = 694
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 358
    Width = 694
    Height = 19
    Panels = <
      item
        Width = 70
      end
      item
        Width = 50
      end>
  end
  object ActionMainMenuBar1: TActionMainMenuBar
    Left = 0
    Top = 0
    Width = 694
    Height = 25
    UseSystemFont = False
    ActionManager = ActionManager1
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
  end
  object ActionManager1: TActionManager
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
    Left = 608
    Top = 104
    StyleName = 'Platform Default'
    object Action1: TAction
      Category = '&Cadastros'
      Caption = '&Cliente'
      OnExecute = Action1Execute
    end
  end
end
