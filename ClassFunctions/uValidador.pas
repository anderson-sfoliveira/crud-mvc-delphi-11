unit uValidador;

interface

uses SysUtils;

type
   TValidador = class
      public
         class function ValidarCPF(const CPF: string): Boolean; static;
         class function RemoverFormatacaoCPF(const CPF: string): string; static;
         class function ValidarCNPJ(const CNPJ: string): Boolean; static;
         class function ValidarData(const Data: string): Boolean; static;
      end;

implementation

class function TValidador.ValidarCPF(const CPF: string): Boolean;
var
  Soma, Resto, Digito: Integer;
  i: Integer;
begin
  Result := False;
  const newCPF = RemoverFormatacaoCPF(CPF);

  if Length(newCPF) <> 11 then
    Exit;

  Soma := 0;
  for i := 1 to 9 do
    Soma := Soma + StrToInt(newCPF[i]) * (11 - i);

  Resto := (Soma * 10) mod 11;
  if (Resto = 10) or (Resto = StrToInt(newCPF[10])) then
  begin
    Soma := 0;
    for i := 1 to 10 do
      Soma := Soma + StrToInt(newCPF[i]) * (12 - i);

    Resto := (Soma * 10) mod 11;
    if (Resto = 10) or (Resto = StrToInt(newCPF[11])) then
      Result := True;
  end;
end;

class function TValidador.RemoverFormatacaoCPF(const CPF: string): string;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(CPF) do
  begin
    if CPF[i] in ['0'..'9'] then
      Result := Result + CPF[i];
  end;
end;

class function TValidador.ValidarCNPJ(const CNPJ: string): Boolean;
var
  CPJSemDigitoVerificador: string;
  Soma, Resto, DigitoVerificador1, DigitoVerificador2: Integer;
begin
  Result := False;

  // Verifica se a string possui 14 dígitos
  if Length(CNPJ) <> 14 then
    Exit;

  CPJSemDigitoVerificador := Copy(CNPJ, 1, 12); // Obtém apenas os 12 primeiros dígitos do CNPJ

  // Calcula o primeiro dígito verificador
  Soma := 0;
  for DigitoVerificador1 := 1 to 12 do
    Soma := Soma + StrToInt(CPJSemDigitoVerificador[DigitoVerificador1]) * (6 + (5 - DigitoVerificador1) mod 6);
  Resto := Soma mod 11;
  if (Resto = 0) or (Resto = 1) then
    DigitoVerificador1 := 0
  else
    DigitoVerificador1 := 11 - Resto;

  // Calcula o segundo dígito verificador
  Soma := 0;
  CPJSemDigitoVerificador := CPJSemDigitoVerificador + IntToStr(DigitoVerificador1); // Adiciona o primeiro dígito verificador ao CNPJ sem dígito verificador
  for DigitoVerificador2 := 1 to 13 do
    Soma := Soma + StrToInt(CPJSemDigitoVerificador[DigitoVerificador2]) * (7 + (6 - DigitoVerificador2) mod 6);
  Resto := Soma mod 11;
  if (Resto = 0) or (Resto = 1) then
    DigitoVerificador2 := 0
  else
    DigitoVerificador2 := 11 - Resto;

  if (StrToInt(CNPJ[13]) = DigitoVerificador1) and (StrToInt(CNPJ[14]) = DigitoVerificador2) then
    Result := True;
end;

class function TValidador.ValidarData(const Data: string): Boolean;
var
  DataConvertida: TDateTime;
begin
  Result := TryStrToDate(Data, DataConvertida);
end;

end.
