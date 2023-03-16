program practica0_1;
var
num1,num2,aux : integer ;
begin
write('ingrese el valor 1 : ');
read(num1);
write('ingrese el valor 2 : ');
read(num2);
aux:=num1;
num1:=num2 ;
num2:=aux ;
write('El mumero de la var 1 es ahora ', num1, ' el numero de la variable 2 es ', num2);
end.

 {Implemente un programa que lea por teclado dos números enteros e imprima en pantalla los
valores leídos en orden inverso. Por ejemplo, si se ingresan los números 4 y 8, debe mostrar el
mensaje: Se ingresaron los valores 8 y 4}
