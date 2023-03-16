

{Realizar un programa que cargue un vector de 1500 números enteros positivos.
Al finalizar la carga informe la posición de los números mayores que 50.}

Program vectores;

Const 
  rango = 15;

Type 
  vect = array [1..rango] Of integer;

Procedure cargav(Var v: vect;Var diml :integer);
Begin
  diml := 1;
  readln(v[diml]);
  While (v[diml]<>0) And (diml<rango) Do
    Begin
      diml := diml + 1;
      readln(v[diml]);
    End;
End;

Procedure VerV(Var v:vect ; diml:integer);

Var 
  i: integer;
Begin
  For i := 1 To diml Do
    Begin
      If v[i]>50 Then
        writeln ('El num ', v[i], ' esta en la posicion ' , i);
    End;
End;

Var 
  v : vect;
  diml: integer;
Begin
  diml := 1;
  cargav(v,diml);
  VerV(v,diml);
End.
