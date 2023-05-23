unit uViewContato;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, uControllerContato, uModelCliente,
  uEnumerador;

type
  TfViewContato = class(TForm)
    lblNome: TLabel;
    edtNome: TEdit;
    btnSalvar: TButton;
    procedure btnSalvarClick(Sender: TObject);
  private
    FIdCliente : Integer;
  public
    { Public declarations }
    property IdCliente : Integer read FIdCliente write FIdCliente;

  end;

var
  fViewContato: TfViewContato;

implementation

{$R *.dfm}

procedure TfViewContato.btnSalvarClick(Sender: TObject);
var
   controllerContato: TControllerContato;
begin
   controllerContato := TControllerContato.Create;

   try
      controllerContato.ContatoModel.acao      := uEnumerador.tipoInclusao;
      controllerContato.ContatoModel.IdCliente := FIdCliente;
      controllerContato.ContatoModel.Nome      := edtNome.Text;

      if controllerContato.persistir then
      begin
         ShowMessage('Contato salvo com sucesso!');
         close;
      end
      else
         begin
            if controllerContato.ContatoModel.widAlerta = '' then
               ShowMessage('Erro ao salvar o contato.')
            else
               begin
                  ShowMessage(controllerContato.ContatoModel.widAlerta);
               end;
         end;

   finally
      FreeAndNil(controllerContato);
   end;
end;

end.
