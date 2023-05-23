unit uDAOContato;

interface

uses
   FireDAC.Comp.Client, uDAOConexao, uModelContato, System.SysUtils;

type
   TDAOContato = class
      public
         function Incluir(modelContato: TModelContato): Boolean;
         function Excluir(modelContato: TModelContato): Boolean;
         function Selecionar(modelContato: TModelContato): TFDQuery;
      end;

implementation

{ TDAOContato }

uses uControllerConexao;

function TDAOContato.Incluir(modelContato: TModelContato): Boolean;
var
   vQuery: TFDQuery;
begin
   vQuery := TControllerConexao.GetInstance().daoConexao.CriarQuery();
   try
      vQuery.ExecSQL('INSERT INTO TbContatos (id_cliente, nome) ' +
        'VALUES (:id_cliente, :nome)', [modelContato.IdCliente,
        modelContato.Nome]);

      Result := True;
   finally
      FreeAndNil(vQuery);
   end;
end;

function TDAOContato.Excluir(modelContato: TModelContato): Boolean;
var
   vQuery: TFDQuery;
begin
   vQuery := TControllerConexao.GetInstance().daoConexao.CriarQuery();
   try
      vQuery.ExecSQL('DELETE FROM TbContatos WHERE id_contato = :id_contato',
        [modelContato.IdContato]);

      Result := True;
   finally
      FreeAndNil(vQuery);
   end;
end;

function TDAOContato.Selecionar(modelContato: TModelContato): TFDQuery;
var
   vQuery: TFDQuery;
begin
   vQuery := TControllerConexao.GetInstance().daoConexao.CriarQuery();
   vQuery.Open('SELECT id_contato, id_cliente, nome FROM TbContatos WHERE id_cliente = :id_cliente',
        [modelContato.IdCliente]);
   Result := vQuery;
end;

end.
