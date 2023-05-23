program PjEmbalsoft;

uses
  Vcl.Forms,
  Unit1 in 'View\Unit1.pas' {Form1},
  uControllerConexao in 'Controller\uControllerConexao.pas',
  uDAOConexao in 'DAO\uDAOConexao.pas',
  uModelCliente in 'Model\uModelCliente.pas',
  uModelEmpresa in 'Model\uModelEmpresa.pas',
  uEnumerador in 'Model\uEnumerador.pas',
  uDAOCliente in 'DAO\uDAOCliente.pas',
  uEmpresaDao in 'DAO\uEmpresaDao.pas',
  uControllerCliente in 'Controller\uControllerCliente.pas',
  uFrmClienteView in 'View\uFrmClienteView.pas' {frmCadastroCliente},
  uFrmPrincipalView in 'View\uFrmPrincipalView.pas' {frmPrincipal},
  uModelContato in 'Model\uModelContato.pas',
  uDAOContato in 'DAO\uDAOContato.pas',
  uControllerContato in 'Controller\uControllerContato.pas',
  uFrmContatos in 'View\uFrmContatos.pas' {frmContatos},
  uValidador in 'ClassFunctions\uValidador.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
