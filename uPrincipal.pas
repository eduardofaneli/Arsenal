unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, PngSpeedButton,
  Vcl.StdCtrls, PngBitBtn, Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids, uClasses, uDmPrincipal, uAEdit, uAEditInteiro,
  uAEditCPF, uAEditData, uAEditTelefone, uAEditEmail, Vcl.DBCtrls,
  Vcl.ImgList, Vcl.Menus;

type
  EAcao = (stCadastrar, stAlterar);
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
    pnlDadosPessoaisAtletas: TPanel;
    gbDadosPessoaisAtletas: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtNome: TAEdit;
    edtEmail: TAEditEmail;
    edtTelefone: TAEditTelefone;
    edtRG: TAEditInteiro;
    edtOrgaoExpeditor: TAEdit;
    edtCPF: TAEditCPF;
    dtDataNascimento: TDateTimePicker;
    pnlDadosAtletas: TPanel;
    gbPosicoesAtleta: TGroupBox;
    rgStatus: TRadioGroup;
    tvPosicoes: TTreeView;
    imgTreeViewPosicoes: TImageList;
    pnlIncluirPosicao: TPanel;
    lblPosicao: TLabel;
    dblkpPosicao: TDBLookupComboBox;
    ckbPosicaoPrincipal: TCheckBox;
    btnIncluirPosicao: TPngSpeedButton;
    pnlLegendaPosicao: TPanel;
    GroupBox1: TGroupBox;
    Image1: TImage;
    Label8: TLabel;
    Image2: TImage;
    Label9: TLabel;
    ppmTreeView: TPopupMenu;
    Excluirposio1: TMenuItem;
    imgListPopup: TImageList;
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
    procedure dbgrdListaAtletasDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure btnExcluirAtletaClick(Sender: TObject);
    procedure btnIncluirPosicaoClick(Sender: TObject);
    procedure ckbPosicaoPrincipalClick(Sender: TObject);
    procedure Excluirposio1Click(Sender: TObject);
  private
    FMensagens: TMensagens;
    FDadosAtleta: TAtleta;
    FAcao: EAcao;
    procedure Expansor();
    procedure OcultarSheets();
    procedure EncerrarAplicacao();
    procedure HabilitarCrudAtleta(AHabilitar: Boolean);
    procedure CarregarInformacoes();
    procedure GravarDadosAtleta();
    procedure AbrirQueryAtletas();
    procedure AbrirQueryPosicoesAtleta();
    procedure LimparCampos();
    procedure MontarTreeViewPosicoes;

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

procedure TfrmPrincipal.AbrirQueryAtletas;
begin

  dmPrincipal.qryListaAtletas.Close;
  dmPrincipal.qryListaAtletas.Open;

end;

procedure TfrmPrincipal.AbrirQueryPosicoesAtleta;
begin

  dmPrincipal.qryPosicoes.Close;
  dmPrincipal.qryPosicoes.ParamByName('atleta').AsInteger := FDadosAtleta.Codigo;
  dmPrincipal.qryPosicoes.Open;

end;

procedure TfrmPrincipal.btnAlterarAtletaClick(Sender: TObject);
begin

  HabilitarCrudAtleta(True);
  pcAtleta.ActivePage := tbDadosAtleta;
  AbrirQueryPosicoesAtleta();
  MontarTreeViewPosicoes();
  FAcao := stAlterar;

end;

procedure TfrmPrincipal.btnAtletasClick(Sender: TObject);
begin
  pcPrincipal.ActivePage := tbAtleta;
  pcAtleta.ActivePage := tbListaAtletas;
  AbrirQueryAtletas();
  HabilitarCrudAtleta(False);
end;

procedure TfrmPrincipal.btnCancelarAtletaClick(Sender: TObject);
begin
  HabilitarCrudAtleta(False);
  pcAtleta.ActivePage := tbListaAtletas;
end;

