program Prac1_ej7;
var
codigo,val,valn:integer;
begin
	repeat
		write ('Escriba el codigo del producto: ');
		read(codigo);
		write('Ingrese valor actual: ');
		read(val);
		write('Ingrese el nuevo valor: ');
		read(valn);
		if (valn<val+(val*0.1)) then
		writeln('el aumento de precio del producto ', codigo ,' no supera el 10%')
		else
		writeln('el aumento de precio del producto ',codigo,' es superior al 10%');
	until (codigo=32767);
end.



{7. Realizar un programa que lea el código, el precio actual y el nuevo precio de los productos de un
almacén. La lectura finaliza al ingresar el producto con el código 32767, el cual debe procesarse.
Para cada producto leído, el programa deberá indicar si el nuevo precio del producto supera en un
10% al precio anterior.
Por ejemplo:
○ Si se ingresa el código 10382, con precio actual 40, y nuevo precio 44, deberá imprimir: “el
aumento de precio del producto 10382 no supera el 10%”
○ Si se ingresa el código 32767, con precio actual 30 y nuevo precio 33,01, deberá imprimir: “el
aumento de precio del producto 32767 es superior al 10%”}
