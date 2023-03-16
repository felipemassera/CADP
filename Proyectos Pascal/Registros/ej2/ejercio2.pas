
{El registro civil de La Plata ha solicitado un programa para analizar la distribución de casamientos durante el año
* 2019. Para ello, cuenta con información de las fechas de todos los casamientos realizados durante ese año.
* 
a) Analizar y definir un tipo de dato adecuado para almacenar la información de la fecha de cada casamiento.
b) Implementar un módulo que lea una fecha desde teclado y la retorne en un parámetro cuyo tipo es el definido
en el inciso a).
c) Implementar un programa que lea la fecha de todos los casamientos realizados en 2019. La lectura finaliza al
ingresar el año 2020, que no debe procesarse, e informe la cantidad de casamientos realizados durante los
meses de verano (enero, febrero y marzo) y la cantidad de casamientos realizados en los primeros 10 días de
cada mes. Nota: utilizar el módulo realizado en b) para la lectura de fecha.  
}


Program registros3;

Const 
  limite = 4;

Type 
  mes1 = 1..12;
  dia1 = 1..31;
  fecha = Record
    ano : integer;
    mes : mes1;
    dia : dia1;
  End;
  arry = array [1..1] Of fecha;{no hace falta en este ejercicio}

Procedure leer (Var f:fecha);

Var 
  auxmes,auxdia: integer;

Begin
  auxmes := 0;
  auxdia := 0;

  writeln('ingrese el aNo del casamiento');
  readln(f.ano);
  While (f.ano<>2020) Do
    Begin
      writeln('ingrese el mes del casamiento');
      readln(f.mes);
      writeln('ingrese el dia del casamiento');
      readln(f.dia);
      If ((f.mes=1) Or (f.mes=2) Or (f.mes=3))Then
        auxmes := auxmes+1;

      Case f.dia Of 
        1..10: auxdia := auxdia+1;
      End;
      writeln('ingrese el aNo del casamiento');
      readln(f.ano);
    End;
  writeln('la cantidad de casamientos en verano: ', auxmes,
          ' . La cantidad de casamientos a comienzo de mes: ',auxdia);
End;


Var 
  f: fecha;
Begin

  leer(f);

End.
