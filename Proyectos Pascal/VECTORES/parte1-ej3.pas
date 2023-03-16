{Se dispone de un vector con números enteros, de dimensión física dimF y
dimensión lógica dimL.
a) Realizar un módulo que imprima el vector desde la primera posición hasta laúltima.
b) Realizar un módulo que imprima el vector desde la última posición hasta la primera.
c) Realizar un módulo que imprima el vector desde la mitad (dimL Div 2) hacia
la primera posición, y
desde la mitad más uno hacia la última posición.
d) Realizar un módulo que reciba el vector, una posición X y otra posición Y,
e imprima el vector desde la
posición X hasta la Y. Asuma que tanto X como Y son menores o igual a la
dimensión lógica. Y considere
que, dependiendo de los valores de X e Y, podría ser necesario recorrer hacia
adelante o hacia atrás.
e) Utilizando el módulo implementado en el inciso anterior, vuelva a realizar
los incisos a, b y c.}
program vectores-3-guia4-p1;
const
dimf= 10;

type
vector = array [1..dimf] of integer;

procedure imprimetodo(v : vector);
var
i:=1
begin
  for i:=1 to dimf do
  writeln (v[i]);
end;

Procedure todoimprime(v : vector);

Var 
  i := 1
       Begin
       For i:=dimf downTo 1 Do
       writeln (v[i]);
End;

procedure mitadimprime (v: vector; dl: integer);
i:integer;
begin
  for i:= (dl/2) downTo 1 do
  writeln(v[i]);
end;

Procedure imprimemitad (v: vector; dl: integer);
i: integer;
Begin
  For i:= (dl/2)+1 to dimF  Do
    writeln(v[i]);
End;


procedure imprXeY(v:vector; x,y :integer);
var 
i:integer;
begin
  if (x>y) then
    For i:= x downTo y  Do
  writeln(v[i]);
else 
for i:= x to y do
writeln(v[i]);
end;
