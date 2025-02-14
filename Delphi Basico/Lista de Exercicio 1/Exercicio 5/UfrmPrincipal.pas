unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    edtNome: TEdit;
    edtProva1: TEdit;
    edtProva2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnCalcular: TButton;
    Image1: TImage;
    lblNomeAluno: TLabel;
    lblNota: TLabel;
    edtProva3: TEdit;
    Label4: TLabel;
    Label5: TLabel;
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
  xMedia : Double;

begin
  xMedia := (StrToFloat(edtProva1.Text) + StrToFloat(edtProva2.Text)
          + StrToFloat(edtProva3.Text))/3;
  lblNomeAluno.Caption := ' A m�dia de ' + edtNome.Text + ' �:';

    if xMedia < 7  then
      lblNota.font.Color := clRed
    else
      lblNota.font.Color := clWhite;

  lblNota.Caption := FormatFloat('#0.##', xMedia);



end;

end.