procedure TfrmPrincipal.btnExcluirAtletaClick(Sender: TObject);
begin

  if not FMensagens.MensagemConfirmacao('Confirma excluir atleta?') then
    Exit;

  try

    FDadosAtleta.ExcluirAtleta;
    AbrirQueryAtletas;
    HabilitarCrudAtleta(False);

  except
    on e:Exception do
      FMensagens.MensagemErro(e.Message);

  end;

end;

procedure TfrmPrincipal.btnExpansorClick(Sender: TObject);
begin
  Expansor();
end;

procedure TfrmPrincipal.btnGravarAtletaClick(Sender: TObject);
begin

  try

    GravarDadosAtleta();

    HabilitarCrudAtleta(False);
    AbrirQueryAtletas();
    pcAtleta.ActivePage := tbListaAtletas;

  except
    on e:Exception do
      FMensagens.MensagemErro(e.Message);

  end;

end;

procedure TfrmPrincipal.btnIncluirPosicaoClick(Sender: TObject);
begin

  try

    FDadosAtleta.CodigoPosicao := dblkpPosicao.KeyValue;

    if ckbPosicaoPrincipal.Checked then
      FDadosAtleta.PosicaoPrincipal := 'S'
    else
      FDadosAtleta.PosicaoPrincipal := 'N';

    FDadosAtleta.AdicionarPosicaoJogador;

    AbrirQueryPosicoesAtleta;
    MontarTreeViewPosicoes;

  except
    on e: Exception do
    FMensagens.MensagemErro(e.Message);

  end;

end;

procedure TfrmPrincipal.btnInicioClick(Sender: TObject);
begin

  pcPrincipal.ActivePage := tbInicio;

end;

procedure TfrmPrincipal.btnNovoAtletaClick(Sender: TObject);
begin
  HabilitarCrudAtleta(True);
  pcAtleta.ActivePage := tbDadosAtleta;
  LimparCampos();
  FDadosAtleta.Codigo := FDadosAtleta.setSequenceAtleta();
  AbrirQueryPosicoesAtleta();
  FAcao := stCadastrar;

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

procedure TfrmPrincipal.CarregarInformacoes;
begin
  //Carregar Classe Atleta;
  FDadosAtleta.Codigo := dmPrincipal.qryListaAtletasid.AsInteger;
  FDadosAtleta.CodigoClube := dmPrincipal.qryListaAtletasid_clube.AsInteger;
  FDadosAtleta.Nome := dmPrincipal.qryListaAtletasnome.AsString;
  FDadosAtleta.Email := dmPrincipal.qryListaAtletasemail.AsString;
  FDadosAtleta.Telefone := dmPrincipal.qryListaAtletastelefone.AsString;
  FDadosAtleta.DataNascimento := dmPrincipal.qryListaAtletasdata_nascimento.AsDateTime;
  FDadosAtleta.RG := dmPrincipal.qryListaAtletasrg.AsString;
  FDadosAtleta.OrgaoExpeditor := dmPrincipal.qryListaAtletasorgao_expeditor.AsString;
  FDadosAtleta.CPF := dmPrincipal.qryListaAtletascpf.AsString;
  FDadosAtleta.Status := dmPrincipal.qryListaAtletasstatus.AsInteger;

  //Atribuir Valores aos campos
  edtNome.Text := FDadosAtleta.Nome;
  edtEmail.Text := FDadosAtleta.Email;
  edtTelefone.Text:= FDadosAtleta.Telefone;
  edtRG.Text := FDadosAtleta.RG;
  edtOrgaoExpeditor.Text := FDadosAtleta.OrgaoExpeditor;
  edtCPF.Text := FDadosAtleta.CPF;
  dtDataNascimento.Date := FDadosAtleta.DataNascimento;


end;

procedure TfrmPrincipal.ckbPosicaoPrincipalClick(Sender: TObject);
begin

  if ckbPosicaoPrincipal.Checked then
    if FDadosAtleta.ExistePosicaoPrincipal then
    begin
      FMensagens.MensagemInformacao('O atleta só pode ter uma posição principal!');
      ckbPosicaoPrincipal.Checked := False;
      Exit;
    end;

end;

