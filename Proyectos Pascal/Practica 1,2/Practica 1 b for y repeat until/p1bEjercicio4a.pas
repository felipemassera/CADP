
Program p1bejercicio4a;

Var 
  min1,i,min2,num: integer;
Begin
  min1 := 99;
  min2 := 99;
  i := 0;
  write('Ingrese 1000 numeros o hasta ingresar "0".');
  Repeat
    readln(num);
    If (num<min1)Then
      Begin
        min2 := min1;
        min1 := num
      End;
    i := i+1;
  Until ((num=0) Or (i>=1000));
  //Sale del bucle cuando pasa uno o el otro
  write('El numero menor 1 es: ',min1,' ,y el menor 2 es: ',min2);
End.




{Realizar un programa que lea 1000 números enteros desde teclado. Informar en pantalla cuáles son
los dos números mínimos leídos.
a. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer
el número 0, el cual debe procesarse.
b. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer
el número 0, el cual no debe procesarse}
