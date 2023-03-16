program p1bEjercicio4;
var
min1,i,min2,num:integer;
begin
min1:=99;
min2:=99;
i:=0;
for i:=1 to 1000 do
begin
readln(num);
if(num<min1)then
begin
min2:= min1;
min1:= num
end;
end;
write('El numero menor 1 es: ',min1,' ,y el menor 2 es: ',min2);
end.
{Realizar un programa que lea 1000 números enteros desde teclado. Informar en pantalla cuáles son
los dos números mínimos leídos.
a. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer
el número 0, el cual debe procesarse.
b. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer
el número 0, el cual no debe procesarse}
