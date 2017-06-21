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
  uADCompClient, uADCompGUIx, uADPhysSQLite, uDmPrincipal, System.Generics.Collections,
  System.Math;

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
      function AdicionarFichaAtleta: TADQuery;
      function getAltura: TADQuery;
      function getPeso: TADQuery;
      function get40Jardas: TADQuery;
      function getShuttle: TADQuery;
      function get3Cones: TADQuery;
      function getSaltoVertical: TADQuery;
      function getSaltoHorizontal: TADQuery;
      function getIMC: TADQuery;

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

  TMelhorMedicao = class
    private
    FDataPeso: TDate;
    FDataShuttle: TDate;
    FData40Jardas: TDate;
    FPeso: Double;
    FShuttle: Double;
    FDataSaltoHorizontal: TDate;
    FSaltoHorizontal: Double;
    FDataAltura: TDate;
    FData3Cones: TDate;
    FAltura: Double;
    FDataIMC: TDate;
    FIMC: Double;
    FD40Jardas: Double;
    FD3Cones: Double;
    FDataSaltoVertical: TDate;
    FSaltoVertical: Double;
    FDescricaoIMC: string;

    published
      property Altura              : Double read FAltura              write FAltura              ;
      property DataAltura          : TDate  read FDataAltura          write FDataAltura          ;
      property Peso                : Double read FPeso                write FPeso                ;
      property DataPeso            : TDate  read FDataPeso            write FDataPeso            ;
      property IMC                 : Double read FIMC                 write FIMC                 ;
      property DescricaoIMC        : string read FDescricaoIMC        write FDescricaoIMC        ;
      property DataIMC             : TDate  read FDataIMC             write FDataIMC             ;
      property D40Jardas           : Double read FD40Jardas           write FD40Jardas           ;
      property Data40Jardas        : TDate  read FData40Jardas        write FData40Jardas        ;
      property Shuttle             : Double read FShuttle             write FShuttle             ;
      property DataShuttle         : TDate  read FDataShuttle         write FDataShuttle         ;
      property D3Cones             : Double read FD3Cones             write FD3Cones             ;
      property Data3Cones          : TDate  read FData3Cones          write FData3Cones          ;
      property SaltoVertical       : Double read FSaltoVertical       write FSaltoVertical       ;
      property DataSaltoVertical   : TDate  read FDataSaltoVertical   write FDataSaltoVertical   ;
      property SaltoHorizontal     : Double read FSaltoHorizontal     write FSaltoHorizontal     ;
      property DataSaltoHorizontal : TDate  read FDataSaltoHorizontal write FDataSaltoHorizontal ;

  end;
  TUltimaMedicao = class
    private
    FDataPeso: TDate;
    FDataShuttle: TDate;
    FData40Jardas: TDate;
    FPeso: Double;
    FShuttle: Double;
    FDataSaltoHorizontal: TDate;
    FSaltoHorizontal: Double;
    FDataAltura: TDate;
    FData3Cones: TDate;
    FAltura: Double;
    FDataIMC: TDate;
    FIMC: Double;
    FD40Jardas: Double;
    FD3Cones: Double;
    FDataSaltoVertical: TDate;
    FSaltoVertical: Double;
    FDescricaoIMC: string;

    published
      property Altura              : Double read FAltura              write FAltura              ;
      property DataAltura          : TDate  read FDataAltura          write FDataAltura          ;
      property Peso                : Double read FPeso                write FPeso                ;
      property DataPeso            : TDate  read FDataPeso            write FDataPeso            ;
      property IMC                 : Double read FIMC                 write FIMC                 ;
      property DescricaoIMC        : string read FDescricaoIMC        write FDescricaoIMC        ;
      property DataIMC             : TDate  read FDataIMC             write FDataIMC             ;
      property D40Jardas           : Double read FD40Jardas           write FD40Jardas           ;
      property Data40Jardas        : TDate  read FData40Jardas        write FData40Jardas        ;
      property Shuttle             : Double read FShuttle             write FShuttle             ;
      property DataShuttle         : TDate  read FDataShuttle         write FDataShuttle         ;
      property D3Cones             : Double read FD3Cones             write FD3Cones             ;
      property Data3Cones          : TDate  read FData3Cones          write FData3Cones          ;
      property SaltoVertical       : Double read FSaltoVertical       write FSaltoVertical       ;
      property DataSaltoVertical   : TDate  read FDataSaltoVertical   write FDataSaltoVertical   ;
      property SaltoHorizontal     : Double read FSaltoHorizontal     write FSaltoHorizontal     ;
      property DataSaltoHorizontal : TDate  read FDataSaltoHorizontal write FDataSaltoHorizontal ;

  end;

  TFichaAtleta = class
    private
      FPeso: Double;
      FShuttle: Double;
      FSaltoHorizontal: Double;
      FAltura: Double;
      FIMC: Double;
      F40Jardas: Double;
      F3Cones: Double;
      FData: TDate;
      FSaltoVertical: Double;

    public
      FMelhorMedicao : TMelhorMedicao;
      FUltimaMedicao : TUltimaMedicao;
      constructor Create;

    published
      property Altura          : Double read FAltura          write FAltura         ;
      property Peso            : Double read FPeso            write FPeso           ;
      property IMC             : Double read FIMC             write FIMC            ;
      property D40Jardas       : Double read F40Jardas        write F40Jardas       ;
      property Shuttle         : Double read FShuttle         write FShuttle        ;
      property D3Cones         : Double read F3Cones          write F3Cones         ;
      property SaltoVertical   : Double read FSaltoVertical   write FSaltoVertical  ;
      property SaltoHorizontal : Double read FSaltoHorizontal write FSaltoHorizontal;
      property Data            : TDate  read FData            write FData           ;
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
      FFichaAtleta: TFichaAtleta;
      constructor Create;
      procedure CadastrarAtleta;
      procedure ExcluirAtleta;
      procedure AdicionarPosicaoJogador;
      procedure ExcluirPosicaoJogador;
      procedure InserirFichaAtleta;
      procedure GetIMC(APeso, AAltura: Double);
      procedure GetMelhorMedicao;
      procedure GetUltimaMedicao;

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

