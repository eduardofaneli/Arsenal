unit uClasses;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, PngSpeedButton,
  Vcl.StdCtrls, PngBitBtn, Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids, uADStanExprFuncs, uADGUIxIntf,
  uADGUIxFormsWait, uADStanIntf, uADStanOption, uADStanError, uADPhysIntf,
  uADStanDef, uADStanPool, uADStanAsync, uADPhysManager, uADStanParam,
  uADDatSManager, uADDAptIntf, uADDAptManager, Data.DB, uADCompDataSet,
  uADCompClient, uADCompGUIx, uADPhysSQLite, uDmPrincipal;

type
  TMensagens = class
    procedure MensagemInformacao(AMensagem: String);
    procedure MensagemErro(AMensagem: string);
    function MensagemConfirmacao(AMensagem: String): Boolean;
    
  end;

  TQuery = class
    private
      FConnection: TADConnection;

      function GetQry: TADQuery;

    public
      constructor Create;

      function getSequenceAtleta: TADQuery;
      function InserirAtleta: TADQuery;
      function ExcluirAtleta: TADQuery;
      function AdicionarPosicaoJogador: TADQuery;
      function getPosicaoPrincipal: TADQuery;
      function ExcluirPosicaoJogador: TADQuery;

  end;

  TPosicoesAtleta = class (TComponent)
    private
    FPrincipal: String;
    FCodigoAtleta: Integer;
    FCodigoPosicao: Integer;

    published
      property CodigoPosicao : Integer read FCodigoPosicao write FCodigoPosicao;
      property CodigoAtleta  : Integer read FCodigoAtleta  write FCodigoAtleta;
      property Principal     : String  read FPrincipal     write FPrincipal;
  end;

  TAtleta = class
    private
    FOrgaoExpeditor: String;
    FRG: String;
    FDataNascimento: TDate;
    FEmail: String;
    FCodigoClube: Integer;
    FCodigo: Integer;
    FCPF: String;
    FStatus: Integer;
    FNome: String;
    FTelefone: String;

    FQueryAtleta: TQuery;
    FCodigoPosicao: Integer;
    FPosicaoPrincipal: String;
    
    public
      constructor Create;
      procedure CadastrarAtleta;
      procedure ExcluirAtleta;
      procedure AdicionarPosicaoJogador;
      procedure ExcluirPosicaoJogador;

      function setSequenceAtleta: Integer;
      function ExistePosicaoPrincipal: Boolean;

    published
      property Codigo           : Integer read FCodigo           write FCodigo         ;
      property CodigoClube      : Integer read FCodigoClube      write FCodigoClube    ;
      property Nome             : String  read FNome             write FNome           ;
      property Email            : String  read FEmail            write FEmail          ;
      property Telefone         : String  read FTelefone         write FTelefone       ;
      property DataNascimento   : TDate   read FDataNascimento   write FDataNascimento ;
      property RG               : String  read FRG               write FRG             ;
      property OrgaoExpeditor   : String  read FOrgaoExpeditor   write FOrgaoExpeditor ;
      property CPF              : String  read FCPF              write FCPF            ;
      property Status           : Integer read FStatus           write FStatus         ;
      property CodigoPosicao    : Integer read FCodigoPosicao    write FCodigoPosicao  ;
      property PosicaoPrincipal : String  read FPosicaoPrincipal write FPosicaoPrincipal;

  end;

implementation

{ TQuery }

function TQuery.AdicionarPosicaoJogador: TADQuery;
begin

  Result := GetQry;

  with Result do
  begin

    Close;
    SQL.Clear;
    SQL.Add(' insert into posicao_jogador (id_atleta, id_posicao, Principal)  ');
    SQL.Add(' values (:id_atleta, :id_posicao, :Principal); ');

  end;

end;

constructor TQuery.Create;
begin
  FConnection := dmPrincipal.Conexao;
end;

