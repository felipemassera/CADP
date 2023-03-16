







Una vez almacenados todos los datos, procesar la estructura de datos generada,
calcular e informar:

                     - La ganancia total de Fortaco’s
                     - Las 2 suscripciones con más clientes.

                     - Genere una lista con nombre y DNI de los clientes de más
                     de 40 años que están suscritos a
                     CrossFit o a Todas las clases. Esta lista debe estar
                     ordenada por DNI.}

                     Program ej12guia7;

Const 
  tope = 4;


{El centro de deportes Fortaco’s quiere procesar la información de los 4 tipos de suscripciones que
ofrece: 
1)Musculación, 2)Spinning, 3)Cross Fit, 4)Todas las clases.}

Type 
  num = 1..4;
  deporte = array [1..tope] Of integer;


{Para ello, el centro dispone de una tabla con información sobre el costo mensual de cada tipo de suscripción.}
  valores = Record;
    prec1: integer;
    prec2: integer;
    prec3: integer;
    prec4: integer;
  End;
  cliente = Record
    nombre : string[20];
    dni : integer;
    edad: integer;
    suscripcion: num;
  End;

  lista : ^nodo;
  nodo = Record
    dato: cliente;
    sig: lista;
  End;

Procedure iniciararray(Var a:deporte; Var v: valores);

Var 
  i: integer;
Begin
  For i := 1 To tope Do
    Begin
      a[i] := 0;
      v[i] := i*100;
    End;
End;


{Realizar un programa que lea y almacene la información de los clientes del centro. 
De cada cliente se conoce el nombre, DNI, edad y tipo de suscripción contratada (valor entre 1 y 4).
La lectura finaliza cuando se lee el cliente con DNI 0, el cual no debe procesarse.}
procedure agregaratras (var l:lista; c:cliente);
var 
nue : lista;
begin
  
  
end;


Procedure leercliente(c:cliente);
Begin
  writeln ('ingrese el dni del cliente');
  readln(c.dni);
  If (c.dni<>0) Then
    Begin
      writeln ('ingrese el nombre del cliente');
      readln(c.nombre);
      writeln ('ingrese el edad del cliente');
      readln(c.edad);
      writeln ('ingrese el suscripcion del cliente');
      readln(c.suscripcion);
    End;
End;


Procedure cargarlista (Var l:lista)

Var 
  c: cliente;
  a: deporte;
  v: valores;
  //SE DISPONE
Begin
  iniciararray(a,v);
  //se inicia a y se carga valores a V: $100,$200,$300,$400.
  leercliente(c);
  While (c.dni <> 0) de Begin
        //se corta la lewctura con 0 (no se procesa el dato)
        agregaradelante(l,c);
        leercliente(c);
        End;
        End;

        //programa principal

        Var

        Begin

        End.
