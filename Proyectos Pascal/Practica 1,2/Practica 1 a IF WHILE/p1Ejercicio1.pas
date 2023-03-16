program Prac1_ej1;
var
num1,num2: integer;
begin
	write('ingrese el num 1 ');
	read(num1);
	write('Ingrese el num2 ');
	read(num2);
	if (num1=num2) then
		write('num1 y num2 son =')
	else
	if (num1>num2) then
		writeln('Num1 es mayor que Num2')
	else
		writeln('Num1 es menor que Num2');
end.

{Realizar un programa que lea 2 números enteros desde teclado e informe en pantalla cuál de los
dos números es el mayor. Si son iguales debe informar en pantalla lo siguiente: “Los números leídos
son iguales”}
