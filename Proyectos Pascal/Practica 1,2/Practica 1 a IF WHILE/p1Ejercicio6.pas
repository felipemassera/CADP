program Prac1_ej6;
var
promedio,j:real;
i,legajo,nota,aux:integer;	
begin
	i:=0;
	nota:=0;
	j:=0;
	aux:=0;
	write('ingrese un numero de legajo ');
	read(legajo);
	while (legajo<>-1)do
		begin
		i:= i+1;
		write('Ingrese el promedio del alumno ',i,': ');
		read(promedio);
		if (promedio>6.5) then
			nota:= nota + 1; 
		if (promedio>8.5) and (legajo<2500) then
			aux:=aux+1;
		write('ingrese otro numero de legajo (salida: -1) ');
		read(legajo);
		end;
		j:= (aux/i)*100;
		writeln('La cantidad de alumnos leidos fue: ' ,i);
		writeln('La cantidad de alumnos cuyo promedio supera 6.5: ' ,nota);
		writeln('El porcentaje de alumnos destacados: ' ,j:3:2,'%');
end.

{Realizar un programa que lea el número de legajo y el promedio de cada alumno de la facultad. La
lectura finaliza cuando se ingresa el legajo -1, que no debe procesarse.
Por ejemplo, se lee la siguiente secuencia:
33423
8.40
19003
6.43
-1
En el ejemplo anterior, se leyó el legajo 33422, cuyo promedio fue 8.40, luego se leyó el legajo
19003, cuyo promedio fue 6.43, y finalmente el legajo -1 (para el cual no es necesario leer un
promedio).
Al finalizar la lectura, informar:
○ La cantidad de alumnos leída (en el ejemplo anterior, se debería informar 2)
○ La cantidad de alumnos cuyo promedio supera 6.5 (en el ejemplo anterior, se debería informar 1)
○ El porcentaje de alumnos destacados (alumnos con promedio mayor a 8.5) cuyo legajo sean
menor al valor 2500 (en el ejemplo anterior se debería informar 0%).}
