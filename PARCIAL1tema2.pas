
Program nombre;

Const 
  fin = 20;

Type 
  prod = Record
    nombre : string [20];
    valprod : real;
  End;

  cliente = Record
    dni: longint;
    catprod : integer;
    kg : real;
  End;

  lista = ^nodo;
  nodo = Record
    dato : cliente;
    sig : lista;
  End;

  vect1 = array [1..fin] Of prod;

Procedure cargaVec (Var v:vect1);
//se dispone

Procedure leercliente (Var c : cliente);
Begin
  writeln ('ingrese dni');
  readln (c.dni);
  If (c.dni <> -1) Then
    Begin
      writeln ('ingrese cat prod');
      readln (c.catprod);
      writeln ('ingrese cant kg');
      readln (c.kg);
    End;
End;

Procedure agregarAdelante (Var l: lista; c:cliente);

Var 
  nueva: lista;
Begin
  new (nueva); {creo un nodo}
  nueva^.dato := c; {cargo dato}
  nueva^.sig = l;
  l := nueva;
End;
End;


Procedure cargarlista (Var l : lista);

Var 
  c : cliente;
Begin
  leercliente(c);
  While (c.dni <>-1) Do
    Begin
      agregarAdelante(l,c);
      leercliente(c);
    End;
End;

Procedure recorrerlista (Var );

Var 
Begin
End;



Var 
  vec : vect1;
  l : lista;
Begin
  l := Nil;
  cargaVec(vec);
  // se dispone
  cargarlista(l);
  //punto A
  recorrerlista(l);


End.
 
 
