program p1bEjercicio1;
var
num,i,max,suma,cont:integer;
begin
max:=0;
suma:=0;
cont:=0;
for i:=1 to 10 do
begin
readln(num);
suma:=suma+num;
if (num>5) then
cont:=cont+1;
if(num>max) then 
max:=num;
end;
writeln('El mayor numero de los ingresados fue el: ',max);
writeln('la cantidad de numero mayores a 5 fue de: ',cont);
writeln('la suma de todos los numeros ingresados fue de: ',suma);
	
end.

{Realizar un programa que lea 10 números enteros e informe la suma total de los números leídos.
a. Modifique el ejercicio 1 para que además informe la cantidad de números mayores a 5}
