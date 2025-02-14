unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

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

procedure TForm1.btnDataClick(Sender: TObject);
var
xEntrada : TDate;

begin
xEntrada := StrToDate(edtentrada.Text)+2;
lbResultado.Caption := DateToStr(xEntrada);
end;

procedure TForm1.btnDataExtensoClick(Sender: TObject);
var
  xEntrada: TDateTime;
begin
  if not TryStrToDate(edtEntrada.text, xEntrada) then
    raise Exception.Create('Erro: Insira uma data v�lida');

  xEntrada := StrToDate(edtentrada.Text);
  lbResultado.Caption :='Hoje � dia ' + FormatDateTime('dd',xEntrada)
                       + ' de ' + FormatDateTime('mmmm',xEntrada)
                       + ' de ' + FormatDateTime('yyyy',xEntrada);;
end;

procedure TForm1.btnInteiroClick(Sender: TObject);
var
xEntrada : Integer;

begin
xEntrada := StrToIntDef(edtentrada.Text,0)+10;
lbResultado.Caption := IntToStr(xEntrada);
end;

procedure TForm1.btnPontoFlutuanteClick(Sender: TObject);
var
xEntrada : Double;

begin
xEntrada := StrToFloatDef(edtentrada.Text,0.0)+10.50;
lbResultado.Caption := FloatToStr(xEntrada);
end;




end.