function TQuery.AdicionarFichaAtleta: TADQuery;
begin

  Result := GetQry;

  with Result do
  begin

    Close;
    SQL.Clear;
    SQL.Add(' INSERT INTO FichaAtleta ');
    SQL.Add('   (id_Atleta ');
    SQL.Add('   ,Altura ');
    SQL.Add('   ,Peso ');
    SQL.Add('   ,"40Jardas" ');
    SQL.Add('   ,Shuttle ');
    SQL.Add('   ,"3Cones" ');
    SQL.Add('   ,SaltoVertical ');
    SQL.Add('   ,SaltoHorizontal ');
    SQL.Add('   ,IMC)');
    SQL.Add(' VALUES(:id_Atleta ');
    SQL.Add('       ,:Altura ');
    SQL.Add('       ,:Peso ');
    SQL.Add('       ,:40Jardas ');
    SQL.Add('       ,:Shuttle ');
    SQL.Add('       ,:3Cones ');
    SQL.Add('       ,:SaltoVertical ');
    SQL.Add('       ,:SaltoHorizontal ');
    SQL.Add('       ,:IMC)');
  end;

end;

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

function TQuery.get3Cones: TADQuery;
begin

  Result := GetQry;

  with Result do
  begin

    Close;
    SQL.Clear;
    SQL.Add(' select "3Cones", "DATA"  ');
    SQL.Add(' from FichaAtleta ');
    SQL.Add(' where "3Cones" is not null ');

  end;

end;

function TQuery.get40Jardas: TADQuery;
begin

  Result := GetQry;

  with Result do
  begin

    Close;
    SQL.Clear;
    SQL.Add(' select "40Jardas", "DATA" ');
    SQL.Add(' from FichaAtleta ');
    SQL.Add(' where "40Jardas" is not null ');

  end;

end;