function TQuery.ExcluirAtleta: TADQuery;
begin

  Result := GetQry;

  with Result do
  begin

    Close;
    SQL.Clear;
    SQL.Add(' update Atleta ');
    SQL.Add(' set status = 3 ');
    SQL.Add(' where id = :id ');
  
  end;

end;

function TQuery.ExcluirPosicaoJogador: TADQuery;
begin

  Result := GetQry;

  with Result do
  begin

    Close;
    SQL.Clear;
    SQL.Add(' delete from posicao_jogador ');
    SQL.Add(' where id_atleta = :atleta ');
    SQL.Add('   and id_posicao = :posicao ');

  end;

end;

function TQuery.getPosicaoPrincipal: TADQuery;
begin

  Result := GetQry;

  with Result do
  begin

    Close;
    SQL.Clear;
    SQL.Add(' select * from posicao_jogador ');
    SQL.Add(' where id_atleta = :atleta ');
    SQL.Add('   and Principal = ''S'' ');

  end;

end;

function TQuery.GetQry: TADQuery;
begin
  Result := TADQuery.Create(nil);
  Result.Connection := FConnection;
end;

function TQuery.getSequenceAtleta: TADQuery;
begin

  Result := GetQry;

  with Result do
  begin

    Close;
    SQL.Clear;
    SQL.Add(' select * from sqlite_sequence where name = ''Atleta'' ');

  end;

end;

function TQuery.InserirAtleta: TADQuery;
begin

  Result := GetQry;

  with Result do
  begin

    Close;
    SQL.Clear;
    SQL.Add(' insert into Atleta ');
    SQL.Add('   (id ');
    SQL.Add('   ,id_clube ');
    SQL.Add('   ,nome ');
    SQL.Add('   ,email ');
    SQL.Add('   ,telefone ');
    SQL.Add('   ,data_nascimento ');
    SQL.Add('   ,rg ');
    SQL.Add('   ,orgao_expeditor ');
    SQL.Add('   ,cpf ');
    SQL.Add('   ,status) ');
    SQL.Add(' values   (:id ');
    SQL.Add(' 		 ,:id_clube ');
    SQL.Add(' 		 ,:nome ');
    SQL.Add(' 		 ,:email ');
    SQL.Add(' 		 ,:telefone ');
    SQL.Add(' 		 ,:data_nascimento ');
    SQL.Add(' 		 ,:rg ');
    SQL.Add(' 		 ,:orgao_expeditor ');
    SQL.Add(' 		 ,:cpf ');
    SQL.Add(' 		 ,:status) ');

  end;


end;

{ TMensagens }

