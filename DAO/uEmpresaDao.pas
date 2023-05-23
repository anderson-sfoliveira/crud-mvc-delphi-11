unit uEmpresaDao;

interface

uses
  uModelEmpresa, FireDAC.Comp.Client, uControllerConexao, System.SysUtils;

type
  TEmpresaDao = class
  public
    procedure carregar(AModelEmpresa: TModelEmpresa; ACodigo: Integer);
  end;

implementation

{ TEmpresaDao }

procedure TEmpresaDao.carregar(AModelEmpresa: TModelEmpresa; ACodigo: Integer);
var
  VQuery: TFDQuery;
begin
  VQuery := TControllerConexao.GetInstance().daoConexao.CriarQuery;
  try
    VQuery.Open('select codigo, rsocial from empresa where codigo = :codigo ', [ACodigo]);
    try
      AModelEmpresa.Codigo := VQuery.Fields[0].AsInteger;
      AModelEmpresa.RSocial := VQuery.Fields[1].AsString;
    finally
      VQuery.Close;
    end;
  finally
    VQuery.Free;
  end;
end;

end.
