unit uModelContato;

interface

uses
   SysUtils, FireDAC.Comp.Client, uEnumerador, uValidadorClasses;

type
   TModelContato = class
      private
         FAcao      : TEnumerador;
         FIdContato : Integer;
         FIdCliente : Integer;
         FNome      : string;
         FwidAlerta : WideString;

      public
         property IdContato : Integer     read FIdContato write FIdContato;
         property IdCliente : Integer     read FIdCliente write FIdCliente;

         [TValidadorClasses('Nome')]
         property Nome      : string      read FNome      write FNome;
         property acao      : TEnumerador read FAcao      write FAcao;
         property widAlerta : WideString  read FwidAlerta write FwidAlerta;

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

   Self.widAlerta := '';

   if Self.acao <> tipoExclusao then
      Self.widAlerta := TValidadorClasses.ValidarPropriedades(self);

   if Self.widAlerta = '' then
   begin
      daoContato := TDAOContato.Create;

      try
         case Acao of
            tipoInclusao:
               Result := daoContato.Incluir(self);
            tipoExclusao:
               Result := daoContato.Excluir(self);
         end;
         Result := True;
      finally
         FreeAndNil(daoContato);
      end;
   end;
end;

function TModelContato.Selecionar: TFDQuery;
var
   daoContato: TDAOContato;
begin
   daoContato := TDAOContato.Create;
   try
      Result := daoContato.Selecionar(Self);
   finally
      daoContato.Free;
   end;
end;

end.
