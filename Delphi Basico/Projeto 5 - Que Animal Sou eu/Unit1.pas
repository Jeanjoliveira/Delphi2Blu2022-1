unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type

  TAnimal = (tpCachorro, tpPassaro, tpGato, tpPeixe);

  TForm1 = class(TForm)
    Label1: TLabel;
    cmbAnimais: TComboBox;
    btProcessar: TButton;
    mmHistorico: TMemo;
    procedure btProcessarClick(Sender: TObject);
  private
    { Private declarations }
    procedure QueAnimalSouEu;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btProcessarClick(Sender: TObject);
begin
  {case cmbAnimais.ItemIndex of
    0: //Cachorro
    begin
      mmHistorico.Lines.Add('Sou um cahorro e tenho 4 patas.');
    end;
    1: //P�ssaro
    begin
      mmHistorico.Lines.Add('Sou um p�ssaro e tenho 2 patas.');
    end;
    2: //Gato
    begin
      mmHistorico.Lines.Add('Sou um gato e tenho 4 patas.');
    end;
    3: //Peixes
    begin
      mmHistorico.Lines.Add('Sou um peixe e possuo nadadeiras.');
    end;
    else //Sem defini��o
    begin
      mmHistorico.Lines.Add('N�o foi definido nenhum animal');
    end;
  end;}

  QueAnimalSouEu;
end;

procedure TForm1.QueAnimalSouEu;
var
  xFrase: String;
begin
  case TAnimal (cmbAnimais.ItemIndex) of
    tpCachorro: //Cachorro
    begin
      xFrase := ('Sou um cahorro e tenho 4 patas.');
    end;
    tpPassaro: //P�ssaro
    begin
      xFrase := ('Sou um p�ssaro e tenho 2 patas.');
    end;
    tpGato: //Gato
    begin
      xFrase := ('Sou um gato e tenho 4 patas.');
    end;
    tpPeixe: //Peixes
    begin
      xFrase := ('Sou um peixe e possuo nadadeiras.');
    end;
    else //Sem defini��o
    begin
      xFrase := ('N�o foi definido nenhum animal');
    end;
  end;

  mmHistorico.Lines.Add(xFrase);
end;

end.
