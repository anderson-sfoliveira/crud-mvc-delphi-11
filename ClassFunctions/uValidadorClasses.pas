unit uValidadorClasses;

interface

uses
   System.SysUtils, System.Rtti, System.Variants, System.TypInfo, Vcl.Dialogs;

type
   TValidadorClasses = class(TCustomAttribute)
      private
         FDescricao: string;
      public
         constructor Create(const Descricao : string);
         property Descricao : string read FDescricao;

         class function ValidarPropriedades(Objeto: TObject): WideString;
      end;

implementation

constructor TValidadorClasses.Create(const Descricao: string);
begin
   FDescricao := Descricao;
end;

class function TValidadorClasses.ValidarPropriedades(Objeto: TObject): WideString;
var
   Contexto: TRttiContext;
   Tipo: TRttiType;
   Propriedade: TRttiProperty;
   Atributo: TCustomAttribute;
   widAlerta: WideString;
   valor: Variant;
begin
   Contexto := TRttiContext.Create;
   try
      Tipo := Contexto.GetType(Objeto.ClassInfo);
      widAlerta := '';

      for Propriedade in Tipo.GetProperties do
      begin
         for Atributo in Propriedade.GetAttributes do
         begin
            if Atributo is TValidadorClasses then
            begin
               valor := Propriedade.GetValue(Objeto).AsVariant;

               if not (VarToStr(valor) <> EmptyStr) and (VarToStr(valor) <> '0') then
               begin
                  if widAlerta = '' then
                     widAlerta := 'Valor não preenchido:' + #13#10;

                  widAlerta := widAlerta + (Atributo as TValidadorClasses).Descricao + #13#10;

               end;
            end;
         end;
      end;
   finally
      Contexto.Free;
   end;

   Result := widAlerta;
end;

end.
