object dmPrincipal: TdmPrincipal
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 320
  Width = 464
  object dsListaAtletas: TDataSource
    DataSet = qryListaAtletas
    Left = 28
    Top = 116
  end
  object qryPosicoes: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select id'
      '      ,'#39'('#39' || Sigla ||'#39') '#39' ||nome as nome'
      '      ,Sigla'
      'from Posicao'
      
        'where id not in (select id_posicao from posicao_jogador where id' +
        '_atleta = :atleta)')
    Left = 92
    Top = 68
    ParamData = <
      item
        Name = 'ATLETA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryPosicoesid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPosicoesnome: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object qryPosicoesSigla: TStringField
      FieldName = 'Sigla'
      Origin = 'Sigla'
      Required = True
      Size = 3
    end
  end
  object dsPosicoes: TDataSource
    DataSet = qryPosicoes
    Left = 92
    Top = 116
  end
  object qryTvPosicoes: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select p.* '
      '      ,pj.Principal'
      '      ,pj.id_atleta      '
      'from posicao_jogador pj'
      'inner join Posicao p on p.id = pj.id_posicao'
      'where pj.id_atleta = :atleta')
    Left = 144
    Top = 68
    ParamData = <
      item
        Name = 'ATLETA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryTvPosicoesid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryTvPosicoesnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 255
    end
    object qryTvPosicoesSigla: TStringField
      FieldName = 'Sigla'
      Origin = 'Sigla'
      Required = True
      Size = 3
    end
    object qryTvPosicoesPrincipal: TStringField
      FieldName = 'Principal'
      Origin = 'Principal'
      Size = 1
    end
    object qryTvPosicoesid_atleta: TIntegerField
      FieldName = 'id_atleta'
      Origin = 'id_atleta'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object Cursor: TFDGUIxWaitCursor
    Left = 152
    Top = 16
  end
  object Driver: TFDPhysSQLiteDriverLink
    Left = 96
    Top = 16
  end
  object Conexao: TFDConnection
    Params.Strings = (
      'LockingMode=Normal'
      'Database=C:\Cuiaba Arsenal\Projeto\Arsenal\kaepernick.s3db'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 24
    Top = 16
  end
  object qryFichasAtleta: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select f.*'
      'from FichaAtleta F '
      'where F.id_atleta = :atleta'
      'order by f.data desc')
    Left = 24
    Top = 168
    ParamData = <
      item
        Name = 'ATLETA'
        DataType = ftInteger
        ParamType = ptInput
        Value = 2
      end>
    object qryFichasAtletaid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryFichasAtletaid_Atleta: TIntegerField
      FieldName = 'id_Atleta'
      Origin = 'id_Atleta'
      Required = True
    end
    object qryFichasAtletaAltura: TBCDField
      FieldName = 'Altura'
      Origin = 'Altura'
      Precision = 2
      Size = 2
    end
    object qryFichasAtletaPeso: TBCDField
      FieldName = 'Peso'
      Origin = 'Peso'
      Precision = 3
      Size = 3
    end
    object qryFichasAtletaBCDField40Jardas: TBCDField
      DisplayLabel = '40 Jardas'
      FieldName = '40Jardas'
      Origin = '"40Jardas"'
      Precision = 3
      Size = 2
    end
    object qryFichasAtletaShuttle: TBCDField
      FieldName = 'Shuttle'
      Origin = 'Shuttle'
      Precision = 3
      Size = 2
    end
    object qryFichasAtletaBCDField3Cones: TBCDField
      DisplayLabel = '3 Cones'
      FieldName = '3Cones'
      Origin = '"3Cones"'
      Precision = 3
      Size = 2
    end
    object qryFichasAtletaSaltoVertical: TBCDField
      DisplayLabel = 'Salto Vertical'
      FieldName = 'SaltoVertical'
      Origin = 'SaltoVertical'
      Precision = 1
      Size = 2
    end
    object qryFichasAtletaSaltoHorizontal: TBCDField
      DisplayLabel = 'Salto Horizontal'
      FieldName = 'SaltoHorizontal'
      Origin = 'SaltoHorizontal'
      Precision = 1
      Size = 2
    end
    object qryFichasAtletadata: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'data'
      Origin = 'data'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryFichasAtletaIMC: TBCDField
      FieldName = 'IMC'
      Origin = 'IMC'
      Precision = 2
      Size = 2
    end
  end
  object dsFichasAtleta: TDataSource
    DataSet = qryFichasAtleta
    Left = 88
    Top = 168
  end
  object qryListaAtletas: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select id'
      '      ,id_clube      '
      '      ,Nome'
      '      ,email'
      '      ,telefone'
      '      ,data_nascimento'
      '      ,rg'
      '      ,orgao_expeditor'
      '      ,cpf'
      '      ,status'
      '      ,case status'
      '      '#9' when 0 then '#39'Inativo'#39
      '      '#9' when 1 then '#39'Ativo'#39
      '      '#9' when 2 then '#39'Suspenso'#39
      '      '#9' when 3 then '#39'Exclu'#237'do'#39
      '      '#9' else'#9#39'Inv'#225'lido'#39
      '       end as Desc_Status'#9
      '      ,data_cadastro'
      '      ,data_atualizacao'
      '      ,Apelido'
      'from Atleta'
      'where status <> 3')
    Left = 24
    Top = 64
    object qryListaAtletasid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryListaAtletasid_clube: TIntegerField
      FieldName = 'id_clube'
      Origin = 'id_clube'
      Required = True
    end
    object qryListaAtletasnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 255
    end
    object qryListaAtletasemail: TStringField
      FieldName = 'email'
      Origin = 'email'
      Required = True
      Size = 255
    end
    object qryListaAtletastelefone: TStringField
      FieldName = 'telefone'
      Origin = 'telefone'
      Required = True
      Size = 30
    end
    object qryListaAtletasdata_nascimento: TDateField
      FieldName = 'data_nascimento'
      Origin = 'data_nascimento'
      Required = True
    end
    object qryListaAtletasrg: TStringField
      FieldName = 'rg'
      Origin = 'rg'
      Required = True
      Size = 30
    end
    object qryListaAtletasorgao_expeditor: TStringField
      FieldName = 'orgao_expeditor'
      Origin = 'orgao_expeditor'
      Required = True
      Size = 30
    end
    object qryListaAtletascpf: TStringField
      FieldName = 'cpf'
      Origin = 'cpf'
      Required = True
      Size = 14
    end
    object qryListaAtletasstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
      Required = True
    end
    object qryListaAtletasDesc_Status: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'Desc_Status'
      Origin = 'Desc_Status'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object qryListaAtletasdata_cadastro: TSQLTimeStampField
      FieldName = 'data_cadastro'
      Origin = 'data_cadastro'
      Required = True
    end
    object qryListaAtletasdata_atualizacao: TSQLTimeStampField
      FieldName = 'data_atualizacao'
      Origin = 'data_atualizacao'
    end
    object qryListaAtletasApelido: TStringField
      FieldName = 'Apelido'
      Origin = 'Apelido'
      Size = 100
    end
  end
end
