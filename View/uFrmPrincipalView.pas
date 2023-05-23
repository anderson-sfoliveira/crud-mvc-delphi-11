unit uFrmPrincipalView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uControllerConexao, Vcl.ComCtrls, System.Actions,
  Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, Vcl.ToolWin, Vcl.ActnCtrls, Vcl.ActnMenus;

type
  TfrmPrincipal = class(TForm)
    StatusBar1: TStatusBar;
    ActionManager1: TActionManager;
    Action1: TAction;
    ActionMainMenuBar1: TActionMainMenuBar;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uFrmClienteView;



procedure TfrmPrincipal.Action1Execute(Sender: TObject);
begin
  Application.CreateForm(TfrmCadastroCliente, frmCadastroCliente);
  try
    frmCadastroCliente.ShowModal;
  finally
    frmCadastroCliente.Release;
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  TControllerConexao.GetInstance();
  TControllerConexao.GetInstance().CarregarEmpresa(1);

  StatusBar1.Panels[0].Text := 'Versão: 1.0';

  StatusBar1.Panels[1].Text := 'Empresa: ' + FormatFloat('00', TControllerConexao.GetInstance().ModelEmpresa.Codigo) + ' - ' +
    TControllerConexao.GetInstance().ModelEmpresa.RSocial;
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  TControllerConexao.GetInstance().Destroy();
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

end.
