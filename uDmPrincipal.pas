unit uDmPrincipal;

interface

uses
  System.SysUtils, System.Classes, uADStanExprFuncs, uADGUIxIntf,
  uADGUIxFormsWait, uADStanIntf, uADStanOption, uADStanError, uADPhysIntf,
  uADStanDef, uADStanPool, uADStanAsync, uADPhysManager, uADStanParam,
  uADDatSManager, uADDAptIntf, uADDAptManager, Data.DB, uADCompDataSet,
  uADCompClient, uADCompGUIx, uADPhysSQLite;

type
  TdmPrincipal = class(TDataModule)
    Driver: TADPhysSQLiteDriverLink;
    Cursor: TADGUIxWaitCursor;
    Conexao: TADConnection;
    qryListaAtletas: TADQuery;
    dsListaAtletas: TDataSource;
    qryListaAtletasnome: TStringField;
    qryListaAtletasemail: TStringField;
    qryListaAtletastelefone: TStringField;
    qryListaAtletasdata_nascimento: TDateField;
    qryListaAtletasrg: TStringField;
    qryListaAtletasorgao_expeditor: TStringField;
    qryListaAtletascpf: TStringField;
    qryListaAtletasstatus: TIntegerField;
    qryListaAtletasdata_cadastro: TSQLTimeStampField;
    qryListaAtletasdata_atualizacao: TSQLTimeStampField;
    qryListaAtletasid: TADAutoIncField;
    qryListaAtletasid_clube: TIntegerField;
    qryPosicoes: TADQuery;
    dsPosicoes: TDataSource;
    qryListaAtletasDesc_Status: TStringField;
    qryPosicoesid: TIntegerField;
    qryPosicoesnome: TStringField;
    qryPosicoesSigla: TStringField;
    qryTvPosicoes: TADQuery;
    qryTvPosicoesid: TIntegerField;
    qryTvPosicoesnome: TStringField;
    qryTvPosicoesSigla: TStringField;
    qryTvPosicoesPrincipal: TStringField;
    qryTvPosicoesid_atleta: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

end.

