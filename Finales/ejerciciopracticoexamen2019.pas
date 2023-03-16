{El siguiente código elimina de un vector v ordenado, las ocurrencias del dato que se recibe como 
parámetro y retorna en b el resultado de la operación. ¿Considera que el código presentado es correcto?
En caso contrario realice las modificaciones necesarias.}

//Postcorrecion:
PROCEDURE TRES (VAR V: vector; VAR dimL: integer; dato: integer; var b:boolean):
Var 
    i,j:integer;
begin
    i:=1;
    while (i<=dimL) and (v[i]<dato) do
        i:=i+1;
        
    if (i>dimL) or (v[i]<>dato) then //agregamos el or
        b:=False;
    else begin
        b:=True;

        while (i<=dimL) and (v[i]=dato) do begin
          if i=dimL then //comprueba si hay que eliminar el ultimo elemento
            dimL:=dimL-1;
          else begin
              for j:=i+1 to dimL do //desplaza al resto!
                v[j-1]:= V[j];
              dimL:=dimL-1;
            end;
        end;
    end;
end;

//Precorrecion:
PROCEDURE TRES (VAR V: vector; VAR dimL: integer; dato: integer; var b:boolean):
Var 
    i,j:integer;
begin
    i:=1;
    while (i<=dimL) and (v[i]<dato) do
        i:=i+1;
        
    if (i>dimL) then 
        b:=False;
    else begin
        b:=True;
        while (i<=dimL) and (v[i]=dato) do begin
            for j:=i+1 to dimL do V[j-1]:= V[j];
            dimL:=dimL-1;
        end;
    end;
end;
{ PRÁCTICA: Se lee información de las ventas de productos de un comercio. De cada venta se conoce. código de venta, 
código de producto y cantidad vendida. La lectura finaliza cuando se ingresa el código de venta 9999. Se pide
implementar un programa que genere una lista ordenada por código de producto. Una vea generada la lista se debe 
informar la cantidad total de productos vendidos, para un código de producto que se ingresa por teclado }
Program examen2019;

Type 
venta = Record
  codigoVenta: integer;
  codProd: integer;
  cantidadVendida: integer;
End;

  lista = ^nodo;
  nodo = Record
    dato : venta;
    sig : lista;
  End;

Procedure insertarOrdenado(Var L:lista; v:venta);
Var 
  nue: lista;
  act, ant: lista; {punteros auxiliares para recorrido}
Begin
  new (nue);
  nue^.dato := v;
  act := L; {ubico act y ant al inicio de la lista}
  ant := L;
  While ( act <> Nil)And(v.codProd > act^.dato.codProd) Do
    {el el orden va a ser por la edad}
    Begin
      ant := act;
      act := act^.sig;
    End;
  If (act = ant) Then {al inicio o lista vacía}
    L := nue
  Else {al medio o al final}
    ant^.sig := nue;
  nue^.sig := act;
End;
Procedure leer (Var L:lista);

Var 
  N: venta;
Begin
  writeln('Ingrese codigo de venta!');
  readln (N.codigoVenta);
  While (N.codigoVenta <> 9999) Do
    Begin
      writeln('Ingrese codigo de producto!');
      readln(N.codProd);
      writeln('Ingrese cantidad vendida!');
      readln (N.cantidadVendida);
      insertarOrdenado(L, N);
      writeln('Ingrese codigo de venta!');
      readln (N.codigoVenta);
    End;
End;
Procedure recorrerLista ( L : lista );

Var 
  codigo ,contador: integer;
Begin
  contador := 0;
 { leer codigo }
  writeln('Ingrese el codigo del producto para ver la cantidad de ventas');
  readln( codigo );
 { posicionarse en el producto }
  //nashei

  While ( L <> Nil ) and (L^.dato.codProd = codigo) Do begin
     contador := contador+L^.dato.cantidadVendida;
     L := L^.sig;
  end;

  writeln('las ventas totales fueron: ', contador);
End;
{programa principal}

Var 
  l : lista;
Begin
  leer(l);
  recorrerlista(l);

End.
# Impoself.rtamos las bibliotecas
import sys, pygame, time
from math import *

# Iniciamos pygame
pygame.init()

# Ancho y alto de la pantalla
ancho, alto = 780, 400
resolucion = (ancho,alto)
pantalla = pygame.display.set_mode(resolucion) # Resolucion de 780x400
pygame.display.set_caption("Calcutrón 3000 by: Macías Luciano y Payajo Shein") # Nombre de la calculadora

