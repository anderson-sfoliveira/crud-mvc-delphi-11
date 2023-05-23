unit uControllerCliente;

interface

uses
   uModelCliente, System.SysUtils, FireDAC.Comp.Client, uDAOCliente, uEnumerador;

type
   TControllerCliente = class
   private
      FClienteModel: TModelCliente;

   public
      property ClienteModel: TModelCliente read FClienteModel write FClienteModel;

      constructor Create;
      destructor Destroy; override;

      function persistir: Boolean;
      function selecionar: TFDQuery;
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

function TControllerCliente.persistir: Boolean;
begin
   Result := FClienteModel.persistir;
end;

function TControllerCliente.selecionar: TFDQuery;
begin
   Result := FClienteModel.selecionar;
end;

end.
