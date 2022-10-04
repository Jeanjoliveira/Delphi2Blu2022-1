unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    edtNumero: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    lblResultado: TLabel;
    procedure edtNumeroChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.edtNumeroChange(Sender: TObject);
begin
  if (StrToFloatDef(edtNumero.Text,0.0) > 100) and
     (StrToFloatDef(edtNumero.Text,0.0) < 200) then
     lblResultado.Caption := 'Sim'
  else
    lblResultado.Caption := 'N�o';
end;

end.
