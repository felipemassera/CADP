
{Hacer un programa que lea una secuencia de números enteros terminada en
0. Informar la cantidad de veces que aparece cada dígito del 0 al 9 para cada numero leido.
}

Program VectorContadorEjemplo2;

Type 
  rango = 0..9;
  vectorcont = array [rango] Of integer;

Procedure incicializar(Var vect: vectorcont);

Var 
  i: integer;
Begin
  For i:= 0 To 9 Do
    vect[i] := 0 ;
End;

Procedure divmod(Var v:vectorcont ; n :longint);

Var 
  dig: rango;
  //uso rango ya que mod10 siempre va a ser un digito comprendido de  0 a 9.
Begin
  While (n<>0) Do
    Begin
      dig := n Mod 10;
      v[dig] := v[dig] + 1;
      n := n Div 10;
    End;
End;

Procedure imprimir(v : vectorcont);

Var 
  i: rango;
Begin
  For i := 0 To 9 Do
    writeln (i,'*: ', v[i], '.')
End;

function masveces(v:vectorcont): rango;
var
max: integer;
posmax,i:rango;
begin
max:=-1;
posmax:=0;
  for i :=1 to 9 do begin
    if (v[i]>max) then begin
      max:= v[i];
      posmax:= i;

    end;
  end;
  masveces:= posmax;
end;

Var 
  v: vectorcont;
  num : longint;
Begin
  readln(num);
  while (num<>0) do begin
  incicializar(v);
  divmod (v,num);
  //imprimir(v);  //aca imprime todos los digitos con sus repeticiones
  write('el digito con mas repeticiones es: ', masveces(v));
  readln(num);
  end;
  
End.
