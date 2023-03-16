
Program resumenEficiencia;
// por Lisi#0411

Type 
  t_ptr = ^integer;

Var 
  i, aux : integer;
  pepe : real;
  puntero : t_ptr;
Begin
  aux := 1;
  // asignacion = 1UT
  aux := aux + 3;
  // suma + asignacion = 2UT
  aux := aux - 2;
  // resta + asignacion = 2UT
  aux := aux * 2;
  // multi + asignacion = 2UT
  pepe := aux / 2;
  // divi + asignacion = 2UT

  readln(i);
  // Lectura = 0 UT
  writeln(i);
  // Escritura = 0 UT

  new(puntero);
  // 0 UT
  dispose(puntero);
  // 0 UT

  // Eficiencia IF
  // evaluar condicion/es + cuerpo


// evaluar condicion/es = 1UT por cada operador logico (AND, OR, NOT, =, <, >, <>, >=, <=)
  // PD: se suma el cuerpo en caso de que se cumpla la condicion del if
  // en caso de no saber se toma el peor caso, es decir que si se ejecuta
  If (aux < 100) Then // condicion = 1 UT
    Begin
      // se cumple aux < 100? si
      aux := aux + 1;
      // 2UT
      i := i + 4 + aux * 5;
      // 4UT
    End;
  // cuerpo = 2UT + 4UT = 6UT
  // eficiencia if = 1UT + 6UT = 7UT


  // Eficiencia IF-ELSE
  // evaluar condicion/es + MAX(cuerpo1, cuerpo2)
  // siendo MAX() una funcion que nos devuelve el maximo entre 2 elementos
  // siendo cuerpo1 el cuerpo del if en UTs
  // siendo cuerpo2 el cuerpo del else en UTs
  If ((aux < 100) And (i = 2)) Then // condiciones = 3UT
    Begin
      aux := 77;
      // 1UT
      write('----');
      // 0UT
      i := aux * 3 - 19;
      // 3UT
      aux := aux - (i Mod 5);
      // 3UT
    End
    // cuerpo1 = 1UT + 0UT + 3UT + 3UT = 7UT
  Else
    Begin
      readln(i);
      // 0UT
      i := i Div 2;
      // 2UT
    End;
  // cuerpo2 = 0UT + 2UT = 2UT
  // eficiencia if-else = 3UT + MAX(7, 2) = 10UT


  // Eficiencia FOR
  // 3N + 2 + N(cuerpo)
  For i:=1 To 10 Do
    // N = 10
    Begin
      aux := aux - 12;
      // resta + asignacion = 2UT
      aux := aux * 2;
      // multi + asignacion = 2UT
    End;
  // cuerpo = 4UT
  // eficiencia for = 3x10 + 2 + 10x4 = 72UT

  // ejemplo
  readln(aux);
  For i:=1 To aux Do
    // cuantas veces se ejecuta?
    Begin
      pepe := i * 3;
      // 2UT
    End;
  // eficiencia = 3N + 2 + 2N
  // eficiencia = 5N + 2  se deja asi con incognita


  // Eficiencia WHILE
  // CxN + C + N(Cuerpo) = C(N + 1) + N(Cuerpo)
  // siendo C las UTs de evaluar condicion/es
  i := 8;
  // podemos analizar que el bucle se va a
  // ejecutar 8 veces. N = 8
  While (i > 0) Do
    // C = 1UT
    Begin
      aux := aux + i * 2;
      // 3UT
      pepe := pepe / 2;
      // 2UT
      i := i - 1;
      // 2UT
    End;
  // Cuerpo = 3UT + 2UT + 2UT = 7UT
  // eficiencia = 1(8 + 1) + 8(7UT)
  // eficiencia = 9UT + 56UT
  // eficiencia = 65UT


  // -RESUMEN DE FORMULAS-
  // C = evaluar condicion/es en UTs
  // N = veces que se ejecuta
  // Cuerpo = ejecutar cuerpo en UTs
  //
  // IF = C + Cuerpo
  // IF-ELSE = C + MAX(Cuerpo1, Cuerpo2)
  // FOR = 3N + 2 + N(Cuerpo)
  // WHILE = C (N + 1) + N(Cuerpo)
End.


Program 

Type 
  producto = Record
    codigo : integer;
    nombre : string [20];
    rubro : 1..20;
    precio : real;
  End;

  vcontador = array [1..20] Of integer;

  list = ^nodo;
  nodo = Record
    dato : productos;
    sig : list;
  End;


  //propgrama principal

Var 
  vcont: vcontador;
  lista , lista2, U: list;
  i: integer;

Begin
  lista := Nil;
  lista2 := Nil;
  U := Nil;
  For i: =1 To 20 Do
    //Inicializamos vector 
    vect [i] := 0;

  While lista <>Nil Do
    vect [lista^.dato.rubro] := vect [lista^.dato.rubro]+1;
  //Contamos la cantidad de por rubro
End;

While lista<>Nil
      If (vect[lista^.dato.rubro] = 10) Do
  //Los que tengan 10 los sacamos a una lista
  agregarAdelante(lista2, lista^.dato);
End;
If (vect[lista^.dato.rubro] = 10) Do //Los que tengan 10 los sacamos a una lista
   agregarAtras(lista2, U, lista^.dato);
   End;
   End.

   Procedure agregarAdelante (Var l2: list; dato:producto);
   Var
   nuevo: list;
   Begin
   new (nuevo);  //Creamos puntero
   nuevo^.dato:=dato; //le asignamos el dato
   nuevo^.siguiente:=l2;
   l2:=nuevo;
   End;
   Procedure agregarAtras (Var l2: list; Var U:list; dato: producto);
   Var
   nuevo: list;
   Begin
   new (nuevo); //Creamos puntero
   nuevo^.dato:=dato;
   nuevo^.siguiente:=Nil;
   If (l2 = Nil) Then
  l2 := nuevo;
Else
  U^.siguiente := nuevo;
U := nuevo;
End;
Procedure Insertar (Var l2: list; dato: producto);

Var 
  nuevo, actual, anterior: list;
Begin
  new (nuevo);
  nuevo^.dato := dato;
  actual := l2;
  anterior := l2;
  While (actual <> Nil) And (nuevo^.dato.rubro > actual^.dato.rubro) Do
    Begin
      anterior := actual;
      actual := actual^.siguiente;
    End;
  If (actual = anterior) Then
    l2 := nuevo
  Else
    anterior^.siguiente := nuevo;
  nuevo^.siguiente := actual;
End;
Procedure eliminar (Var l2:list; dato:producto);

Var 

Begin

End;

Procedure eliminar(Var l:lista; valor:longint);
//buscas en una lista un valor y si existe lo elimina
Var 
  actual ,ant: lista;
Begin
  ant := l;
  actual := l;
  While (actual <> Nil) {and (actual^.dato.dni<valor)} Do
    //si la lista esta ordenado
    Begin
      If (actual^.dato.dni <> valor) Then
        Begin
          ant := actual;
          actual := actual^.sig
        End
      Else
        Begin
          If (actual <> Nil) Then
            If (actual = l) Then
              l := l^.sig
          Else
            ant^.sig := actual^.sig;
          dispose (actual);
          actual := ant;
        End;
    End;
End;