function TQuery.getAltura: TADQuery;
begin

  Result := GetQry;

  with Result do
  begin

    Close;
    SQL.Clear;
    SQL.Add(' select Altura, "DATA"  ');
    SQL.Add(' from FichaAtleta ');
    SQL.Add(' where Altura is not null ');

  end;

end;

function TQuery.getIMC: TADQuery;
begin

  Result := GetQry;

  with Result do
  begin

    Close;
    SQL.Clear;
    SQL.Add(' select IMC  ');
    SQL.Add(' 	   ,case  ');
    SQL.Add(' 	     when IMC < 17 then  '' | 3 - Muito abaixo''	 ');
    SQL.Add(' 	     when IMC >= 17 and IMC <= 18.49 then '' | 1 - Abaixo'' ');
    SQL.Add(' 	     when IMC >= 18.5 and IMC < 25 then '' | 0 - Normal'' ');
    SQL.Add(' 	     when IMC >= 25 and IMC < 30 then '' | 2 - Acima'' ');
    SQL.Add(' 	     when IMC >= 30 and IMC < 35 then '' | 4 - Obesidade I'' ');
    SQL.Add(' 	     when IMC >= 35 and IMC < 40 then '' | 5 - Obesidade II'' ');
    SQL.Add(' 	     when IMC >= 40 then '' | 6 - Obesidade III'' ');
    SQL.Add(' 	    end as Descricao	       ');
    SQL.Add('         ,"DATA"  ');
    SQL.Add(' from FichaAtleta ');
    SQL.Add(' where IMC is not null ');

  end;

end;

function TQuery.getPeso: TADQuery;
begin

  Result := GetQry;

  with Result do
  begin

    Close;
    SQL.Clear;
    SQL.Add(' select Peso, "DATA" ');
    SQL.Add(' from FichaAtleta ');
    SQL.Add(' where Peso is not null ');

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

function TQuery.getSaltoHorizontal: TADQuery;
begin

  Result := GetQry;

  with Result do
  begin

    Close;
    SQL.Clear;
    SQL.Add(' select SaltoHorizontal, "DATA"  ');
    SQL.Add(' from FichaAtleta ');
    SQL.Add(' where SaltoHorizontal is not null ');

  end;

end;

function TQuery.getSaltoVertical: TADQuery;
begin

  Result := GetQry;

  with Result do
  begin

    Close;
    SQL.Clear;
    SQL.Add(' select SaltoVertical, "DATA"  ');
    SQL.Add(' from FichaAtleta ');
    SQL.Add(' where SaltoVertical is not null ');
  end;

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

function TQuery.getShuttle: TADQuery;
begin

  Result := GetQry;

  with Result do
  begin

    Close;
    SQL.Clear;
    SQL.Add(' select Shuttle, "DATA"  ');
    SQL.Add(' from FichaAtleta ');
    SQL.Add(' where Shuttle is not null ');

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

  FFichaAtleta := TFichaAtleta.Create;

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

procedure TAtleta.GetIMC(APeso, AAltura: Double);
begin

  FFichaAtleta.IMC := RoundTo(APeso / (AAltura * AAltura), -1);

end;

procedure TAtleta.GetMelhorMedicao;
var
  qryMelhorMedicao: TADQuery;
