unit uDmPrincipal;

interface

uses
  System.SysUtils, System.Classes, uADStanExprFuncs, uADGUIxIntf,
  uADGUIxFormsWait, uADStanIntf, uADStanOption, uADStanError, uADPhysIntf,
  uADStanDef, uADStanPool, uADStanAsync, uADPhysManager, Data.DB,
  uADCompClient, uADCompGUIx, uADPhysSQLite, Vcl.Forms, Winapi.Windows,
  uADStanParam, uADDatSManager, uADDAptIntf, uADDAptManager, uADCompDataSet;

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
    qryPosicoesid: TIntegerField;
    qryPosicoesnome: TStringField;
    qryPosicoesSigla: TStringField;
    qryTvPosicoes: TADQuery;
    qryTvPosicoesid: TIntegerField;
    qryTvPosicoesnome: TStringField;
    qryTvPosicoesSigla: TStringField;
    qryTvPosicoesPrincipal: TStringField;
    qryTvPosicoesid_atleta: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
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

procedure TdmPrincipal.DataModuleCreate(Sender: TObject);
  function ExtrairResource(ResourceName, ResType, Filename: string): Boolean;
    var
    Resource: TResourceStream;
  begin
    Resource := TResourceStream.create(HInstance, ResourceName, PWideChar(ResType));
    try
      Resource.SaveToFile(Filename);
      result := FileExists(Filename)
    finally
      Resource.Free;
    end;
  end;
var
  ResourceName: string;
begin

  try

    if not FileExists('kaepernick.s3db') then
    begin

      ResourceName := ExtractFilePath(ParamStr(0));
      if ResourceName[Length(ResourceName)] <> '\' then
        ResourceName := ResourceName + '\';
      ResourceName := ResourceName + 'kaepernick.s3db';

      if not ExtrairResource('kaepernick', 's3db', ResourceName) Then
        Application.MessageBox(PChar('Falha ao extrair ' + ResourceName), 'Erro', MB_ICONERROR + MB_OK);

    end;

    Conexao.Connected := False;

    Conexao.Params.Values['Database'] := 'kaepernick.s3db';

    Conexao.Connected := True;

  except
    on e:Exception do
      Application.MessageBox(PChar('Falha ao conectar no Banco de Dados' + sLineBreak + 'Motivo:' + sLineBreak + e.Message),'Erro', MB_ICONERROR);

  end;

end;

end.