# Algunos colores
# Color 		R 		G 		B
negro 	= 	(0		,0		,0		)
gris	=	(64		,64		,64		)
gras	=	(14		,137	,162	)
griso	=	(114	,114	,114	)
blanco 	=	(255	,255	,255	)
naranja = 	(255	,112	,40		)
cyan 	=	(44		,167	,192	)
bordo 	=	(185	,35		,35		)
amarillo=	(213	,204	,80		)

# Instanciamos el clock y algunas variables de ayuda
clock = pygame.time.Clock()
accion = "" # almacenará la accion presionada

"""
Clase Boton: esta clase hecha por nosotros nos ayudara a no repetir código
			ademas de otorgarnos la oportunidad de conocer cuando es presionado
			o incluso adquirir el valor que lleva cada uno de los botones
"""
class Boton:
	"""
	Iniciamos el objeto con coordenadas iniciales, los respectivos tamaños, 
	color y texto
	"""
	def __init__ (self,sx_coord,sy_coord,x_tam,y_tam,color,texto):
		# Los almacenamos para su uso
		self.x = sx_coord
		self.y = sy_coord
		self.ancho = x_tam
		self.alto = y_tam
		self.color = color
		self.texto = texto

	def graf (self,ventana): # Al llamar Boton.graf se pide la ventana a dibujar
		"""
		Detectamos si se ha pasado texto como parametro y de esta forma
		solo renderizamos cuando es necesario
		"""
		if self.texto != "":
			# Por temas de diseño, el tamaño máximo de fuente es 40
			if self.ancho > 40: 
				fuente = pygame.font.SysFont("Times New Roman", 40)
			else:
				fuente = pygame.font.SysFont("Times New Roman", self.ancho)

			"""
			Establecemos el color del texto, blanco o negro dependiendo del
			color del boton pasado al inicializar
			"""
			if self.color != blanco:
				rendertxt = fuente.render(self.texto,0,blanco)
			else:
				rendertxt = fuente.render(self.texto,0,negro)

			# Obtenemos el tamaño del texto para poder acomodar sus coordenadas
			fx,fy = fuente.size(self.texto)
			fux,fuy = int(self.x+(self.ancho/2)-(fx/2)), int(self.y+(self.alto/2)-(fy/2))
		"""
		Para evitar que el texto se salga del boton establecemos que cuando
		este es mayor al tamaño pasado, el boton se agrande
		"""
		if fx < self.ancho:
			self.cuadro = pygame.Rect(self.x,self.y,self.ancho,self.alto)
		else:
			self.cuadro = pygame.Rect(self.x,self.y,fx+10,self.alto)

		# Lo dibujamos
		pygame.draw.rect(ventana,self.color,self.cuadro)

		# Lo cargamos
		ventana.blit(rendertxt,(fux,fuy))

	def presion(self,pos,ventana):
		"""
		Haciendo uso de la herramienta collidepoint de pygame,
		detectamos si las coordenadas "pos" (las cuales son las coordenadas
		del cursor al hacer click) se encuentran dentro del area del boton
		"""
		if self.cuadro.collidepoint(pos):
			aux = self.color # Guardamos el color original
			R,G,B = self.color # Desarmamos la tupla
			R,G,B = R-50,G-50,B-50 # Modificamos los valores

			# Verificamos que no hayan numeros negativos
			if R < 0: R=0
			if G < 0: G=0
			if B < 0: B=0
			# Almacenamos los nuevos colores oscurecidos en una tupla
			sombra = (R,G,B)

			# Establecemos esta sombra como color del boton
			self.color = sombra

			# Redibujamos el boton presionado para dar el efecto
			pygame.draw.rect(ventana,self.color,self.cuadro)
			pygame.display.flip()

			# Reestablecemos el color original
			self.color = aux
			self.graf(ventana)

			return self.texto
		else:
			return "NADA"

