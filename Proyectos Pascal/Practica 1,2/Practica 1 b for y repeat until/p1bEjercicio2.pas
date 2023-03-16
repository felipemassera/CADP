
Program p1bEjercicio2;

Var 
  num,pos,i,max: integer;
Begin
  pos := 0;
  max := 0;
  writeln('Ingrese 10 numeros.');
  For i:=1 To 10 Do
    Begin
      readln(num);
      If (num>max)Then
        Begin
          max := num;
          pos := i
        End;
    End;
  writeln('El mayor numero leido fue el ' , max, ', en la posicion ',  pos);
End.



{Realice un programa que lea 10 números e informe cuál fue el mayor número leído. Por ejemplo, si
se lee la secuencia:
3 5 6 2 3 10 98 8 -12 9
deberá informar: “El mayor número leído fue el 98”}




{a. Modifique el programa anterior para que, además de informar el mayor número leído, se
informe el número de orden, dentro de la secuencia, en el que fue leído. Por ejemplo, si se lee la
misma secuencia:
3 5 6 2 3 10 98 8 -12 9
deberá informar: “El mayor número leído fue el 98, en la posición 7”}
