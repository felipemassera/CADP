{Realizar un programa que lea una secuencia de caracteres y verifique si cumple
con el patrón X&Y&Z* donde:
                             - X es una secuencia de caracteres numéricos
                             - Y es una secuencia de vocales minúsculas
                             - Z es una secuencia caracteres del doble de
                             longitud de Y
                             - Los caracteres & y * seguro existen
                             Nota: en caso de no cumplir, informar que parte del
                                   patrón no se cumplió }

Program procesoX.Y.Z;

Function esNumero(c: char): boolean;
Begin
  esNumero := (c >= '0') And (c <= '9');
End;

Procedure cumpleX(Var cumple : boolean);
Var 
  c: char;
Begin
  writeln('Ingrese la secuencia X');
  readln(c);
  While (c <> '&') And (cumple) Do
    Begin
      If (Not esNumero(c)) Then
        cumple := false
      Else
        readln(c);
    End;
End;
Function esVocalMinuscula(c: char): boolean;
Begin
  esVocalMinuscula := (c='a')Or(c='e')Or(c='i')Or(c='o')Or(c='u');
End;

Procedure cumpleY(Var cumple:boolean; Var long:integer);

Var 
  c : char;
Begin
  writeln('Ingrese la secuencia Y');
  readln(c);
  While (c <> '&') And (cumple) Do
    Begin
      If (Not esVocalMinuscula(c)) Then
        cumple := false
      Else
        Begin
          long := long + 1;
          readln(c);
        End;
    End;
End;

Procedure cumpleZ(long:integer; Var cumple:boolean);

Var 
  c : char;
  longZ : integer;
Begin
  longZ := 0;
  writeln('Ingrese la secuencia Z');
  readln(c);
  While (c <> '*') Do
    Begin
      longZ := longZ + 1;
      readln(c);
    End;
  cumple := (longZ = long*2);
End;

Var 
  long : integer;
  cumple : boolean;
Begin
  cumple := true;
  cumpleX(cumple);
  If (cumple) Then
    Begin { if x }
      long := 0;
      cumpleY(cumple, long);
      If (cumple) Then
        Begin { if Y }
          cumpleZ(long,cumple);
          If (cumple) Then { if z }
            writeln('Se cumple la secuencia')
          Else
            writeln('No cumple con Z')
        End { end del if y }
      Else
        writeln('No cumple con Y');
    End { end del if x }
  Else
    writeln('No cumple con X');
End.
