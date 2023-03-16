{. La Agencia Espacial Europea (ESA) está realizando un relevamiento de todas las sondas espaciales lanzadas
al espacio en la última década. De cada sonda se conoce su nombre, duración estimada de la misión
(cantidad de meses que permanecerá activa), el costo de construcción, el costo de mantenimiento mensual y
rango del espectro electromagnético sobre el que realizará estudios. Dicho rango se divide en 7 categorías:
1. radio; 2. microondas; 3.infrarrojo; 4. luz visible; 5. ultravioleta; 6. rayos X; 7. rayos gamma
Realizar un programa que lea y almacene la información de todas las sondas espaciales. La lectura finaliza al
ingresar la sonda llamada “GAIA”, que debe procesarse.
Una vez finalizada la lectura, informar:

d. El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las sondas.
Nota: para resolver los incisos a), b), c) y d), la lista debe recorrerse la menor cantidad de veces posible
}
Program ej6tp6listas;

Type 

  rango = array [1..7] Of integer;
  sonda = Record
    nombre: string [20];
    duracionM : integer;
    //meses que dura la mision
    costoConst: integer;
    costoMant: integer;
    categorias: integer;
  End;

  lista = ^nodo;
  nodo = Record
    dato : sonda;
    sig : lista;
  End;

Procedure iniciarArr(a:rango);

Var 
  i: integer;
Begin
  For i:=1 To 7 Do
    a[i] := 0;
End;

Procedure leersonda(Var s:sonda;var a:rango);
begin
  
  writeln ('Ingrese el nombre de la sonda');
  readln (s.nombre);
  writeln ('Ingrese la duracion del viaje');
  readln(s.duracionM);
  writeln ('Ingrese el costo de construccion');
  readln(s.costoConst);
  writeln ('Ingrese el costo de mantenimiento');
  readln(s.costoMant);
  writeln ('Que tipo de estudios realiza la nave? (1..7): ');
  readln(s.categorias) ;
  a[s.categorias] := a[s.categorias] + 1;
End;

Procedure agregarAdelante(Var l:lista ; s: sonda);
Var 
  nuevo: lista;
Begin
  new(nuevo);
  nuevo^.dato := s;
  nuevo^.sig := l;
  l := nuevo;
End;


Procedure cargarlista(Var l:lista);

Var 
  s : sonda;
  a: rango;
Begin
iniciarArr(a);
  Repeat
    leersonda(s,a);
    agregarAdelante(l,s);
  Until (s.nombre = 'GAIA');
End;

{a. El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento).}
Procedure laMasCostosa(c,m,t:integer; nombre:String ; Var MaxVal: integer; Var MaxName: String);
begin
  if (c+(m*t) > MaxVal) then begin
  MaxVal := c+(m*t);
  MaxName := nombre;
end;
end;

{b. La cantidad de sondas que realizarán estudios en cada rango del espectro
electromagnético.}
procedure recorrerarr(a:rango);
var
i:integer;
begin
  for i:= 1 to 7 do
  writeln ('* las sondas del rango ',i, ' son: ', a[i]); 
end; 

{c. La cantidad de sondas cuya duración estimada supera la duración promedio de
todas las sondas.}
{d. El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las sondas.}
procedure promedios (l:lista; durac: integer; diml: integer: costotot:integer);
var 
sonda:= integer;
begin
sonda:= 0;
  while (l<>nil) do begin
    if(l^.dato.duracionM > (durac/diml) ) then
    sonda:= sonda + 1;

    if (l^.dato.costoConst > (costotot/diml)) then
    writeln('La sonda ', l^.dato.nombre, ' supera el costo promedio de las naves');    
    l:= l^.sig;
  end;
    writeln('La cantidad de sondas con duracion sup al promedio es: ' ,sonda);
end;

Procedure recorrerlista(l:lista);
Var 
  MaxName: string;
  costotot,durtot,diml, MaxVal: integer;
  
Begin
diml:=0;
  MaxName := '';
  MaxVal := 0;
  durtot:=0;
  costotot:=0;
  While (l<>nil) Do begin
  diml:= diml + 1;
  laMasCostosa(l^.dato.costoConst,l^.dato.costoMant,l^.dato.duracionM,MaxVal,MaxName);
  writeln (l^.dato.costoConst);
  
  durtot:= durtot + l^.dato.duracionM;
  costotot:= costotot + l^.dato.costoConst;
  l := l^.sig;
  end;
  promedios(l,durtot,diml, costotot);
  recorrerarr(a);
End;

Var 
  l : lista;
  num: integer;
Begin
  l := nil;
  cargarlista(l);
  recorrerlista (l);

End.