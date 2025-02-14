unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TComandos = (cmdFor, cmdWhile, cmdRepeat); // Enumerado para o CASE

  TForm1 = class(TForm)
    Label1: TLabel;
    rdgComandos: TRadioGroup;
    edtNumero1: TEdit;
    edtNumero2: TEdit;
    btnExecutar: TButton;
    procedure btnExecutarClick(Sender: TObject);
  private
    { Private declarations }
    Function ComandFor : Integer;
    Function ComandWhile : Integer;
    Function ComandRepeat : Integer;

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

// METODO FUN��O PARA A OP��O "FOR":
Function TForm1.ComandFor;
var
I,xResultFor, xNumero1, xNumero2 : Integer;

begin
  xNumero1 := StrToInt(edtNumero1.Text);
  xNumero2 := StrToInt(edtNumero2.Text);

  for I := xNumero1 to xNumero2 do
  begin
    if(I mod 2) = 0 then
      xResultFor := xResultFor + I;
    end;
  Result := xResultFor;
end;



// METODO FUN��O PARA A OP��O "WHILE":

Function TForm1.ComandWhile;
var
xResultWhile, xDias, xNumero1, xNumero2 : Integer;

begin
  xNumero1 := StrToInt(edtNumero1.Text);
  xNumero2 := StrToInt(edtNumero2.Text);
  xDias := 0;
  xResultWhile := xNumero1;
  while xResultWhile > 0 do
    begin
      xResultWhile := xResultWhile - xNumero2;
      xDias := xDias + 1;
    end;
    Result := xDias;
end;


// METODO FUN��O PARA A OP��O "REPEAT":

Function TForm1.ComandRepeat;
var
xResultRepeat, xDias, xNumero1, xNumero2 : Integer;

begin
  xNumero1 := StrToInt(edtNumero1.Text);
  xNumero2 := StrToInt(edtNumero2.Text);
  xResultRepeat := 0;
  xDias := 0;
  repeat
    xResultRepeat := xResultRepeat + xNumero2;
    xDias := xDias + 1;
  until (xResultRepeat >= xNumero1);
  Result := xDias;
end;

// PROCEDURE PARA O EVENTO DE CLIQUE NO BOTAO EXECUTAR:
procedure TForm1.btnExecutarClick(Sender: TObject);
begin

  case TComandos(rdgComandos.ItemIndex) of
    cmdFor:
        ShowMessage(IntToStr(Self.ComandFor)); //Chama Fun��o FOR

    cmdWhile:
        ShowMessage(IntToStr(Self.ComandWhile)); //Chama fun��o WHILE

    cmdRepeat:
        ShowMessage(IntToStr(Self.ComandRepeat)); //Chama Fun��o REPEAT
  else
    ShowMessage('Selecione uma op��o');
  end;
end;
end.
