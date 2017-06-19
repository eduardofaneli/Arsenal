unit uADBEditInteiro;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, uADBEdit;

type
  ADBEditInteiro = class(ADBEdit)
  private
    FIntegerOnly : Boolean;
    procedure KeyPressInteger(Sender: TObject; var Key: Char);
    procedure SetIntegerOnly(const Value : Boolean);
    { Private declarations }
  protected
    { Protected declarations }
  public
    constructor Create(AOwner : TComponent); override;
    { Public declarations }
  published
    property IntegerOnly : Boolean read FIntegerOnly write SetIntegerOnly default True;
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Atrium', [ADBEditInteiro]);
end;

{ ADBEditInteiro }

constructor ADBEditInteiro.Create(AOwner: TComponent);
begin
  inherited;
  Self.IntegerOnly := True;
end;

procedure ADBEditInteiro.KeyPressInteger(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;

procedure ADBEditInteiro.SetIntegerOnly(const Value: Boolean);
begin
  FIntegerOnly := Value;
  OnKeyPress := nil;
  if Value then
    OnKeyPress := KeyPressInteger;
end;

end.
