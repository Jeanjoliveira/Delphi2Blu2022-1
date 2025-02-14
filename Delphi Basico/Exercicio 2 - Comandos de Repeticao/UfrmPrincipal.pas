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
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

// FUN��O PARA A OP��O "FOR":
Function ResultFor(Numero1, Numero2 : Integer) : Integer;
var
I,xResultFor : Integer;

begin
xResultFor := 0;
  for I := Numero1 to Numero2 do
    begin
      if(I mod 2) = 0 then
        xResultFor := xResultFor + I;
    end;
    Result := xResultFor;
end;

// FUN��O PARA A OP��O "WHILE":
Function ResultWhile(Numero1, Numero2 : Integer) : Integer;
var
xResultWhile, xDias : Integer;

begin
  xDias := 0;
  xResultWhile := Numero1;
  while xResultWhile > 0 do
    begin
      xResultWhile := xResultWhile - Numero2;
      xDias := xDias + 1;
    end;
    Result := xDias;
  end;

// FUN��O PARA A OP��O "REPEAT":
Function ResultRepeat(Numero1, Numero2 : Integer) : Integer;
var
xResultRepeat, xDias : Integer;
begin
xResultRepeat := 0;
xDias := 0;
  repeat
    xResultRepeat := xResultRepeat + Numero2;
    xDias := xDias + 1;
  until (xResultRepeat >= Numero1);
  Result := xDias;
end;

// PROCEDURE PARA O EVENTO DE CLIQUE NO EXECUTAR:
procedure TForm1.btnExecutarClick(Sender: TObject);
var
  xResultado, xNumero1, xNumero2 :Integer;

begin
  xResultado := 0;
  xNumero1 := StrToInt(edtNumero1.Text);
  xNumero2 := StrToInt(edtNumero2.Text);

  case TComandos(rdgComandos.ItemIndex) of
    cmdFor:
      begin
        xResultado := ResultFor(xNumero1, xNumero2); //Chama Fun��o FOR
      end;

    cmdWhile:
      begin
        xResultado := ResultWhile(xNumero1, xNumero2); //Chama fun��o WHILE
      end;

    cmdRepeat:
      begin
        xResultado := ResultRepeat(xNumero1, xNumero2); //Chama Fun��o REPEAT
      end;
  end;
  ShowMessage(IntToStr(xResultado));
end;

end.
