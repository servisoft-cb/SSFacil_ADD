object frmConsPedido_Real: TfrmConsPedido_Real
  Left = 262
  Top = 183
  Width = 928
  Height = 480
  Caption = 'frmConsPedido_Real'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 912
    Height = 67
    Align = alTop
    Color = clSilver
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 14
      Width = 70
      Height = 13
      Alignment = taRightJustify
      Caption = 'Dt.Emiss'#227'o Ini:'
    end
    object Label2: TLabel
      Left = 215
      Top = 14
      Width = 25
      Height = 13
      Alignment = taRightJustify
      Caption = 'Final:'
    end
    object Label3: TLabel
      Left = 45
      Top = 32
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cliente:'
    end
    object Label4: TLabel
      Left = 16
      Top = 52
      Width = 64
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo Material:'
    end
    object Shape1: TShape
      Left = 608
      Top = 40
      Width = 25
      Height = 14
      Brush.Color = 12320699
    end
    object Label5: TLabel
      Left = 635
      Top = 40
      Width = 233
      Height = 13
      Caption = 'Item com Realizado maior que cobrado do cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object DateEdit1: TDateEdit
      Left = 82
      Top = 6
      Width = 121
      Height = 21
      Ctl3D = False
      NumGlyphs = 2
      ParentCtl3D = False
      TabOrder = 0
    end
    object DateEdit2: TDateEdit
      Left = 242
      Top = 6
      Width = 121
      Height = 21
      Ctl3D = False
      NumGlyphs = 2
      ParentCtl3D = False
      TabOrder = 1
    end
    object Edit1: TEdit
      Left = 82
      Top = 26
      Width = 281
      Height = 19
      CharCase = ecUpperCase
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
    end
    object NxButton1: TNxButton
      Left = 364
      Top = 40
      Width = 108
      Height = 25
      Caption = 'Efetuar Pesquisa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = NxButton1Click
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 82
      Top = 44
      Width = 281
      Height = 21
      DropDownCount = 8
      Ctl3D = False
      LookupField = 'ID'
      LookupDisplay = 'NOME'
      LookupSource = DMConsTalaoPed.dsTipo_Material
      ParentCtl3D = False
      TabOrder = 3
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 67
    Width = 912
    Height = 374
    Align = alClient
    Ctl3D = False
    DataSource = DMConsTalaoPed.dsPedido_Real
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Flat = True
    BandsFont.Charset = DEFAULT_CHARSET
    BandsFont.Color = clWindowText
    BandsFont.Height = -11
    BandsFont.Name = 'MS Sans Serif'
    BandsFont.Style = []
    Groupings = <>
    GridStyle.Style = gsCustom
    GridStyle.OddColor = clWindow
    GridStyle.EvenColor = clWindow
    TitleHeight.PixelCount = 24
    FooterColor = clBtnFace
    ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
    OnGetCellParams = SMDBGrid1GetCellParams
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 11
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 25
    RowCount = 2
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NUM_PEDIDO'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Pedido'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ITEM'
        Title.Alignment = taCenter
        Title.Caption = 'Item'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_TIPO_MATERIAL'
        Title.Alignment = taCenter
        Title.Caption = 'Tipo Material'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DTEMISSAO'
        Title.Alignment = taCenter
        Title.Caption = 'Dt.Emiss'#227'o'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TEMPO'
        Title.Alignment = taCenter
        Title.Caption = 'Tempo'
        Width = 47
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TEMPO_REAL'
        Title.Alignment = taCenter
        Title.Caption = 'Tempo Real'
        Width = 55
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DTBAIXA'
        Title.Alignment = taCenter
        Title.Caption = 'Data Baixa'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'QTD'
        Title.Alignment = taCenter
        Title.Caption = 'Qtde.'
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_UNITARIO'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. Unit'#225'rio'
        Title.Color = 8454016
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_TOTAL'
        Title.Caption = 'Vlr. Total'
        Title.Color = 8454016
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_UNITARIO_REAL'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. Unit'#225'rio Real'
        Title.Color = 16760767
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_TOTAL_REAL'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. Total Real'
        Title.Color = 16760767
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FATOR_CALCULO'
        Title.Alignment = taCenter
        Title.Caption = 'Fator de C'#225'lculo'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FATOR_CALCULO_REAL'
        Title.Alignment = taCenter
        Title.Caption = 'Fator de C'#225'lculo Real'
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_MAQUINA'
        Title.Alignment = taCenter
        Title.Caption = 'M'#225'quina'
        Width = 145
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_MAQUINA'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. Hora Maquina'
        Width = 59
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'COMPRIMENTO'
        Title.Alignment = taCenter
        Title.Caption = 'Comp.'
        Width = 54
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LARGURA'
        Title.Alignment = taCenter
        Title.Caption = 'Larg.'
        Width = 56
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ESPESSURA'
        Title.Alignment = taCenter
        Title.Caption = 'Esp.'
        Width = 48
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DENSIDADE'
        Title.Alignment = taCenter
        Title.Caption = 'Densd.'
        Width = 56
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PESO'
        Title.Alignment = taCenter
        Title.Caption = 'Peso'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_UNITARIO_MAT'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. Unit. Material'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_TOTAL_MAT'
        Title.Alignment = taCenter
        Title.Caption = 'Vlr. Total Material'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_CLIENTE2'
        Title.Alignment = taCenter
        Title.Caption = 'Cliente'
        Width = 210
        Visible = True
      end>
  end
end
