{La tienda de libros Amazon Books está analizando información de algunas editoriales. 

Para ello,Amazon cuenta con una tabla con las 35 áreas temáticas utilizadas para clasificar los libros (Arte y Cultura,
Historia, Literatura, etc.).

De cada libro se conoce su título, nombre de la editorial, cantidad de páginas, año de edición, cantidad de
veces que fue vendido y código del área temática (1..35).

Realizar un programa que:
A) Invoque a un módulo que lea la información de los libros hasta ingresar el título “Relato de un
náufrago” (que debe procesarse).


y devuelva en una estructura de datos adecuada para la editorial “Planeta Libros”, con la siguiente información:

- Nombre de la editorial
- Año de edición del libro más antiguo
- Cantidad de libros editados
- Cantidad total de ventas entre todos los libros

- Detalle con título, nombre del área temática y cantidad de páginas de todos los libros con
más de 250 ventas.

B) Invoque a un módulo que reciba la estructura generada en A) e imprima el nombre de la editorial
y el título de cada libro con más de 250 ventas.}

Program ej13guia7;

Const 
  tope = 35;

Type 
  tematica = array [1..tope] Of integer;

  num = 1..35;

  libro = Record
    titulo: string [30];
    editorial: string [30];
    pag: INTEGER;
    anoEdicion: INTEGER;
    venta: INTEGER;
    codTema: num;
  End;

  libro2 = Record
  editorial: string [30];
  masantiguo: INTEGER;
  libroseditados: INTEGER;
  ventatot: INTEGER;
  End;

  lista = ^nodo;
  nodo = Record
    dato : libro;
    sig: lista;
  End;

Procedure agregaralista(Var l: lista;b:libro;Var ult:lista); //agregamos atras
Var 
  nue: lista;
Begin
  new (nue);
  nue^.dato := b;
  nue^.sig := Nil;

  If (l=Nil)Then
      l := nue;
  Else
    ult^.sig := nue;
  ult := nue;
End;

Procedure leerlibro(Var b:libro);
Begin
  writeln('ingresar titulo');
  readln (b.titulo);
  writeln('ingresar editorial');
  readln (b.editorial);
  writeln('ingresar cantidad de pag');
  readln (b.pag);
  writeln('ingresar ano Edicion');
  readln (b.anoEdicion);
  writeln('ingresar cantidad de ventas');
  readln (b.venta);
  writeln('ingresar codTema (1..35)');
  readln (b.codTema);
End;

Procedure cargarlista (l: lista; ult:lista);

Var 
  b, pl: libro;
Begin
  Repeat
    leerlibro(b);

    if(b.editorial = 'Planeta Libros') then
     procesar 




    agregaralista(l,b,u);
  Until (b.titulo = 'Relato de un náufrago');
End;

procedure recorrerlista(l:lista);
begin
  while (l<>nil) do

end;
