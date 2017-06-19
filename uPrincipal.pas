unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, PngSpeedButton,
  Vcl.StdCtrls, PngBitBtn, Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids, uClasses, uDmPrincipal;

type

  TfrmPrincipal = class(TForm)
    pnlMenuLateral: TPanel;
    btnSair: TPngBitBtn;
    PngBitBtn2: TPngBitBtn;
    PngBitBtn3: TPngBitBtn;
    PngBitBtn4: TPngBitBtn;
    btnAtletas: TPngBitBtn;
    btnInicio: TPngBitBtn;
    pnlPrincipal: TPanel;
    pnlExpansor: TPanel;
    btnExpansor: TPngSpeedButton;
    pcPrincipal: TPageControl;
    tbInicio: TTabSheet;
    imgInicio: TImage;
    tbAtleta: TTabSheet;
    pnlAtleta: TPanel;
    pcAtleta: TPageControl;
    pnlMenuAtleta: TPanel;
    tbListaAtletas: TTabSheet;
    tbDadosAtleta: TTabSheet;
    btnSairAtleta: TPngBitBtn;
    dbgrdListaAtletas: TDBGrid;
    btnNovoAtleta: TPngBitBtn;
    btnGravarAtleta: TPngBitBtn;
    btnAlterarAtleta: TPngBitBtn;
    btnCancelarAtleta: TPngBitBtn;
    btnExcluirAtleta: TPngBitBtn;
    procedure btnExpansorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnInicioClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnAtletasClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSairAtletaClick(Sender: TObject);
    procedure btnNovoAtletaClick(Sender: TObject);
    procedure btnAlterarAtletaClick(Sender: TObject);
    procedure btnGravarAtletaClick(Sender: TObject);
    procedure btnCancelarAtletaClick(Sender: TObject);
  private
    FMensagens: TMensagens;
    procedure Expansor();
    procedure OcultarSheets();
    procedure EncerrarAplicacao();
    procedure HabilitarCrudAtleta(AHabilitar: Boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

var
  Dados: TQuery;

{$R *.dfm}

procedure TfrmPrincipal.btnAlterarAtletaClick(Sender: TObject);
begin
  HabilitarCrudAtleta(True);
end;

procedure TfrmPrincipal.btnAtletasClick(Sender: TObject);
begin
  pcPrincipal.ActivePage := tbAtleta;
  pcAtleta.ActivePage := tbListaAtletas;
  HabilitarCrudAtleta(False);
end;

procedure TfrmPrincipal.btnCancelarAtletaClick(Sender: TObject);
begin
  HabilitarCrudAtleta(False);
end;

procedure TfrmPrincipal.btnExpansorClick(Sender: TObject);
begin
  Expansor();
end;

procedure TfrmPrincipal.btnGravarAtletaClick(Sender: TObject);
begin
  HabilitarCrudAtleta(False);
end;

procedure TfrmPrincipal.btnInicioClick(Sender: TObject);
begin

  pcPrincipal.ActivePage := tbInicio;

end;

procedure TfrmPrincipal.btnNovoAtletaClick(Sender: TObject);
begin
  HabilitarCrudAtleta(True);
end;

procedure TfrmPrincipal.btnSairAtletaClick(Sender: TObject);
begin

  pcPrincipal.ActivePage := tbInicio;
  pcAtleta.ActivePage := tbListaAtletas;

end;

procedure TfrmPrincipal.btnSairClick(Sender: TObject);
begin

  EncerrarAplicacao();

end;

procedure TfrmPrincipal.EncerrarAplicacao;
begin

  if FMensagens.MensagemConfirmacao('Encerrar aplicação?') then
    Application.Terminate
  else
    DefocusControl(TBitBtn(ActiveControl), True);

end;

procedure TfrmPrincipal.Expansor;
begin
  if pnlMenuLateral.Width = pnlMenuLateral.Constraints.MaxWidth then
    pnlMenuLateral.Width := pnlMenuLateral.Constraints.MinWidth
  else
    pnlMenuLateral.Width := pnlMenuLateral.Constraints.MaxWidth;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin

  if not Assigned(Dados) then
    Dados := TQuery.Create;

end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin

  if Assigned(Dados) then
    FreeAndNil(Dados);

end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin

  OcultarSheets();

  pcPrincipal.ActivePage := tbInicio;

end;

procedure TfrmPrincipal.HabilitarCrudAtleta(AHabilitar: Boolean);
begin

  btnNovoAtleta.Enabled := not (AHabilitar);
  btnAlterarAtleta.Enabled := (not (AHabilitar)) and (dbgrdListaAtletas.DataSource.DataSet.RecordCount > 0);
  btnGravarAtleta.Enabled := AHabilitar;
  btnCancelarAtleta.Enabled := AHabilitar;
  btnExcluirAtleta.Enabled := (not (AHabilitar)) and (dbgrdListaAtletas.DataSource.DataSet.RecordCount > 0);
  btnSairAtleta.Enabled := not (AHabilitar);

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

