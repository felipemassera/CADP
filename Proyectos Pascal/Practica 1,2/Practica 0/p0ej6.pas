program practica0_6;
var
dolar:integer;
dolarHoy,total, comision: real;
begin
dolarHoy:=189.32;
write('Ingrese la cantidad de dolares que quiere cambiar: ');
read(dolar);
comision:= (dolar*dolarHoy)*0.04;
total:= dolar*dolarHoy + comision;
writeln('usted quiere cambiar u$d ',dolar, ' ,con un valor del dolar a: ',dolarHoy:4:2,' .Esta transaccion tiene una comision del 4%($',comision:4:2,'). Usted recibira un total de: $', total:4:2);
end.

{Realice un programa que informe el valor total en pesos de una transacción en dólares.
Para ello, el programa debe leer el monto total en dólares de la transacción, el valor del
dólar al día de la fecha y el porcentaje (en pesos) de la comisión que cobra el banco por la
transacción. Por ejemplo, si la transacción se realiza por 10 dólares, el dólar tiene un valor
189,32 pesos y el banco cobra un 4% de comisión, entonces el programa deberá informar:
La transacción será de 1968,93 pesos argentinos
(resultado de multiplicar 10*189,32 y adicionarle el 4%)}