begin

  qryMelhorMedicao := FQueryAtleta.getAltura;
  try
    qryMelhorMedicao.SQL.Add(' order by 1 desc limit 1 ');
    qryMelhorMedicao.Open;

    FFichaAtleta.FMelhorMedicao.Altura     := qryMelhorMedicao.FieldByName('Altura').AsFloat;
    FFichaAtleta.FMelhorMedicao.DataAltura := qryMelhorMedicao.FieldByName('DATA').AsDateTime;
  finally
    FreeAndNil(qryMelhorMedicao);
  end;

  qryMelhorMedicao := FQueryAtleta.getPeso;
  try
    qryMelhorMedicao.SQL.Add(' order by 1 limit 1 ');
    qryMelhorMedicao.Open;

    FFichaAtleta.FMelhorMedicao.Peso     := qryMelhorMedicao.FieldByName('Peso').AsFloat;
    FFichaAtleta.FMelhorMedicao.DataPeso := qryMelhorMedicao.FieldByName('DATA').AsDateTime;
  finally
    FreeAndNil(qryMelhorMedicao);
  end;

  qryMelhorMedicao := FQueryAtleta.getIMC;
  try
    qryMelhorMedicao.SQL.Add(' order by 2 limit 1 ');
    qryMelhorMedicao.Open;

    FFichaAtleta.FMelhorMedicao.IMC := qryMelhorMedicao.FieldByName('IMC').AsFloat;
    FFichaAtleta.FMelhorMedicao.DescricaoIMC := qryMelhorMedicao.FieldByName('DESCRICAO').AsString;
    FFichaAtleta.FMelhorMedicao.DataIMC := qryMelhorMedicao.FieldByName('DATA').AsDateTime;
  finally
    FreeAndNil(qryMelhorMedicao);
  end;

  qryMelhorMedicao := FQueryAtleta.get40Jardas;
  try
    qryMelhorMedicao.SQL.Add(' order by 1 limit 1 ');
    qryMelhorMedicao.Open;

    FFichaAtleta.FMelhorMedicao.D40Jardas     := qryMelhorMedicao.FieldByName('40jardas').AsFloat;
    FFichaAtleta.FMelhorMedicao.Data40Jardas := qryMelhorMedicao.FieldByName('DATA').AsDateTime;
  finally
    FreeAndNil(qryMelhorMedicao);
  end;

  qryMelhorMedicao := FQueryAtleta.getShuttle;
  try
    qryMelhorMedicao.SQL.Add(' order by 1 limit 1 ');
    qryMelhorMedicao.Open;

    FFichaAtleta.FMelhorMedicao.Shuttle     := qryMelhorMedicao.FieldByName('Shuttle').AsFloat;
    FFichaAtleta.FMelhorMedicao.DataShuttle := qryMelhorMedicao.FieldByName('DATA').AsDateTime;
  finally
    FreeAndNil(qryMelhorMedicao);
  end;

  qryMelhorMedicao := FQueryAtleta.get3Cones;
  try
    qryMelhorMedicao.SQL.Add(' order by 1 limit 1 ');
    qryMelhorMedicao.Open;

    FFichaAtleta.FMelhorMedicao.D3Cones     := qryMelhorMedicao.FieldByName('3Cones').AsFloat;
    FFichaAtleta.FMelhorMedicao.Data3Cones := qryMelhorMedicao.FieldByName('DATA').AsDateTime;
  finally
    FreeAndNil(qryMelhorMedicao);
  end;

  qryMelhorMedicao := FQueryAtleta.getSaltoVertical;
  try
    qryMelhorMedicao.SQL.Add(' order by 1 desc limit 1 ');
    qryMelhorMedicao.Open;

    FFichaAtleta.FMelhorMedicao.SaltoVertical     := qryMelhorMedicao.FieldByName('SaltoVertical').AsFloat;
    FFichaAtleta.FMelhorMedicao.DataSaltoVertical := qryMelhorMedicao.FieldByName('DATA').AsDateTime;
  finally
    FreeAndNil(qryMelhorMedicao);
  end;

  qryMelhorMedicao := FQueryAtleta.getSaltoHorizontal;
  try
    qryMelhorMedicao.SQL.Add(' order by 1 desc limit 1 ');
    qryMelhorMedicao.Open;

    FFichaAtleta.FMelhorMedicao.SaltoHorizontal     := qryMelhorMedicao.FieldByName('SaltoHorizontal').AsFloat;
    FFichaAtleta.FMelhorMedicao.DataSaltoHorizontal := qryMelhorMedicao.FieldByName('DATA').AsDateTime;
  finally
    FreeAndNil(qryMelhorMedicao);
  end;

end;

procedure TAtleta.GetUltimaMedicao;
var
  qryUltimaMedicao: TADQuery;
