unit uDAOConexao;

interface

uses FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, SysUtils;

Type
  TDAOConexao = class
      private
         FConexao : TFDConnection;
         SQLiteDriverLink: TFDPhysSQLITEDriverLink;
         DriverLink: TFDPhysDriverLink;

      public
         function getConexao : TFDConnection;
         function criarQuery : TFDQuery;

         constructor Create;
         destructor Destroy; Override;
  end;

implementation

{ TDAOConexao }

constructor TDAOConexao.Create;
begin
   inherited Create;

   SQLiteDriverLink := TFDPhysSQLITEDriverLink.Create(nil);
   DriverLink := SQLiteDriverLink;

   FConexao := TFDConnection.Create(nil);
   FConexao.DriverName := 'SQLite';
   FConexao.Params.Add('Database=D:\Anderson Oliveira\Documents\workspace - embalsoft\db\BDCANDITADO.db');
   // Configurar outros parâmetros opcionais, se necessário
   FConexao.Params.Add('OpenMode=OpenOrCreate');
   FConexao.Params.Add('LockingMode=Normal');
   FConexao.Params.Add('Synchronous=Full');
   FConexao.Params.Add('JournalMode=Auto');
   FConexao.LoginPrompt := false;


//SQLiteDriverLink.Free;
//DriverLink.Free;
end;

function TDAOConexao.criarQuery: TFDQuery;
var
   Query : TFDQuery;
begin
   Query            := TFDQuery.Create(nil);
   Query.Connection := FConexao;

   result := Query;
end;

destructor TDAOConexao.Destroy;
begin
   inherited;

   FreeAndNil(FConexao);
   FreeAndNil(SQLiteDriverLink);
   FreeAndNil(DriverLink);
end;

function TDAOConexao.getConexao: TFDConnection;
begin
   Result := FConexao;
end;

end.
