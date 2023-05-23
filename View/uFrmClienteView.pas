unit uFrmClienteView;

interface

uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
   System.Classes, Vcl.Graphics,
   Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
   FireDAC.Stan.Option, FireDAC.Stan.Param,
   FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
   Data.DB, Vcl.Grids, Vcl.DBGrids,
   FireDAC.Comp.DataSet, FireDAC.Comp.Client, uControllerCliente, uEnumerador,
   Vcl.Mask;

type
   TfrmCadastroCliente = class(TForm)
      edtCliente: TEdit;
      Label2: TLabel;
      mmTableClientes: TFDMemTable;
      DBGrid1: TDBGrid;
      dsClientes: TDataSource;
      btnSalvar: TButton;
      Label1: TLabel;
      edtId: TEdit;
      btnExcluir: TButton;
      btnNovo: TButton;
      Label4: TLabel;
      Label5: TLabel;
      edtCNPJ: TMaskEdit;
      edtCPF: TMaskEdit;
      edtNascimento: TMaskEdit;
      edtRazao: TEdit;
      Label3: TLabel;
      Label6: TLabel;
      mmTableClientesid_cliente: TIntegerField;
      mmTableClientesrazao_social: TStringField;
      mmTableClientescliente: TStringField;
      mmTableClientescnpj: TStringField;
      mmTableClientescpf: TStringField;
      mmTableClientesdt_nascimento: TDateField;
      procedure FormShow(Sender: TObject);
      procedure btnExcluirClick(Sender: TObject);
      procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
        Shift: TShiftState);
      procedure DBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
        Shift: TShiftState; X, Y: Integer);
      procedure btnNovoClick(Sender: TObject);
      procedure btnSalvarClick(Sender: TObject);
   private
      procedure incluir;
      procedure alterar;
      procedure CarregarClientes;
      procedure CarregarEdits;
      procedure CarregarIdGerado;

      function FormatarCNPJ(const CNPJ: string): string;
      function FormatarCPF(const CPF: string): string;
   end;

var
   frmCadastroCliente: TfrmCadastroCliente;

implementation

{$R *.dfm}
{ TfrmCadastroCliente }

procedure TfrmCadastroCliente.btnSalvarClick(Sender: TObject);
begin
   if edtId.Text = '' then
      incluir
   else
      alterar;
end;

procedure TfrmCadastroCliente.incluir;
var
   controllerCliente: TControllerCliente;
   CNPJ: string;
   CPF: string;
begin
   controllerCliente := TControllerCliente.Create;

   CNPJ := edtCNPJ.Text;
   CNPJ := StringReplace(CNPJ, '.', '', [rfReplaceAll]);
   CNPJ := StringReplace(CNPJ, '-', '', [rfReplaceAll]);
   CNPJ := StringReplace(CNPJ, '/', '', [rfReplaceAll]);

   CPF := edtCPF.Text;
   CPF := StringReplace(CPF, '.', '', [rfReplaceAll]);
   CPF := StringReplace(CPF, '-', '', [rfReplaceAll]);

   try
      controllerCliente.ClienteModel.acao := uEnumerador.tipoInclusao;
      controllerCliente.ClienteModel.cliente := edtCliente.Text;
      controllerCliente.ClienteModel.razaoSocial := edtRazao.Text;
      controllerCliente.ClienteModel.CNPJ := CNPJ;
      controllerCliente.ClienteModel.CPF := CPF;
      controllerCliente.ClienteModel.dtNascimento := edtNascimento.Text;

      if controllerCliente.persistir then
         ShowMessage('Incluído com sucesso.')
      else
         ShowMessage('Não foi possível realizar essa operação.');
   finally
      FreeAndNil(controllerCliente);
   end;

   Self.CarregarClientes();
   CarregarIdGerado;
end;

procedure TfrmCadastroCliente.alterar;
var
   controllerCliente: TControllerCliente;
   CNPJ: string;
   CPF: string;
