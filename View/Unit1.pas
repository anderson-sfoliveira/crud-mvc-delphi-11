unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.DApt;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses uControllerConexao, uFrmClienteView;

procedure TForm1.Button1Click(Sender: TObject);
begin
  TControllerConexao.getInstance().daoConexao.getConexao.Connected := true;

  if TControllerConexao.getInstance().daoConexao.getConexao.Connected then
    ShowMessage('Conectado');
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCadastroCliente, frmCadastroCliente);
  try
    frmCadastroCliente.ShowModal;
  finally
    frmCadastroCliente.Release;
  end;
end;

end.
