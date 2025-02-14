unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg;

type
  TForm1 = class(TForm)
    edtNome: TEdit;
    edtSalarioFixo: TEdit;
    edtVendas: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnCalcular: TButton;
    lblResultado: TLabel;
    Label4: TLabel;
    Image1: TImage;
    lblResultado2: TLabel;
    Image2: TImage;
    procedure btnCalcularClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnCalcularClick(Sender: TObject);
var
  xResultado, xComissao : Currency;
begin
  xComissao := StrToCurr(edtVendas.Text)*0.15;
  xResultado := StrToCurr(edtSalarioFixo.Text) + xComissao;
  lblResultado.Caption := 'Sr.(a) ' + edtNome.Text +
                          ', seu sal�rio fixo � R$' + edtSalarioFixo.Text +
                           '. Nesse m�s sua comiss�o foi de R$' +
                           CurrToStr(xComissao) + '.';
   lblResultado2.Caption := 'Portanto seu sal�rio foi de R$' +
                            CurrToStr(xResultado) + '.';
end;

end.
