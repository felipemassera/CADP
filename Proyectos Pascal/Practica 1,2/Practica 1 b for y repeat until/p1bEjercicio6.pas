program p1bEjercicio6;
type
Codigo = 1..200;
var
min,num,i,cont:integer;
codmin1,codmin2,cod: Codigo;
begin
cont:=0;
min:=99;
codmin1:=200;
codmin2:=200;

writeln('Buenos dias, ingrese sus productos.');
for i:=1 to 5 do
begin
write('Ingrese el codigo del producto: ');
read(cod);
write('Ingrese el valor del producto n*',i,' :');
readln(num);
if(num>16)then
	if(num mod 2=0)then
		cont:=cont+1;
if(num<min)then
	begin
	min:=num;
	codmin2:=codmin1;
	codmin1:= cod;
	end;
end;
writeln('El codigo del producto mas barato es: #',codmin1,'.El segundo mas barato es: #',codmin2);
writeln('La cantidad de productos de mas de 16 pesos con codigo par es:',cont);
end.

{Realizar un programa que lea información de 200 productos de un supermercado. De cada producto
se lee código y precio (cada código es un número entre 1 y 200). Informar en pantalla:
- Los códigos de los dos productos más baratos.
- La cantidad de productos de más de 16 pesos con código par.}