begin
   controllerCliente := TControllerCliente.Create;

   CNPJ := edtCNPJ.Text;
   CNPJ := StringReplace(CNPJ, '.', '', [rfReplaceAll]);
   CNPJ := StringReplace(CNPJ, '-', '', [rfReplaceAll]);
   CNPJ := StringReplace(CNPJ, '/', '', [rfReplaceAll]);

   CPF := edtCPF.Text;
   CPF := StringReplace(CPF, '.', '', [rfReplaceAll]);
   CPF := StringReplace(CPF, '-', '', [rfReplaceAll]);

   try
      controllerCliente.ClienteModel.acao := uEnumerador.tipoAlteracao;
      controllerCliente.ClienteModel.idCliente := StrToInt(edtId.Text);
      controllerCliente.ClienteModel.cliente := edtCliente.Text;
      controllerCliente.ClienteModel.razaoSocial := edtRazao.Text;
      controllerCliente.ClienteModel.CNPJ := CNPJ;
      controllerCliente.ClienteModel.CPF := CPF;
      controllerCliente.ClienteModel.dtNascimento := edtNascimento.Text;

      if controllerCliente.persistir then
         ShowMessage('Alterado com sucesso.')
      else
         ShowMessage('Não foi possível realizar essa operação.');
   finally
      FreeAndNil(controllerCliente);
   end;

   Self.CarregarClientes();
end;

procedure TfrmCadastroCliente.btnExcluirClick(Sender: TObject);
var
   controllerCliente: TControllerCliente;
begin
   controllerCliente := TControllerCliente.Create;

   try
      if edtId.Text <> '' then
      begin
         if (Application.MessageBox(PChar('Deseja excluir o registro?'),
           'Confirmação', MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION) = mrYes)
         then
         begin
            controllerCliente.ClienteModel.acao := uEnumerador.tipoExclusao;
            controllerCliente.ClienteModel.idCliente := StrToInt(edtId.Text);

            if controllerCliente.persistir() then
               ShowMessage('Excluído com sucesso.');

            Self.CarregarClientes();
            btnNovoClick(Self);
         end;
      end;
   finally
      FreeAndNil(controllerCliente);
   end;
end;

procedure TfrmCadastroCliente.btnNovoClick(Sender: TObject);
begin
   edtId.Clear;
   edtCliente.Clear;
   edtRazao.Clear;
   edtCNPJ.Clear;
   edtCPF.Clear;
   edtNascimento.Clear;
   edtCliente.SetFocus();
end;

procedure TfrmCadastroCliente.CarregarClientes;
var
   controllerCliente: TControllerCliente;
   qCliente: TFDQuery;
begin
   qCliente := TFDQuery.Create(nil);
   controllerCliente := TControllerCliente.Create;

   try
      qCliente := controllerCliente.selecionar;

      try
         qCliente.FetchAll;
         mmTableClientes.Close;
         mmTableClientes.Data := qCliente.Data;
      finally
         qCliente.Close;
         FreeAndNil(qCliente);
      end;

   finally
      FreeAndNil(controllerCliente);
   end;
end;

procedure TfrmCadastroCliente.CarregarEdits;
begin
   edtId.Text := mmTableClientes.Fields[0].AsString;
   edtCliente.Text := mmTableClientes.Fields[1].AsString;
   edtRazao.Text := mmTableClientes.Fields[2].AsString;
   edtCNPJ.Text := FormatarCNPJ(mmTableClientes.Fields[3].AsString);
   edtCPF.Text := FormatarCPF(mmTableClientes.Fields[4].AsString);
   edtNascimento.Text := DateToStr(mmTableClientes.Fields[5].AsDateTime);
end;

function TfrmCadastroCliente.FormatarCNPJ(const CNPJ: string): string;
begin
   Result := Copy(CNPJ, 1, 2) + '.' + Copy(CNPJ, 3, 3) + '.' + Copy(CNPJ, 6, 3)
     + '/' + Copy(CNPJ, 9, 4) + '-' + Copy(CNPJ, 13, 2);
end;

function TfrmCadastroCliente.FormatarCPF(const CPF: string): string;
begin
   Result := Copy(CPF, 1, 3) + '.' + Copy(CPF, 4, 3) + '.' + Copy(CPF, 7, 3) +
     '-' + Copy(CPF, 10, 2);
end;

procedure TfrmCadastroCliente.CarregarIdGerado;
begin
   mmTableClientes.Last;
   edtId.Text := mmTableClientes.Fields[0].AsString;
end;

procedure TfrmCadastroCliente.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   Self.CarregarEdits();
end;

procedure TfrmCadastroCliente.DBGrid1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   Self.CarregarEdits();
end;

procedure TfrmCadastroCliente.FormShow(Sender: TObject);
begin
   Self.CarregarClientes();

   if mmTableClientes.RecordCount > 0 then
   begin
      Self.CarregarEdits();
   end;
end;

end.
