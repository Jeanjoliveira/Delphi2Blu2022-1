unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    mmValoresCalculados: TMemo;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure CalcularDesconto;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure Tform1.CalcularDesconto;
var
  xModelo, xContinuar : String;
  xValorSemDesconto, xValorComDesconto, xValorDesconto : Double;
  xAno, xContVelho, xContNovo : Integer;
begin
  mmValoresCalculados.lines.Clear;
  xContVelho := 0;
  xContNovo := 0;
  repeat
    xModelo := inputbox( 'C�lculo de Desconto','Modelo','');
    xAno := StrToInt(inputbox( 'C�lculo de Desconto','Ano',''));
    xValorSemDesconto :=StrToInt(inputbox( 'C�lculo de Desconto',
                                           'Valor Sem Desconto',''));
    if xAno <= 2000 then
      begin
        xValorDesconto :=  xValorSemDesconto * 0.12;
        xContVelho := xContVelho + 1;
      end
    else
      begin
        xValorDesconto :=  xValorSemDesconto * 0.07;
        xContNovo := xContNovo + 1;
      end;

    xValorComDesconto := xValorSemDesconto - xValorDesconto;

    mmValoresCalculados.lines.Add(xModelo + ': De R$' +
                                  FormatFloat('#0.##', xValorSemDesconto)
                                  + ' Por R$' +
                                  FormatFloat('#0.##', xValorComDesconto) +
                                   '. Total de desconto: R$' +
                                  FormatFloat('#0.##', xValorDesconto));

    xContinuar :=UpperCase(inputbox('C�lculo de Desconto',
                        'Calcular desconto de mais um carro? S(Sim) ou N(N�o)',
                        ''));
  until (xContinuar = 'N');
  mmValoresCalculados.lines.Add('Total de Carros Calculados : ');
  mmValoresCalculados.lines.Add('At� 2000: ' + IntToStr(xContVelho));
  mmValoresCalculados.lines.Add('Acima de 2000: ' + IntToStr(xContNovo));
  mmValoresCalculados.lines.Add('Todos: ' + IntToStr(xContNovo + xContVelho));

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Self.CalcularDesconto;
end;

end.