# Creamos la clase calculadora para dibujarla y operar
class Calculadora:
	# Iniciamos la calculadora
	def __init__(self):
		self.n1 = 0.0
		self.n2 = 0.0
		self.visor = ""
		self.taman = 62
		self.expresion = ""
		self.limite = False
		self.max_visor = 22 # Indica el numero maximo de digitos disponibles
		print("Calculadora iniciada")

	# Iniciamos el dibujo de la base y el visor
	def dibujar(self,ventana):
		# Pintamos la pantalla de gris
		ventana.fill(gris) 
		# Dibujamos algunos detalles y el visor
		funte = pygame.font.SysFont("Times New Roman", 14)
		creditos = funte.render("Calcutrón 3000 by: Macías Luciano y Payajo Shein",0,gras) # Marca de agua
		ventana.blit(creditos,(0,0))
		pygame.draw.rect(ventana,griso,(20,20,740,110),10) # Marco
		pygame.draw.rect(ventana,blanco,(22,22,736,106)) # Visor
		pygame.draw.rect(ventana,griso,(0,150,780,250)) # Zona de lso botones

	def vista_visor(self,ventana):
		pygame.draw.rect(ventana,blanco,(22,22,736,106)) # Visor

		self.taman = 62

		funte = pygame.font.SysFont("Times New Roman", self.taman)
		# Generamos el render
		rend_visor = funte.render(str(self.visor),0,negro)
		# Calculamos las coordenadas
		tw,th = funte.size(str(self.visor))
		if tw > 700:
			while tw > 700:
				self.taman -=1
				funte = pygame.font.SysFont("Times New Roman", self.taman)
				rend_visor = funte.render(self.visor,0,negro)
				tw,th = funte.size(self.visor)
			if self.taman > 30:
				self.limite = False
			elif self.taman < 30:
				self.limite = True

		tw,th = 22+int((714/2)-(tw/2)), 22+int((84/2)-(th/2))
		# Lo cargamos
		ventana.blit(rend_visor,(tw,th))

	"""
	Menu de informacion para el uso de la calculadora
	Vamos a obviar 
	"""
	def infomenu(self,ventana):
		atras = False
		volver = ""

		ventana.fill(gris)

		funte = pygame.font.SysFont("Times New Roman", 24)
		titulo = funte.render("¡Información a tener en cuenta!",0,amarillo)
		tw,th = funte.size("I")
		ventana.blit(titulo,(20,10))

		funte = pygame.font.SysFont("Times New Roman", 20)
		textto = funte.render("1. Todas las operaciones compuestas son fácilmente realizables.",0,blanco)
		separacion = 12+th
		ventana.blit(textto,(20,separacion))
		pygame.display.flip() # Actualizamos la ventana

		tw,th = funte.size("I")
		separacion += th
		textto = funte.render("2. Tener cuidado con el límite de caracteres disponibles.",0,blanco)
		ventana.blit(textto,(20,separacion))
		pygame.display.flip() # Actualizamos la ventana

		tw,th = funte.size("I")
		separacion += th + 5
		textto = funte.render("3. '%' se utiliza para sacar el resto entre dos números y no para porcentajes.",0,blanco)
		ventana.blit(textto,(20,separacion))
		pygame.display.flip() # Actualizamos la ventana

		tw,th = funte.size("I")
		separacion += th
		textto = funte.render("4. Si la cuenta a realizar está mal ejecutada, no se realizará y dará mensaje de error.",0,blanco)
		ventana.blit(textto,(20,separacion))
		pygame.display.flip() # Actualizamos la ventana

		tw,th = funte.size("I")
		separacion += th + 5
		textto = funte.render("5. Respetar el uso de paréntesis cuando se dibujan en pantalla automáticamente.",0,blanco)
		ventana.blit(textto,(20,separacion))
		pygame.display.flip() # Actualizamos la ventana

		tw,th = funte.size("I")
		separacion += th
		textto = funte.render("6. Las operaciones como 'sin', 'cos' y 'tan', devuelven los valores en deg.",0,blanco)
		ventana.blit(textto,(20,separacion))
		pygame.display.flip() # Actualizamos la ventana

		tw,th = funte.size("I")
		separacion += th + 5
		textto = funte.render("7. Luego de presionar la igualación '=' es necesario limpiar con el boton 'AC'.",0,blanco)
		ventana.blit(textto,(20,separacion))
		pygame.display.flip() # Actualizamos la ventana

		tw,th = funte.size("I")
		separacion += th
		textto = funte.render("9. El número máximo de caracteres es de 47.",0,blanco)
		ventana.blit(textto,(20,separacion))
		pygame.display.flip() # Actualizamos la ventana

		tw,th = funte.size("I")
		separacion += th + 5
		textto = funte.render("10. Al presionar la potenciación, todo lo que haya en el visor será elevado,",0,blanco)
		ventana.blit(textto,(20,separacion))
		pygame.display.flip() # Actualizamos la ventana

		tw,th = funte.size("I")
		separacion += th
		textto = funte.render("utilizar con sabiduría.",0,blanco)
		ventana.blit(textto,(20,separacion))
		pygame.display.flip() # Actualizamos la ventana

		tw,th = funte.size("I")
		separacion += th+20
		funte = pygame.font.SysFont("Times New Roman", 24)
		textto = funte.render("Calcutrón 3000 by: Macías Luciano y Payajo Shein",0,naranja)
		ventana.blit(textto,(130,300))
		pygame.display.flip() # Actualizamos la ventana

		funte = pygame.font.SysFont("Times New Roman", 20)
		titulo = funte.render("Volver",0,amarillo)
		tw,th = funte.size("I")
		ventana.blit(titulo,(25+(tw/2),340-th))

		b_atras = Boton(10,340,100,50,amarillo,"←")
		b_atras.graf(ventana)
		pygame.display.flip() # Actualizamos la ventana

		# Salida del menu de información o cerrado de ventana
		while atras == False:
			for event in pygame.event.get():
				if event.type == pygame.QUIT:
					sys.exit()
					pygame.quit()

				elif event.type == pygame.MOUSEBUTTONDOWN:
					# Tomamos la posicion del cursor
					posi = pygame.mouse.get_pos()

					volver = b_atras.presion(posi,pantalla)

			if volver == "←":
				break

	def accionar(self,valor,ventana):
		
		if valor == "Info":
			# Abrimos el menu
			self.infomenu(ventana)

			# Dibujamos la calculadora
			self.dibujar(ventana)

			for boton in botones:
				# Se dibujan los botones en pantalla
				boton.graf(ventana)

		# Lista de algunos caracteres especiales
		caracteres =["=","AC"]

		# Detectamos lo que se presiono
		if valor != "=" and valor != "AC" and valor != "Info" and self.limite == False:
			try:
				if valor == "x":
					self.expresion += "*" 	# Expresion guardará el código
					self.visor += "*"		# visor mostrará en pantalla
				elif valor == "sin":
					self.expresion += "sin(1/180*pi*"# Expresion guardará el código
					self.visor += "sin("# visor mostrará en pantalla
				elif valor == "cos":
					self.expresion += "cos(1/180*pi*"# Expresion guardará el código
					self.visor += "cos("# visor mostrará en pantalla
				elif valor == "tan":
					self.expresion += "tan(1/180*pi*"# Expresion guardará el código
					self.visor += "tan("# visor mostrará en pantalla
				elif valor == "log":
					self.expresion += "log10("# Expresion guardará el código
					self.visor += "log("# visor mostrará en pantalla
				elif valor == "ln":
					self.expresion += "log("# Expresion guardará el código
					self.visor += "ln("# visor mostrará en pantalla
				elif valor == "√":
					self.expresion += "sqrt("# Expresion guardará el código
					self.visor += "√("# visor mostrará en pantalla
				elif valor == "π":
					self.expresion += "pi"# Expresion guardará el código
					self.visor += "π"# visor mostrará en pantalla
				elif valor == "e":
					self.expresion += "e"# Expresion guardará el código
					self.visor += "e"# visor mostrará en pantalla
				elif valor == "^":
					aux = self.visor
					self.visor = ""
					self.expresion = ""
					self.expresion += "pow("+aux+","# Expresion guardará el código
					self.visor += "("+aux+"^"# visor mostrará en pantalla
				else:
					self.expresion += valor# Expresion guardará el código
					self.visor += valor# visor mostrará en pantalla

			except:
				self.visor = ""
				self.expresion = ""

		if valor in caracteres:
			self.visor = "" # Al presionar un caracter especial se limpia el visor
			if valor == "AC": # AC borrará tambien la expresión
				self.expresion = ""
			elif valor == "=": # Igualdad hará la cuenta y borrará dicha expresion
				"""
				Segun la documentacion de python 3.X, la funcion 'eval()' intentará
				ejecutar el string como una linea de codigo de python
				"""
				try: # Intentamos ejecutar la cuenta
					self.visor = eval(self.expresion)
					self.expresion = ""

				except: # Si no se consigue avisaremos por pantalla
					self.visor = "Error de tipeo"


