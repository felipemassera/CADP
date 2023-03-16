


{. La Agencia Espacial Europea (ESA) está realizando un relevamiento de todas las sondas espaciales lanzadas
al espacio en la última década. De cada sonda se conoce su nombre, duración estimada de la misión
(cantidad de meses que permanecerá activa), el costo de construcción, el costo de mantenimiento mensual y
rango del espectro electromagnético sobre el que realizará estudios. Dicho rango se divide en 7 categorías:
1. radio; 2. microondas; 3.infrarrojo; 4. luz visible; 5. ultravioleta; 6. rayos X; 7. rayos gamma
Realizar un programa que lea y almacene la información de todas las sondas espaciales. La lectura finaliza al
ingresar la sonda llamada “GAIA”, que debe procesarse.
Una vez finalizada la lectura, informar:
a. El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento).
b. La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.
c. La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas.
d. El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las sondas.
Nota: para resolver los incisos a), b), c) y d), la lista debe recorrerse la menor cantidad de veces posible
}

Program ej6tp6listas;

Type 
lista = ^nodo;
  nodo = Record
    dato : integer;
    sig : lista;
   
  End;

Procedure armarnodo (Var l: lista; d: integer);

Var 
  nue : lista;
Begin
  new (nue);
  nue^.dato := d;
  nue^.sig := l;
  l := nue;
End;

procedure imprimir(l:lista);
begin
  while (l<>nil) do
  write (l^.dato);
  l:= l^.sig;
end;

Var 
  l : lista;
  num: integer;
Begin
  l := Nil;
  writeln('ingrese un valor');
  readln (num);
  While (num<>0) Do
    Begin
      armarnodo(l, num);
      writeln('ingrese un valor');

      readln (num);

    End;
imprimir (l);
End.
