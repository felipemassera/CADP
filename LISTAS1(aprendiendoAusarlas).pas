Program uno;
Type 
  puntero = ^integer;
Var 
  p,q: puntero;
Begin
  new (p);
  p^ := 14;
  write (p^);
  q := p;
  q^ := q^*10;
  
End.
