unit uAEditData;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Graphics, uAEdit,
  uAEditInteiro;

type
  TAEditData = class(TAEditInteiro)
  private
    FPanelCalendar : TPanel;
    FCalendar      : TMonthCalendar;
    procedure Calendar(Sender : TObject);
    procedure ClickFCalendar(Sender : TObject);
    procedure DoEnter; override;
    procedure DoExit; override;
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
  RegisterComponents('Atrium', [TAEditData]);
end;

{ TAEditData }

procedure TAEditData.Calendar(Sender : TObject);
begin
  if not Assigned(FPanelCalendar) then
  begin
    FPanelCalendar := TPanel.Create(nil);
    FCalendar := TMonthCalendar.Create(nil);
    try
      FPanelCalendar.Parent      := Self.Parent;
      FPanelCalendar.Top         := Self.Top + 21;
      FPanelCalendar.Left        := Self.Left;
      FPanelCalendar.Height      := 160;
      FPanelCalendar.Width       := 225;
      FPanelCalendar.BevelInner  := bvNone;
      FPanelCalendar.BevelOuter  := bvNone;
      FPanelCalendar.BevelKind   := bkNone;
      FPanelCalendar.Visible     := True;
      FPanelCalendar.Color := clRed;
      FCalendar.Parent := FPanelCalendar;
      FCalendar.Align := alClient;
      FCalendar.SetFocus;
      FPanelCalendar.Show;
      FCalendar.OnDblClick := ClickFCalendar;
    finally
    end;
  end;
end;

procedure TAEditData.ClickFCalendar(Sender: TObject);
begin
  Self.Text := DateToStr(FCalendar.Date);
  FreeAndNil(FCalendar);
  FreeAndNil(FPanelCalendar);
end;

constructor TAEditData.Create(AOwner: TComponent);
begin
  inherited;
  Self.InvalidColor := clRed;
  Self.MaxLength := 8;
  OnDblClick := Calendar;
end;

procedure TAEditData.DoEnter;
begin
  inherited;
  if Trim(Self.Text) <> EmptyStr then
    Self.Text := StringReplace(Trim(Self.Text), '/', EmptyStr, [rfReplaceAll])
  else
    Self.Invalid := False;
end;

procedure TAEditData.DoExit;
var
  ValueEdit : String;
  Date : TDate;
begin
  inherited;
  try
    if Trim(Self.Text) <> EmptyStr then
    begin
      ValueEdit := Trim(Self.Text);
      ValueEdit:= copy(ValueEdit,1,2) + '/' + Copy(ValueEdit,3,2) + '/' + copy(ValueEdit,5,4);
      Date := StrToDate(ValueEdit);
      Self.Text := DateToStr(Date);
      Self.Invalid := False;
    end
    else
      Self.Invalid := False;
  except
    on EConvertError do
      Self.Invalid := True
  end;
end;

end.
