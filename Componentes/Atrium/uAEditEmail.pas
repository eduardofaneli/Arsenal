unit uAEditEmail;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls, Vcl.Graphics, uAEdit, System.RegularExpressions;

type
  TAEditEmail = class(TAEdit)
  private
    procedure DoExit; override;
    procedure ValidateEmail(Email : String);
    procedure KeyPressEmail(Sender: TObject; var Key: Char);
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
  RegisterComponents('Atrium', [TAEditEmail]);
end;

{ TAEditEmail }

constructor TAEditEmail.Create(AOwner: TComponent);
begin
  inherited;
  Self.InvalidColor := clRed;
  OnKeyPress := KeyPressEmail;
end;

procedure TAEditEmail.DoExit;
begin
  inherited;
  if Trim(Self.Text) <> EmptyStr then
    ValidateEmail(Trim(Self.Text))
  else
    Self.Invalid := False;
end;

procedure TAEditEmail.KeyPressEmail(Sender: TObject; var Key: Char);
begin
  if not (Key in ['a'..'z','A'..'Z', '0'..'9', '-', '.', '_', '@', #8, #32]) then
    Key := #0;
end;

procedure TAEditEmail.ValidateEmail(Email: String);
var
  Validar: TRegEx;
begin

  Validar.Create('^[A-z0-9_\\-]+([.][A-z0-9_\\-]+)*[@][A-z0-9_]+([.][A-z0-9_]+)*[.][A-z]{2,4}$');

  Self.Invalid := not Validar.IsMatch(Email);

//  Email := Trim(UpperCase(Email));
//  if Pos('@', Email) > 1 then
//  begin
//    Delete(Email, 1, pos('@', Email));
//    Self.Invalid := not ((Length(Email) > 0) and (Pos('.', Email) > 2));
//  end
//  else
//    Self.Invalid := True;
end;

end.
