program ejercicio1;
const
	valor=12345;
type
	vector= array[1..5]of integer;
	lista= ^nodo;	
	teatro = record
		DNI:integer;
		nombre,apellido:string[20];
		edad:integer;
		codigo:integer;
	end;
	nodo = record
		elem:teatro;
		sig:lista;
	end;
procedure leer(var x:teatro);
begin
	write('Escriba el numero de DNI:  ');
	readln(x.DNI);
	if(x.DNI<>valor)then
		begin
		{write('Escriba el nombre:  ');
		readln(x.nombre);
		write('Escriba el apellido:  ');
		readln(x.apellido);
		write('Escriba la edad:  ');
		readln(x.edad);
		write('Escriba el codigo de genero:  ');
		readln(x.codigo);}
		end;
end;

 procedure agregar(var l:lista;x:teatro);
var
	aux:lista;
begin
	new(aux);
	aux^.elem:=x;
	aux^.sig:=l;
	l:=aux;
end;


procedure cargarLista(var l:lista);
var
	x:teatro;
begin
	leer(x);
	while(x.DNI<>valor)do
		begin
		agregar(l,x);
		leer(x);
		end;
end;

function digitoDNI(l:lista):boolean;
var
	ok:boolean;
	num:integer;
	dig:integer;
	par,impar:integer;
begin
	ok:=false;
	par:=0;impar:=0;
	num:=l^.elem.DNI;
	while(num<>0)do
		begin
		dig:=num mod 10;
		if(dig mod 2=0)then
			par:=par+1
		else
			impar:=impar+1;
		num:= num div 10;
		end;
	if(par>impar)then
		ok:=true;
	digitoDNI:=ok;

end;
function analizarDNI(l:lista):integer;
var
	aux:lista;cont:integer;
begin
	cont:=0;
	aux:=l;
	while(aux<>nil)do
		begin
		if(digitoDNI(aux))then
			cont:=cont+1;
		aux:=aux^.sig;
		end;
	analizarDNI:=cont;
end;

procedure iniciarCont(var v:vector);
var
	i:integer;
begin
	for i:=1 to 5 do
		begin
		v[i]:=0;
		end;
end;

procedure analizarCodigos(l:lista;var v:vector);
var
	aux:lista;
	min1,min2,cod1,cod2:integer;
	i:integer;
begin
	min1:=-999;min2:=-999;
	aux:=l;
	iniciarCont(v);
	while(aux<>nil)do
		begin
		v[aux^.elem.codigo]:=v[aux^.elem.codigo] + 1;
		aux:=aux^.sig;
		end;
	
	for i:=1 to 5 do
		begin
		if(v[i]>min1)then
			begin
			min2:=min1;
			cod2:=cod1;
			min1:=v[i];
			cod1:=i;
			end
		else
			if(v[i]>min2)then
				begin
				min2:=v[i];
				cod2:=i;
				end;
		end;
	writeln('Los codigos de generos mas elegidos son: ',cod1,' y ',cod2);
end;
procedure eliminar();
begin

end;

function buscar(l:lista;x:integer):boolean;
var
	ok:boolean;
	aux:lista;
begin
	ok:=false;
	aux:=l;
	while((aux<>nil) and (ok=false))do
		begin
		if(aux^.elem.DNI=x)then
			ok:=true
		else
			aux:=aux^.sig;
		end;
	buscar:=ok;
end;
procedure eliminarNodo(var l:lista;x:integer);
var
	act,ant:lista;
begin
	act:=l;
	ant:=l;
	while((act<>nil) and (act^.elem.DNI<>x))do
		begin
		ant:=act;
		act:=act^.sig;
		end;
	if(act<>nil)then
		begin
		if(act=l)then
			begin
			l:=l^.sig;
			dispose(act);
			end
		else
			begin
			ant^.sig:=act^.sig;
			dispose(act);
			end;
		
		end;

end;

procedure buscarYeliminar(var l:lista;x:integer);
begin
	if(buscar(l,x))then
			eliminarNodo(l,x)
		else
			writeln('El numero de DNI no se encontro en la lista');
end;
procedure informar(l:lista);
begin
	while(l<>nil)do
		begin
		writeln(l^.elem.DNI);
		l:=l^.sig;
		end;
end;


var
	valorDNI:integer;
	l:lista;
	v:vector;
BEGIN
	l:=nil;
	cargarLista(l);
	{writeln('La cantidad de personas cuyo digitos del DNI pares supera los impares es de:  ',analizarDNI(l));
	analizarCodigos(l,v);}
	informar(l);
	writeln('Ingrese el numero de DNI a eliminar');
	read(valorDNI);
	buscarYeliminar(l,valorDNI);
	writeln('Mostrar lo que se elimino');
	informar(l);
	
END.

