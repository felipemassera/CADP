
Program p1bEjercicio4b;

Var 
  min1,min2,num: integer;
Begin
  min1 := 99;
  min2 := 99;
  write('Ingrese 1000numeros o hasta ingresar "0".');
  readln(num);
  While (num<>0) Do
    //mientras el numero n sea 0 sigue.
    Begin
      If (num<min1)Then
        Begin
          min2 := min1;
          min1 := num
        End;
      readln(num);
    End;
  write('El numero menor 1 es: ',min1,' ,y el menor 2 es: ',min2);
End.

{Realizar un programa que lea 1000 números enteros desde teclado.
Informar en pantalla cuáles son los dos números mínimos leídos.
a. Modifique el ejercicio anterior para que, en vez de leer 1000 números,
 la lectura finalice al leer el número 0, el cual debe procesarse.
b. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura 
 finalice al leer el número 0, el cual no debe procesarse}
