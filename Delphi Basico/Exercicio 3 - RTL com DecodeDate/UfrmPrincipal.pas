unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, DateUtils;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    edtEntrada: TEdit;
    Label2: TLabel;
    btnInteiro: TButton;
    btnData: TButton;
    btnPontoFlutuante: TButton;
    btnDataExtenso: TButton;
    lbResultado: TLabel;
    procedure btnInteiroClick(Sender: TObject);
    procedure btnPontoFlutuanteClick(Sender: TObject);
    procedure btnDataClick(Sender: TObject);
    procedure btnDataExtensoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function MesExtenso(aMes:word): String;

begin
  case aMes of
    1:
      Result := 'Janeiro';
    2:
      Result := 'Fevereiro';
    3:
      Result := 'Mar�o';
    4:
      Result := 'Abril';
    5:
      Result := 'Maio';
    6:
      Result := 'Junho';
    7:
      Result := 'Julho';
    8:
      Result := 'Agosto';
    9:
      Result := 'Setembro';
    10:
      Result := 'Outubro';
    11:
      Result := 'Novembro';
    12:
      Result := 'Dezembro';
  end;
end;


procedure TForm1.btnDataClick(Sender: TObject);
var
xEntrada : TDateTime;

begin
  if not TryStrToDate(edtEntrada.text, xEntrada) then
    raise Exception.Create('Erro: Insira uma data v�lida');

  xEntrada := StrToDate(edtentrada.Text)+2;
  lbResultado.Caption := DateToStr(xEntrada);

end;

procedure TForm1.btnDataExtensoClick(Sender: TObject);
var
  xEntrada: TDateTime;
  xDia, xMes, xAno : word;
  xMesExtenso : String;
begin
  if not TryStrToDate(edtEntrada.text, xEntrada) then
    raise Exception.Create('Erro: Insira uma data v�lida');

  xEntrada := StrToDate(edtentrada.Text);
  DecodeDate(xEntrada, xAno, xMes, xDia);

  xMesExtenso := MesExtenso (xMes);


  lbResultado.Caption :='Hoje � dia ' + IntToStr(xDia)
                       + ' de ' + xMesExtenso
                       + ' de ' + IntToStr(xAno);

end;

procedure TForm1.btnInteiroClick(Sender: TObject);
var
xEntrada : Integer;

begin
  if not TryStrToInt(edtEntrada.text, xEntrada) then
    raise Exception.Create('Erro: Insira um n�mero inteiro');

  xEntrada := StrToIntDef(edtentrada.Text,0)+10;
  lbResultado.Caption := IntToStr(xEntrada);
end;

procedure TForm1.btnPontoFlutuanteClick(Sender: TObject);
var
  xEntrada : Double;

begin
  if not TryStrToFloat(edtEntrada.text, xEntrada) then
    raise Exception.Create('Erro: Insira um n�mero decimal');
  xEntrada := StrToFloatDef(edtentrada.Text,0.0)+10.50;
  lbResultado.Caption := FloatToStr(xEntrada);
end;


end.
