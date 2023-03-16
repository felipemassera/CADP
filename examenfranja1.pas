









{de Verano CADP 2020 - Parcial (10/3/2020) 
una empresa administra la información de sus empleados y necesita disponer de un programa que: 

a) Lea y almacene la información de los empleados. De cada empleado se conoce: 
DNI, apellido, nombre, categoría (A, B, C, D o E), sueldo básico, montos de los premios obtenidos en el mes (como máximo 5) y antigüedad en la 
empresa. 

La lectura de la información finaliza cuando se lee el DNI -1 (que no debe procesarse).

la infformación debe ser almacenada de manera ordenada por DNI de menor a mayor.
'a vez leída y almacenada la información: 

b)Obtener una lista de "Liquidaciones" con DNI del empleado y sueldo mensual a cobrar. El sueldo mensual se 
calcula de la siguiente manera: 
EMPLEADO Categoría A, B o C Sueldo básico + premios. 
EMPLEADO Categoría D, E Sueldo básico + premios + 1000 pesos por cada año de trabajo en la empresa.  
c) Informar para cada categoría la cantidad de empleados.
d) Eliminar de la lista de "Liquidaciones" el empleado con DNI 555, de ser posible. }

Program examen1;

Const 
  tope = 5;

Type 
  vector = array [1..tope] Of real;
vector2 = array [A..E] of integer;
  str = string [20];
  empleado = Record
    dni: longint;
    apellido: str;
    nombre: str;
    antiguedad: integer;
    cat : char;
    sueldo: real;
    premios: vector;
    diml: integer;
  End;

  Liquidaciones = Record
    dni: longint;
    sueldo: real;
  End;

  lista2 = ^nodo2;
  nodo2 = Record
    dato: Liquidaciones;
    sig: lista
  End;

  lista = ^nodo;
  nodo = Record
    dato: empleado;
    sig: lista
  End;


Procedure insertarOrdenado(Var l:lista; e:empleado);

Var 
  nue,ant,act: lista;
Begin
  new (nue);
  nue^.dato := e;
  act := l;
  ant := l;
  While (act<>Nil) And (act^.dato.dni > e.dni) Do
    //menor a mayor
    Begin
      ant := act;
      act := act^.sig;
    End;
  If (act=ant) Then
    l := nue
  Else
    ant^.sig := nue;
  nue^.sig := act;
End;


Procedure leervector(Var a:vector; Var diml:integer);

Var 
  aux: integer;
Begin
  readln(aux);
  While (diml<tope) And (aux<>-1) Do
    Begin
      diml := diml + 1;
      a[diml] := aux;
      readln(aux);
    End;
End;

Procedure leerempleado(Var e:empleado);
Begin
  e.diml := 0;
  readln(e.dni);
  If (e.dni <>-1)Then
    Begin
      readln(e.apellido);
      readln(e.nombre);
      readln(e.antiguedad);
      readln(e.cat);
      readln(e.sueldo);
      leervector(e.premios, e.diml);
    End;
End;

Procedure cargarlista(l:lista);
Var 
  e: empleado;
Begin
  leerempleado(e);
  While (e.dni <>-1) Do
    Begin
      agregarordenado(l,e);
      leerempleado(e);
    End;
End;

{  b)Obtener una lista de "Liquidaciones" con DNI del empleado y sueldo mensual a cobrar. El sueldo mensual se 
calcula de la siguiente manera: 
EMPLEADO Categoría A, B o C Sueldo básico + premios. 
EMPLEADO Categoría D, E Sueldo básico + premios + 1000 pesos por cada año de trabajo en la empresa.  }

Function maspremios(a:vector;diml: integer): integer;

Var 
  i,total: integer;
Begin
  total := 0;
  For i:=1 To diml Do
    total := total + a[i];
  maspremios := total;
End;

Procedure obtenerliquidaciones(Var l:lista2;dni:longint; sueldo:real; cat:char;
                               diml: integer ; a:vector; antiguedad:integer);

Var 
  aux: Liquidaciones;
Begin
  aux.dni := dni;
  If ((cat = 'A') Or (cat = 'C') Or (cat = 'B')) Then
    aux.sueldo := sueldo + maspremios(a,diml);
  Else If ((cat = 'D') Or (cat = 'E')Then
         aux.sueldo := sueldo + maspremios(a,diml) + (1000*antiguedad);
  insertarOrdenado(l,aux);
End;
procedure iniciarvect(var e: vector2);
var
i:integer;
begin
  for i:=A to E do
  e[i]:= 0;
end;
Procedure mostrararray(Var e: vector2);

Var 
  i: integer;
Begin
  For i:=A To E Do
    writeln ('para la categoria ',i,' :',e[i]);
End;


Procedure recorrerlista (l:lista, l2:Liquidaciones);

Var 
e: vector2;
Begin
 iniciarvect(e);
  While (l<>Nil) Do
    Begin
      obtenerliquidaciones(l2,l^.dato.dni,l^.dato.sueldo,l^.dato.cat,l^.dato.
                           diml, l^.dato.premios; l^.dato.antiguedad);


      e[l^.dato.cat]:= e[l^.dato.cat] + 1;  

      l := l^.sig;
    End;
    {c) Informar para cada categoría la cantidad de empleados.}
   mostrararray(e);
End;


Procedure eliminar(Var l:lista; valor:integer);//buscas en una lista un valor y si existe lo elimina
Var 
  actual ,ant: lista;
Begin
  ant := l;
  actual := l;
  While (actual <> Nil) Do
    Begin
      If (actual^.dato.dni <> valor) Then
        Begin
          ant := actual;
          actual := actual^.sig
        End
      Else
        Begin
          If (actual <> Nil) Then
            Begin
              If (actual = l) Then
                l := l^.sig
              Else
                ant^.sig := actual^.sig;
              dispose (actual);
              actual := ant;
            End;
        End;
    End

var
l:lista;
l2:lista2;
num:integer;

Begin
l=nil;
l2=nil;
cargarlista(l);
recorrerlista(l,l2);
{d) Eliminar de la lista de "Liquidaciones" el empleado con DNI 555, de ser
posible.}
writeln('inserte el digito a eliminar');
read(num);
eliminar(l,num);
End.
