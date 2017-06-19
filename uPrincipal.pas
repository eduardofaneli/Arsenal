unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, PngSpeedButton,
  Vcl.StdCtrls, PngBitBtn, Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.ComCtrls;

type
  TfrmPrincipal = class(TForm)
    pnlMenuLateral: TPanel;
    PngBitBtn1: TPngBitBtn;
    PngBitBtn2: TPngBitBtn;
    PngBitBtn3: TPngBitBtn;
    PngBitBtn4: TPngBitBtn;
    PngBitBtn5: TPngBitBtn;
    PngBitBtn6: TPngBitBtn;
    pnlPrincipal: TPanel;
    pnlExpansor: TPanel;
    btnExpansor: TPngSpeedButton;
    pcPrincipal: TPageControl;
    tbInicio: TTabSheet;
    imgInicio: TImage;
    procedure btnExpansorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure Expansor();
    procedure OcultarSheets();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnExpansorClick(Sender: TObject);
begin
  Expansor();
end;

procedure TfrmPrincipal.Expansor;
begin
  if pnlMenuLateral.Width = pnlMenuLateral.Constraints.MaxWidth then
    pnlMenuLateral.Width := pnlMenuLateral.Constraints.MinWidth
  else
    pnlMenuLateral.Width := pnlMenuLateral.Constraints.MaxWidth;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin

  OcultarSheets();

  pcPrincipal.ActivePage := tbInicio;

end;

procedure TfrmPrincipal.OcultarSheets;
var
  I: Integer;
begin

  for I := 0 to ComponentCount -1 do
    if Components[I].ClassType = TTabSheet then
      TTabSheet(Components[I]).TabVisible := False;


end;

end.

