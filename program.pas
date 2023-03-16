program ej1;
var
c:integer;

var 
a, b : integer;

procedure calcular (var b , a : integer);
begin
  b:= 10;
  while (b>0) do begin
  a:= a+b;
  b:= b-2;
  c := c-b;
end;
writeln ('METODO a= ', a, ' b= ', b,' c= ', c);
end;

begin
a:=0;
b:= 80;
c:= 30;
writeln ('PROGRAMA 1   a= ', a, ' b= ', b,' c= ', c);
calcular (a,b);
writeln('PROGRAMA 2  a= ', a, ' b= ', b,' c= ', c);
end.