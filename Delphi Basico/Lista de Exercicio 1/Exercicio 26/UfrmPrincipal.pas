unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TEnumNumeros = (tpUm=1, tpDois, tpTres, tpQuatro, tpCinco);

  TForm1 = class(TForm)
    edtNumero: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    lblResultado: TLabel;
    procedure edtNumeroChange(Sender: TObject);
  private
    { Private declarations }
    procedure Escrita;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure Tform1.Escrita;
var
  xNumero : Integer;
begin
  lblResultado.Caption := '';

  if not (edtNumero.Text = '') then
  begin
    if not TryStrToInt(edtNumero.Text, xNumero) then
      raise Exception.Create('Insira um n�mero de 1 a 5');
  end;


  if (xNumero <= 5) and (xNumero >= 1)  then
  begin
      case TEnumNumeros(xNumero) of
        tpUm:
          lblResultado.Caption := 'Um';
        tpDois:
          lblResultado.Caption := 'Dois';
        tpTres:
          lblResultado.Caption := 'Tres';
        tpQuatro:
          lblResultado.Caption := 'Quatro';
        tpCinco:
          lblResultado.Caption := 'Cinco';
      end;
  end
  else if edtNumero.Text = '' then
    lblResultado.Caption := ''
  else
    lblResultado.Caption := 'N�mero Inv�lido';

end;

procedure TForm1.edtNumeroChange(Sender: TObject);
begin
  Self.Escrita;
end;

end.
