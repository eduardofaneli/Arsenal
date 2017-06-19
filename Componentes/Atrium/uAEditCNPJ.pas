unit uAEditCNPJ;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls, Vcl.Graphics, uAEdit,
  uAEditInteiro;

type
  TAEditCNPJ = class(TAEditInteiro)
  private
    FCNPJ : String;
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure ValidateCNPJ(CNPJ : String);
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
  RegisterComponents('Atrium', [TAEditCNPJ]);
end;

{ TAEditCNPJ }

constructor TAEditCNPJ.Create(AOwner: TComponent);
begin
  inherited;
  Self.MaxLength := 14;
  Self.InvalidColor := clRed;
end;

procedure TAEditCNPJ.DoEnter;
begin
  inherited;
  FCNPJ :=  StringReplace(Self.Text,'.',EmptyStr, [rfReplaceAll]);
  Self.Text := StringReplace(FCNPJ,'-',EmptyStr, [rfReplaceAll]);
end;

procedure TAEditCNPJ.DoExit;
begin
  inherited;
  if Trim(Self.Text) <> EmptyStr then
    ValidateCNPJ(Trim(Self.Text))
  else
    Self.Invalid := False;
end;

procedure TAEditCNPJ.ValidateCNPJ(CNPJ: String);
var
  Digit13, Digit14 : String;
  i, DigCalc, VerifDigit, Weight : Integer;
begin
  if (Length(CNPJ) < 14) or
     (CNPJ = '00000000000000') or (CNPJ = '11111111111111') or
     (CNPJ = '22222222222222') or (CNPJ = '33333333333333') or
     (CNPJ = '44444444444444') or (CNPJ = '55555555555555') or
     (CNPJ = '66666666666666') or (CNPJ = '77777777777777') or
     (CNPJ = '88888888888888') or (CNPJ = '99999999999999') then
  begin
    Self.Invalid := True;
    Exit;
  end;

  //  Calcular Primeiro Dígito Verificador
  DigCalc := 0;
  Weight := 2;
  for i := 12 downto 1 do
  begin
    DigCalc := DigCalc + (StrToInt(CNPJ[i]) * Weight);
    Weight := Weight + 1;
    if (Weight = 10) then
      Weight := 2;
  end;
  VerifDigit := (DigCalc mod 11);
  if ((VerifDigit = 0) or (VerifDigit = 1)) then
    Digit13 := '0'
  else
    Str((11 - VerifDigit):1, Digit13);

  //  Calcular Segundo Dígito Verificador
  DigCalc := 0;
  Weight := 2;
  for i := 13 downto 1 do
  begin
    DigCalc := DigCalc + (StrToInt(CNPJ[i]) * Weight);
    Weight := Weight + 1;
    if (Weight = 10) then
      Weight := 2;

  end;
  VerifDigit := (DigCalc mod 11);
  if ((VerifDigit = 0) or (VerifDigit = 1)) then
    Digit14 := '0'
  else
    Str((11 - VerifDigit):1, Digit14);

//  Valida os dígitos informados para verificar se estão de acordo com o cálculo

  if ((Digit13 = CNPJ[13]) and (Digit14 = CNPJ[14])) then
  begin
    Self.Invalid := False;
    Self.Text := copy(CNPJ, 1, 2) + '.' + copy(CNPJ, 3, 3) + '.' + copy(CNPJ, 6, 3) + '.' + copy(CNPJ, 9, 4) + '-' + copy(CNPJ, 13, 2);
  end
  else
  begin
    Self.Invalid := True;
  end;
end;

end.
