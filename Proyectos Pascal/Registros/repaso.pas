
Program nombre;
{constantes del programa}

Const 
  gente = 20;

Type 
{datos simples}
  letras = char;
  numeros = integer;
  fraccionarios = real;
  ok = boolean;
  palabra = String;
{datos complejos}
  numeritos = 1..8;
  palabra20 = String [20];
  registro = Record
    nombre : palabra;
    dni: numeritos;
  End;
  arreglo = array [1..gente] Of integer;  {Dimension Fisica y logica }



{metodos se divide en dos PROCEDIMIENTOS Y FUNCIONES (retorna el resultado de una variable simple) }
Function  promedio(): real;{retorna un entero}

Var 
  dato: real;
  i, notatot, nota : integer;
Begin
  dato := 0;
  notatot := 0;
  For i:=1 To 4 Do

{esto se hace cuando sabes las cantidades de veces que tenemos que utilizart una variable}
    Begin
      writeln('escriba notas colegio');
      readln(nota);
      notatot := nota + notatot;
    End;
  dato := (notatot / 4);

  promedio := dato;
End;


{var por valor = copiar los datos de la variable
* var por refererencia copia la direccion de la variable original posibilitando modificarla}
Procedure nombreprocedimiento( num1, num2 : integer ; i : integer);
Begin
  num1 := num1 + num2;
  num2 := num2 +1;
{if (i=2) then}
{writeln('vuelta ',i, ' el num1 es ', num1 );}

End;

Var 
  a: arreglo;
  i,cont,n1, n2, legajo: integer;
  notatot: real;
Begin
  notatot := 0;
  cont := 0;
  i := 0;
  writeln('insete el valor del numero 1  y 2');
  readln(n1);
  readln(n2);
  If (n1 =2) Then
  Else {esta es la estrutura de control pregunta}
    For i := 1 To 3 Do

{estructura de control cuando se conoce de antemano la cantidad de veces a repetir}
      Begin
        nombreprocedimiento(n1,n2,i);
        write (n1,' y ' , n2);
      End;

  writeln('escriba el legajo');
  readln(legajo);
  While (legajo<>0) Do
    {repite mientras la condicion de salida sea TRUE. NO LA PROCESA}
    Begin


{aca se repite todo el codigo que vamos a procesar y luego se pide nuevamente el legajo y se evalua la condicion de salida}
      cont := cont +1;
      writeln('escriba el legajo');
      readln(legajo);
    End;
  writeln(cont);

  cont := 0;
  Repeat
    writeln('escriba notas colegio');
    readln(legajo);
    cont := cont +1;
    notatot := legajo+notatot;
  Until (legajo=0);

{repite una N cantidad de veces hasta que la condicion de salida sea FALSE. PROCESA}
  writeln('el promedio es: ', notatot/cont);
  cont := 0;
  notatot := 0;

  Case f.dia Of 

{Este es el ejemplo caso, usando una variable accedes a las opciones, en caso de no ejecutarse entra en el else.}
    1..10: auxdia := auxdia+1;
    11..20:
            Begin

            End;
    Else
      Begin
      End;

    writeln('el promedio es: ', promedio(): 2: 2);
    {muestra el resultado de la movida}


{   ARREGLOS    }
    For i:=1 To gente Do {asi se carga, "gente" es la constante}
      a[i] := i;

    writeln('arreglo');
    For i:=1 To gente Do {asi se ve}
      write(a[i], ' ')
  End.
