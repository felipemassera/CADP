

{  Realice un procedimiento que reciba como parámetro un número entero y retorne
la cantidad de dígitos impares y la cantidad de dígitos pares que posee el número recibido.}

Program ModDiv;
procedure uno (a: integer;var ptot:integer);
Var 
  par,impar,dig : integer;
Begin
 par := 0;
impar := 0;
  While a<>0 Do
    Begin
      dig := a Mod 10;
      If (dig Mod 2 = 0) Then
        par := par+1
      Else
        impar := impar+1;
      a := a Div 10;
    End;
    writeln('La cantidad denum par ',par,' impar ',impar);
    if (par > impar) then
    ptot:=ptot+1;    
    end;

Var 
  x,partot,i: integer;
Begin
partot:=0;
  for i:= 1 to 3 do begin
  writeln('Ingrese un numero.');
  read(x);
  uno(x,partot);
  end;
  writeln('La cantidad de numeros con mas pares es: ',partot);
End.