
Program Ej3Guia3;

Type 
  escuela = Record
    cue : integer;
    nomEsc: String [20];
    cantDoc: integer;
    cantAlu: integer;
    loc: String;
    //localidad
  End;

Function alumnosxprof(e:escuela): boolean;

Var 
  ok: boolean;
  coeficiente: real;
Begin
  coeficiente := 23.435;
  ok := false;
  If ((e.cantAlu/e.cantDoc) > coeficiente ) Then
    Begin
      ok := true;
    End;
  alumnosxprof := ok ;
End;

Function laPlata(e : escuela ; cont:integer): integer;
Begin
  If (e.loc = 'La Plata')Then
    If (alumnosxprof(e)) Then
      cont := cont+1;
  laPlata := cont;
End;

Procedure maximos(e:escuela ;Var cue1,cue2:integer;Var name1,name2:String; rmax1
                  ,rmax2 : real);

Var 
  relac: real;
Begin
  relac:= e.cantAlu/e.cantDoc;
  If  (relac>rmax1)Then
    Begin
      rmax1 := relac;
      name2 := name1;
      cue2 := cue1;
      name1 := e.nomEsc;
      cue1 := e.cue;
    End
  Else If (relac>rmax2) Then
         Begin
           rmax2 := relac;
           name2 := e.nomEsc;
           cue2 := e.cue;
         End;
End;
Procedure carga(Var e:escuela);
Begin
  write('CUE de la institucion: ');
  readln(e.cue);
  write('Nombre de la institucion: ');
  readln(e.nomEsc);
  write('Localidad de la institucion: ');
  readln(e.loc);
  write('Cant de profes de la institucion: ');
  readln(e.cantDoc);
  write('Cant de alumnos de la institucion: ');
  readln(e.cantAlu);
End;

Var 
  e: escuela;
  rmax1,rmax2: real;
  i,cue1,cue2,LpProf: integer;
  name1,name2: String;
Begin
  rmax1 := 0;
  rmax2 := 0;
  cue1 := 0;
  cue2 := 0;
  name1 := '';
  name2 := '';
  LpProf := 0;
  For i:= 1 To 3 Do
    Begin
      carga(e);
      maximos(e,cue1,cue2,name1,name2,rmax1,rmax2);
      LpProf := laPlata(e,LpProf);
    End;

  writeln('la cantidad de instituciones con profesores acordes a los alumnos de laPlata : ', LpProf);
  writeln('CUE y Nombre de la Primera Escuela de mejor relacion prof alumnos : ',cue1,'/', name1);
  writeln('CUE y Nombre de la Segunda Escuela de mejor relacion prof alumnos : ',cue2,'/', name2);
End.