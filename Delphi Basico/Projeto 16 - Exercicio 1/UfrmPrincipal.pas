unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TNivel = (Estagiario, Junior, Pleno, Senior);

  TfrmPrincipal = class(TForm)
    edtNome: TEdit;
    btnIf: TButton;
    btnCase: TButton;
    rdgNivel: TRadioGroup;
    Label1: TLabel;
    procedure btnIfClick(Sender: TObject);
    procedure btnCaseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}



procedure TfrmPrincipal.btnCaseClick(Sender: TObject);

begin
  case TNivel(rdgNivel.ItemIndex) of  // Utilizei o Enum TNivel
    Estagiario :
      ShowMessage('Eu ' + edtNome.Text + ' sou do n�vel Estagi�rio');
    Junior :
      ShowMessage('Eu ' + edtNome.Text + ' sou do n�vel J�nior');
    Pleno :
      ShowMessage('Eu ' + edtNome.Text + ' sou do n�vel Pleno');
    Senior :
      ShowMessage('Eu ' + edtNome.Text + ' sou do n�vel Senior');
    else
      ShowMessage('Op��o Inv�lida');
  end;

  { PODERIA N�O UTILIZAR O ENUM, AI FICARIA ASSIM:
  case rdgNivel.ItemIndex of
    0 : ShowMessage('Eu ' + edtNome.Text + ' sou do n�vel Estagi�rio');
    1 : ShowMessage('Eu ' + edtNome.Text + ' sou do n�vel J�nior');
    2 : ShowMessage('Eu ' + edtNome.Text + ' sou do n�vel Pleno');
    3 : ShowMessage('Eu ' + edtNome.Text + ' sou do n�vel Senior');
  end;
  }

end;

procedure TfrmPrincipal.btnIfClick(Sender: TObject);

begin
if UpperCase(trim(edtNome.Text)) = 'CARLOS' then
  ShowMessage('Sou eu. Presente')
else
  ShowMessage('N�o sou eu. Este n�o � meu nome');
end;

end.
