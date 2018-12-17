object DMBaixa_TalaoPed: TDMBaixa_TalaoPed
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 367
  Top = 189
  Height = 311
  Width = 690
  object sdsBaixa_TalaoPed: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM BAIXA_TALAOPED'#13#10'WHERE ID = :ID'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 88
    Top = 32
    object sdsBaixa_TalaoPedID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsBaixa_TalaoPedID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object sdsBaixa_TalaoPedITEM_PEDIDO: TIntegerField
      FieldName = 'ITEM_PEDIDO'
    end
    object sdsBaixa_TalaoPedID_MAQUINA: TIntegerField
      FieldName = 'ID_MAQUINA'
    end
    object sdsBaixa_TalaoPedDTBAIXA: TDateField
      FieldName = 'DTBAIXA'
    end
    object sdsBaixa_TalaoPedTEMPO: TFloatField
      FieldName = 'TEMPO'
    end
    object sdsBaixa_TalaoPedDTUSUARIO: TDateField
      FieldName = 'DTUSUARIO'
    end
    object sdsBaixa_TalaoPedHRUSUARIO: TTimeField
      FieldName = 'HRUSUARIO'
    end
    object sdsBaixa_TalaoPedUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 15
    end
    object sdsBaixa_TalaoPedVLR_MAQUINA: TFloatField
      FieldName = 'VLR_MAQUINA'
    end
  end
  object dspBaixa_TalaoPed: TDataSetProvider
    DataSet = sdsBaixa_TalaoPed
    UpdateMode = upWhereKeyOnly
    Left = 144
    Top = 32
  end
  object cdsBaixa_TalaoPed: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspBaixa_TalaoPed'
    Left = 200
    Top = 32
    object cdsBaixa_TalaoPedID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsBaixa_TalaoPedID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object cdsBaixa_TalaoPedITEM_PEDIDO: TIntegerField
      FieldName = 'ITEM_PEDIDO'
    end
    object cdsBaixa_TalaoPedID_MAQUINA: TIntegerField
      FieldName = 'ID_MAQUINA'
    end
    object cdsBaixa_TalaoPedDTBAIXA: TDateField
      FieldName = 'DTBAIXA'
    end
    object cdsBaixa_TalaoPedTEMPO: TFloatField
      FieldName = 'TEMPO'
    end
    object cdsBaixa_TalaoPedDTUSUARIO: TDateField
      FieldName = 'DTUSUARIO'
    end
    object cdsBaixa_TalaoPedHRUSUARIO: TTimeField
      FieldName = 'HRUSUARIO'
    end
    object cdsBaixa_TalaoPedUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 15
    end
    object cdsBaixa_TalaoPedVLR_MAQUINA: TFloatField
      FieldName = 'VLR_MAQUINA'
    end
  end
  object dsBaixa_TalaoPed: TDataSource
    DataSet = cdsBaixa_TalaoPed
    Left = 256
    Top = 32
  end
  object qVerBaixa: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_PEDIDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ITEM_PEDIDO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT B.*'
      'FROM BAIXA_TALAOPED B'
      'WHERE B.ID_PEDIDO = :ID_PEDIDO'
      '  AND B.ITEM_PEDIDO = :ITEM_PEDIDO')
    SQLConnection = dmDatabase.scoDados
    Left = 472
    Top = 88
    object qVerBaixaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qVerBaixaID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object qVerBaixaITEM_PEDIDO: TIntegerField
      FieldName = 'ITEM_PEDIDO'
    end
    object qVerBaixaID_MAQUINA: TIntegerField
      FieldName = 'ID_MAQUINA'
    end
    object qVerBaixaDTBAIXA: TDateField
      FieldName = 'DTBAIXA'
    end
    object qVerBaixaTEMPO: TFloatField
      FieldName = 'TEMPO'
    end
    object qVerBaixaDTUSUARIO: TDateField
      FieldName = 'DTUSUARIO'
    end
    object qVerBaixaHRUSUARIO: TTimeField
      FieldName = 'HRUSUARIO'
    end
    object qVerBaixaUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 15
    end
  end
  object qPedidoTipo: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'NUM_PEDIDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ITEM'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'SELECT TP.ID, TP.comprimento, TP.complemento_nome, TP.largura, T' +
        'P.altura,'
      
        'TP.qtd, TP.espessura, tp.densidade, tp.peso, tp.id_tipo_material' +
        ','
      
        'TMAT.NOME NOME_TIPO_MATERIAL, IT.NOMEPRODUTO, IT.TEMPO, IT.DTBAI' +
        'XA,'
      'PED.NUM_PEDIDO, TP.FATOR_CALCULO, IT.TEMPO_REAL, TP.VLR_MAQUINA'
      'FROM PEDIDO_ITEM_TIPO TP'
      'INNER JOIN PEDIDO_ITEM IT'
      'ON TP.ID = IT.ID'
      'AND TP.ITEM = IT.ITEM'
      'INNER JOIN PEDIDO PED'
      'ON TP.ID = PED.ID'
      'INNER JOIN TIPO_MATERIAL TMAT'
      'ON TP.ID_TIPO_MATERIAL = TMAT.ID'
      'WHERE PED.NUM_PEDIDO = :NUM_PEDIDO'
      '  AND TP.ITEM = :ITEM'
      '  AND PED.TIPO_REG = '#39'P'#39)
    SQLConnection = dmDatabase.scoDados
    Left = 496
    Top = 160
    object qPedidoTipoCOMPRIMENTO: TFloatField
      FieldName = 'COMPRIMENTO'
    end
    object qPedidoTipoCOMPLEMENTO_NOME: TStringField
      FieldName = 'COMPLEMENTO_NOME'
      Size = 50
    end
    object qPedidoTipoLARGURA: TFloatField
      FieldName = 'LARGURA'
    end
    object qPedidoTipoALTURA: TFloatField
      FieldName = 'ALTURA'
    end
    object qPedidoTipoQTD: TFloatField
      FieldName = 'QTD'
    end
    object qPedidoTipoESPESSURA: TFloatField
      FieldName = 'ESPESSURA'
    end
    object qPedidoTipoDENSIDADE: TFloatField
      FieldName = 'DENSIDADE'
    end
    object qPedidoTipoPESO: TFloatField
      FieldName = 'PESO'
    end
    object qPedidoTipoID_TIPO_MATERIAL: TIntegerField
      FieldName = 'ID_TIPO_MATERIAL'
    end
    object qPedidoTipoNOME_TIPO_MATERIAL: TStringField
      FieldName = 'NOME_TIPO_MATERIAL'
      Size = 30
    end
    object qPedidoTipoNOMEPRODUTO: TStringField
      FieldName = 'NOMEPRODUTO'
      Size = 100
    end
    object qPedidoTipoTEMPO: TFloatField
      FieldName = 'TEMPO'
    end
    object qPedidoTipoDTBAIXA: TDateField
      FieldName = 'DTBAIXA'
    end
    object qPedidoTipoNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object qPedidoTipoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qPedidoTipoFATOR_CALCULO: TFloatField
      FieldName = 'FATOR_CALCULO'
    end
    object qPedidoTipoTEMPO_REAL: TFloatField
      FieldName = 'TEMPO_REAL'
    end
    object qPedidoTipoVLR_MAQUINA: TFloatField
      FieldName = 'VLR_MAQUINA'
    end
  end
  object sdsMaquina: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT ID, NOME, VALORHORACALC'#13#10'FROM MAQUINA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 88
    Top = 112
  end
  object dspMaquina: TDataSetProvider
    DataSet = sdsMaquina
    UpdateMode = upWhereKeyOnly
    Left = 144
    Top = 112
  end
  object cdsMaquina: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NOME'
    Params = <>
    ProviderName = 'dspMaquina'
    Left = 200
    Top = 112
    object cdsMaquinaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsMaquinaNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object cdsMaquinaVALORHORACALC: TFloatField
      FieldName = 'VALORHORACALC'
    end
  end
  object dsMaquina: TDataSource
    DataSet = cdsMaquina
    Left = 256
    Top = 112
  end
end
