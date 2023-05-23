unit uMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.PlatformDefaultStyleActnCtrls,
  System.Actions, Vcl.ActnList, Vcl.ActnMan, Vcl.ToolWin, Vcl.ActnCtrls,
  Vcl.ActnMenus,FireDAC.DApt
  ;

type
  TfMenu = class(TForm)
    ActionMainMenuBar1: TActionMainMenuBar;
    ActionManager2: TActionManager;
    Action1: TAction;
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMenu: TfMenu;

implementation

{$R *.dfm}

uses uViewCliente;

procedure TfMenu.Action1Execute(Sender: TObject);
begin
  Application.CreateForm(TfViewCliente, fViewCliente);
  try
    fViewCliente.ShowModal;
  finally
    fViewCliente.Release;
  end;
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

end.
