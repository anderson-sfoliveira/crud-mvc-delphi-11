unit uModelCliente;

interface

uses
   uEnumerador, SysUtils, FireDAC.Comp.Client;

type
   TModelCliente = class
      private
         FAcao         : TEnumerador;
         FCNPJ         : string;
         FCliente      : string;
         FCPF          : string;
         FIdCliente    : Integer;
         FDtNascimento : string;
         FRazaoSocial  : string;

      public
         property idCliente    : Integer     read FIdCliente    write FIdCliente;
         property cliente      : string      read FCliente      write FCliente;
         property razaoSocial  : string      read FRazaoSocial  write FRazaoSocial;
         property cnpj         : string      read FCNPJ         write FCNPJ;
         property cpf          : string      read FCPF          write FCPF;
         property dtNascimento : string      read FDtNascimento write FDtNascimento;
         property acao         : TEnumerador read FAcao         write FAcao;

         function persistir: Boolean;
         function selecionar: TFDQuery;
      end;

implementation

uses uDAOCliente;

function TModelCliente.persistir: Boolean;
var
   daoCliente: TDAOCliente;
begin
   Result := False;
   daoCliente := TDAOCliente.Create;
   try
      case Acao of
         tipoInclusao:
            Result := daoCliente.Incluir(self);
         tipoAlteracao:
            Result := daoCliente.Alterar(self);
         tipoExclusao:
            Result := daoCliente.Excluir(self);
      end;
      Result := True;
   finally
      FreeAndNil(daoCliente);
   end;
end;

function TModelCliente.selecionar: TFDQuery;
var
   daoCliente: TDAOCliente;
begin
   daoCliente := TDAOCliente.Create;
   try
      Result := daoCliente.selecionar;
   finally
      FreeAndNil(daoCliente);
   end;
end;

end.
