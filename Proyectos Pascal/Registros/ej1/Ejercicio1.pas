program Registros;
type
str20 = string[20];
alumno = record
codigo : integer;
nombre : str20;
promedio : real;
end;
procedure leer(var alu : alumno);
var
cont : integer;
begin
cont:=0;
writeln('ingrese el codigo del alumno');
read(alu.codigo);
while (alu.codigo <> 0) do begin
writeln('Ingrese el nombre del alumno'); 
readln(alu.nombre);
write('Ingrese el promedio del alumno'); readln(alu.promedio);
cont := cont + 1;
writeln('Ingrese el codigo del alumno'); readln(alu.codigo);
end;
writeln('la cantidad de alumnos leidos: ',cont); 
end;
{ declaración de variables del programa principal }
var
a : alumno;
{ cuerpo del programa principal }
{Completar el programa principal para que lea información de alumnos (código, nombre, promedio) e informe
la cantidad de alumnos leídos. La lectura finaliza cuando ingresa un alumno con código 0, que no debe
procesarse. Nota: utilizar el módulo leer.}
begin
leer(a);
end.