procedure TfrmPrincipal.dbgrdListaAtletasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  CarregarInformacoes;
end;

procedure TfrmPrincipal.EncerrarAplicacao;
begin

  if FMensagens.MensagemConfirmacao('Encerrar aplicação?') then
    Application.Terminate
  else
    DefocusControl(TBitBtn(ActiveControl), True);

end;

procedure TfrmPrincipal.Excluirposio1Click(Sender: TObject);
begin

  try

    FDadosAtleta.CodigoPosicao := TPosicoesAtleta(tvPosicoes.Selected.Data).CodigoPosicao;
    FDadosAtleta.ExcluirPosicaoJogador;

    tvPosicoes.Items.Delete(tvPosicoes.Selected);

    AbrirQueryPosicoesAtleta;

  except
    on e: Exception do
      FMensagens.MensagemErro(e.Message);

  end;
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

  FDadosAtleta := TAtleta.Create;

end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin

  if Assigned(Dados) then
    FreeAndNil(Dados);


  if Assigned(FDadosAtleta) then
    FreeAndNil(FDadosAtleta);

end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin

  OcultarSheets();

  pcPrincipal.ActivePage := tbInicio;

end;

procedure TfrmPrincipal.GravarDadosAtleta;
begin

  case FAcao of
    stCadastrar:
    begin

      FDadosAtleta.CodigoClube := 1;
      FDadosAtleta.Nome := Trim(edtNome.Text);
      FDadosAtleta.Email := Trim(edtEmail.Text);
      FDadosAtleta.Telefone := Trim(edtTelefone.Text);
      FDadosAtleta.RG := Trim(edtRG.Text);
      FDadosAtleta.OrgaoExpeditor := Trim(edtOrgaoExpeditor.Text);
      FDadosAtleta.CPF := Trim(edtCPF.Text);
      FDadosAtleta.DataNascimento := dtDataNascimento.Date;
      FDadosAtleta.Status := rgStatus.ItemIndex;

      FDadosAtleta.CadastrarAtleta;

    end;
    stAlterar:
    begin

    end;
  end;



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

procedure TfrmPrincipal.LimparCampos;
begin
  edtNome.Clear;
  edtEmail.Clear;
  edtTelefone.Clear;
  edtRG.Clear;
  edtOrgaoExpeditor.Clear;
  edtCPF.Clear;
end;

procedure TfrmPrincipal.MontarTreeViewPosicoes;
var
  Node: TTreeNode;
  FPosicoesAtleta: TPosicoesAtleta;
begin

  dmPrincipal.qryTvPosicoes.Close;
  dmPrincipal.qryTvPosicoes.ParamByName('atleta').AsInteger := FDadosAtleta.Codigo;
  dmPrincipal.qryTvPosicoes.Open;

  tvPosicoes.Items.Clear;

  while not dmPrincipal.qryTvPosicoes.Eof do
  begin

    FPosicoesAtleta := TPosicoesAtleta.Create(Self);

    FPosicoesAtleta.CodigoAtleta := dmPrincipal.qryTvPosicoesid_atleta.AsInteger;
    FPosicoesAtleta.CodigoPosicao := dmPrincipal.qryTvPosicoesid.AsInteger;
    FPosicoesAtleta.Principal := dmPrincipal.qryTvPosicoesPrincipal.AsString;

    Node := tvPosicoes.Items.AddObject(nil, dmPrincipal.qryTvPosicoesnome.AsString + ' - ' + dmPrincipal.qryTvPosicoesSigla.AsString, FPosicoesAtleta);

    if dmPrincipal.qryTvPosicoesPrincipal.AsString = 'S' then
    begin

      Node.ImageIndex := 1;
      Node.SelectedIndex := 1;
      Node.StateIndex := 1;
      node.ExpandedImageIndex := 1;

    end
    else
    begin

      Node.ImageIndex := 0;
      Node.SelectedIndex := 0;
      Node.StateIndex := 0;
      node.ExpandedImageIndex := 0;

    end;

    dmPrincipal.qryTvPosicoes.Next;
  end;

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

