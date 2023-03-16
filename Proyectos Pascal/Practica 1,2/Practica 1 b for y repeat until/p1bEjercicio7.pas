program p1bEjercicio7;
type
posiciones=1..100;

var
ganador,segundo,anteultimo,ultimo,nombre:string;
i:integer;
posi: posiciones;
begin

for i:=1 to 4 do
begin
writeln('Ingrese el nombre del conductor');
readln(nombre);
writeln('Ingrese la posicion al finalizar');
readln(posi);

case posi of
1:
	ganador:=nombre;
2:
	segundo:=nombre;
99:
anteultimo:=nombre;
100:
ultimo:=nombre;
end;
end;
writeln('El nombre del puesto  1  es: ', ganador);
writeln('El nombre del puesto  2  es: ', segundo);
writeln('El nombre del puesto 99  es: ', anteultimo);
writeln('El nombre del puesto 100 es: ', ultimo);
end.

{Realizar un programa que lea desde teclado información de autos de carrera. Para cada uno de los
autos se lee el nombre del piloto y el tiempo total que le tomó finalizar la carrera. En la carrera
participaron 100 autos. Informar en pantalla:
- Los nombres de los dos pilotos que finalizaron en los dos primeros puestos.
- Los nombres de los dos pilotos que finalizaron en los dos últimos puestos.}
