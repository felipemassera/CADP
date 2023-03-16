

For i:= 1 To 100 Begin
    If(v[i]=2)Then
    writeln(i);

    i:=1
    While (i<diml) And (v[i]<>2) Do
  Begin
    i := i+1;
  End;
If ((v[i]=2)) Then
  writeln (i);

i := 1
     While (i<diml) And (v[i]<2) Do
     Begin
     i := i+1;
End;
If ((v[i]=2)) Then
  writeln (i);


ok := false
      4      5
      While (l<>Nil) And (L^.dato > dato )
      l:= l^.sig;
End;
If (l^.dato = 5) Then
  ok := true;

10 9 8 7 6 5

Procedure eliminar(Var l:lista; valor:longint);//buscas en una lista un valor y si existe lo elimina
Var 
  actual ,ant: lista;
Begin
  ant := l;
  actual := l;
  While (actual <> Nil) Do
    Begin
      If (actual^.dato <> valor) Then
        Begin
          ant := actual;
          actual := actual^.sig
        End
      Else
        Begin
          If (actual <> Nil) Then
            If (actual = l) Then
              Begin
                l := l^.sig;
                dispose (actual);
                actual := l;
              End
          Else
            Begin
              ant^.sig := actual^.sig;
              dispose (actual);
              actual := ant;
            End;
        End;
    End;
End;


if ((x>1)and (x<=20))

if 3.86>4

case ok of 
   true: 
   Else
