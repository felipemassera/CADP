10 9 8 7 6 
5
function encontrado (L:lista; dato:integer):boolean;
begin
    while (L <> nil) and (dato < aux^.dato) do begin
        aux:=aux^.siguiente;
    end;
    encontrado:=aux^.dato = dato;
end;


