unit uDAOCliente;

interface

uses
   FireDAC.Comp.Client, uDAOConexao, uModelCliente, System.SysUtils;

type
   TDAOCliente = class
      public
         function Incluir(modelCliente: TModelCliente): Boolean;
         function Alterar(modelCliente: TModelCliente): Boolean;
         function Excluir(modelCliente: TModelCliente): Boolean;
         function Selecionar: TFDQuery;
      end;

implementation

{ TDAOCliente }

uses uControllerConexao;

function TDAOCliente.Incluir(modelCliente: TModelCliente): Boolean;
var
   vQuery: TFDQuery;
begin
   vQuery := TControllerConexao.GetInstance().daoConexao.CriarQuery();
   try
      vQuery.ExecSQL
        ('insert into TbClientes (cliente, razao_social, CNPJ, CPF, dt_nascimento) values (:cliente, :razao_social, :CNPJ, :CPF, :dt_nascimento)',
        [modelCliente.cliente, modelCliente.razaoSocial, modelCliente.cnpj, modelCliente.cpf, modelCliente.dtNascimento]);

      Result := True;
   finally
      FreeAndNil(vQuery);
   end;
end;

function TDAOCliente.Alterar(modelCliente: TModelCliente): Boolean;
var
   vQuery: TFDQuery;
begin
   vQuery := TControllerConexao.GetInstance().daoConexao.CriarQuery();
   try
      vQuery.ExecSQL
        ('update TbClientes set cliente = :cliente, razao_social = :razao_social, CNPJ = :CNPJ, CPF = :CPF, dt_nascimento = :dt_nascimento where (id_cliente = :id_cliente)',
        [modelCliente.cliente, modelCliente.razaoSocial, modelCliente.cnpj, modelCliente.cpf, modelCliente.dtNascimento, modelCliente.idCliente]);

      Result := True;
   finally
      FreeAndNil(vQuery);
   end;
end;

function TDAOCliente.Excluir(modelCliente: TModelCliente): Boolean;
var
   vQuery: TFDQuery;
begin
   vQuery := TControllerConexao.GetInstance().daoConexao.CriarQuery();
   try
      vQuery.ExecSQL('delete from TbClientes where (id_cliente = :id_cliente)',
        [modelCliente.idCliente]);

      Result := True;
   finally
      FreeAndNil(vQuery);
   end;
end;

function TDAOCliente.Selecionar: TFDQuery;
var
   vQuery: TFDQuery;
begin
   vQuery := TControllerConexao.GetInstance().daoConexao.CriarQuery();

   vQuery.Open('select id_cliente, cliente, razao_social, CNPJ, CPF, dt_nascimento from TbClientes');

   Result := vQuery;
end;

end.
