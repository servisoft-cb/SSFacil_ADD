unit UBaixaTalaoPed;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, CurrEdit, ExtCtrls,
  NxCollection, UDMCadPedido, UDMBaixa_TalaoPed, RxLookup;

type
  TfrmBaixaTalaoPed = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Label2: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    CurrencyEdit3: TCurrencyEdit;
    DateEdit1: TDateEdit;
    Panel3: TPanel;
    Memo1: TMemo;
    btnConfirmar: TNxButton;
    btnCancelar: TNxButton;
    Label5: TLabel;
    Label6: TLabel;
    CurrencyEdit4: TCurrencyEdit;
    Label7: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnConfirmarClick(Sender: TObject);
    procedure CurrencyEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DateEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit4Exit(Sender: TObject);
  private
    { Private declarations }
    fDMCadPedido: TDMCadPedido;
    fDMBaixa_TalaoPed: TDMBaixa_TalaoPed;
    vFator_Calculo : Real;

    function fnc_Busca_Item : Boolean;

  public
    { Public declarations }
  end;

var
  frmBaixaTalaoPed: TfrmBaixaTalaoPed;

implementation

uses rsDBUtils, DB, uCalculo_Pedido;

{$R *.dfm}

procedure TfrmBaixaTalaoPed.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(fDMCadPedido);
  FreeAndNil(fDMBaixa_TalaoPed);
  Action := Cafree;
end;

procedure TfrmBaixaTalaoPed.FormShow(Sender: TObject);
begin
  fDMCadPedido := TDMCadPedido.Create(Self);
  fDMBaixa_TalaoPed := TDMBaixa_TalaoPed.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMBaixa_TalaoPed);
  fDMCadPedido.prc_Abrir_cdsCFOP('S');
  fDMCadPedido.prc_Abrir_CSTICMS('S');
  fDMCadPedido.prc_Abrir_cdsCliente('C');
end;

procedure TfrmBaixaTalaoPed.btnCancelarClick(Sender: TObject);
begin
  CurrencyEdit1.SetFocus;
  Panel2.Visible := not(Panel2.Visible);
  Panel3.Visible := not(Panel3.Visible);
  CurrencyEdit3.Clear;
  DateEdit1.Clear;
  vFator_Calculo := 1.50;
end;

procedure TfrmBaixaTalaoPed.CurrencyEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
    CurrencyEdit2.SetFocus;
end;

procedure TfrmBaixaTalaoPed.CurrencyEdit2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) then
  begin
    if fnc_Busca_Item then
      CurrencyEdit3.SetFocus;
  end;
end;

function TfrmBaixaTalaoPed.fnc_Busca_Item: Boolean;
begin
  Memo1.Clear;
  Result := False;
  Panel2.Visible := False;
  Panel3.Visible := False;
  fDMBaixa_TalaoPed.qPedidoTipo.Close;
  fDMBaixa_TalaoPed.qPedidoTipo.ParamByName('NUM_PEDIDO').AsInteger := CurrencyEdit1.AsInteger;
  fDMBaixa_TalaoPed.qPedidoTipo.ParamByName('ITEM').AsInteger       := CurrencyEdit2.AsInteger;
  fDMBaixa_TalaoPed.qPedidoTipo.Open;
  if fDMBaixa_TalaoPed.qPedidoTipo.IsEmpty then
  begin
    MessageDlg('*** Número do Pedido/Item não encontrado !',mtError,[mbOK],0);
    exit;
  end;
  Panel2.Visible := True;
  Panel3.Visible := True;

  if fDMBaixa_TalaoPed.qPedidoTipoFATOR_CALCULO.AsFloat > 0 then
    vFator_Calculo := StrToFloat(FormatFloat('0.0000',fDMBaixa_TalaoPed.qPedidoTipoFATOR_CALCULO.AsFloat))
  else
    vFator_Calculo := 1.50;
  Memo1.Lines.Add(copy(fDMBaixa_TalaoPed.qPedidoTipoNOME_TIPO_MATERIAL.AsString,1,30));
  Memo1.Lines.Add('Comp: '+fDMBaixa_TalaoPed.qPedidoTipoCOMPRIMENTO.AsString);
  Memo1.Lines.Add('Larg: ' +fDMBaixa_TalaoPed.qPedidoTipoLARGURA.AsString);
  Memo1.Lines.Add('Esp.: ' + fDMBaixa_TalaoPed.qPedidoTipoESPESSURA.AsString);
  Memo1.Lines.Add('Dens.: ' + fDMBaixa_TalaoPed.qPedidoTipoDENSIDADE.AsString);
  Memo1.Lines.Add('Peso: ' + fDMBaixa_TalaoPed.qPedidoTipoPESO.AsString );

  fDMBaixa_TalaoPed.qVerBaixa.Close;
  fDMBaixa_TalaoPed.qVerBaixa.ParamByName('ID_PEDIDO').AsInteger   := fDMBaixa_TalaoPed.qPedidoTipoID.AsInteger;
  fDMBaixa_TalaoPed.qVerBaixa.ParamByName('ITEM_PEDIDO').AsInteger := CurrencyEdit2.AsInteger;
  fDMBaixa_TalaoPed.qVerBaixa.Open;

  if StrToFloat(FormatFloat('0.00',fDMBaixa_TalaoPed.qVerBaixaTEMPO.AsFloat)) > 0 then
    CurrencyEdit3.Value := StrToFloat(FormatFloat('0.00',fDMBaixa_TalaoPed.qVerBaixaTEMPO.AsFloat))
  else
    CurrencyEdit3.Value := StrToFloat(FormatFloat('0.00',fDMBaixa_TalaoPed.qPedidoTipoTEMPO.AsFloat));
  if fDMBaixa_TalaoPed.qVerBaixaDTBAIXA.AsDateTime > 10 then
    DateEdit1.Date := fDMBaixa_TalaoPed.qVerBaixaDTBAIXA.AsDateTime
  else
    DateEdit1.Date := Date;
  if fDMBaixa_TalaoPed.cdsMaquina.RecordCount = 1 then
  begin
    fDMBaixa_TalaoPed.cdsMaquina.First;
    CurrencyEdit4.AsInteger := fDMBaixa_TalaoPed.cdsMaquinaID.AsInteger;
    Label7.Caption          := fDMBaixa_TalaoPed.cdsMaquinaNOME.AsString;
  end;
  Result := True;
