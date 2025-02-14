unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TRegistro = record
    Nome: String;
    Sexo: String;
  end;

  TForm1 = class(TForm)
    btnIniciar: TButton;
    Label1: TLabel;
    mmLista: TMemo;
    btnListar: TButton;
    btnQuantSexo: TButton;
    lblQuantMulher: TLabel;
    lblQuantHomem: TLabel;
    lblQuantOutro: TLabel;
    procedure btnIniciarClick(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
    procedure btnQuantSexoClick(Sender: TObject);
  private
    { Private declarations }
    FRegistro : array of TRegistro;
    FContHomem, FContMulher, FContOutro, FQuantidade : Integer;
    procedure Cadastro;
    procedure Limpar;
    procedure Listar;
    procedure QuantidadePorSexo;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Limpar;
var
  I : Integer;
begin
  if FQuantidade > 0 then
    begin
      for I := 0 to FQuantidade do
        begin
          FRegistro[I].Nome := '';
          FRegistro[I].Sexo := '';
        end;
    end;
end;

procedure Tform1.Cadastro;
var
  i, xQuantidade: Integer;
  xSexo : String;

begin
  FContHomem := 0;
  FContMulher := 0;
  FContOutro := 0;

  FQuantidade := StrToInt( inputbox
                 ( 'Cadastro','Deseja cadastrar quantas pessoas?',''))
                 - 1;

  SetLength(FRegistro,(FQuantidade+1));

  for I := 0 to FQuantidade do
  begin
    mmLista.Lines.Clear;
    btnQuantSexo.Visible := False;
    mmLista.Visible := False;
    lblQuantMulher.Visible := False;
    lblQuantHomem.Visible := False;
    lblQuantOutro.Visible := False;
    btnListar.Visible := False;

    FRegistro[I].Nome:= inputbox( 'Cadastro','Nome','');
    if FRegistro[I].Nome = '' then
      Break;

    xSexo := inputbox( 'Cadastro','Sexo: 1 - Masculino ou 2 - Feminino','');
    if xSexo = '1' then
      begin
        FRegistro[I].Sexo := 'Homem';
        FContHomem := FContHomem + 1;
      end
    else if xSexo = '2' then
      begin
        FRegistro[I].Sexo := 'Mulher';
        FContMulher := FContMulher + 1;
      end
    else
      begin
        FRegistro[I].Sexo := 'N�o Identificado';
        FContOutro := FContOutro + 1;
      end;
  end;

  btnListar.Visible := True;

end;

procedure Tform1.Listar;
var
  i : Integer;

begin
  mmLista.Lines.Add('Lista de todos os cadastrados:');
  for I := 0 to FQuantidade do
    begin
      if FRegistro[I].Nome = '' then continue;
      mmLista.Lines.Add(FRegistro[I].Nome +' � '+ FRegistro[I].Sexo);
    end;
  mmLista.Visible := True;
  btnQuantSexo.Visible := True;
end;

procedure Tform1.QuantidadePorSexo;
begin
  lblQuantMulher.Caption := 'Quantidade de Mulheres: ' + IntToStr(FContMulher);
  lblQuantHomem.Caption := 'Quantidade de Homens: ' + IntToStr(FContHomem);
  lblQuantOutro.Caption := 'Quantidade de N�o identificados: '
                            + IntToStr(FContOutro);
  lblQuantMulher.Visible := True;
  lblQuantHomem.Visible := True;
  lblQuantOutro.Visible := True;
end;

procedure TForm1.btnIniciarClick(Sender: TObject);
begin
  Self.Limpar;
  Self.Cadastro;
end;

procedure TForm1.btnListarClick(Sender: TObject);
begin
  Self.Listar;
end;

procedure TForm1.btnQuantSexoClick(Sender: TObject);
begin
  Self.QuantidadePorSexo;
end;

end.
