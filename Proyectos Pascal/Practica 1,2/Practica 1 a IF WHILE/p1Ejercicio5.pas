program Prac1_ej5;
var
x,y,i:real;	
begin
	i:=0;
	write('ingrese un numero para la comparacion ');
	
	read(x);
	y:= x*2;
	writeln('numero de salida =', y:2:0);
	while (x<>y) and (i<10) do
		begin
		write('Ingrese un numero ');
		read(x);
		i:= i+1;
		writeln(i);
		end;
		if (i>=10) then
			write('No se ha ingresado el doble de X');
end.


{Modifique el ejercicio anterior para que, luego de leer el número X, se lean a lo sumo 10 números
reales. La lectura deberá finalizar al ingresar un valor que sea el doble de X, o al leer el décimo
número, en cuyo caso deberá informarse “No se ha ingresado el doble de X”.}
