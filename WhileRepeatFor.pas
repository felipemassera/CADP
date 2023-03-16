
Program WhileRepeatFor;

Type 
  medidas = 0..100;
  lote = Record
    nro : char;
    alto : medidas;
    ancho : medidas;
  End;
Function carga(p: lote; aux :medidas) : medidas;

Var 
  i,sup, suptot: integer;
Begin
suptot:=0;
  Repeat
  sup:=0;
    writeln('Ingrese la LETRA del terreno');
    readln(p.nro);
    writeln ('ingrese medida del lote AltoxAncho');
    readln (p.alto);
    readln (p.ancho);
    sup := p.alto * p.ancho;
    suptot := sup + suptot;
    If (sup>=200) Then
      aux := aux + 1;
  Until (suptot >= 10000);
  carga := aux;
End;

Var 
  prop: lote;
  aux,a: medidas;
Begin
  aux := 0;
  a := carga(prop,aux);
  Write('El numero de prop mayores a 200 es de ',a);
End.