end;

procedure TfrmBaixaTalaoPed.btnConfirmarClick(Sender: TObject);
var
  vAux : Real;
begin
  if DateEdit1.Date <= 10 then
  begin
    MessageDlg('*** Data não informada!',mtError,[mbOK],0);
    exit;
  end;
  if CurrencyEdit4.AsInteger <= 0 then
  begin
    MessageDlg('*** Máquina não informada!',mtError,[mbOK],0);
    CurrencyEdit4.SetFocus;
    exit;
  end;
  if not fDMBaixa_TalaoPed.cdsMaquina.Locate('ID',CurrencyEdit4.AsInteger,[loCaseInsensitive]) then
  begin
    MessageDlg('*** Código da Máquina não encontrado!',mtError,[mbOK],0);
    CurrencyEdit4.SetFocus;
    exit;
  end;

  fDMBaixa_TalaoPed.prc_Localizar(fDMBaixa_TalaoPed.qVerBaixaID.AsInteger);
  fDMCadPedido.prc_Localizar(fDMBaixa_TalaoPed.qPedidoTipoID.AsInteger);

  if not fDMCadPedido.cdsPedido_Itens.Locate('ITEM',CurrencyEdit2.AsInteger,[loCaseInsensitive]) then
    exit;

  if not fDMBaixa_TalaoPed.cdsBaixa_TalaoPed.IsEmpty then
    fDMBaixa_TalaoPed.cdsBaixa_TalaoPed.Edit
  else
  begin
    fDMBaixa_TalaoPed.prc_Inserir;
    fDMBaixa_TalaoPed.cdsBaixa_TalaoPedID_PEDIDO.AsInteger   := fDMCadPedido.cdsPedido_ItensID.AsInteger;
    fDMBaixa_TalaoPed.cdsBaixa_TalaoPedITEM_PEDIDO.AsInteger := fDMCadPedido.cdsPedido_ItensITEM.AsInteger;
  end;
  fDMBaixa_TalaoPed.cdsBaixa_TalaoPedDTBAIXA.AsDateTime    := DateEdit1.Date;
  fDMBaixa_TalaoPed.cdsBaixa_TalaoPedTEMPO.AsFloat         := CurrencyEdit3.Value;
  if StrToFloat(FormatFloat('0.00',fDMBaixa_TalaoPed.qPedidoTipoVLR_MAQUINA.AsFloat)) > 0 then
    fDMBaixa_TalaoPed.cdsBaixa_TalaoPedVLR_MAQUINA.AsFloat   := StrToFloat(FormatFloat('0.00',fDMBaixa_TalaoPed.qPedidoTipoVLR_MAQUINA.AsFloat))
  else
    fDMBaixa_TalaoPed.cdsBaixa_TalaoPedVLR_MAQUINA.AsFloat   := StrToFloat(FormatFloat('0.00',fDMBaixa_TalaoPed.cdsMaquinaVALORHORACALC.AsFloat));
  fDMBaixa_TalaoPed.cdsBaixa_TalaoPedID_MAQUINA.AsInteger  := CurrencyEdit4.AsInteger;
  fDMBaixa_TalaoPed.cdsBaixa_TalaoPed.Post;
  fDMBaixa_TalaoPed.cdsBaixa_TalaoPed.ApplyUpdates(0);

  fDMCadPedido.cdsPedido_Itens.Edit;
  if StrToFloat(FormatFloat('0.00',fDMCadPedido.cdsPedido_ItensTEMPO.AsFloat)) <= 0 then
    fDMCadPedido.cdsPedido_ItensTEMPO.AsFloat    := CurrencyEdit3.Value;
  fDMCadPedido.cdsPedido_ItensTEMPO_REAL.AsFloat := CurrencyEdit3.Value;
  fDMCadPedido.cdsPedido_ItensDTBAIXA.AsDateTime := DateEdit1.Date;
  if StrToFloat(FormatFloat('0.000', fDMCadPedido.cdsPedido_ItensTEMPO_REAL.AsFloat)) > 0 then
  begin
    fDMCadPedido.cdsPedido_ItensFATOR_CALCULO_REAL.AsFloat := StrToFloat(FormatFloat('0.000',vFator_Calculo));
    //fDMCadPedido.cdsPedido_ItensVLR_UNITARIO_REAL.AsFloat  := StrToFloat(FormatFloat('0.00',fDMCadPedido.cdsPedido_ItensVLR_MATERIAL.AsFloat * fDMCadPedido.cdsPedido_ItensTEMPO_REAL.AsFloat));
    //fDMCadPedido.cdsPedido_ItensVLR_UNITARIO_REAL.AsFloat  := StrToFloat(FormatFloat('0.00',fDMCadPedido.cdsPedido_ItensVLR_UNITARIO_REAL.AsFloat * vFator_Calculo));
    fDMCadPedido.cdsPedido_ItensVLR_UNITARIO_REAL.AsFloat  := StrToFloat(FormatFloat('0.00',fDMCadPedido.cdsPedido_ItensVLR_MATERIAL.AsFloat * vFator_Calculo));
    fDMCadPedido.cdsPedido_ItensVLR_UNITARIO_REAL.AsFloat  := StrToFloat(FormatFloat('0.00',fDMCadPedido.cdsPedido_ItensVLR_UNITARIO_REAL.AsFloat
                                                            + (fDMCadPedido.cdsPedido_ItensTEMPO_REAL.AsFloat * fDMBaixa_TalaoPed.cdsBaixa_TalaoPedVLR_MAQUINA.AsFloat)));
    if StrToFloat(FormatFloat('0.0000',fDMCadPedido.cdsPedido_ItensVLR_UNITARIO.AsFloat)) <= 0 then
    begin
      fDMCadPedido.cdsPedido_ItensVLR_UNITARIO.AsFloat := StrToFloat(FormatFloat('0.00',fDMCadPedido.cdsPedido_ItensVLR_MATERIAL.AsFloat * fDMCadPedido.cdsPedido_ItensTEMPO_REAL.AsFloat));
      fDMCadPedido.cdsPedido_ItensVLR_UNITARIO.AsFloat := StrToFloat(FormatFloat('0.00',fDMCadPedido.cdsPedido_ItensVLR_UNITARIO.AsFloat * vFator_Calculo));
      fDMCadPedido.cdsPedido_ItensVLR_TOTAL.AsFloat    := StrToFloat(FormatFloat('0.00',fDMCadPedido.cdsPedido_ItensVLR_UNITARIO.AsFloat * fDMCadPedido.cdsPedido_ItensQTD.AsFloat));
      uCalculo_Pedido.prc_Calculo_GeralItem(fDMCadPedido,fDMCadPedido.cdsPedido_ItensQTD.AsFloat,fDMCadPedido.cdsPedido_ItensVLR_UNITARIO.AsFloat,
                                                 fDMCadPedido.cdsPedido_ItensVLR_DESCONTO.AsFloat,fDMCadPedido.cdsPedido_ItensPERC_DESCONTO.AsFloat,
                                                 fDMCadPedido.cdsPedido_ItensVLR_TOTAL.AsFloat);
      uCalculo_Pedido.prc_Calcular_Desconto_Novo(fDMCadPedido,False);
    end;
  end;

  if fDMCadPedido.cdsPedido_Itens.State in [dsEdit] then
    fDMCadPedido.cdsPedido_Itens.Post;
  fDMCadPedido.cdsPedido_Itens.ApplyUpdates(0);

  Memo1.Lines.Add('');
  Memo1.Lines.Add('');
  Memo1.Lines.Add('Gravação confirmada');
  Memo1.Refresh;
  Refresh;
  Sleep(1000);
  btnCancelarClick(Sender);
end;

procedure TfrmBaixaTalaoPed.CurrencyEdit3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
    DateEdit1.SetFocus;
end;

procedure TfrmBaixaTalaoPed.DateEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
    CurrencyEdit4.SetFocus;
end;

procedure TfrmBaixaTalaoPed.CurrencyEdit4KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
    btnConfirmar.SetFocus;
end;

procedure TfrmBaixaTalaoPed.CurrencyEdit4Exit(Sender: TObject);
begin
  Label7.Caption := '';
  if CurrencyEdit4.AsInteger > 0 then
  begin
    if fDMBaixa_TalaoPed.cdsMaquina.Locate('ID',CurrencyEdit4.AsInteger,[loCaseInsensitive]) then
      Label7.Caption := fDMBaixa_TalaoPed.cdsMaquinaNOME.AsString;
  end;
end;

end.
