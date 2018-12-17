unit UCadMaquina;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Buttons, Grids, SMDBGrid, UDMCadMaquina,
  DBGrids, ExtCtrls, StdCtrls, DB, RzTabs, DBCtrls, ToolEdit, UCBase, RxLookup, Mask,
  jpeg, NxCollection, CurrEdit;

type
  TfrmCadMaquina = class(TForm)
    RzPageControl1: TRzPageControl;
    TS_Consulta: TRzTabSheet;
    TS_Cadastro: TRzTabSheet;
    SMDBGrid1: TSMDBGrid;
    Panel2: TPanel;
    Panel1: TPanel;
    pnlCadastro: TPanel;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    StaticText1: TStaticText;
    pnlPesquisa: TPanel;
    Label6: TLabel;
    Edit4: TEdit;
    btnInserir: TNxButton;
    btnExcluir: TNxButton;
    btnPesquisar: TNxButton;
    btnConsultar: TNxButton;
    btnAlterar: TNxButton;
    btnCancelar: TNxButton;
    btnConfirmar: TNxButton;
    UCControls1: TUCControls;
    Label1: TLabel;
    DBEdit7: TDBEdit;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure Edit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
    fDMCadMaquina: TDMCadMaquina;

    procedure prc_Inserir_Registro;
    procedure prc_Excluir_Registro;
    procedure prc_Gravar_Registro;
    procedure prc_Consultar;
    procedure prc_Limpar_Edit_Consulta;

    procedure Habilita_Campos;

  public
    { Public declarations }

  end;

var
  frmCadMaquina: TfrmCadMaquina;

implementation

uses DmdDatabase, rsDBUtils, UMenu;

{$R *.dfm}

procedure TfrmCadMaquina.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmCadMaquina.btnExcluirClick(Sender: TObject);
begin
  if fDMCadMaquina.cdsMaquina.IsEmpty then
    exit;

  if MessageDlg('Deseja excluir este registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  prc_Excluir_Registro;
end;

procedure TfrmCadMaquina.prc_Excluir_Registro;
begin
  fDMCadMaquina.prc_Excluir;
end;

procedure TfrmCadMaquina.prc_Gravar_Registro;
begin
  fDMCadMaquina.prc_Gravar;
  if fDMCadMaquina.cdsMaquina.State in [dsEdit,dsInsert] then
  begin
    MessageDlg(fDMCadMaquina.vMsgErro, mtError, [mbOk], 0);
    exit;
  end;
  TS_Consulta.TabEnabled    := not(TS_Consulta.TabEnabled);
  RzPageControl1.ActivePage := TS_Consulta;
  Habilita_Campos;
  {pnlCadastro.Enabled       := not(pnlCadastro.Enabled);
  btnConfirmar.Enabled      := not(btnConfirmar.Enabled);
  btnAlterar.Enabled        := not(btnAlterar.Enabled);}
end;

procedure TfrmCadMaquina.prc_Inserir_Registro;
begin
  fDMCadMaquina.prc_Inserir;

  if fDMCadMaquina.cdsMaquina.State in [dsBrowse] then
    exit;

  RzPageControl1.ActivePage := TS_Cadastro;

  TS_Consulta.TabEnabled := False;
  Habilita_Campos;
  {btnAlterar.Enabled     := False;
  btnConfirmar.Enabled   := True;
  pnlCadastro.Enabled    := True;}
  DBEdit7.SetFocus;
end;

procedure TfrmCadMaquina.FormShow(Sender: TObject);
begin
  fDMCadMaquina := TDMCadMaquina.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMCadMaquina);
end;

procedure TfrmCadMaquina.prc_Consultar;
begin
  fDMCadMaquina.cdsMaquina.Close;
  fDMCadMaquina.sdsMaquina.CommandText := fDMCadMaquina.ctCommand
                                      + ' WHERE 0 = 0 ';
  if Trim(Edit4.Text) <> '' then
    fDMCadMaquina.sdsMaquina.CommandText := fDMCadMaquina.sdsMaquina.CommandText
                                    + ' AND NOME LIKE ' + QuotedStr('%'+Edit4.Text+'%');
  fDMCadMaquina.cdsMaquina.Open;
end;

procedure TfrmCadMaquina.btnConsultarClick(Sender: TObject);
begin
  prc_Consultar;
end;

procedure TfrmCadMaquina.btnCancelarClick(Sender: TObject);
begin
  if (fDMCadMaquina.cdsMaquina.State in [dsBrowse]) or not(fDMCadMaquina.cdsMaquina.Active) then
  begin
    RzPageControl1.ActivePage := TS_Consulta;
    exit;
  end;

  if MessageDlg('Deseja cancelar alteração/inclusão do registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  fDMCadMaquina.cdsMaquina.CancelUpdates;
  TS_Consulta.TabEnabled    := True;
  RzPageControl1.ActivePage := TS_Consulta;
  Habilita_Campos;
  {pnlCadastro.Enabled       := not(pnlCadastro.Enabled);
  btnConfirmar.Enabled      := not(btnConfirmar.Enabled);
  btnAlterar.Enabled        := not(btnAlterar.Enabled);}
end;

procedure TfrmCadMaquina.SMDBGrid1DblClick(Sender: TObject);
begin
  RzPageControl1.ActivePage := TS_Cadastro;
end;

procedure TfrmCadMaquina.btnAlterarClick(Sender: TObject);
begin
  if (fDMCadMaquina.cdsMaquina.IsEmpty) or not(fDMCadMaquina.cdsMaquina.Active) or (fDMCadMaquina.cdsMaquinaID.AsInteger < 1) then
    exit;

  fDMCadMaquina.cdsMaquina.Edit;

  TS_Consulta.TabEnabled := False;
  Habilita_Campos;

  {btnAlterar.Enabled     := False;
  btnConfirmar.Enabled   := True;
  pnlCadastro.Enabled    := True;}
end;

procedure TfrmCadMaquina.btnConfirmarClick(Sender: TObject);
begin
  prc_Gravar_Registro;
end;

procedure TfrmCadMaquina.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fDMCadMaquina);
end;

procedure TfrmCadMaquina.btnInserirClick(Sender: TObject);
begin
  prc_Inserir_Registro;
end;

procedure TfrmCadMaquina.Edit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    btnConsultarClick(Sender);
end;

procedure TfrmCadMaquina.btnPesquisarClick(Sender: TObject);
begin
  pnlPesquisa.Visible := not(pnlPesquisa.Visible);
  if pnlPesquisa.Visible then
    Edit4.SetFocus
  else
    prc_Limpar_Edit_Consulta;
end;

procedure TfrmCadMaquina.prc_Limpar_Edit_Consulta;
begin
  Edit4.Clear;
end;

procedure TfrmCadMaquina.Habilita_Campos;
begin
  pnlCadastro.Enabled := not(pnlCadastro.Enabled);
  
  btnAlterar.Enabled   := not(btnAlterar.Enabled);
  btnConfirmar.Enabled := not(btnConfirmar.Enabled);
end;

end.
