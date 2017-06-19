unit uAEdit;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls, Vcl.Graphics;

type
  TAEdit = class(TEdit)
  private
    FColorOnFocus : TColor;
    FRequired     : Boolean;
    FInvalid      : Boolean;
    FInvalidColor : TColor;
    FontStyle     : TFontStyles;
    EditColor     : TColor;
    OldColor      : TColor;
    procedure SetInvalid(Value : Boolean);
    { Private declarations }
  protected
    procedure DoEnter; override;
    procedure DoExit; override;
    { Protected declarations }
  public
    constructor Create(AOwner : TComponent); override;
    { Public declarations }
  published
    property ColorOnFocus : TColor read FColorOnFocus write FColorOnFocus default clWindow;
    property Required : Boolean read FRequired  write FRequired default False;
    property Invalid : Boolean read FInvalid write SetInvalid default False;
    property InvalidColor : TColor read FInvalidColor write FInvalidColor default clWindow;
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Atrium', [TAEdit]);
end;

{ TAEdit }

constructor TAEdit.Create(AOwner : TComponent);
begin
  Self.ColorOnFocus := clWindow;
  Self.Required     := False;
  Self.Invalid      := False;
  Self.InvalidColor := clWindow;
  inherited;
end;
procedure TAEdit.DoEnter;
begin
  EditColor       := Self.Color;
  if OldColor = TColor(0) then
    OldColor          :=  Self.Color;
  FontStyle       := Self.Font.Style;
  Self.Color      := FColorOnFocus;
  Self.Font.Style := [fsBold];
  inherited;
end;

procedure TAEdit.DoExit;
begin
  Self.Color      := EditColor;
  Self.Font.Style := FontStyle;
  inherited;
end;

procedure TAEdit.SetInvalid(Value : Boolean);
begin
  FInvalid := Value;
  if Value then
  begin
    Self.Color := FInvalidColor;
  end
  else
  begin
    Self.Color := OldColor;
  end;
end;

end.

