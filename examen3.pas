{Enunciado Tema 1 (Salas 4, 7, 10, 13 y 16)
 Una compañía aérea desea analizar la información los tickets vendidos a sus clientes.

 La empresa cuenta con 1200 servicios de vuelos diferentes. en adelante denominados Vuelo•.
 
 De cada ticket se conoce el 
 código de vuelo (entre 1 y 1200). DNI del ciente, pais de origen, pais de destino y valor ael ticket. 
 
 La información de los tickets se dispone en una estructura de datos adecuada. y se encuentra ordenada por el DNI del
 cliente (un cliente puede haber comprado más de un ticket en distintos vuelos)

 Realizar un programa que procese la información de los tickets y calcuW
 a) Cantidad de vuelos dentro de mismo país que hayan tenido más de 50 pasajeros
 b) DNI del cliente que más dinero gastó en tickets
 c) Cantidad de clientes cuyo DNI terminen en O o en 5 }

 program examen2;
 const
tope= 1200;
 type
vuelo = array [1..tope] of integer;

ticket= record
codigodevuelo: integer;
dni: longint;
salida: string [20];
llegada: string [20];
precio:real;
end;

lista = ^nodo;
nodo= record
dato:ticket;
sig:lista;
end;

insertarOrdenado(l,t);//se dispone
leerticket(t);//se dispone
cargarlista (l);//se dispone

procedure inicializararray(var a:vuelo):
var
i:integer;
begin
  for i:=1 to tope do
  a[i]:=0;
end;

function mismopais(num:integer; a:vuelo):integer;
var 
i,aux : integer;
begin
  for i:= 1 to tope do
  if (a[i] > 50) then
  aux:= aux +1; 
mismopais:= aux;
end;

procedure maximodni(precio:real ;var maxprecio:real; dni:longint var maxdni: longint);
begin
  if (precio>maxprecio) then begin
    maxdni  := dni;
    maxprecio:= precio;
  end;
end;

function cumpledni (dni:longint):boolean;
var
dig:integer
begin
  dig:= dni mod 10
 cumpledni:= ((dig = 0) or (dig =5)); 
end;

procedure recorrerlista (l:lista;var a:vuelo);
var
dniact, maxdni: longint; maxgasto,aux:integer;
begin
  inicializararray(a);
maxgasto:=-1;
maxdni:=0;
aux:=0;
while (l<>nil) do begin

dniact := l^.dato.dni;
tot:=-1;
if(cumpledni(l^.dato.dni)) then
aux := aux + 1;

While (l<>Nil) And (l^.dato.dni= dniact) Do begin
  
If (l^.dato.salida = l^.dato.llegada) then
   a[l^.dato.codigodevuelo]:= a[l^.dato.codigodevuelo] + 1;

    tot:= tot + l^.dato.precio;

    l := l^.sig;
end;
maximodni(tot,dniact,maxdni,maxgasto);
end;
writeln ('la cant de vuelos en el mismo pais es de: ' , mismopais(50,a));
writeln ('el dni que mas gasto ' , maxdni);
writeln ('la cantidad de personas con dni terminado en 0 o 5 son ', aux);
end;

{Realizar un programa que procese la información de los tickets y calcuW
a) Cantidad de vuelos dentro de mismo país que hayan tenido más de 50 pasajeros

b) DNI del cliente que más dinero gastó en tickets
c) Cantidad de clientes cuyo DNI terminen en O o en 5}

var
l:lista;
a: vuelo;
begin
l=nil;
cargarlista(l);
recorrerlista(l,a);
end.
