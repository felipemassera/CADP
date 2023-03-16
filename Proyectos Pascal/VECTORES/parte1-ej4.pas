{Se dispone de un vector con 100 números enteros. Implementar los siguientes módulos:


e) elementoMaximo: retorna la posición del mayor elemento del vector
f) elementoMinimo: retorna la posicion del menor elemento del vector}

Program ej4vectores;

Const 
  tope = 100;

Type 
  vector = array [1..tope] Of integer;

Procedure carga(Var vec: vector);

Var 
  i: integer;
Begin
  For i:= 1 To tope Do
    vec[i] := abs(random (50));
End;

{YAPA ES PARA VER EL VECTOR}
procedure imprimir(v: vector);
var
i:integer;
begin
  for i:= 1 to tope do
writeln (i,'*: ', v[i]);
end;




{a) posicion: dado un número X y el vector de números, retorna la posición del número X en dicho vector,
o el valor -1 en caso de no encontrarse.}
Procedure posicion(v: vector, num:integer);
Begin

  For i:= 1 To tope Do
    If (v[i] = num) Then
      write ('esta en la pos: ',i);
  Else
    write ('-1');
End;

{b) intercambio: recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna el mismo vector
donde se intercambiaron los valores de las posiciones x e y.}
Procedure intercambio(Var v:vector; x,y:integer);

Var 
  aux: integer;
Begin
  aux := v[x];
  v[x] := v[y];
  v[y] := aux;
End;
{c) sumaVector: retorna la suma de todos los elementos del vector.}
function sumavector(v): integer;
var
tot, i: integer
begin
tot:=0;
for i:=1 to tope do
tot := tot + v[i];
sumavector := tot;  
end; 
{d) promedio: devuelve el valor promedio de los elementos del vector.}
function promedio (v : vector): real;
var
i, tot : integer;
begin
tot := 0;
  for i:=1 to tope do begin
  tot := tot + v[i];

  end;
  promedio:= tot/tope;
end; 
{elementoMaximo: retorna la posición del mayor elemento del vector}
function elementoMaximo(v:vector): integer;
var
i, max:integer;
begin
max:=0;
for i:=1 to tope do
if (a[i]>max) then
max:= a[i];
elementoMaximo:= max;
end;
{elementoMinimo: retorna la posición del menor elemento del vector}

Function elementoMinimo(v:vector): integer;

Var 
  i, min: integer;
Begin
  min := 999;
  For i:=1 To tope Do
    If (a[i]<min) Then
      min := a[i];
  elementoMinimo := min;
End;



Var 
  v : vector;
  x,y,num, total: integer;
Begin
total:=0;
  carga(v);
  imprimir(v);
  write ('ingrese el numero que desea buscar en el vect:  ');
  readln (num);
  //puse random 50
  posicion(v,num);
  write('ingrese los numeros a reemplazar X e Y');
  readln (x,y);
  intercambio(v,x,y);
  imprimir(v);
  total:= sumaVector(v);
writeln ('la suma de todos los elementos del vector es: ',total);
writeln ('la suma de todos los elementos del vector es: ',promedio(v):2:2);
writeln ('el elemento max es ', elementoMaximo(v));
writeln ('el elemento min es ', elementoMinimo(v));

End.
