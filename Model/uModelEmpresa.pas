unit uModelEmpresa;

interface

uses
  System.SysUtils;

type
  TModelEmpresa = class
  private
    FCodigo: Integer;
    FRSocial: string;

    procedure SetCodigo(const Value: Integer);
    procedure SetRSocial(const Value: string);
  public
    procedure Carregar(ACodigo: Integer);

    property Codigo: Integer read FCodigo write SetCodigo;
    property RSocial: string read FRSocial write SetRSocial;
  end;

implementation

{ TEmpresa }

uses uEmpresaDao;

procedure TModelEmpresa.Carregar;
var
  VEmpresaDao: TEmpresaDao;
begin
  VEmpresaDao := TEmpresaDao.Create;
  try
    VEmpresaDao.carregar(Self, ACodigo);
  finally
    VEmpresaDao.Free;
  end;
end;

procedure TModelEmpresa.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TModelEmpresa.SetRSocial(const Value: string);
begin
  FRSocial := Value;
end;

end.
