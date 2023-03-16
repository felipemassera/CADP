program Prac1_ej3;
var
alto,medio,bajo,Num: integer;
begin
	alto:=-999;
	medio:= alto;
	bajo:= 999;
	for i:=1 to 3 do
	begin
		write('ingrese el num',i,': ');
		read(Num);
	if (Num>alto) then
		begin
			bajo:=medio;
			medio:= alto;
			alto:= Num
	else
		if (Num>medio) then
			bajo:=medio;
			medio:=Num
		else
			bajo:=Num; 
		end;
	end;
	writeln('El valor mas alto es: ',alto,',elvalor del medio es ',medio,' y el valor mas bajo es ' bajo)
end.
{3. Realizar un programa que lea 3 números enteros y los imprima en orden descendente.
Por ejemplo, si se ingresan los valores 4, -10 y 12, deberá imprimir:
12 4 -10}
