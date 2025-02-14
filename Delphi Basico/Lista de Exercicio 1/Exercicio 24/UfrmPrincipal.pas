unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    btnIniciar: TButton;
    mmListaNumeros: TMemo;
    procedure btnIniciarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Verificar;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure Tform1.Verificar;
var
  xNumero : Double;
  xContinuar : String;

begin
  mmListaNumeros.Lines.Clear;

  repeat
    if not TryStrToFloat(inputbox('Cadastro N�meros','Insira um n�mero:','0'),
                       xNumero) then
      raise Exception.Create('Erro: Insira um n�mero');

    if xNumero > 0 then
      mmListaNumeros.lines.Add(FloatToStr(xNumero) + ' � Positivo')
    else if xNumero < 0 then
      mmListaNumeros.lines.Add(FloatToStr(xNumero) + ' � Negativo')
    else
      mmListaNumeros.lines.Add(FloatToStr(xNumero) + ' � Zero');

    xContinuar := UpperCase(inputbox( 'Cadastro N�meros',
                  'Deseja continuar cadastrando? S(Sim) ou N(N�o)',''));
  until xContinuar = 'N';


end;

procedure TForm1.btnIniciarClick(Sender: TObject);
begin
  Self.Verificar;
end;

end.
