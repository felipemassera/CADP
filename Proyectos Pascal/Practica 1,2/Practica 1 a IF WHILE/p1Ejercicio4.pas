program Prac1_ej4;
var
x,y:real;	
begin
	write('ingrese un numero para la comparacion ');
	read(x);
	y:= x*2;
	while (x<>y) do
		begin
		write('Ingrese un numero ');
		read(x);
		end;
end.

{Realizar un programa que lea un número real X. Luego, deberá leer números reales hasta que se
ingrese uno cuyo valor sea exactamente el doble de X (el primer número leído)}
