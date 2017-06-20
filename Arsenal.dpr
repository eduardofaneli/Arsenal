program Arsenal;

{$R *.dres}

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  Vcl.Themes,
  Vcl.Styles,
  uDmPrincipal in 'uDmPrincipal.pas' {dmPrincipal: TDataModule},
  uClasses in 'uClasses.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Metro Black');
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.

