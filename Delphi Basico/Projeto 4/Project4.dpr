program Project4;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;
{
EXEMPLO PRA USAR ENUM NO LUGAR DOS N�MEROS NO IF
type
  Thora = (opMeioDia = 12, opMeiaNoite = 18);
}

function MaiorIdade (const aIdade: Byte): Boolean;
begin
  if aIdade >= 18 then
    Result := True        //n�o vai ; porque considera todo o if como uma linha
  else
    Result := False;
end;

{
OP��O DE IF:

  if aIdade >= 18 then
  begin
    Result := True;
  end
  else
  begin
    Result := False;
  end;

OU

  Result := False;
  if aIdade >= 18 then
    Result := True;
  end;

}

function Periodo (const aHora: Byte): String;
begin
    if aHora < 12 then
      Result := 'Bom dia'
    else if aHora < 18 then
      Result := 'Boa tarde'
    else
      Result := 'Boa noite';
end;

{
EXEMPLO IF COM ENUM:

begin
    if (Thora(aHora) < THora.opMeioDia) then
      Result := 'Bom dia'
    else if aHora < 18 then
      Result := 'Boa tarde'
    else
      Result := 'Boa noite';
end;

}

var
  xIdade: Byte;
  xHora: Byte;
  xStrPeriodo: String;
  xEntrada: String;

  begin
  try
    writeln('Ol�, entre com sua idade:');
    Readln(xIdade);

    writeln('Entre com o hor�rio:');
    Readln(xHora);

    xStrPeriodo := Periodo (xHora);

    if MaiorIdade (xIdade) then
      writeln(xStrPeriodo + ' voc� � maior de idade.')
    else
      writeln(xStrPeriodo + ' voc� n�o � maior de idade.');

    {   OP��O IF COM OPERADOR L�GICO NOT:

    if not (MaiorIdade (xIdade)) then
      writeln(xStrPeriodo + ' voc� n�o � maior de idade.');
    }

    Readln(xEntrada);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
