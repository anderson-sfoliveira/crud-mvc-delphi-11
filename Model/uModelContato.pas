unit uModelContato;

interface

uses
   SysUtils, FireDAC.Comp.Client, uEnumerador;

type
   TModelContato = class
      private
         FAcao      : TEnumerador;
         FIdContato : Integer;
         FIdCliente : Integer;
         FNome      : string;

      public
         property IdContato : Integer     read FIdContato write FIdContato;
         property IdCliente : Integer     read FIdCliente write FIdCliente;
         property Nome      : string      read FNome      write FNome;
         property acao      : TEnumerador read FAcao      write FAcao;

         function Persistir: Boolean;
         function Selecionar: TFDQuery;
      end;

implementation

uses
   uDAOContato;

function TModelContato.Persistir: Boolean;
var
   daoContato: TDAOContato;
begin
   Result := False;
   daoContato := TDAOContato.Create;
   try
      case Acao of
         tipoInclusao:
            Result := daoContato.Incluir(self);
         tipoAlteracao:
            Result := daoContato.Alterar(self);
         tipoExclusao:
            Result := daoContato.Excluir(self);
      end;
      Result := True;
   finally
      FreeAndNil(daoContato);
   end;
end;

function TModelContato.Selecionar: TFDQuery;
var
   daoContato: TDAOContato;
begin
   daoContato := TDAOContato.Create;
   try
      Result := daoContato.Selecionar;
   finally
      daoContato.Free;
   end;
end;

end.