function TMensagens.MensagemConfirmacao(AMensagem: String): Boolean;
begin
  Result := Application.MessageBox(pChar(AMensagem), 'Confirmação', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = mrYes;
end;

procedure TMensagens.MensagemErro(AMensagem: string);
begin
  Application.MessageBox(pChar(AMensagem), 'Erro', MB_ICONERROR + MB_OK);
end;

procedure TMensagens.MensagemInformacao(AMensagem: String);
begin
  Application.MessageBox(pChar(AMensagem), 'Informação', MB_ICONINFORMATION + MB_OK);
end;

{ TAtleta }

procedure TAtleta.AdicionarPosicaoJogador;
var
  qryAdicionarPosicaoJogador: TADQuery;
begin

  qryAdicionarPosicaoJogador := FQueryAtleta.AdicionarPosicaoJogador;

  try

    try

      qryAdicionarPosicaoJogador.ParamByName('ID_ATLETA').AsInteger := Codigo;
      qryAdicionarPosicaoJogador.ParamByName('ID_POSICAO').AsInteger := CodigoPosicao;
      qryAdicionarPosicaoJogador.ParamByName('PRINCIPAL').AsString := PosicaoPrincipal;

      qryAdicionarPosicaoJogador.ExecSQL;

    except
      on e:Exception do
        raise Exception.Create('Erro ao adicionar posição.' + sLineBreak + 'Motivo: ' + sLineBreak + e.Message);
    end;

  finally

    FreeAndNil(qryAdicionarPosicaoJogador);

  end;

end;

procedure TAtleta.CadastrarAtleta;
var
  qryCadastrarAtleta: TADQuery;
begin

  qryCadastrarAtleta := FQueryAtleta.InserirAtleta;

  try
  
    try
    
      qryCadastrarAtleta.ParamByName('ID').AsInteger := Codigo;
      qryCadastrarAtleta.ParamByName('ID_CLUBE').AsInteger := CodigoClube;
      qryCadastrarAtleta.ParamByName('NOME').AsString := Nome;
      qryCadastrarAtleta.ParamByName('EMAIL').AsString := Email;
      qryCadastrarAtleta.ParamByName('TELEFONE').AsString := Telefone;
      qryCadastrarAtleta.ParamByName('DATA_NASCIMENTO').AsDateTime := DataNascimento;
      qryCadastrarAtleta.ParamByName('RG').AsString := RG;
      qryCadastrarAtleta.ParamByName('ORGAO_EXPEDITOR').AsString := OrgaoExpeditor;
      qryCadastrarAtleta.ParamByName('CPF').AsString := CPF;
      qryCadastrarAtleta.ParamByName('STATUS').AsInteger := Status;

      qryCadastrarAtleta.ExecSQL;

    except
      on e: Exception do
        raise Exception.Create('Erro ao cadastrar atleta.' + sLineBreak + 'Motivo: ' + sLineBreak + e.Message);                
    
    end;

    
  finally

    FreeAndNil(qryCadastrarAtleta);
  
  end;

end;

constructor TAtleta.Create;
begin

  if not Assigned(FQueryAtleta) then
    FQueryAtleta := TQuery.Create;

end;

procedure TAtleta.ExcluirAtleta;
var
  qryExcluirAtleta: TADQuery;
begin

  qryExcluirAtleta := FQueryAtleta.ExcluirAtleta;

  try
  
    try
    
      qryExcluirAtleta.ParamByName('ID').AsInteger := Codigo;

      qryExcluirAtleta.ExecSQL;    
  
    except
      on E: Exception do
        raise Exception.Create('Erro ao excluir Atleta.' + sLineBreak + 'Motivo: ' + sLineBreak + e.Message);
  
    end;
    
  finally    
  
    FreeAndNil(qryExcluirAtleta);
  
  end;



end;

procedure TAtleta.ExcluirPosicaoJogador;
var
  qryExcluirPosicao: TADQuery;
begin

  qryExcluirPosicao := FQueryAtleta.ExcluirPosicaoJogador;

  try

    try

      qryExcluirPosicao.ParamByName('ATLETA').AsInteger  := Codigo;
      qryExcluirPosicao.ParamByName('POSICAO').AsInteger := CodigoPosicao;

      qryExcluirPosicao.ExecSQL;

    except
      on e:Exception do
        raise Exception.Create('Erro ao excluir posição do jogador.' + sLineBreak + 'Motivo: ' + sLineBreak + e.Message);

    end;

  finally

    FreeAndNil(qryExcluirPosicao);

  end;

end;

function TAtleta.ExistePosicaoPrincipal: Boolean;
var
  qryVerificar: TADQuery;
begin

  qryVerificar := FQueryAtleta.getPosicaoPrincipal;

  try

    qryVerificar.ParamByName('ATLETA').AsInteger := Codigo;

    qryVerificar.Open;

    Result := qryVerificar.RecordCount > 0;

  finally

    FreeAndNil(qryVerificar);

  end;


end;

function TAtleta.setSequenceAtleta: Integer;
var
  qrySequenciaAtleta: TADQuery;
begin

  qrySequenciaAtleta := FQueryAtleta.getSequenceAtleta;

  try
  
    qrySequenciaAtleta.Open;

    if qrySequenciaAtleta.RecordCount > 0 then
      Result := qrySequenciaAtleta.FieldByName('SEQ').AsInteger + 1
    else
      Result := 1;  
  
  finally

    FreeAndNil(qrySequenciaAtleta);
  
  end;

end;

end.

