program Prac1_ej8;
var
c:char;
num, total:integer;
begin
	total:=0;
	repeat
	writeln('que desea hacer?(+,-)');
	read(c);
	until (c='+') or (c='-');
	if (c='+')then
	begin
	writeln('ingrese un numero (finaliza al poner 0)');
	readln(num);
	while(num<>0)do
	begin
	total:= total+num;
	writeln('ingrese un numero (finaliza al poner 0)');
	readln(num)
	end;
	end;
	
	if (c='-')then
	begin
	writeln('ingrese un numero (finaliza al poner 0)');
	readln(num);
	total:=num*2;
	while(num<>0)do
	begin
	total:= total-num;
	writeln('ingrese un numero (finaliza al poner 0)');
	readln(num)
	end;
	end;
	writeln(c,' El resultado es', total);
end.
{Realizar un programa que lea un carácter, que puede ser “+” (suma) o “-” (resta); si se ingresa otro
carácter, debe informar un error y finalizar. Una vez leído el carácter de suma o resta, deberá leerse
una secuencia de números enteros que finaliza con 0. El programa deberá aplicar la operación leída
con la secuencia de números, e imprimir el resultado final.
Por ejemplo:
○ Si se lee el carácter “-” y la secuencia 4 3 5 -6 0 , deberá imprimir: 2 (4 – 3 – 5 - (-6) )
○ Si se lee el carácter “+” y la secuencia -10 5 6 -1 0, deberá imprimir 0 ( -10 + 5 + 6 + (-1) )}
