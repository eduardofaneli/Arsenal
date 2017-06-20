object dmPrincipal: TdmPrincipal
  OldCreateOrder = False
  Left = 417
  Top = 187
  Height = 320
  Width = 464
  object Driver: TADPhysSQLiteDriverLink
    Left = 112
    Top = 8
  end
  object Cursor: TADGUIxWaitCursor
    Left = 72
    Top = 8
  end
  object Conexao: TADConnection
    Params.Strings = (
      'Database=C:\Eduardo Faneli\GIT\Arsenal\BD\kaepernick.s3db'
      'LockingMode=Normal'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 32
    Top = 8
  end
  object qryListaAtletas: TADQuery
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
      '       end as Desc_Status'#9
      '      ,data_cadastro'
      '      ,data_atualizacao'
      'from Atleta'
      'where status <> 3')
    Left = 28
    Top = 68
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
    object qryListaAtletasdata_cadastro: TSQLTimeStampField
      FieldName = 'data_cadastro'
      Origin = 'data_cadastro'
      Required = True
    end
    object qryListaAtletasdata_atualizacao: TSQLTimeStampField
      FieldName = 'data_atualizacao'
      Origin = 'data_atualizacao'
    end
    object qryListaAtletasid: TADAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object qryListaAtletasid_clube: TIntegerField
      FieldName = 'id_clube'
      Origin = 'id_clube'
      Required = True
    end
    object qryListaAtletasDesc_Status: TStringField
      FieldName = 'Desc_Status'
      Size = 255
    end
  end
  object dsListaAtletas: TDataSource
    DataSet = qryListaAtletas
    Left = 28
    Top = 116
  end
  object qryPosicoes: TADQuery
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
    object qryPosicoesnome: TStringField
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
  object qryTvPosicoes: TADQuery
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
end
