program Prac1_ej8;
var
c:char;
voc,i:integer;
begin
	voc:=0;
	for i := 1 to 3 do
	begin
	writeln('Escriba el caracter ',i,': ');
	readln(c);	
	if ((c='a')or(c='e')or(c='i')or(c='o')or(c='u'))then
	voc := voc + 1;
	end;
	
	if (voc=3) then
	writeln('Los tres son vocales');
	if((voc<3)and(voc>1))then
	writeln('al menos un carácter no era vocal');
	if(voc=0) then
	writeln('Ninguna es vocal');
end.
{Realizar un programa que lea tres caracteres, e informe si los tres eran letras vocales o si al menos
uno de ellos no lo era. Por ejemplo, si se leen los caracteres “a e o” deberá informar “Los tres son
vocales”, y si se leen los caracteres “z a g” deberá informar “al menos un carácter no era vocal”.}
