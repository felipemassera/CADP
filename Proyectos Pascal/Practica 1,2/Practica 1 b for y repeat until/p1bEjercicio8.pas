program p1bEjercicio8;
var
mes,cont,venta,i,masVenta,dia:integer;
begin
dia:=0;
mes:=0;
masVenta:=0;
for i:=1 to 31 do
begin
cont:=1;
write('Escriba la cantidad de ventas del dia ',i,' n*de venta ',cont,':$');
readln(venta);
mes:=mes+venta;
while(venta<>0) do
begin
cont:=cont+1;
write('Escriba la cantidad de ventas del dia ',i,' n*de venta ',cont,':$');
readln(venta);
mes:=mes+venta;
end;
if(cont>masVenta) then
begin
masVenta:=cont;
dia:=i;
end;
writeln('La cantidad de ventas del dia ',i,' es de ',(cont-1));

end;
writeln('La valor de las ventas del mes es: $',mes);
writeln('La mayor candidad de ventas del mes fue: ',(masVenta-1),' y fue el dia ',dia);
end. 


{Un local de ropa desea analizar las ventas realizadas en el último mes. Para ello se lee por cada día
del mes, los montos de las ventas realizadas. La lectura de montos para cada día finaliza cuando se
lee el monto 0. Se asume un mes de 31 días. Informar la cantidad de ventas por cada día, y el monto
total acumulado en ventas de todo el mes.
a) Modifique el ejercicio anterior para que además informe el día en el que se realizó la
mayor cantidad de ventas}
