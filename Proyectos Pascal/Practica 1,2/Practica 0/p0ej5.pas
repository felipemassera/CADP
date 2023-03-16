program practica0_5;
var
	x,y, venta, mio: integer;
	valor:real;
begin
	write('Ingrese la cantidad de caramelos que tiene para vender ');
	read(x);
	write('Ingrese la cantidad de  clientes ');
	read(y);
	mio:= x mod y;
	venta:= x div y;
	valor:= venta * 1.6;
	writeln ('Se vendieron por cada cliente ', venta, ' caramelos, debiendo pagar cada uno de ellos $', valor:2:2);
	writeln('Me queda un total del plata = $', valor * y :2:2);
	writeln('sobraron ', mio, ' caramelos para mi.');
end.

{Un kiosquero debe vender una cantidad X de caramelos entre Y clientes, dividiendo
cantidades iguales entre todos los clientes. Los que le sobren se los quedará para él.
a. Realice un programa que lea la cantidad de caramelos que posee el kiosquero (X),
la cantidad de clientes (Y), e imprima en pantalla un mensaje informando la
cantidad de caramelos que le corresponderá a cada cliente, y la cantidad de
caramelos que se quedará para sí mismo.
b. Imprima en pantalla el dinero que deberá cobrar el kiosquero si cada caramelo
tiene un valor de $1.60,}
