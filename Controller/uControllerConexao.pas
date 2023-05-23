unit uControllerConexao;

interface

uses SysUtils, uDAOConexao, uModelEmpresa;

Type
   TControllerConexao = class
   private
      FConexao: TDAOConexao;
      FModelEmpresa: TModelEmpresa;

      constructor Create;
      destructor Destroy; Override;
   public
      property daoConexao: TDAOConexao read FConexao write FConexao;
      property ModelEmpresa: TModelEmpresa read FModelEmpresa write FModelEmpresa;

      procedure CarregarEmpresa(ACodigoEmpresa: Integer);
      class function getInstance: TControllerConexao;
   end;

implementation

var
   instanciaBD: TControllerConexao;

   { TControllerConexao }

procedure TControllerConexao.CarregarEmpresa(ACodigoEmpresa: Integer);
begin
   ModelEmpresa.Carregar(ACodigoEmpresa);
end;

constructor TControllerConexao.Create;
begin
   inherited Create;

   FConexao := TDAOConexao.Create;
end;

destructor TControllerConexao.Destroy;
begin
   inherited;

   FreeAndNil(FConexao);
end;

class function TControllerConexao.getInstance: TControllerConexao;
begin
   if instanciaBD = nil then
      instanciaBD := TControllerConexao.Create;

   Result := instanciaBD;
end;

initialization

instanciaBD := nil;

finalization

if instanciaBD <> nil then
   instanciaBD.Free;

end.
