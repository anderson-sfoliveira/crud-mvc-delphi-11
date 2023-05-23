unit uControllerCliente;

interface

uses
   uModelCliente, System.SysUtils, FireDAC.Comp.Client, uDAOCliente;

type
   TControllerCliente = class
   private
      FClienteModel: TModelCliente;

   public
      property ClienteModel: TModelCliente read FClienteModel write FClienteModel;

      constructor Create;
      destructor Destroy; override;

      function Persistir: Boolean;
      function Selecionar: TFDQuery;
   end;

implementation

{ TControllerCliente }

constructor TControllerCliente.Create;
begin
   FClienteModel := TModelCliente.Create;
end;

destructor TControllerCliente.Destroy;
begin
   FreeAndNil(FClienteModel);
   inherited;
end;

function TControllerCliente.Persistir: Boolean;
begin
   Result := FClienteModel.Persistir;
end;

function TControllerCliente.Selecionar: TFDQuery;
begin
   Result := FClienteModel.Selecionar;
end;

end.
