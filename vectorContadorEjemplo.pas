

{Hacer un programa que lea una secuencia de números enteros terminada en
0. Informar la cantidad de veces que aparece cada dígito del 0 al 9 entre
todos los números leídos.
Ejemplo: se leen los números: 457 9875 5 24879 0}

Program VectorContadorEjemplo;

Type 
  rango = 0..9;
  vectorcont = array [rango] of integer;

Procedure incicializar(Var vect: vectorcont);
Var 
  i: integer;
Begin
  For i:= 0 To 9 do
      vect[i]:= 0 ;
End;

Procedure divmod(Var v:vectorcont ; n :longint);

Var 
  dig: rango; //uso rango ya que mod10 siempre va a ser un digito comprendido de  0 a 9.
       Begin
         While (n<>0) Do
           Begin
             dig := n Mod 10;
             v[dig] := v[dig] + 1;
             n := n Div 10;
           End;
       End;

Procedure lecturaycarga(Var vect: vectorcont);
    Var
      num : longint; //uso longint ya que intger no me deja ccargar un dni
    Begin
      readln(num);
    While num<>0 Do
    Begin
      divmod (vect,num);
       readln(num);
    End;
End;


procedure imprimir(v : vectorcont);
var
i: rango;
begin
  For i := 0 to 9 do
  writeln (i,'*: ', v[i], '.')
end;


Var 
  v: vectorcont;
Begin
  incicializar(v);
  lecturaycarga(v);
  imprimir(v);
End.
