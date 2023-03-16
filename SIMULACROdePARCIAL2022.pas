{LA FUENTE - SIMULACRO DE PARCIAL - 2022 
Enunciado de CODP año 2017 
Un banco necesi a un programa para administrar información de sus clientes. Para ello, se debe:  }

Program simulacroparcial;

Const 
  tope = 10;
Type 
  num = 1..2;
  cuenta = Record
    cbu : integer;
    tipo: num;
    //1-caja de ahorro 2-cta corriente
    saldo: integer;
  End;

  vector = array [1..tope] Of cuenta;

  cumpleanito = Record
    dia: integer;
    mes: integer;
    ano: integer;
  End;

  cliente = Record
    ncliente: integer;
    dni: integer;
    apellido: string[20];
    nombre: string[20];
    fnac: cumpleanito;
    cta: vector;
    diml: integer;
  End;

  lista = ^nodo;
  nodo = Record
    dato: cliente;
    sig: lista;
  End;




{A) Leer y almacenar información de los clientes. De cada cliente se lee: nro de cliente, DNI, apellido y nombre, 
fecha de nacimiento e información de las cuentas que posee en el banco (a lo sumo 10).
De cada cuenta se lee el CBU de la cuenta, tipo de cuenta (1: caja de ahorro, 2: cuenta corriente), saldo. La lectura de cuentas para cada 
cliente finaliza cuando se lee el CBU 111 (que no debe procesarse).      
La lectura de clientes finaliza cuando se lee el código -1 (que no debe procesarse).}

Procedure agregarlista(Var l:lista;c: cliente);

Var 
  nue: lista;
Begin
  new (nue);
  nue^.dato := c;
  nue^.sig := l;
  l := nue;
End;

Procedure cargavec(Var a:vector; Var diml: integer);

Var 
  aux: integer;
Begin
  write('ingrese el CBU');
  readln(aux);
  if not(aux=111) then begin
  While (diml < tope) And (aux <> 111) Do
    Begin
      diml := diml + 1;
      a[diml].cbu := aux;
      write('ingrese el tipo : 1-caja de ahorro 2-cta corriente');
      readln(a[diml].tipo);
      write('ingrese el saldo de la cuenta');
      readln(a[diml].saldo);
      write('ingrese el CBU');
      readln(aux);
    End;
end;
End;

Procedure leercliente(Var c: cliente);
Begin
  c.diml := 0;
  writeln ('ingrese nro cliente');
  readln (c.ncliente);
  If (c.ncliente<>-1) Then
    Begin
      writeln ('ingrese dni');
      readln (c.dni);
      writeln ('ingrese apellido');
      readln (c.apellido);
      writeln ('ingrese nombre');
      readln (c.nombre);
      writeln ('ingrese dia, mes y ano');
      read (c.fnac.dia);
      write('/');
      READ (c.fnac.mes);
      write('/');
      readln(c.fnac.ano);
      cargavec(c.cta, c.diml);
    End else 
    writeln ('no hay datos');
End;

Procedure cargarlista(Var l:lista);

Var 
  c: cliente;
Begin
  leercliente(c);
  While (c.ncliente<>-1) Do
    Begin
      agregarlista(l,c);
      leercliente(c);
    End;
End;




{B) Una vez leída y almacenada toda la información, calcular e informar: 
1. Para cada cliente, el saldo total de las cajas de ahorro que posee. 
2. Nro de los dos clientes que poseen menor cantidad de cuentas en el banco. 
3. Apellido y nombre de los clientes con DNI compuesto por más dígitos pares que impares.}

Function saldo (diml : integer; a: vector): integer;

Var 
  i, saldotot: integer;
Begin
  saldotot := 0;
  For i:= 1 To diml Do
    Begin
      saldotot := saldotot + a[i].saldo;
      saldo := saldotot;
    End;
End;

Procedure dosmenores(num, cliente:integer ; Var codm1,codm2,cta1,cta2 : integer)
;

Begin
  If (num < codm1)Then
    Begin
      codm2 := codm1;
      cta2 := cta1;
      codm1 := num;
      cta1 := cliente;
    End
  Else If (num< codm2) Then
         Begin
           codm2 := num;
           cta2 := cliente;
         End;
End;

Function maspar (dni: integer): boolean;

Var 
  par,impar,dig: integer;
Begin
  par := 0;
  impar := 0;
  While (dni<>0) Do
    Begin
      dig := dni Mod 10;
      If (dig Mod 2 = 0 ) Then
        par := par +1
      Else
        impar := impar + 1;
      dni := dni Div 10;
    End;
  maspar := par > impar;
End;

Procedure recorrerlista(l:lista);

Var 
  menos1,menos2, ctamin1, ctamin2: integer;
Begin
  ctamin1 := 0;
  ctamin2 := 0;
  menos1 := 999;
  menos2 := 999;
  
  While (l<>Nil) Do
    Begin
      writeln ('el saldo total es: ',saldo(l^.dato.diml, l^.dato.cta));
      //punto 1 inciso b.

      dosmenores (l^.dato.diml,l^.dato.ncliente,menos1,menos2,ctamin1,ctamin2);

      If (maspar(l^.dato.dni))Then //punto 3 inciso b
        write (l^.dato.nombre,' ',l^.dato.apellido);

      l := l^.sig;
    End;
  writeln ('los clientes con menos cuentas son los nros: ', ctamin1,' y ',
           ctamin2);
  //punto2  inciso b
End;




{C) Implementar un módulo que adicione, en la estructura generada en "A)" , 1000 pesos al saldo de la cuenta 
con CBU 112233445566 del cliente con nro 7777. 
Se asegura que existe dicho cliente y que posee dicha cuenta. NOTA: Se pide realizar la invocación del módulo.}

Procedure planero(l: lista);

Var 
  i: integer;
Begin
  While {(l<> nil) and} (l^.dato.ncliente <> 777) Do
    l := l^.sig;

  If (l^.dato.ncliente = 777) Then
    For i:= 1 To l^.dato.diml Do
      If (l^.dato.cta[i].cbu = 12345) Then
        l^.dato.cta[i].saldo := l^.dato.cta[i].saldo + 1000;
End;

Var 
  l: lista;
Begin
  l := nil;
  cargarlista(l);
  if not(l=nil) then begin
  recorrerlista(l);
  planero(l);
  end else 
  writeln('No hay datos en el sistema');
End.
