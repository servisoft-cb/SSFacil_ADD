unit UConsTalaoPed;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMConsTalaoPed, ExtCtrls, StdCtrls, Mask, ToolEdit, CurrEdit,
  NxCollection, Grids, DBGrids, SMDBGrid, DB, RxLookup;

type
  TfrmConsTalaoPed = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DateEdit1: TDateEdit;
    Label2: TLabel;
    DateEdit2: TDateEdit;
    Label3: TLabel;
    DateEdit3: TDateEdit;
    Label4: TLabel;
    DateEdit4: TDateEdit;
    Label5: TLabel;
    Edit1: TEdit;
    Label6: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    RadioGroup1: TRadioGroup;
    NxButton1: TNxButton;
    SMDBGrid1: TSMDBGrid;
    Label7: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure NxButton1Click(Sender: TObject);
    procedure SMDBGrid1TitleClick(Column: TColumn);
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
  frmConsTalaoPed: TfrmConsTalaoPed;

implementation

uses rsDBUtils;

{$R *.dfm}

procedure TfrmConsTalaoPed.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmConsTalaoPed.FormShow(Sender: TObject);
begin
  fDMConsTalaoPed := TDMConsTalaoPed.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMConsTalaoPed);
end;

procedure TfrmConsTalaoPed.NxButton1Click(Sender: TObject);
begin
  prc_Consultar;
end;

procedure TfrmConsTalaoPed.prc_Consultar;
var
  vComando : String;
begin
  fDMConsTalaoPed.cdsTalaoPed.Close;
  vComando := '';
  if CurrencyEdit1.AsInteger > 0 then
    vComando := vComando + ' AND P.NUM_PEDIDO = ' + IntToStr(CurrencyEdit1.AsInteger)
  else
  begin
    if DateEdit1.Date > 10 then
      vComando := vComando + ' AND P.DTEMISSAO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
    if DateEdit2.Date > 10 then
      vComando := vComando + ' AND P.DTEMISSAO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
    if DateEdit3.Date > 10 then
      vComando := vComando + ' AND I.DTBAIXA >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit3.date));
    if DateEdit4.Date > 10 then
      vComando := vComando + ' AND I.DTBAIXA <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit4.date));
    if trim(Edit1.Text) <> '' then
      vComando := vComando + ' AND CLI.NOME LIKE ' + QuotedStr('%'+Edit1.Text+'%');
    if trim(RxDBLookupCombo1.Text) <> '' then
      vComando := vComando + ' AND TAL.ID_MAQUINA = ' + IntToStr(RxDBLookupCombo1.KeyValue);
    case RadioGroup1.ItemIndex of
      0 : vComando := vComando + ' AND I.DTBAIXA IS NULL';
      1 : vComando := vComando + ' AND I.DTBAIXA IS NOT NULL';
    end;
  end;
  fDMConsTalaoPed.sdsTalaoPed.CommandText := fDMConsTalaoPed.ctTalaoPed + vComando;
  fDMConsTalaoPed.cdsTalaoPed.Open;
  fDMConsTalaoPed.cdsTalaoPed.IndexFieldNames := 'NUM_PEDIDO;ITEM';
end;

procedure TfrmConsTalaoPed.SMDBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
  ColunaOrdenada: String;
begin
  ColunaOrdenada := Column.FieldName;
  fDMConsTalaoPed.cdsTalaoPed.IndexFieldNames := Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid1.Columns.Count - 1 do
    if not (SMDBGrid1.Columns.Items[I] = Column) then
      SMDBGrid1.Columns.Items[I].Title.Color := $00FFD379;
end;

procedure TfrmConsTalaoPed.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if fDMConsTalaoPed.cdsTalaoPedDTBAIXA.AsDateTime > 10 then
    Background := clMoneyGreen;
end;

end.
