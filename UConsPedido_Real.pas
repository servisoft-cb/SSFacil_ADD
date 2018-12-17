unit UConsPedido_Real;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, ToolEdit, NxCollection, Grids,
  DBGrids, SMDBGrid, RxLookup, UDMConsTalaoPed, DB;

type
  TfrmConsPedido_Real = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DateEdit1: TDateEdit;
    Label2: TLabel;
    DateEdit2: TDateEdit;
    Label3: TLabel;
    Edit1: TEdit;
    NxButton1: TNxButton;
    SMDBGrid1: TSMDBGrid;
    Label4: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Shape1: TShape;
    Label5: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NxButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    { Private declarations }
    fDMConsTalaoPed: TDMConsTalaoPed;
    procedure prc_Consultar;
  public
    { Public declarations }
  end;

var
  frmConsPedido_Real: TfrmConsPedido_Real;

implementation

uses rsDBUtils;


{$R *.dfm}

procedure TfrmConsPedido_Real.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmConsPedido_Real.NxButton1Click(Sender: TObject);
begin
  prc_Consultar;
end;

procedure TfrmConsPedido_Real.prc_Consultar;
var
 vComando : String;
begin
  vComando := '';
  if DateEdit1.Date > 10 then
    vComando := vComando + ' AND P.DTEMISSAO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
  if DateEdit2.Date > 10 then
    vComando := vComando + ' AND P.DTEMISSAO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  if trim(Edit1.Text) <> '' then
    vComando := vComando + ' AND ((p.nome_consumidor like ' + QuotedStr('%'+Edit1.Text+'%') + ') or (CLI.FANTASIA LIKE ' + QuotedStr('%'+Edit1.Text+'%') + '))';
  if trim(RxDBLookupCombo1.Text) <> '' then
    vComando := vComando + ' AND PTIP.ID_TIPO_MATERIAL = ' + IntToStr(RxDBLookupCombo1.KeyValue);
  fDMConsTalaoPed.cdsPedido_Real.Close;
  fDMConsTalaoPed.sdsPedido_Real.CommandText := fDMConsTalaoPed.ctPedido_Real + vComando;
  fDMConsTalaoPed.cdsPedido_Real.Open;
end;

procedure TfrmConsPedido_Real.FormShow(Sender: TObject);
begin
  fDMConsTalaoPed := TDMConsTalaoPed.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMConsTalaoPed);
end;

procedure TfrmConsPedido_Real.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if StrToFloat(FormatFloat('0.0000',fDMConsTalaoPed.cdsPedido_RealVLR_UNITARIO_REAL.AsFloat)) > StrToFloat(FormatFloat('0.0000',fDMConsTalaoPed.cdsPedido_RealVLR_UNITARIO.AsFloat)) then
  begin
    Background  := $00BBFFBB;
    AFont.Color := clBlack;
  end;
end;

end.
