unit uDAOContato;

interface

uses
  FireDAC.Comp.Client, uDAOConexao, uModelContato, System.SysUtils, uEnumerador;

type
  TDAOContato = class
  public
    function Incluir(modelContato: TModelContato): Boolean;
    function Alterar(modelContato: TModelContato): Boolean;
    function Excluir(modelContato: TModelContato): Boolean;
    function Selecionar: TFDQuery;
  end;

implementation

uses
  uControllerConexao;

function TDAOContato.Incluir(modelContato: TModelContato): Boolean;
var
  VQry: TFDQuery;
begin
  VQry := TControllerConexao.GetInstance().DAOConexao.CriarQuery();
  try
    VQry.ExecSQL(
      'INSERT INTO TbContatos (id_cliente, nome) ' +
      'VALUES (:id_cliente, :nome)',
      [modelContato.IdCliente, modelContato.Nome]
    );

    Result := True;
  finally
    FreeAndNil(VQry);
  end;
end;

function TDAOContato.Alterar(modelContato: TModelContato): Boolean;
var
  VQry: TFDQuery;
begin
  VQry := TControllerConexao.GetInstance().DAOConexao.CriarQuery();
  try
    VQry.ExecSQL(
      'UPDATE TbContatos SET id_cliente = :id_cliente, nome = :nome ' +
      'WHERE id_contato = :id_contato',
      [modelContato.IdCliente, modelContato.Nome, modelContato.IdContato]
    );

    Result := True;
  finally
    FreeAndNil(VQry);
  end;
end;

function TDAOContato.Excluir(modelContato: TModelContato): Boolean;
var
  VQry: TFDQuery;
begin
  VQry := TControllerConexao.GetInstance().DAOConexao.CriarQuery();
  try
    VQry.ExecSQL('DELETE FROM TbContatos WHERE id_contato = :id_contato',
      [modelContato.IdContato]);

    Result := True;
  finally
    FreeAndNil(VQry);
  end;
end;

function TDAOContato.Selecionar: TFDQuery;
var
  VQry: TFDQuery;
begin
  VQry := TControllerConexao.GetInstance().DAOConexao.CriarQuery();
  VQry.Open('SELECT id_contato, id_cliente, nome FROM TbContatos');
  Result := VQry;
end;

end.

