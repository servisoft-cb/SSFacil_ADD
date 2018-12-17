unit UDMBaixa_TalaoPed;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr, Provider, DBClient, LogTypes;

type
  TDMBaixa_TalaoPed = class(TDataModule)
    sdsBaixa_TalaoPed: TSQLDataSet;
    sdsBaixa_TalaoPedID: TIntegerField;
    sdsBaixa_TalaoPedID_PEDIDO: TIntegerField;
    sdsBaixa_TalaoPedITEM_PEDIDO: TIntegerField;
    sdsBaixa_TalaoPedID_MAQUINA: TIntegerField;
    sdsBaixa_TalaoPedDTBAIXA: TDateField;
    sdsBaixa_TalaoPedTEMPO: TFloatField;
    sdsBaixa_TalaoPedDTUSUARIO: TDateField;
    sdsBaixa_TalaoPedHRUSUARIO: TTimeField;
    dspBaixa_TalaoPed: TDataSetProvider;
    cdsBaixa_TalaoPed: TClientDataSet;
    cdsBaixa_TalaoPedID: TIntegerField;
    cdsBaixa_TalaoPedID_PEDIDO: TIntegerField;
    cdsBaixa_TalaoPedITEM_PEDIDO: TIntegerField;
    cdsBaixa_TalaoPedID_MAQUINA: TIntegerField;
    cdsBaixa_TalaoPedDTBAIXA: TDateField;
    cdsBaixa_TalaoPedTEMPO: TFloatField;
    cdsBaixa_TalaoPedDTUSUARIO: TDateField;
    cdsBaixa_TalaoPedHRUSUARIO: TTimeField;
    dsBaixa_TalaoPed: TDataSource;
    sdsBaixa_TalaoPedUSUARIO: TStringField;
    cdsBaixa_TalaoPedUSUARIO: TStringField;
    qVerBaixa: TSQLQuery;
    qPedidoTipo: TSQLQuery;
    qPedidoTipoCOMPRIMENTO: TFloatField;
    qPedidoTipoCOMPLEMENTO_NOME: TStringField;
    qPedidoTipoLARGURA: TFloatField;
    qPedidoTipoALTURA: TFloatField;
    qPedidoTipoQTD: TFloatField;
    qPedidoTipoESPESSURA: TFloatField;
    qPedidoTipoDENSIDADE: TFloatField;
    qPedidoTipoPESO: TFloatField;
    qPedidoTipoID_TIPO_MATERIAL: TIntegerField;
    qPedidoTipoNOME_TIPO_MATERIAL: TStringField;
    qPedidoTipoNOMEPRODUTO: TStringField;
    qPedidoTipoTEMPO: TFloatField;
    qPedidoTipoDTBAIXA: TDateField;
    qPedidoTipoNUM_PEDIDO: TIntegerField;
    qPedidoTipoID: TIntegerField;
    qPedidoTipoFATOR_CALCULO: TFloatField;
    qPedidoTipoTEMPO_REAL: TFloatField;
    qVerBaixaID: TIntegerField;
    qVerBaixaID_PEDIDO: TIntegerField;
    qVerBaixaITEM_PEDIDO: TIntegerField;
    qVerBaixaID_MAQUINA: TIntegerField;
    qVerBaixaDTBAIXA: TDateField;
    qVerBaixaTEMPO: TFloatField;
    qVerBaixaDTUSUARIO: TDateField;
    qVerBaixaHRUSUARIO: TTimeField;
    qVerBaixaUSUARIO: TStringField;
    sdsMaquina: TSQLDataSet;
    dspMaquina: TDataSetProvider;
    cdsMaquina: TClientDataSet;
    dsMaquina: TDataSource;
    sdsBaixa_TalaoPedVLR_MAQUINA: TFloatField;
    cdsBaixa_TalaoPedVLR_MAQUINA: TFloatField;
    cdsMaquinaID: TIntegerField;
    cdsMaquinaNOME: TStringField;
    cdsMaquinaVALORHORACALC: TFloatField;
    qPedidoTipoVLR_MAQUINA: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }

    procedure DoLogAdditionalValues(ATableName: string; var AValues: TArrayLogData; var UserName: string);

  public
    { Public declarations }
    procedure prc_Localizar(ID: Integer);
    procedure prc_Inserir;

  end;

var
  DMBaixa_TalaoPed: TDMBaixa_TalaoPed;

implementation

uses DmdDatabase, LogProvider, uUtilPadrao;

{$R *.dfm}

{ TDMBaixa_TalaoPed }

procedure TDMBaixa_TalaoPed.DoLogAdditionalValues(ATableName: string;
  var AValues: TArrayLogData; var UserName: string);
begin
  UserName := vUsuario;
end;

procedure TDMBaixa_TalaoPed.DataModuleCreate(Sender: TObject);
var
  i, x: Integer;
  SR: TSearchRec;
  Origem, Destino: string;
  vIndices: string;
  aIndices: array of string;
begin
  cdsMaquina.Open;
  LogProviderList.OnAdditionalValues := DoLogAdditionalValues;
  for i := 0 to (Self.ComponentCount - 1) do
  begin
    if (Self.Components[i] is TClientDataSet) then
    begin
      SetLength(aIndices, 0);
      vIndices := TClientDataSet(Components[i]).IndexFieldNames;
      while (vIndices <> EmptyStr) do
      begin
        SetLength(aIndices, Length(aIndices) + 1);
        x := Pos(';', vIndices);
        if (x = 0) then
        begin
          aIndices[Length(aIndices) - 1] := vIndices;
          vIndices := EmptyStr;
        end
        else
        begin
          aIndices[Length(aIndices) - 1] := Copy(vIndices, 1, x - 1);
          vIndices := Copy(vIndices, x + 1, MaxInt);
        end;
      end;
      LogProviderList.AddProvider(TClientDataSet(Self.Components[i]), TClientDataSet(Self.Components[i]).Name, aIndices);
    end;
  end;
end;

procedure TDMBaixa_TalaoPed.prc_Localizar(ID: Integer);
begin
  cdsBaixa_TalaoPed.Close;
  sdsBaixa_TalaoPed.ParamByName('ID').AsInteger := ID;
  cdsBaixa_TalaoPed.Open;
end;

procedure TDMBaixa_TalaoPed.prc_Inserir;
var
  vAux: Integer;
  vNumAux: Integer;
begin
  if not cdsBaixa_TalaoPed.Active then
    prc_Localizar(-1);
  vAux := dmDatabase.ProximaSequencia('BAIXA_TALAOPED',0);

  cdsBaixa_TalaoPed.Insert;
  cdsBaixa_TalaoPedID.AsInteger         := vAux;
  cdsBaixa_TalaoPedDTUSUARIO.AsDateTime := Date;
  cdsBaixa_TalaoPedHRUSUARIO.AsDateTime := Now;
  cdsBaixa_TalaoPedUSUARIO.AsString     := vUsuario;
end;

end.
