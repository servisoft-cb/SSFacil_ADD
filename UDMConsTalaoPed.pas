unit UDMConsTalaoPed;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr, DBClient, Provider;

type
  TDMConsTalaoPed = class(TDataModule)
    sdsTalaoPed: TSQLDataSet;
    dspTalaoPed: TDataSetProvider;
    cdsTalaoPed: TClientDataSet;
    dsTalaoPed: TDataSource;
    sdsPedido_Real: TSQLDataSet;
    dspPedido_Real: TDataSetProvider;
    cdsPedido_Real: TClientDataSet;
    dsPedido_Real: TDataSource;
    cdsPedido_RealID: TIntegerField;
    cdsPedido_RealNUM_PEDIDO: TIntegerField;
    cdsPedido_RealID_CLIENTE: TIntegerField;
    cdsPedido_RealDTEMISSAO: TDateField;
    cdsPedido_RealTEMPO: TFloatField;
    cdsPedido_RealTEMPO_REAL: TFloatField;
    cdsPedido_RealDTBAIXA: TDateField;
    cdsPedido_RealVLR_UNITARIO: TFloatField;
    cdsPedido_RealVLR_UNITARIO_REAL: TFloatField;
    cdsPedido_RealFATOR_CALCULO: TFloatField;
    cdsPedido_RealFATOR_CALCULO_REAL: TFloatField;
    cdsPedido_RealID_TIPO_MATERIAL: TIntegerField;
    cdsPedido_RealCOMPRIMENTO: TFloatField;
    cdsPedido_RealLARGURA: TFloatField;
    cdsPedido_RealESPESSURA: TFloatField;
    cdsPedido_RealDENSIDADE: TFloatField;
    cdsPedido_RealVLR_UNITARIO_MAT: TFloatField;
    cdsPedido_RealVLR_TOTAL_MAT: TFloatField;
    cdsPedido_RealPESO: TFloatField;
    cdsPedido_RealNOME_TIPO_MATERIAL: TStringField;
    cdsPedido_RealQTD: TFloatField;
    cdsPedido_RealVLR_TOTAL: TFloatField;
    cdsPedido_RealVLR_TOTAL_REAL: TFloatField;
    cdsPedido_RealNOME_CLIENTE2: TStringField;
    cdsPedido_RealITEM: TIntegerField;
    sdsTipo_Material: TSQLDataSet;
    dspTipo_Material: TDataSetProvider;
    cdsTipo_Material: TClientDataSet;
    dsTipo_Material: TDataSource;
    cdsTipo_MaterialID: TIntegerField;
    cdsTipo_MaterialNOME: TStringField;
    cdsTalaoPedID: TIntegerField;
    cdsTalaoPedNUM_PEDIDO: TIntegerField;
    cdsTalaoPedDTEMISSAO: TDateField;
    cdsTalaoPedID_CLIENTE: TIntegerField;
    cdsTalaoPedNOMEPRODUTO: TStringField;
    cdsTalaoPedQTD: TFloatField;
    cdsTalaoPedTEMPO: TFloatField;
    cdsTalaoPedDTBAIXA: TDateField;
    cdsTalaoPedCOMPRIMENTO: TFloatField;
    cdsTalaoPedLARGURA: TFloatField;
    cdsTalaoPedESPESSURA: TFloatField;
    cdsTalaoPedDENSIDADE: TFloatField;
    cdsTalaoPedPESO: TFloatField;
    cdsTalaoPedNOME_TIPO_MATERIAL: TStringField;
    cdsTalaoPedNOME_CLIENTE: TStringField;
    cdsTalaoPedITEM: TIntegerField;
    cdsTalaoPedID_MAQUINA: TIntegerField;
    cdsTalaoPedNOME_MAQUINA: TStringField;
    cdsTalaoPedNOME_CLIENTE2: TStringField;
    sdsMaquina: TSQLDataSet;
    dspMaquina: TDataSetProvider;
    cdsMaquina: TClientDataSet;
    dsMaquina: TDataSource;
    cdsMaquinaID: TIntegerField;
    cdsMaquinaNOME: TStringField;
    cdsPedido_RealVLR_MAQUINA: TFloatField;
    cdsPedido_RealNOME_MAQUINA: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ctTalaoPed : String;
    ctPedido_Real : String;
  end;

var
  DMConsTalaoPed: TDMConsTalaoPed;

implementation

uses DmdDatabase;

{$R *.dfm}

procedure TDMConsTalaoPed.DataModuleCreate(Sender: TObject);
begin
  ctTalaoPed    := sdsTalaoPed.CommandText;
  ctPedido_Real := sdsPedido_Real.CommandText;
  cdsTipo_Material.Open;
  cdsMaquina.Open;
end;

end.
