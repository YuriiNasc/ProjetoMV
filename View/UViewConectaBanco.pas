{----------------------------------------------------------------------}
//     Projeto:    ProjetoMV
//     Unity:      UViewDepartamento
//     Criado por: yuri.borges
//     Data:       17/07/2022 14:49:45
//     Versão:     1.0.0.0
{----------------------------------------------------------------------}
unit UViewConectaBanco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls;

type
  TViewConectaBanco = class(TForm)
    pnPrincipal: TPanel;
    pnRodape: TPanel;
    edDatabase: TEdit;
    edUsuario: TEdit;
    edSenha: TEdit;
    edServidor: TEdit;
    edPorta: TEdit;
    btConfirmar: TSpeedButton;
    btCancelar: TSpeedButton;
    lbServidor: TLabel;
    lbSenha: TLabel;
    lbUsuario: TLabel;
    lbPorta: TLabel;
    lbDatabase: TLabel;
    procedure btCancelarClick(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewConectaBanco: TViewConectaBanco;

implementation

Uses
  DataModuloConexao;

{$R *.dfm}

procedure TViewConectaBanco.btCancelarClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TViewConectaBanco.btConfirmarClick(Sender: TObject);
var
  StatusConexao: TStatusConexao;
  Erro: string;
begin
  StatusConexao := TStatusConexao.Create;
  try
    With StatusConexao do
    begin
      ConexaoLoginPrompt := False;
      ConexaoDatabase := edDatabase.Text;
      ConexaUserName := edUsuario.Text;
      ConexaoPassWord := edSenha.Text;
      ConexaoServer := edServidor.Text;
      ConexaoPort := edPorta.Text;

      if not ModGeral.VerificaConexaoServidor(StatusConexao, Erro) Then
        raise Exception.Create(Erro);

      Close;
    end;
  finally
    FreeAndNil(StatusConexao);
  end;
end;

end.
