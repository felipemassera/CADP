


{Una productora nacional realiza un casting de personas para la selección de actores extras de una
nueva película, para ello se debe leer y almacenar la información de las personas que desean
participar de dicho casting. 
De cada persona se lee: DNI, apellido y nombre, edad y el código de
género de actuación que prefiere (1: drama, 2: romántico, 3: acción, 4: suspenso, 5: terror).

La lecturafinaliza cuando llega una persona con DNI 33555444, la cual debe procesarse.

Una vez finalizada la lectura de todas las personas, se pide:


}

Program ej1guia7;

Const 
  tope = 5;

Type 
  genero = array [1..tope] Of integer;

  persona = Record
    dni : longint;
    apellido: string [20];
    nombre : string [20];
    edad: integer;
    cod: integer;
  End;
  lista = ^nodo;
  nodo = Record
    dato: persona;
    sig: lista;
  End;

Procedure iniciarArr(Var a :genero);

Var 
  i: integer;
Begin
  For i:=1 To tope Do
    a[i] := 0;
End;


Procedure leerpersona(Var p: persona);
Begin
  writeln ('ingrese el dni');
  readln (p.dni);
  writeln ('ingrese el nombre');
  readln (p.nombre);
  writeln ('ingrese el apellido');
  readln (p.apellido);
  writeln ('ingrese el edad');
  readln (p.edad);
  writeln ('ingrese el Categoria');
  readln (p.cod);
End;

Procedure agregarAdelante(Var l: lista; p: persona);

Var 
  nue : lista;
Begin
  new (nue);
  nue^.dato := p;
  nue^.sig := l;
  l := nue;
End;


Procedure cargarLista( Var l: lista; Var arr: genero);

Var 
  p: persona;

Begin
  iniciarArr(arr);
  Repeat
    leerpersona(p);
    arr[p.cod] := arr[p.cod] + 1;
    agregarAdelante(l,p);
  Until (p.dni = 33555444);
End;




{a. Informar la cantidad de personas cuyo DNI contiene más dígitos pares que impares.}
Function ParImpar (dni:longint): boolean;

Var 
  dig,par, impar: integer;
Begin
  par := 0;
  impar := 0;
  While (dni<>0) Do
    Begin
      dig := dni Mod 10;
      If (dig Mod 2 =0) Then
        par := par + 1
      Else
        impar := impar +1;

      dni := dni Div 10;
    End;
  ParImpar := par > impar;
End;

{b. Informar los dos códigos de género más elegidos.}
Procedure maselegidos (arr :genero; Var m1,m2:integer);

Var 
  i: integer;
Begin
  For i:=1 To tope Do
    Begin
      If (arr[i]> m1) Then
        Begin
          m2 := m1;
          m1 := i;
        End
      Else If (arr[i] > m2) Then
             m2 := i;
    End;
End;




{c. Realizar un módulo que reciba un DNI, lo busque y lo elimine de la 
estructura. El DNI puede no existir. Invocar dicho módulo en el programa principal.}
Procedure eliminar(Var l:lista; valor:longint);
//buscas en una lista un valor y si existe lo elimina

Var 
  actual ,ant: lista;
Begin
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

          If (actual <> Nil) And (actual = l) Then
            l := l^.sig
          Else
            ant^.sig := actual^.sig;
          dispose (actual);
          actual := ant;
        End;
    End;
End;

Procedure procesarlista(l:lista ; a:genero);

Var 
  mas1, mas2, contpar: integer;
Begin
  contpar := 0;
  mas1 := 0 ;
  mas2 := 0;
  While (l<>Nil) Do
    Begin
      If (ParImpar(l^.dato.dni) )Then   //lo que vamos a procesar
        contpar := contpar + 1;

      maselegidos (a,mas1,mas2);
      //trae mas1 y mas 2 categoriasmas elegidas.

      l := l^.sig;
      //de esta manera sigue al sig nodo
    End;
  writeln ('La cantidad de dni con mas dig pares que impares es :', contpar);
  writeln ('La las dos categorias mas elegidas fueron :', mas1, ' y ', mas2);
End;
Procedure imprimir(l:lista);
Begin
  While (l<>Nil) Do
    Begin
      writeln (l^.dato.dni);
      l := l^.sig;
    End;
End;

Var 
  list: lista;
  arr: genero;
  num: longint;
Begin
  list := Nil;
  cargarLista(list,arr);
  procesarlista(list,arr);
  //aca la recorremos
  imprimir(list);
  writeln ('Intentemos eliminar un dni(ingresalo)');
  readln (num);
  eliminar(list,num);
  imprimir(list);
End.
