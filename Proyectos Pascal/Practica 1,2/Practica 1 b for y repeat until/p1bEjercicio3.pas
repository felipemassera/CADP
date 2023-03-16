program p1bEjercicio3;
type
calificacion = 1..10;
var
nota,nota8,nota7:calificacion;
salida,nombre:String;
begin
nota8:=1;
nota7:=1;
salida:='Zidane Zinedine';
repeat
write('Ingrese nombre del alumno: ');
readln(nombre);
write('Ingrese calificacion del alumno: ');
readln(nota); 
if(nota>=8)then
nota8:=nota8+1;
if(nota=7) then
nota7:= nota7+1;
until (nombre = salida); //Se repite el bucle mientras no se introduzca la palabra de salida. 
writeln('La cantidad de alumnos con nota mayo a 8 fue de: ' , nota8, '. La cantidad de alunmos con nota7 es de: ', nota7);
end.

{
Realizar un programa que lea desde teclado la información de alumnos ingresantes a la carrera
Analista en TIC. De cada alumno se lee nombre y nota obtenida en el módulo EPA (la nota es un
número entre 1 y 10). La lectura finaliza cuando se lee el nombre “Zidane Zinedine“, que debe
procesarse. Al finalizar la lectura informar:
- La cantidad de alumnos aprobados (nota 8 o mayor) y
- la cantidad de alumnos que obtuvieron un 7 como nota

}
