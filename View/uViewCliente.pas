unit uViewCliente;

interface

uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
   System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
   Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, uControllerCliente, uEnumerador,
   Vcl.Mask, Vcl.Menus, uControllerContato, uValidador, Data.DB,
   FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
   FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
   FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
   TfViewCliente = class(TForm)
      edtCliente: TEdit;
      mmTableClientes: TFDMemTable;
      DBGrid1: TDBGrid;
      dsClientes: TDataSource;
      btnSalvar: TButton;
      edtId: TEdit;
      btnExcluir: TButton;
      btnNovo: TButton;
      edtCNPJ: TMaskEdit;
      edtCPF: TMaskEdit;
      edtNascimento: TMaskEdit;
      edtRazao: TEdit;
      mmTableClientesid_cliente: TIntegerField;
      mmTableClientesrazao_social: TStringField;
      mmTableClientescliente: TStringField;
      mmTableClientescnpj: TStringField;
      mmTableClientescpf: TStringField;
      mmTableClientesdt_nascimento: TDateField;
    PopupMenu1: TPopupMenu;
    optNovoContato: TMenuItem;
    optExcluirContato: TMenuItem;
    dsContatos: TDataSource;
    mmTableContatos: TFDMemTable;
    StringField1: TStringField;
    DBGrid2: TDBGrid;
    mmTableContatosid_contato: TIntegerField;
    Label7: TLabel;
    Label8: TLabel;
      procedure FormShow(Sender: TObject);
      procedure btnExcluirClick(Sender: TObject);
      procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
        Shift: TShiftState);
      procedure DBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
        Shift: TShiftState; X, Y: Integer);
      procedure btnNovoClick(Sender: TObject);
      procedure btnSalvarClick(Sender: TObject);
    procedure optNovoContatoClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure optExcluirContatoClick(Sender: TObject);
    procedure edtCPFExit(Sender: TObject);
    procedure edtCNPJExit(Sender: TObject);
    procedure edtNascimentoExit(Sender: TObject);
   private
      procedure incluir;
      procedure alterar;
      procedure CarregarClientes;
      procedure CarregarContatos;
      procedure CarregarEdits;
      procedure CarregarIdGerado;

      function FormatarCNPJ(const CNPJ: string): string;
      function FormatarCPF(const CPF: string): string;
   end;

var
   fViewCliente: TfViewCliente;

implementation

{$R *.dfm}

uses uViewContato;

{ TfViewCliente }

procedure TfViewCliente.btnSalvarClick(Sender: TObject);
begin
   edtCNPJExit(Self);
   edtCNPJExit(Self);
   edtNascimentoExit(Self);

   if edtId.Text = '' then
      incluir
   else
      alterar;
end;

procedure TfViewCliente.incluir;
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
      begin
         ShowMessage('Incluído com sucesso.');
         Self.CarregarClientes();
         Self.CarregarIdGerado;
         Self.CarregarContatos;
      end
      else
         begin
            if controllerCliente.ClienteModel.widAlerta = '' then
               ShowMessage('Não foi possível realizar essa operação.')
            else
               begin
                  ShowMessage(controllerCliente.ClienteModel.widAlerta);
               end;
         end;

   finally
      FreeAndNil(controllerCliente);
   end;


end;

procedure TfViewCliente.alterar;
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
      begin
         ShowMessage('Alterado com sucesso.');
         Self.CarregarClientes();
      end
      else
         begin
            if controllerCliente.ClienteModel.widAlerta = '' then
               ShowMessage('Não foi possível realizar essa operação.')
            else
               begin
                  ShowMessage(controllerCliente.ClienteModel.widAlerta);
               end;
         end;
   finally
      FreeAndNil(controllerCliente);
   end;


end;

procedure TfViewCliente.optExcluirContatoClick(Sender: TObject);
var
   controllerContato: TControllerContato;
begin
   controllerContato := TControllerContato.Create;

   try
      if edtId.Text <> '' then
      begin
         if (Application.MessageBox(PChar('Deseja excluir o registro?'),
           'Confirmação', MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION) = mrYes)
         then
         begin
            controllerContato.ContatoModel.acao := uEnumerador.tipoExclusao;
            controllerContato.ContatoModel.IdContato := mmTableContatos.Fields[0].AsInteger;

            if controllerContato.persistir() then
               ShowMessage('Excluído com sucesso.');

            Self.CarregarContatos;
         end;
      end;
   finally
      FreeAndNil(controllerContato);
   end;
end;

