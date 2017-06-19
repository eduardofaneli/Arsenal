unit uClasses;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, PngSpeedButton,
  Vcl.StdCtrls, PngBitBtn, Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids, uADStanExprFuncs, uADGUIxIntf,
  uADGUIxFormsWait, uADStanIntf, uADStanOption, uADStanError, uADPhysIntf,
  uADStanDef, uADStanPool, uADStanAsync, uADPhysManager, uADStanParam,
  uADDatSManager, uADDAptIntf, uADDAptManager, Data.DB, uADCompDataSet,
  uADCompClient, uADCompGUIx, uADPhysSQLite, uDmPrincipal;

type
  TMensagens = class
    procedure MensagemInformacao(AMensagem: String);
    function MensagemConfirmacao(AMensagem: String): Boolean;
  end;

  TQuery = class
    private
      FConnection: TADConnection;

      function GetQry: TADQuery;

    public
      constructor Create;


  end;

implementation

{ TQuery }

constructor TQuery.Create;
begin
  FConnection := dmPrincipal.Conexao;
end;

function TQuery.GetQry: TADQuery;
begin
  Result := TADQuery.Create(nil);
  Result.Connection := FConnection;
end;

{ TMensagens }

function TMensagens.MensagemConfirmacao(AMensagem: String): Boolean;
begin
  Result := Application.MessageBox(pChar(AMensagem), 'Confirmação', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = mrYes;
end;

procedure TMensagens.MensagemInformacao(AMensagem: String);
begin
  Application.MessageBox(pChar(AMensagem), 'Informação', MB_ICONINFORMATION + MB_OK);
end;

end.

