unit uControllerContato;

interface

uses
   uModelContato, System.SysUtils, FireDAC.Comp.Client, uDAOContato;

type
   TControllerContato = class
   private
      FContatoModel: TModelContato;

   public
      property ContatoModel: TModelContato read FContatoModel
        write FContatoModel;

      constructor Create;
      destructor Destroy; override;

      function Persistir: Boolean;
      function Selecionar: TFDQuery;
   end;

implementation

{ TControllerContato }

constructor TControllerContato.Create;
begin
   FContatoModel := TModelContato.Create;
end;

destructor TControllerContato.Destroy;
begin
   FreeAndNil(FContatoModel);
   inherited;
end;

function TControllerContato.Persistir: Boolean;
begin
   Result := FContatoModel.Persistir;
end;

function TControllerContato.Selecionar: TFDQuery;
begin
   Result := FContatoModel.Selecionar;
end;

end.
