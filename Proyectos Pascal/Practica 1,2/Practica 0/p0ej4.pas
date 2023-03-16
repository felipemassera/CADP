program practica0_4;
var
diametro,radio,area,perimetro: real;
begin
write('Ingrese el tamano del diametro del circulo ' );
read(diametro);
radio:= diametro/2;
area:= 3.14 * (radio*2);
perimetro:= diametro*3.14;
writeln('Para una circunferencia de diametro ' , diametro:2:2, ' se puede calcular.');
writeln('El radio del circulo: ' , radio:2:2);
writeln('El area del circulo: ', area:2:2);
writeln('El perimetro del circulo: ', perimetro:2:2);
end.

{Implemente un programa que lea el diámetro D de un círculo e imprima:
a. El radio (R) del círculo (la mitad del diámetro)
b. El área del círculo. Para calcular el área de un círculo debe utilizar la fórmula PI x R
2
c. El perímetro del círculo. Para calcular el perímetro del círculo debe utilizar la fórmula
D*PI (o también PI*R*2)}
