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
    qryListaAtletasDesc_Status: TWideStringField;
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

