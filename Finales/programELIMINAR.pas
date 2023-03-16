program eliminar;
type
vector = array [1..10] of integer;


PROCEDURE TRES (VAR V: vector; VAR dimL: integer; dato: integer; var b:boolean);
Var 
    i,j:integer;
begin
    i:=1;
    while (i<=dimL) and (v[i]<dato) do
        i:=i+1;
        
    if (i>dimL) or (v[i]<>dato) then //agregamos el or
        b:=False
    else begin
        b:=True;

        while (i<=dimL) and (v[i]=dato) do begin
          cont:=cont+1;
          i:=i+1;

        for j:=i+cont to dimL do //desplaza al resto!
             v[j-cont]:= V[j];
          dimL:=dimL-cont;

          if i=dimL then //comprueba si hay que eliminar el ultimo elemento
            dimL:=dimL-1
          else begin
              for j:=i+1 to dimL do //desplaza al resto!
                v[j-1]:= V[j];
              dimL:=dimL-1;
            end;
        end;
    end;
end;

var
diml, dato,i: integer;
ok: boolean;
v:vector;

begin
  for i:= 1 to 10 do
    v[i]:= i;
  diml:=10;
  v[6]:=5;
  dato:=0;
  while (dato <> -1) do begin
    read(dato);
  tres(v,dimL,dato,ok);
    for i := 1 to diml do
      write(v[i]);
  end;
end.