procedure TfViewCliente.optNovoContatoClick(Sender: TObject);
begin
  Application.CreateForm(TfViewContato, fViewContato);
  try
     fViewContato.IdCliente := strtoint(edtId.Text);

    fViewContato.ShowModal;
  finally
    fViewContato.Release;
  end;

  Self.CarregarContatos;
end;

procedure TfViewCliente.PopupMenu1Popup(Sender: TObject);
begin
   optNovoContato.Enabled    := false;
   optExcluirContato.Enabled := false;

   if edtId.Text <> ''                then optNovoContato.Enabled    := true;
   if mmTableContatos.RecordCount > 0 then optExcluirContato.Enabled := true;
end;

procedure TfViewCliente.btnExcluirClick(Sender: TObject);
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

procedure TfViewCliente.btnNovoClick(Sender: TObject);
begin
   edtId.Clear;
   edtCliente.Clear;
   edtRazao.Clear;
   edtCNPJ.Clear;
   edtCPF.Clear;
   edtNascimento.Clear;
   edtCliente.SetFocus();
end;

procedure TfViewCliente.CarregarClientes;
var
   controllerCliente: TControllerCliente;
   qCliente: TFDQuery;
begin
   qCliente := TFDQuery.Create(fViewCliente);
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

procedure TfViewCliente.CarregarContatos;
var
   controllerContato: TControllerContato;
   vQuery: TFDQuery;
begin
   vQuery := TFDQuery.Create(fViewCliente);
   controllerContato := TControllerContato.Create;

   try
      controllerContato.ContatoModel.idCliente := StrToInt(edtId.Text);
      vQuery := controllerContato.selecionar;

      try
         vQuery.FetchAll;
         mmTableContatos.Close;
         mmTableContatos.Data := vQuery.Data;
      finally
         vQuery.Close;
         FreeAndNil(vQuery);
      end;

   finally
      FreeAndNil(controllerContato);
   end;
end;

procedure TfViewCliente.CarregarEdits;
begin
   edtId.Text := mmTableClientes.Fields[0].AsString;
   edtCliente.Text := mmTableClientes.Fields[1].AsString;
   edtRazao.Text := mmTableClientes.Fields[2].AsString;
   edtCNPJ.Text := FormatarCNPJ(mmTableClientes.Fields[3].AsString);
   edtCPF.Text := FormatarCPF(mmTableClientes.Fields[4].AsString);
   edtNascimento.Text := DateToStr(mmTableClientes.Fields[5].AsDateTime);
end;

function TfViewCliente.FormatarCNPJ(const CNPJ: string): string;
begin
   Result := Copy(CNPJ, 1, 2) + '.' + Copy(CNPJ, 3, 3) + '.' + Copy(CNPJ, 6, 3)
     + '/' + Copy(CNPJ, 9, 4) + '-' + Copy(CNPJ, 13, 2);
end;

function TfViewCliente.FormatarCPF(const CPF: string): string;
begin
   Result := Copy(CPF, 1, 3) + '.' + Copy(CPF, 4, 3) + '.' + Copy(CPF, 7, 3) +
     '-' + Copy(CPF, 10, 2);
end;

procedure TfViewCliente.CarregarIdGerado;
begin
   mmTableClientes.Last;
   edtId.Text := mmTableClientes.Fields[0].AsString;
end;

procedure TfViewCliente.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   Self.CarregarEdits();
   Self.CarregarContatos;
end;

procedure TfViewCliente.DBGrid1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   Self.CarregarEdits();
   Self.CarregarContatos;
end;

procedure TfViewCliente.edtCNPJExit(Sender: TObject);
begin
   if (edtCNPJ.Text <> '  .   .   /    -  ') then
   begin
     if not TValidador.ValidarCNPJ(edtCNPJ.Text) then
     begin
       ShowMessage('CNPJ inválido');
       abort;
     end;
   end;
end;

procedure TfViewCliente.edtCPFExit(Sender: TObject);
begin
   if (edtCPF.Text <> '   .   .   -  ') then
   begin
     if not TValidador.ValidarCPF(edtCPF.Text) then
     begin
       ShowMessage('CPF inválido');
       abort;
     end;
   end;
end;

procedure TfViewCliente.edtNascimentoExit(Sender: TObject);
begin
   if (edtNascimento.Text <> '  /  /    ') then
   begin
     if not TValidador.ValidarData(edtNascimento.Text) then
     begin
       ShowMessage('Data inválida');
       abort;
     end;
   end;
end;

procedure TfViewCliente.FormShow(Sender: TObject);
begin
   Self.CarregarClientes();

   if mmTableClientes.RecordCount > 0 then
   begin
      Self.CarregarEdits();
      Self.CarregarContatos;
   end;
end;

end.
