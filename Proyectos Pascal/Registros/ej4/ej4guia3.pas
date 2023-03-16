
Program ej4guia3;

Type 
  dato = Record
    numTel: integer;
    minCons: integer;
    megaCons: integer;
  End;
  tuenti = Record
    cod: integer;
    cantL: integer;
    line: dato;
  End;

Procedure lineasCliente(var t1 :dato ; var lineas : integer);
Begin
  For i=1 To lineas Do
    Begin
      write ('ingrese Num telefono del cliente: ');
      readln(t1.numTel);
      write ('ingrese Minutos Consumido de lineas del cliente: ');
      readln(t1.minCons);
      write ('ingrese Megas Consumido de lineas del cliente: ');
      readln(t1.megaCons);

      mintot := mintot + t1.minCons;
      megatot := megatot+ t1.megaCons;
    End;
  writeln ('El monto para los MINUTOS consumidos de las lineas es: ', mintot*3.
           40);
  writeln ('El monto para los MEGAS consumidos de las lineas es: ', megatot*1.35
  );

End;

//Punto A
Procedure datoCliente(Var t : tuenti);
Begin
  write ('ingrese codigo de cliente: ');
  readln(t.cod);
  write ('ingrese cantidad de lineas del cliente: ');
  readln(t.cantL);
  lineasCliente(t.line, t.cantL);
End;

var
Cliente
Begin


End.