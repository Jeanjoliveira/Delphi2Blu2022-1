unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    btnCadastro: TButton;
    mmListaAptos: TMemo;
    lblTitulo: TLabel;
    mmListaNaoAptos: TMemo;
    procedure btnCadastroClick(Sender: TObject);
  private
    { Private declarations }

    procedure AlistamentoMilitar;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure Tform1.AlistamentoMilitar;
var
  xNome, xSexo, xSaude, xContinuar : String;
  xIdade , xContApto, xContNaoApto : Integer;
begin
  mmListaAptos.Visible := False;
  mmListaNaoAptos.Visible := False;
  xContApto := 0;
  xContNaoApto := 0;
  mmListaAptos.Lines.Clear;
  mmListaNaoAptos.Lines.Clear;
  mmListaAptos.Lines.Add('lista de aptos para o servi�o militar:');
  mmListaNaoAptos.Lines.Add('lista de N�o aptos para o servi�o militar:');

  repeat
    xNome := inputbox( 'Alistamento Militar','Nome','');
    xIdade := StrToInt(inputbox( 'Alistamento Militar','Idade','0'));
    xSexo := inputbox( 'Alistamento Militar','Sexo: 1(Masc) ou 2(Fem)','');
    xSaude := inputbox( 'Alistamento Militar','Sa�de: 1(Boa) ou 2(Ruim)','');

    if (xIdade >= 18) and (xSexo = '1') and (xSaude = '1') then
      begin
        mmListaAptos.Lines.Add(xNome);
        xContApto := xContApto + 1;
      end
    else
      begin
        mmListaNaoAptos.Lines.Add(xNome);
        xContNaoApto := xContNaoApto + 1;
      end;


    xContinuar := UpperCase(inputbox( 'Alistamento Militar',
                  'Deseja continuar cadastrando? S(Sim) ou N(N�o)',''));
  until (xContinuar = 'N');

  mmListaAptos.Lines.Add('Total de aptos: ' + IntToStr(xContApto));
  mmListaNaoAptos.Lines.Add('Total de N�o aptos: ' + IntToStr(xContNaoApto));
  mmListaAptos.Visible := True;
  mmListaNaoAptos.Visible := True;

end;

procedure TForm1.btnCadastroClick(Sender: TObject);
begin
  Self.AlistamentoMilitar;
end;

end.
