{Una compañía de venta de insumos agrícolas desea procesar la información de las empresas a las que
les provee sus productos. 
De cada empresa se conoce su código, nombre, si es estatal o privada,
nombre de la ciudad donde está radicada y los cultivos que realiza (a lo sumo 20). 
Para cada cultivo de la empresa se registra: tipo de cultivo (trigo, maíz, soja, girasol, etc.), cantidad de hectáreas
dedicadas y la cantidad de meses que lleva el ciclo de cultivo.
Una vez leída y almacenada la información, calcular e informar:
b. Nombres de las empresas radicadas en “San Miguel del Monte” que cultivan trigo y cuyo código
de empresa posee al menos dos ceros.
c. La cantidad de hectáreas dedicadas al cultivo de soja y qué porcentaje representa con respecto
al total de hectáreas.
d. La empresa que dedica más tiempo al cultivo de maíz
e. Realizar un módulo que incremente en un mes los tiempos de cultivos de girasol de menos de 5
hectáreas de todas las empresas que no son estatales.
}

Program ej10guia7;

Type 

  cosecha = Record
    tipo: string[20];
    cantHec : integer;
    tiempo : integer;
    //expresado en meses de cosecha
  End;

  cultivos = array [1..20] Of cosecha;
  estatalandia = 1..2;
  empresa = Record
    cod: integer;
    nombre : string [20];
    estatal: estatalandia;
    ciudad: string[20];
    cult : cultivos;
    diml: integer;
  End;
  lista = ^nodo;
  nodo = Record
    dato: empresa;
    sig: lista;
  End;

{Para cada cultivo de la empresa se registra: tipo de cultivo (trigo, maíz, soja, girasol, etc.), cantidad de hectáreas
dedicadas y la cantidad de meses que lleva el ciclo de cultivo.
Para cada empresa se leen todos sus cultivos, hasta que se ingrese un cultivo con 0 hectáreas (que no
debe procesarse).}
Procedure tiposcultivos (Var a :cultivos; Var diml: integer);

Var 
  aux: integer;
Begin
  writeln('Cuantas hectareas tiene ocupada (se sale con 0): ');
  readln(aux);

  While ((diml < 20 ) And (aux <> 0)) Do
    Begin
      diml := diml + 1;
      a[diml].cantHec := aux;
      writeln('que tipo de cultivo hace: ');
      read(a[diml].tipo);
      writeln('Tiempo de cosecha: ');
      read(a[diml].tiempo);
      writeln('Cuantas hectareas tiene ocupada (se sale con 0): ');
      readln(aux)
    End;
End;

{De cada empresa se conoce su código, nombre, si es estatal o privada,
nombre de la ciudad donde está radicada y los cultivos que realiza (a lo sumo 20).}
Procedure leerempresa (Var e: empresa);
Begin
  writeln ('ingrese el codigo de la empresa (se sale con -1)');
  readln(e.cod);
  If (e.cod <> -1) Then
    Begin
      writeln ('ingrese el nombre de la empresa');
      readln(e.nombre);
      writeln ('ingrese el es estatal? 1- si, 2- no');
      readln(e.estatal);
      writeln ('ingrese el ciudad de ubicacion de la empresa');
      readln(e.ciudad);
      tiposcultivos(e.cult, e.diml);
    End;
End;

Procedure agregarAtras(Var l:lista; e: empresa);

Var 
  nuevo: lista;
Begin
  new (nuevo);
  nuevo^.dato := e;
  nuevo^.sig := l;
  l := nuevo;
End;

{Realizar un programa que lea la información de las empresas y sus cultivos. Dicha información
se ingresa hasta que llegue una empresa con código -1 (la cual no debe procesarse).}
Procedure cargarlista (Var l: lista);

Var 
  e: empresa;
Begin
  e.diml := 0;
  leerempresa (e);
  While (e.cod<>-1) Do
    Begin
      agregarAtras(l,e);
      leerempresa (e);
    End;
End;

{b. Nombres de las empresas radicadas en “San Miguel del Monte” que cultivan trigo y cuyo código
de empresa posee al menos dos ceros.}
Function masdosceros (c:integer): boolean;

Var 
  dig,cero: integer;
Begin
  cero := 0;
  While (c<>0) Do
    Begin
      dig := c Mod 10;
      If (dig = 0) Then
        cero := cero + 1;
      c := c Div 10;
    End;
  masdosceros := cero >=2;
End;


Procedure desanmiguel (nombre:String;cod,diml:integer;c:cultivos);

Var 
  i: integer;
Begin
  For i:=1 To diml Do
    If (c[i].tipo = 'trigo') Then
      If (masdosceros(cod)) Then
        writeln ('La empresa ',nombre, ' tiene mas de dos cifras  0');
End;

{c. La cantidad de hectáreas dedicadas al cultivo de soja y qué porcentaje representa con respecto
al total de hectáreas.}
{d. La empresa que dedica más tiempo al cultivo de maíz}

Procedure recorrerArray(Var a:cultivos; diml:integer; Var hectot,sojatot,maxmaiz
                        :integer;var nombre:string; cosechaname:String);
Var 
  i: integer;
Begin
  For i:=1 To diml Do
    Begin
      hectot := a[i].cantHec + hectot;
      If (a[i].tipo= 'soja') Then
        sojatot := sojatot + a[i].cantHec;

      If (a[i].tipo = 'maiz') Then
        If (a[i].tiempo > maxmaiz)Then
          Begin
            maxmaiz := a[i].tiempo;
            nombre := cosechaname;
          End;
    End;
End;

Procedure recorrerLista(l:lista);

Var 
  hecttot,sojatot,maxmaiz: integer;
  nombmaiz: string;
Begin
  hecttot := 0;
  sojatot := 0;
  maxmaiz := 0;
  nombmaiz := '';
  While (l<>Nil) Do
    Begin
      If (l^.dato.ciudad = 'San Miguel del Monte') Then
        desanmiguel(l^.dato.nombre,l^.dato.cod,l^.dato.diml,l^.dato.cult);
      recorrerArray (l^.dato.cult,l^.dato.diml,hecttot,sojatot,
                     maxmaiz,nombmaiz, l^.dato.nombre);
      l := l^.sig;
    End;
  if (l<>nil) then begin
  writeln ('el porcentaje de soja total con respecto al total de hectarias es: '
           ,((sojatot*100)/hecttot),'%.');
  writeln ('la empresa que se dedica mas al maiz es ', nombmaiz);
end else 
writeln('no se registran datos');
End;

{e. Realizar un módulo que incremente en un mes los tiempos de cultivos de girasol de menos de 5
hectáreas de todas las empresas que no son estatales.}
Procedure incMaiz (Var a:cultivos; estatal:estatalandia; diml:integer);
var
i:integer;
Begin
  For i:=1 To diml Do
    Begin
      If (estatal = 1) And (a[i].cantHec >5 ) Then
        a[i].tiempo := a[i].tiempo + 1;
    End;
End;

Procedure agregarmaiz (l:lista);
Begin
  While (l<>Nil) Do
    Begin
      incMaiz(l^.dato.cult,l^.dato.estatal,l^.dato.diml);
      l := l^.sig;
    End;
End;

//program principal

Var 
  l: lista;
Begin
  l := Nil;
  cargarlista(l);
  recorrerLista(l);
  if (l=nil) then
  writeln ('no se puede incorporar maiz a las empresas si no hay datos cargados')
  else
  agregarmaiz(l);
End.
