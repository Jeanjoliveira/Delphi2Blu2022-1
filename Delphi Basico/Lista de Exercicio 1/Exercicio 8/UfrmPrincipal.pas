unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    edtDolar: TEdit;
    edtCotacao: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnConverter: TButton;
    lblResultado: TLabel;
    procedure btnConverterClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnConverterClick(Sender: TObject);
var
  xResultado : Double;
begin
  xResultado := StrToFloat(edtDolar.Text) * StrToFloat(edtCotacao.Text);

  lblResultado.Caption := edtDolar.Text + ' US$ � equivalente � R$ '
                          + FloatToStr(xResultado);
end;

end.