# Creamos la calculadora
calcu = Calculadora()

# Creamos algunos botones
uno = Boton(10,160,100,50,naranja,"1")
dos = Boton(120,160,100,50,naranja,"2")
tres = Boton(230,160,100,50,naranja,"3")
cuatro = Boton(10,220,100,50,naranja,"4")
cinco = Boton(120,220,100,50,naranja,"5")
seis = Boton(230,220,100,50,naranja,"6")
siete = Boton(10,280,100,50,naranja,"7")
ocho = Boton(120,280,100,50,naranja,"8")
nueve = Boton(230,280,100,50,naranja,"9")
cero = Boton(120,340,100,50,naranja,"0")
punto = Boton(10,340,100,50,naranja,".")
igual = Boton(230,340,100,50,cyan,"=")
borrar = Boton(340,160,100,50,bordo,"AC")
suma = Boton(340,220,100,50,cyan,"+")
porcent = Boton(340,280,100,50,cyan,"%")
seno = Boton(450,160,100,50,cyan,"sin")
resta = Boton(450,220,100,50,cyan,"-")
logn = Boton(450,280,100,50,cyan,"ln")
euler = Boton(340,340,45,50,cyan,"e")
numpi = Boton(395,340,45,50,cyan,"π")
parun = Boton(450,340,45,50,cyan,"(")
pardo = Boton(505,340,45,50,cyan,")")
cose = Boton(560,160,100,50,cyan,"cos")
divis = Boton(560,220,100,50,cyan,"/")
log_10 = Boton(560,280,100,50,cyan,"log")
raiz = Boton(560,340,100,50,cyan,"√")
tang = Boton(670,160,100,50,cyan,"tan")
multip = Boton(670,220,100,50,cyan,"x")
poten = Boton(670,280,100,50,cyan,"^")
info = Boton(670,340,100,50,amarillo,"Info")