begin

  qryUltimaMedicao := FQueryAtleta.getAltura;
  try
    qryUltimaMedicao.SQL.Add(' order by 2 desc limit 1 ');
    qryUltimaMedicao.Open;

    FFichaAtleta.FUltimaMedicao.Altura     := qryUltimaMedicao.FieldByName('Altura').AsFloat;
    FFichaAtleta.FUltimaMedicao.DataAltura := qryUltimaMedicao.FieldByName('DATA').AsDateTime;
  finally
    FreeAndNil(qryUltimaMedicao);
  end;

  qryUltimaMedicao := FQueryAtleta.getPeso;
  try
    qryUltimaMedicao.SQL.Add(' order by 2 desc limit 1 ');
    qryUltimaMedicao.Open;

    FFichaAtleta.FUltimaMedicao.Peso     := qryUltimaMedicao.FieldByName('Peso').AsFloat;
    FFichaAtleta.FUltimaMedicao.DataPeso := qryUltimaMedicao.FieldByName('DATA').AsDateTime;
  finally
    FreeAndNil(qryUltimaMedicao);
  end;

  qryUltimaMedicao := FQueryAtleta.getIMC;
  try
    qryUltimaMedicao.SQL.Add(' order by 3 desc limit 1 ');
    qryUltimaMedicao.Open;

    FFichaAtleta.FUltimaMedicao.IMC := qryUltimaMedicao.FieldByName('IMC').AsFloat;
    FFichaAtleta.FUltimaMedicao.DescricaoIMC := qryUltimaMedicao.FieldByName('DESCRICAO').AsString;
    FFichaAtleta.FUltimaMedicao.DataIMC := qryUltimaMedicao.FieldByName('DATA').AsDateTime;
  finally
    FreeAndNil(qryUltimaMedicao);
  end;

  qryUltimaMedicao := FQueryAtleta.get40Jardas;
  try
    qryUltimaMedicao.SQL.Add(' order by 2 desc limit 1 ');
    qryUltimaMedicao.Open;

    FFichaAtleta.FUltimaMedicao.D40Jardas     := qryUltimaMedicao.FieldByName('40jardas').AsFloat;
    FFichaAtleta.FUltimaMedicao.Data40Jardas := qryUltimaMedicao.FieldByName('DATA').AsDateTime;
  finally
    FreeAndNil(qryUltimaMedicao);
  end;

  qryUltimaMedicao := FQueryAtleta.getShuttle;
  try
    qryUltimaMedicao.SQL.Add(' order by 2 desc limit 1 ');
    qryUltimaMedicao.Open;

    FFichaAtleta.FUltimaMedicao.Shuttle     := qryUltimaMedicao.FieldByName('Shuttle').AsFloat;
    FFichaAtleta.FUltimaMedicao.DataShuttle := qryUltimaMedicao.FieldByName('DATA').AsDateTime;
  finally
    FreeAndNil(qryUltimaMedicao);
  end;

  qryUltimaMedicao := FQueryAtleta.get3Cones;
  try
    qryUltimaMedicao.SQL.Add(' order by 2 desc limit 1 ');
    qryUltimaMedicao.Open;

    FFichaAtleta.FUltimaMedicao.D3Cones     := qryUltimaMedicao.FieldByName('3Cones').AsFloat;
    FFichaAtleta.FUltimaMedicao.Data3Cones := qryUltimaMedicao.FieldByName('DATA').AsDateTime;
  finally
    FreeAndNil(qryUltimaMedicao);
  end;

  qryUltimaMedicao := FQueryAtleta.getSaltoVertical;
  try
    qryUltimaMedicao.SQL.Add(' order by 2 desc limit 1 ');
    qryUltimaMedicao.Open;

    FFichaAtleta.FUltimaMedicao.SaltoVertical     := qryUltimaMedicao.FieldByName('SaltoVertical').AsFloat;
    FFichaAtleta.FUltimaMedicao.DataSaltoVertical := qryUltimaMedicao.FieldByName('DATA').AsDateTime;
  finally
    FreeAndNil(qryUltimaMedicao);
  end;

  qryUltimaMedicao := FQueryAtleta.getSaltoHorizontal;
  try
    qryUltimaMedicao.SQL.Add(' order by 2 desc limit 1 ');
    qryUltimaMedicao.Open;

    FFichaAtleta.FUltimaMedicao.SaltoHorizontal     := qryUltimaMedicao.FieldByName('SaltoHorizontal').AsFloat;
    FFichaAtleta.FUltimaMedicao.DataSaltoHorizontal := qryUltimaMedicao.FieldByName('DATA').AsDateTime;
  finally
    FreeAndNil(qryUltimaMedicao);
  end;

