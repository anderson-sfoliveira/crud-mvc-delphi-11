unit uDAOCliente;

interface

uses
   FireDAC.Comp.Client, uDAOConexao, uModelCliente, System.SysUtils;

type
   TDAOCliente = class
   private

   public
      function Incluir(modelCliente: TModelCliente): Boolean;
      function Alterar(modelCliente: TModelCliente): Boolean;
      function Excluir(modelCliente: TModelCliente): Boolean;
      function selecionar: TFDQuery;
   end;

implementation

{ TDAOCliente }

uses uControllerConexao;

function TDAOCliente.Incluir(modelCliente: TModelCliente): Boolean;
var
   VQry: TFDQuery;
begin
   VQry := TControllerConexao.GetInstance().daoConexao.CriarQuery();
   try
      VQry.ExecSQL
        ('insert into TbClientes (cliente, razao_social, CNPJ, CPF, dt_nascimento) values (:cliente, :razao_social, :CNPJ, :CPF, :dt_nascimento)',
        [modelCliente.cliente, modelCliente.razaoSocial, modelCliente.cnpj, modelCliente.cpf, modelCliente.dtNascimento]);

      Result := True;
   finally
//      VQry.Free;
      FreeAndNil(VQry);
   end;
end;

function TDAOCliente.Alterar(modelCliente: TModelCliente): Boolean;
var
   VQry: TFDQuery;
begin
   VQry := TControllerConexao.GetInstance().daoConexao.CriarQuery();
   try
      VQry.ExecSQL
        ('update TbClientes set cliente = :cliente, razao_social = :razao_social, CNPJ = :CNPJ, CPF = :CPF, dt_nascimento = :dt_nascimento where (id_cliente = :id_cliente)',
        [modelCliente.cliente, modelCliente.razaoSocial, modelCliente.cnpj, modelCliente.cpf, modelCliente.dtNascimento, modelCliente.idCliente]);

      Result := True;
   finally
//      VQry.Free;
      FreeAndNil(VQry);
   end;
end;

function TDAOCliente.Excluir(modelCliente: TModelCliente): Boolean;
var
   VQry: TFDQuery;
begin
   VQry := TControllerConexao.GetInstance().daoConexao.CriarQuery();
   try
      VQry.ExecSQL('delete from TbClientes where (id_cliente = :id_cliente)',
        [modelCliente.idCliente]);

      Result := True;
   finally
//      VQry.Free;
      FreeAndNil(VQry);
   end;
end;

function TDAOCliente.selecionar: TFDQuery;
var
   VQry: TFDQuery;
begin
   VQry := TControllerConexao.GetInstance().daoConexao.CriarQuery();

   VQry.Open('select id_cliente, cliente, razao_social, CNPJ, CPF, dt_nascimento from TbClientes');

   Result := VQry;
end;

end.
