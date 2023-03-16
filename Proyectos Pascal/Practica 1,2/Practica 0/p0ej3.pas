program practica0_3;
var
num1,num2,aux : real ;
begin
write('ingrese el valor 1 : ');
read(num1);
write('ingrese el valor 2 : ');
read(num2);
aux:= num1/num2;
write('La la division del numero ' , num1:1:1, ' y el numero ',num2:1:1 , ' es: ',aux:1:2);
end.

{Implemente un programa que lea dos números reales e imprima el resultado de la división de
los mismos con una precisión de dos decimales. Por ejemplo, si se ingresan los valores 4,5 y 7,2,
debe imprimir: El resultado de dividir 4,5 por 7,2 es 0,62
Recuerde que para imprimir en pantalla números reales puede utilizar la notación:
writeln(X:Y:Z) donde X es el número a imprimir, Y es el ancho (en cantidad de caracteres) que
debe ocupar la impresión, y Z es la cantidad de decimales. Por ejemplo, sea el número
pi=3.141592654 :
3.14 => writeln(pi,1,2);
3.14 => writeln(pi,8,2); (hay 4 espacios delante del 3, para completar 8 caracteres de ancho)
3,1415 => writeln(pi,1,4);}
