object DMConsTalaoPed: TDMConsTalaoPed
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 286
  Top = 226
  Height = 309
  Width = 755
  object sdsTalaoPed: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT P.ID, P.NUM_PEDIDO, P.DTEMISSAO, P.ID_CLIENTE,'#13#10'I.nomepro' +
      'duto, I.QTD, I.TEMPO, I.dtbaixa, PIT.comprimento, PIT.largura,'#13#10 +
      'PIT.espessura, PIT.densidade, PIT.peso, TMAT.nome NOME_TIPO_MATE' +
      'RIAL,'#13#10'CLI.NOME NOME_CLIENTE, I.ITEM, TAL.ID_MAQUINA, MAQ.NOME N' +
      'OME_MAQUINA,'#13#10'CASE'#13#10'  WHEN P.ID_CLIENTE = (SELECT P2.id_cliente_' +
      'consumidor FROM PARAMETROS P2) THEN P.nome_consumidor'#13#10'  ELSE CL' +
      'I.fantasia'#13#10'  END NOME_CLIENTE2'#13#10'FROM PEDIDO P'#13#10'INNER JOIN PEDID' +
      'O_ITEM I'#13#10'ON P.ID = I.ID'#13#10'INNER JOIN PEDIDO_ITEM_TIPO PIT'#13#10'ON I.' +
      'ID = PIT.ID'#13#10'AND I.ITEM = PIT.ITEM'#13#10'INNER JOIN TIPO_MATERIAL TMA' +
      'T'#13#10'ON PIT.ID_TIPO_MATERIAL = TMAT.ID'#13#10'INNER JOIN PESSOA CLI'#13#10'ON ' +
      'P.ID_CLIENTE = CLI.CODIGO'#13#10'LEFT JOIN BAIXA_TALAOPED TAL'#13#10'ON I.ID' +
      ' = TAL.ID_PEDIDO'#13#10'AND I.ITEM = TAL.ITEM_PEDIDO'#13#10'LEFT JOIN MAQUIN' +
      'A MAQ'#13#10'ON TAL.ID_MAQUINA = MAQ.ID'#13#10'WHERE P.TIPO_REG = '#39'P'#39#13#10'   AN' +
      'D I.QTD_RESTANTE > 0'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 80
    Top = 16
  end
  object dspTalaoPed: TDataSetProvider
    DataSet = sdsTalaoPed
    Left = 144
    Top = 16
  end
  object cdsTalaoPed: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTalaoPed'
    Left = 200
    Top = 16
    object cdsTalaoPedID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsTalaoPedNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object cdsTalaoPedDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object cdsTalaoPedID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object cdsTalaoPedNOMEPRODUTO: TStringField
      FieldName = 'NOMEPRODUTO'
      Size = 100
    end
    object cdsTalaoPedQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsTalaoPedTEMPO: TFloatField
      FieldName = 'TEMPO'
    end
    object cdsTalaoPedDTBAIXA: TDateField
      FieldName = 'DTBAIXA'
    end
    object cdsTalaoPedCOMPRIMENTO: TFloatField
      FieldName = 'COMPRIMENTO'
    end
    object cdsTalaoPedLARGURA: TFloatField
      FieldName = 'LARGURA'
    end
    object cdsTalaoPedESPESSURA: TFloatField
      FieldName = 'ESPESSURA'
    end
    object cdsTalaoPedDENSIDADE: TFloatField
      FieldName = 'DENSIDADE'
    end
    object cdsTalaoPedPESO: TFloatField
      FieldName = 'PESO'
    end
    object cdsTalaoPedNOME_TIPO_MATERIAL: TStringField
      FieldName = 'NOME_TIPO_MATERIAL'
      Size = 30
    end
    object cdsTalaoPedNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 60
    end
    object cdsTalaoPedITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsTalaoPedID_MAQUINA: TIntegerField
      FieldName = 'ID_MAQUINA'
    end
    object cdsTalaoPedNOME_MAQUINA: TStringField
      FieldName = 'NOME_MAQUINA'
      Size = 30
    end
    object cdsTalaoPedNOME_CLIENTE2: TStringField
      FieldName = 'NOME_CLIENTE2'
      Size = 30
    end
  end
  object dsTalaoPed: TDataSource
    DataSet = cdsTalaoPed
    Left = 256
    Top = 16
  end
  object sdsPedido_Real: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT P.ID, P.NUM_PEDIDO, P.ID_CLIENTE, P.dtemissao, I.tempo, I' +
      '.tempo_real, I.dtbaixa,'#13#10'I.vlr_unitario, I.vlr_unitario_real, PT' +
      'IP.fator_calculo, I.fator_calculo_real,'#13#10'PTIP.id_tipo_material, ' +
      'PTIP.comprimento, PTIP.largura, PTIP.espessura,'#13#10'PTIP.densidade,' +
      ' PTIP.vlr_unitario VLR_UNITARIO_MAT, PTIP.vlr_total VLR_TOTAL_MA' +
      'T,'#13#10'PTIP.peso, TMAT.NOME NOME_TIPO_MATERIAL, I.QTD, I.vlr_total,' +
      #13#10'(coalesce(I.vlr_unitario_real,0) * I.QTD) VLR_TOTAL_REAL, I.IT' +
      'EM,'#13#10'BT.vlr_maquina, MAQ.NOME NOME_MAQUINA,'#13#10'CASE'#13#10'  WHEN P.ID_C' +
      'LIENTE = (SELECT P2.id_cliente_consumidor FROM PARAMETROS P2) TH' +
      'EN P.nome_consumidor'#13#10'  ELSE CLI.fantasia'#13#10'  END NOME_CLIENTE2'#13#10 +
      'FROM PEDIDO P'#13#10'INNER JOIN PEDIDO_ITEM I'#13#10'ON P.ID = I.ID'#13#10'INNER J' +
      'OIN PEDIDO_ITEM_TIPO PTIP'#13#10'ON I.ID = PTIP.ID'#13#10'AND I.ITEM = PTIP.' +
      'ITEM'#13#10'INNER JOIN TIPO_MATERIAL TMAT'#13#10'ON PTIP.ID_TIPO_MATERIAL = ' +
      'TMAT.ID'#13#10'INNER JOIN PESSOA CLI'#13#10'ON P.ID_CLIENTE = CLI.CODIGO'#13#10'LE' +
      'FT JOIN BAIXA_TALAOPED BT'#13#10'ON I.ID = BT.ID_PEDIDO'#13#10'AND I.ITEM = ' +
      'BT.ITEM_PEDIDO'#13#10'LEFT JOIN MAQUINA MAQ'#13#10'ON BT.ID_MAQUINA = MAQ.ID' +
      #13#10'WHERE P.TIPO_REG = '#39'P'#39#13#10'  AND I.DTBAIXA IS NOT NULL'#13#10'  AND I.Q' +
      'TD > 0'#13#10#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 72
    Top = 96
  end
  object dspPedido_Real: TDataSetProvider
    DataSet = sdsPedido_Real
    Left = 136
    Top = 96
  end
  object cdsPedido_Real: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPedido_Real'
    Left = 192
    Top = 96
    object cdsPedido_RealID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsPedido_RealNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object cdsPedido_RealID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object cdsPedido_RealDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object cdsPedido_RealTEMPO: TFloatField
      FieldName = 'TEMPO'
    end
    object cdsPedido_RealTEMPO_REAL: TFloatField
      FieldName = 'TEMPO_REAL'
    end
    object cdsPedido_RealDTBAIXA: TDateField
      FieldName = 'DTBAIXA'
    end
    object cdsPedido_RealVLR_UNITARIO: TFloatField
      FieldName = 'VLR_UNITARIO'
    end
    object cdsPedido_RealVLR_UNITARIO_REAL: TFloatField
      FieldName = 'VLR_UNITARIO_REAL'
    end
    object cdsPedido_RealFATOR_CALCULO: TFloatField
      FieldName = 'FATOR_CALCULO'
    end
    object cdsPedido_RealFATOR_CALCULO_REAL: TFloatField
      FieldName = 'FATOR_CALCULO_REAL'
    end
    object cdsPedido_RealID_TIPO_MATERIAL: TIntegerField
      FieldName = 'ID_TIPO_MATERIAL'
    end
    object cdsPedido_RealCOMPRIMENTO: TFloatField
      FieldName = 'COMPRIMENTO'
    end
    object cdsPedido_RealLARGURA: TFloatField
      FieldName = 'LARGURA'
    end
    object cdsPedido_RealESPESSURA: TFloatField
      FieldName = 'ESPESSURA'
    end
    object cdsPedido_RealDENSIDADE: TFloatField
      FieldName = 'DENSIDADE'
    end
    object cdsPedido_RealVLR_UNITARIO_MAT: TFloatField
      FieldName = 'VLR_UNITARIO_MAT'
    end
    object cdsPedido_RealVLR_TOTAL_MAT: TFloatField
      FieldName = 'VLR_TOTAL_MAT'
    end
    object cdsPedido_RealPESO: TFloatField
      FieldName = 'PESO'
    end
    object cdsPedido_RealNOME_TIPO_MATERIAL: TStringField
      FieldName = 'NOME_TIPO_MATERIAL'
      Size = 30
    end
    object cdsPedido_RealQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsPedido_RealVLR_TOTAL: TFloatField
      FieldName = 'VLR_TOTAL'
    end
    object cdsPedido_RealVLR_TOTAL_REAL: TFloatField
      FieldName = 'VLR_TOTAL_REAL'
    end
    object cdsPedido_RealNOME_CLIENTE2: TStringField
      FieldName = 'NOME_CLIENTE2'
      Size = 30
    end
    object cdsPedido_RealITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsPedido_RealVLR_MAQUINA: TFloatField
      FieldName = 'VLR_MAQUINA'
    end
    object cdsPedido_RealNOME_MAQUINA: TStringField
      FieldName = 'NOME_MAQUINA'
      Size = 30
    end
  end
  object dsPedido_Real: TDataSource
    DataSet = cdsPedido_Real
    Left = 248
    Top = 96
  end
  object sdsTipo_Material: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT ID, NOME'#13#10'FROM TIPO_MATERIAL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 424
    Top = 104
  end
  object dspTipo_Material: TDataSetProvider
    DataSet = sdsTipo_Material
    Left = 488
    Top = 104
  end
  object cdsTipo_Material: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NOME'
    Params = <>
    ProviderName = 'dspTipo_Material'
    Left = 544
    Top = 104
    object cdsTipo_MaterialID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsTipo_MaterialNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
  end
  object dsTipo_Material: TDataSource
    DataSet = cdsTipo_Material
    Left = 600
    Top = 104
  end
  object sdsMaquina: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM MAQUINA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 424
    Top = 168
  end
  object dspMaquina: TDataSetProvider
    DataSet = sdsMaquina
    Left = 488
    Top = 168
  end
  object cdsMaquina: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NOME'
    Params = <>
    ProviderName = 'dspMaquina'
    Left = 544
    Top = 168
    object cdsMaquinaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsMaquinaNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
  end
  object dsMaquina: TDataSource
    DataSet = cdsMaquina
    Left = 600
    Top = 168
  end
end
