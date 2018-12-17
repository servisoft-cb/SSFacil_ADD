program SSFacil_ADD;

uses
  Forms,
  UMenu in 'UMenu.pas' {fMenu},
  DmdDatabase in '..\ssfacil\DmdDatabase.pas' {dmDatabase: TDataModule},
  rsDBUtils in '..\rslib\nova\rsDBUtils.pas',
  LogProvider in '..\logs\src\LogProvider.pas',
  LogTypes in '..\logs\src\LogTypes.pas',
  uNFeComandos in '..\ssfacil\uNFeComandos.pas',
  uNFeConsts in '..\NFe 3.10\NFESrv\uNFeConsts.pas',
  uUtilPadrao in '..\ssfacil\uUtilPadrao.pas',
  UEscolhe_Filial in '..\ssfacil\UEscolhe_Filial.pas' {frmEscolhe_Filial},
  UBaixaTalaoPed in 'UBaixaTalaoPed.pas' {frmBaixaTalaoPed},
  UDMCadPedido in '..\ssfacil\UDMCadPedido.pas' {DMCadPedido: TDataModule},
  uCalculo_Pedido in '..\ssfacil\uCalculo_Pedido.pas',
  UDMEstoque in '..\ssfacil\UDMEstoque.pas' {DMEstoque: TDataModule},
  UDMAprovacao_Ped in '..\ssfacil\UDMAprovacao_Ped.pas' {DMAprovacao_Ped: TDataModule},
  ApiDirectcall in '..\ssfacil\DirectCall\ApiDirectcall.pas',
  UDMConsTalaoPed in 'UDMConsTalaoPed.pas' {DMConsTalaoPed: TDataModule},
  UConsTalaoPed in 'UConsTalaoPed.pas' {frmConsTalaoPed},
  UConsPedido_Real in 'UConsPedido_Real.pas' {frmConsPedido_Real},
  UDMBaixa_TalaoPed in 'UDMBaixa_TalaoPed.pas' {DMBaixa_TalaoPed: TDataModule},
  UDMCadMaquina in '..\ssfacil\pcp\UDMCadMaquina.pas' {DMCadMaquina: TDataModule},
  UCadMaquina in 'UCadMaquina.pas' {frmCadMaquina};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Controle de Pedidos / Talões';
  Application.CreateForm(TdmDatabase, dmDatabase);
  Application.CreateForm(TfMenu, fMenu);
  Application.Run;
end.
