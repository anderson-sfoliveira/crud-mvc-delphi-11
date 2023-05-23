program PjEmbalsoft;

uses
  Vcl.Forms,
  Unit1 in 'View\Unit1.pas' {Form1},
  uControllerConexão in 'Controller\uControllerConexão.pas',
  uDAOConexao in 'DAO\uDAOConexao.pas',
  uModelCliente in 'Model\uModelCliente.pas',
  uModelEmpresa in 'Model\uModelEmpresa.pas',
  uEnumerador in 'Model\uEnumerador.pas',
  uDAOCliente in 'DAO\uDAOCliente.pas',
  uEmpresaDao in 'DAO\uEmpresaDao.pas',
  uControllerCliente in 'Controller\uControllerCliente.pas',
  uFrmClienteView in 'View\uFrmClienteView.pas' {frmCadastroCliente},
  uFrmPrincipalView in 'View\uFrmPrincipalView.pas' {frmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
