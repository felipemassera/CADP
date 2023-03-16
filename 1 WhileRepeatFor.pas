program WhileRepeatFor
Type 
medidas = [1..100] of integer;
lote = record
nro = char;
alto = medidas;
ancho = medidas;
end;
Var 
prop : lote;
Begin
writeln ('ingrese medida del lote');
read (prop);

End.
