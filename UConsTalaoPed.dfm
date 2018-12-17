object frmConsTalaoPed: TfrmConsTalaoPed
  Left = 214
  Top = 177
  Width = 928
  Height = 480
  Caption = 'frmConsTalaoPed'
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
    Height = 106
    Align = alTop
    Color = clSilver
    TabOrder = 0
    object Label1: TLabel
      Left = 101
      Top = 12
      Width = 86
      Height = 13
      Alignment = taRightJustify
      Caption = 'Dt.Emiss'#227'o Inicial:'
    end
    object Label2: TLabel
      Left = 301
      Top = 12
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Dt.Final:'
    end
    object Label3: TLabel
      Left = 114
      Top = 32
      Width = 73
      Height = 13
      Alignment = taRightJustify
      Caption = 'Dt.Baixa Inicial:'
    end
    object Label4: TLabel
      Left = 301
      Top = 32
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Dt.Final:'
    end
    object Label5: TLabel
      Left = 152
      Top = 50
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cliente:'
    end
    object Label6: TLabel
      Left = 136
      Top = 90
      Width = 51
      Height = 13
      Alignment = taRightJustify
      Caption = 'N'#186' Pedido:'
    end
    object Label7: TLabel
      Left = 143
      Top = 70
      Width = 44
      Height = 13
      Alignment = taRightJustify
      Caption = 'M'#225'quina:'
    end
    object DateEdit1: TDateEdit
      Left = 189
      Top = 4
      Width = 100
      Height = 21
      Ctl3D = False
      NumGlyphs = 2
      ParentCtl3D = False
      TabOrder = 0
    end
    object DateEdit2: TDateEdit
      Left = 341
      Top = 4
      Width = 100
      Height = 21
      Ctl3D = False
      NumGlyphs = 2
      ParentCtl3D = False
      TabOrder = 1
    end
    object DateEdit3: TDateEdit
      Left = 189
      Top = 24
      Width = 100
      Height = 21
      Ctl3D = False
      NumGlyphs = 2
      ParentCtl3D = False
      TabOrder = 2
    end
    object DateEdit4: TDateEdit
      Left = 341
      Top = 24
      Width = 100
      Height = 21
      Ctl3D = False
      NumGlyphs = 2
      ParentCtl3D = False
      TabOrder = 3
    end
    object Edit1: TEdit
      Left = 189
      Top = 44
      Width = 249
      Height = 19
      CharCase = ecUpperCase
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 4
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 189
      Top = 82
      Width = 121
      Height = 21
      AutoSize = False
      Ctl3D = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      ParentCtl3D = False
      TabOrder = 6
    end
    object RadioGroup1: TRadioGroup
      Left = 1
      Top = 1
      Width = 88
      Height = 104
      Align = alLeft
      Caption = 'Op'#231#227'o'
      ItemIndex = 0
      Items.Strings = (
        'Pendente'
        'Baixado'
        'Ambos')
      TabOrder = 7
    end
    object NxButton1: TNxButton
      Left = 439
      Top = 76
      Width = 143
      Height = 28
      Caption = 'Efetuar Pesquisa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      OnClick = NxButton1Click
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 189
      Top = 62
      Width = 249
      Height = 21
      DropDownCount = 8
      Ctl3D = False
      LookupField = 'ID'
      LookupDisplay = 'NOME'
      LookupSource = DMConsTalaoPed.dsMaquina
      ParentCtl3D = False
      TabOrder = 5
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 106
    Width = 912
    Height = 335
    Align = alClient
    Ctl3D = False
    DataSource = DMConsTalaoPed.dsTalaoPed
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnTitleClick = SMDBGrid1TitleClick
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
    ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
    OnGetCellParams = SMDBGrid1GetCellParams
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 11
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 17
    RowCount = 2
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NUM_PEDIDO'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Pedido'
        Title.Color = 16765817
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ITEM'
        Title.Alignment = taCenter
        Title.Caption = 'Item'
        Title.Color = 16765817
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_TIPO_MATERIAL'
        Title.Alignment = taCenter
        Title.Caption = 'Tipo Material'
        Title.Color = 16765817
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMPRIMENTO'
        Title.Alignment = taCenter
        Title.Caption = 'Comprimento'
        Title.Color = 16765817
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LARGURA'
        Title.Alignment = taCenter
        Title.Caption = 'Largura'
        Title.Color = 16765817
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESPESSURA'
        Title.Alignment = taCenter
        Title.Caption = 'Espessura'
        Title.Color = 16765817
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DENSIDADE'
        Title.Alignment = taCenter
        Title.Caption = 'Densidade'
        Title.Color = 16765817
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PESO'
        Title.Alignment = taCenter
        Title.Caption = 'Peso'
        Title.Color = 16765817
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'QTD'
        Title.Alignment = taCenter
        Title.Color = 16765817
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TEMPO'
        Title.Alignment = taCenter
        Title.Caption = 'Tempo'
        Title.Color = 13238163
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTBAIXA'
        Title.Alignment = taCenter
        Title.Caption = 'Dt. Baixa'
        Title.Color = 13238163
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_MAQUINA'
        Title.Alignment = taCenter
        Title.Caption = 'M'#225'quina'
        Title.Color = 13238163
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMEPRODUTO'
        Title.Alignment = taCenter
        Title.Caption = 'Nome Produto'
        Title.Color = 16765817
        Width = 313
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_CLIENTE2'
        Title.Alignment = taCenter
        Title.Caption = 'Nome Cliente'
        Title.Color = 16765817
        Width = 291
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTEMISSAO'
        Title.Alignment = taCenter
        Title.Caption = 'Data Emiss'#227'o'
        Title.Color = 16765817
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_CLIENTE'
        Title.Alignment = taCenter
        Title.Caption = 'ID Cliente'
        Title.Color = 16765817
        Visible = True
      end>
  end
end
