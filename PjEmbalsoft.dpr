program PjEmbalsoft;

uses
  Vcl.Forms,
  uMenu in 'View\uMenu.pas' {fMenu},
  uControllerConexao in 'Controller\uControllerConexao.pas',
  uDAOConexao in 'DAO\uDAOConexao.pas',
  uModelCliente in 'Model\uModelCliente.pas',
  uEnumerador in 'Model\uEnumerador.pas',
  uDAOCliente in 'DAO\uDAOCliente.pas',
  uControllerCliente in 'Controller\uControllerCliente.pas',
  uViewCliente in 'View\uViewCliente.pas' {fViewCliente},
  uModelContato in 'Model\uModelContato.pas',
  uDAOContato in 'DAO\uDAOContato.pas',
  uControllerContato in 'Controller\uControllerContato.pas',
  uViewContato in 'View\uViewContato.pas' {fViewContato},
  uValidador in 'ClassFunctions\uValidador.pas',
  uValidadorClasses in 'ClassFunctions\uValidadorClasses.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMenu, fMenu);
  Application.Run;
end.
