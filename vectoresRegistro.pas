


{Realizar un programa que cargue un vector de 100 productos. De cada producto
se conoce código, descripción y precio. Al finalizar la carga informe la
cantidadde productos con precio mayor que 50.}

Program vectoresRegistros;

Const 
  tope = 10;

Type 
  reg = Record
    cod: integer;
    info: string[50];
    price: integer;
  End;
  vect = array [1..tope] Of reg;



Procedure cargdos(Var v:vect; Var i :integer);
// carga con WHILE + dlog

Var 
  codigo: integer;
Begin
  writeln ('dlog ',i); 
  writeln('Ingrese el codigo');
  readln(codigo);
  While ((codigo<>00) And (i <tope)) Do
    Begin
      i := i+1;
      With v[i] Do //de esta manera hacemos mencion implicita para todo nuestro array de "v."
        Begin
          cod := codigo;
          writeln('ingrese la info del producto.');
          readln (info);
          writeln('ingrese valor el producto.');
          readln (price);
        End;
      writeln('inngrese el cod ',(i+1));
      readln(codigo);
    End;
  writeln ('dlog salida carga ',i);
End;

Procedure masCincuenta2(v:vect; dlog:integer);
//procesamiento del vector Con DIMENSION LOGICA

Var 
  i, tot: integer;
Begin
  writeln ('dlog +50 ',dlog);
  tot := 0;
  i := 1;
  While (i<=dlog) Do
    Begin
      If (v[i].price>50) Then
        tot := tot+1;
      i := i+1;
    End;
  writeln('La cantidad de productos con precio +$50 es: ',tot);
End;


Procedure carga1 (Var v:vect);
// con FOR

Var 
  i: integer;
Begin
  For i :=1 To tope Do
    Begin
      writeln('ingrese el codigo.');
      readln (v[i].cod);
      //carga de vector
      writeln('ingrese la info del producto.');
      readln (v[i].info);
      writeln('ingrese valor el producto.');
      readln (v[i].price);
    End;
End;

Procedure masCincuenta(v:vect);
//procesamiento del vector FOr

Var 
  tot,i: integer;
Begin
  tot := 0;
  For i :=1 To tope Do
    Begin
      If (v[i].price>50) Then
        tot := tot+1;
    End;
  writeln('La cantidad de productos con precio +$50 es: ',tot);
End;

Var 
  v: vect;
  dlog: integer;
Begin
  dlog := 0;
  //carga1(v);
  cargdos(v,dlog);
  //masCincuenta(v);
 writeln ('dlog algoritmno 1 ',dlog);

  masCincuenta2(v,dlog);

End.
