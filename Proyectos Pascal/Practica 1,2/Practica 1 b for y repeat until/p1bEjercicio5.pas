program p1bEjercicio5;
var
max,min,num,suma:integer;

begin
max:=0;
min:=999;
suma:=0;
writeln('Ingrese numero hasta ingresar el 100.');
repeat
readln(num);
if(num>max)then
max:=num;
if(num<min)then
min:=num;
suma:= suma+num;
until(num=100);
writeln('El numero maximo leido es: ', max);
writeln('El numero minimo leido es: ', min);
writeln('la suma de los numeros es: ', suma);
end.

{Realizar un programa que lea números enteros desde teclado. La lectura debe finalizar cuando se
ingrese el número 100, el cual debe procesarse. Informar en pantalla:
◦ El número máximo leído.
◦ El número mínimo leído.
◦ La suma total de los números leídos.}