# Los almacenamos en una lista
botones=[uno,dos,tres,cuatro,cinco,
		seis,siete,ocho,nueve,cero,
		punto,igual,borrar,suma,resta,
		multip,divis,porcent,seno,cose,
		tang,logn,log_10,raiz,numpi,
		euler,poten,info,parun,pardo]

# Dibujamos la calculadora
calcu.dibujar(pantalla)

for boton in botones:
	# Se dibujan los botones en pantalla
	boton.graf(pantalla)

# Main
while 1:
	# Cierre del programa
	for event in pygame.event.get():
		if event.type == pygame.QUIT:
			sys.exit()
			pygame.quit()

		elif event.type == pygame.MOUSEBUTTONDOWN:
			# Tomamos la posicion del cursor
			posi = pygame.mouse.get_pos()

			for boton in botones:
				# Detecta colisiones y almacena la accion presionada
				accion = boton.presion(posi,pantalla)
				if accion != "NADA":
					calcu.accionar(accion,pantalla) # Llamamos a la funcion que diferencia y opera
					# Una vez detectado salimos del bucle for
					break
			calcu.vista_visor(pantalla) # Re dibujamos el visor de la calculadora
			accion = "" # Limpiamos dicha variable de operacion

	clock.tick(60) # El bucle debe repetirse 60 veces por segundo 

	pygame.display.flip() # Actualizamos la ventana

    //Calculadora! Aca se muestran cosas importantes
do //Para los entendidos, es como un repeat until
{
		Console.WriteLine("╔══════════════════╗"); //Ascii code for this in https://www.bbc.co.uk/bitesize/guides/zscvxfr/revision/4
		Console.WriteLine("║Calculator Program║");
		Console.WriteLine("╚══════════════════╝");
		double num1 = 0;
		double num2 = 0;
		double result = 0;

		Console.WriteLine("Enter number 1: ");
		num1 = Convert.ToDouble(Console.ReadLine());
		Console.WriteLine("Enter number 2: ");
		num2 = Convert.ToDouble(Console.ReadLine()); // Esta linea:\t tabula el texto
		Console.WriteLine("Enter a option: ");
		Console.WriteLine(" \t+ : Add ");
		Console.WriteLine(" \t- : Substract ");
		Console.WriteLine(" \t* : Multiply ");
		Console.WriteLine(" \t/ : Divide ");

		switch (Console.ReadLine())
		{
				case "+":
						result = num1 + num2;
						Console.WriteLine($"Your result: {num1} + {num2} = " + result); //El $ es para interporlar el texto con las variables sin salir del "".
						break;
				case "-":
						result = num1 - num2;
						Console.WriteLine($"Your result: {num1} - {num2} = " + result);
						break;
				case "*":
						result = num1 * num2;
						Console.WriteLine($"Your result: {num1} * {num2} = " + result);
						break;
				case "/":
						result = num1 / num2;
						Console.WriteLine($"Your result: {num1} / {num2} = " + result);
						break;
				default:
						Console.WriteLine("That was not a valid option");
						break;
		}
		Console.WriteLine("Continue? (Y/N)");
} while (Console.ReadLine().ToUpper() == "Y"); //Asi leemos y lo hacemos mayusculas
Console.ReadKey();