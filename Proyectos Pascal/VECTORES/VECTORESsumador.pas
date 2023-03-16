Program sumador;

Type 
vnums = array [1..10] Of integer;


Var 
 numeros : vnums;
 i : integer;

Begin
 For i:=1 To 10 Do {primer bloque for}
 numeros[i] := i;
 For i :=1  To 9 Do {segundo bloque for}
 numeros[i+1] := numeros[i+1] + numeros [i];
For i:=1 To 10 Do {primer bloque for}
  writeln(numeros[i]);

End.
