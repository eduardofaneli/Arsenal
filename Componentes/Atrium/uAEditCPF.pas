unit uAEditCPF;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls, Vcl.Graphics, uAEdit,
  uAEditInteiro;

type
  TAEditCPF = class(TAEditInteiro)
  private
    FCPF : String;
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure ValidateCPF(CPF : String);
    { Private declarations }
  protected
    { Protected declarations }
  public
    constructor Create(AOwner : TComponent); override;
    { Public declarations }
  published
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Atrium', [TAEditCPF]);
end;

{ TAEditCPF }

constructor TAEditCPF.Create(AOwner: TComponent);
begin
  inherited;
  Self.MaxLength := 11;
  Self.InvalidColor := clRed;
end;

procedure TAEditCPF.DoEnter;
begin
  inherited;
  FCPF :=  StringReplace(Self.Text,'.',EmptyStr, [rfReplaceAll]);
  Self.Text := StringReplace(FCPF,'-',EmptyStr, [rfReplaceAll]);
  Self.MaxLength := 11;
end;

procedure TAEditCPF.DoExit;
begin
  inherited;
  if Trim(Self.Text) <> EmptyStr then
    ValidateCPF(Self.Text)
  else
    Self.Invalid := False;
end;

procedure TAEditCPF.ValidateCPF(CPF: String);
var
  Digit10, Digit11 : String;
  i, DigCalc, VerifDigit, Weight : Integer;
begin
  if (Length(CPF) < 11) or
     (CPF = '00000000000') or (CPF = '11111111111') or
     (CPF = '22222222222') or (CPF = '33333333333') or
     (CPF = '44444444444') or (CPF = '55555555555') or
     (CPF = '66666666666') or (CPF = '77777777777') or
     (CPF = '88888888888') or (CPF = '99999999999') then
  begin
    Self.Invalid := True;
    Exit;
  end;

  Self.MaxLength := 14;
  //  Calcular Primeiro Dígito Verificador
  DigCalc := 0;
  Weight := 10;
  for i := 1 to 9 do
  begin
    DigCalc := DigCalc + (StrToInt(CPF[i]) * Weight);
    Weight := Weight - 1;
  end;
  VerifDigit := 11 - (DigCalc mod 11);
  if ((VerifDigit = 10) or (VerifDigit = 11)) then
    Digit10 := '0'
  else
    Str(VerifDigit:1, Digit10);

  //  Calcular Segundo Dígito Verificador
  DigCalc := 0;
  Weight := 11;
  for i := 1 to 10 do
  begin
    DigCalc := DigCalc + (StrToInt(CPF[i]) * Weight);
    Weight := Weight - 1;
  end;
  VerifDigit := 11 - (DigCalc mod 11);
  if ((VerifDigit = 10) or (VerifDigit = 11)) then
    Digit11 := '0'
  else
    Str(VerifDigit:1, Digit11);

//  Valida os dígitos informados para verificar se estão de acordo com o cálculo

  if ((Digit10 = CPF[10]) and (Digit11 = CPF[11])) then
  begin
    Self.Invalid := False;
    Self.Text := copy(CPF, 1, 3) + '.' + copy(CPF, 4, 3) + '.' + copy(CPF, 7, 3) + '-' + copy(CPF, 10, 2);
  end
  else
  begin
    Self.Invalid := True;
  end;
end;

end.
