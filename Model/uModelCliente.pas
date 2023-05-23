unit uModelCliente;

interface

uses
   uEnumerador, SysUtils, FireDAC.Comp.Client, uValidadorClasses;

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
         FwidAlerta    : WideString;

      public
         property idCliente    : Integer     read FIdCliente    write FIdCliente;

         [TValidadorClasses('Nome do cliente')]
         property cliente      : string      read FCliente      write FCliente;

         [TValidadorClasses('Razão social')]
         property razaoSocial  : string      read FRazaoSocial  write FRazaoSocial;
         property cnpj         : string      read FCNPJ         write FCNPJ;
         property cpf          : string      read FCPF          write FCPF;
         property dtNascimento : string      read FDtNascimento write FDtNascimento;
         property acao         : TEnumerador read FAcao         write FAcao;
         property widAlerta    : WideString  read FwidAlerta    write FwidAlerta;

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

   Self.widAlerta := '';

   if Self.acao <> tipoExclusao then
      Self.widAlerta := TValidadorClasses.ValidarPropriedades(self);

   if Self.widAlerta = '' then
   begin
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
