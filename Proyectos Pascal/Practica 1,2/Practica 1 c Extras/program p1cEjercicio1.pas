
Program p1cEjercicio1;

Var 
  monto,max,sumaMonto,promedio: real;
  codigo,codigomax,inversion,mayorInv,i: integer;
Begin
  max := 0;
  codigomax := 0;
  mayorInv := 0;
  Repeat
    sumaMonto := 0;
    write('Ingrese el Codigo de la empresa: ');
    readln(codigo);
    write('Ingrese la cantidad de inversiones: ');
    readln(inversion);
    readln('Ingrese el valor de las inversiones');
    For i:=1 To inversion Do
      Begin
		read(i,'):');
        read(monto);
        sumaMonto := sumaMonto + monto;
        promedio := sumaMonto/inversion;
      End;
    writeln ('Resultado del analisis: Empresa ',codigo,' Monto promedio ',
             promedio:4:4);
    If (sumaMonto>max) Then
      Begin
        max := sumaMonto;
        codigomax := codigo;
      End;
    If (sumaMonto>50000) Then
      Begin
        mayorInv := mayorInv + 1;
      End;
  Until (codigo=100);
  writeln('La empresa ',codigomax,' es la que mayor dinero posee invertido (',
          max:4:4,').');
  writeln('Hay ',mayorInv,' empresas con inversiones por más de $50000');
End.





{Actividad 1: Revisando Inversiones
Realizar un programa que analice las inversiones de las empresas más grandes del país. Para cada
empresa se lee su código (un número entero), la cantidad de inversiones que tiene, y el monto
dedicado a cada una de las inversiones. La lectura finaliza al ingresar la empresa con código 100,
que debe procesarse.
El programa deberá informar:
● Para cada empresa, el monto promedio de sus inversiones
● Código de la empresa con mayor monto total invertido
● Cantidad de empresas con inversiones de más de $50000
Por ejemplo:
Ingrese un código de empresa: 33
Ingrese la cant. de inversiones: 4
Ingrese el monto de cada inversión: 33200 56930 24500.85 10000
Resultado del análisis: Empresa 33 Monto promedio 31157,71
Ingrese un código de empresa: 41
Ingrese la cant. de inversiones: 3
Ingrese el monto de cada inversión: 102000.22 53000 12000
Resultado del análisis: Empresa 41 Monto promedio 55666,74
Ingrese un código de empresa: 100
Ingrese la cant. de inversiones: 1
Ingrese el monto de cada inversión: 84000.34
Resultado del análisis: Empresa 100 Monto promedio 84000.34
(Fin de la lectura)
La empresa 41 es la que mayor dinero posee invertido ($167000.22).
Hay 3 empresas con inversiones por más de $50000}