end;

procedure TAtleta.InserirFichaAtleta;
var
  qryInserirFicha: TADQuery;
begin

  qryInserirFicha := FQueryAtleta.AdicionarFichaAtleta;

  try

    try

      qryInserirFicha.ParamByName('ID_ATLETA').AsInteger := Codigo;

      if FFichaAtleta.Altura <> 0 then
        qryInserirFicha.ParamByName('ALTURA').AsFloat := FFichaAtleta.Altura
      else
      begin
        qryInserirFicha.ParamByName('ALTURA').Clear;
        qryInserirFicha.ParamByName('ALTURA').DataType := ftFloat;
      end;

      if FFichaAtleta.Peso <> 0 then
        qryInserirFicha.ParamByName('PESO').AsFloat := FFichaAtleta.Peso
      else
      begin
        qryInserirFicha.ParamByName('PESO').Clear;
        qryInserirFicha.ParamByName('PESO').DataType := ftFloat;
      end;

      if (FFichaAtleta.Peso <> 0) and (FFichaAtleta.Altura <> 0) then
        qryInserirFicha.ParamByName('IMC').AsFloat := FFichaAtleta.IMC
      else
      begin
        qryInserirFicha.ParamByName('IMC').Clear;
        qryInserirFicha.ParamByName('IMC').DataType := ftFloat;
      end;


      if FFichaAtleta.D40Jardas <> 0 then
        qryInserirFicha.ParamByName('40JARDAS').AsFloat := FFichaAtleta.D40Jardas
      else
      begin
        qryInserirFicha.ParamByName('40JARDAS').Clear;
        qryInserirFicha.ParamByName('40JARDAS').DataType := ftFloat;
      end;

      if FFichaAtleta.Shuttle <> 0 then
        qryInserirFicha.ParamByName('SHUTTLE').AsFloat := FFichaAtleta.Shuttle
      else
      begin
        qryInserirFicha.ParamByName('SHUTTLE').Clear;
        qryInserirFicha.ParamByName('SHUTTLE').DataType := ftFloat;
      end;

      if FFichaAtleta.D3Cones <> 0 then
        qryInserirFicha.ParamByName('3CONES').AsFloat := FFichaAtleta.D3Cones
      else
      begin
        qryInserirFicha.ParamByName('3CONES').Clear;
        qryInserirFicha.ParamByName('3CONES').DataType := ftFloat;
      end;

      if FFichaAtleta.SaltoVertical <> 0 then
        qryInserirFicha.ParamByName('SALTOVERTICAL').AsFloat := FFichaAtleta.SaltoVertical
      else
      begin
        qryInserirFicha.ParamByName('SALTOVERTICAL').Clear;
        qryInserirFicha.ParamByName('SALTOVERTICAL').DataType := ftFloat;
      end;

      if FFichaAtleta.SaltoHorizontal <> 0 then
        qryInserirFicha.ParamByName('SALTOHORIZONTAL').AsFloat := FFichaAtleta.SaltoHorizontal
      else
      begin
        qryInserirFicha.ParamByName('SALTOHORIZONTAL').Clear;
        qryInserirFicha.ParamByName('SALTOHORIZONTAL').DataType := ftFloat;
      end;

      qryInserirFicha.ExecSQL;

    except
      on e:Exception do
        raise Exception.Create('Erro ao inserir ficha do atleta' + sLineBreak + 'Motivo:' + sLineBreak + e.Message);

    end;

  finally

    FreeAndNil(qryInserirFicha);

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

{ TFichaAtleta }

constructor TFichaAtleta.Create;
begin

  FMelhorMedicao := TMelhorMedicao.Create;
  FUltimaMedicao := TUltimaMedicao.Create
  ;
end;

end.

