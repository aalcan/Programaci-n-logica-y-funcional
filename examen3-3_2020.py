"""

 Primos  <generadores>  30 pts

	Realice una generador que devuelva  de todos lo numeros primos
	existentes de 0 hasta n-1 que cumpla con el siguiente prototipo:
	
	def gprimo(N):
		pass
	
	
	a = gprimo(10)
	z = [e for e in a]
	print(z)
	# [2, 3 ,5 ,7 ]
"""

def gprimo(nmax):
	for x in range(1,nmax):
		for i in range(2,x):
			if x % i != 0:
				#i no es divisor de x, x puede ser primo
				continue
			else:
				#i es divisor de x, x no es primo
				break
		else:
			#El bucle ha terminado con normalidad, el número que estabamos comprobando es primo
			yield x

a = gprimo(10)
z =[e for e in a]
print(z)


"""
Bada Boom!!! <generadores> 20 pts
	
	Defina un generador que reciba un numero entero positivo mayor a 0 N,
	dicho generador proporciona numero de 1 hasta N
	con las siguientes condiciones:
		1) si es multiplo de 3 coloque la cadena "Bada"
		2) si es multiplo de 5 coloque la cadena "Boom!!"
		3) si es multiplo de 3 y 5 coloque "Bada Boom!!"
		
	def genBadaBoom(N):
		pass
		
	a = genBadaBoom(10)
	z = [e for e in a]
	print(z)
	#[1,2,"Bada",4,"Boom","Bada",7,8,"Bada","Boom"]
"""
def genBadaBoom(N):
	if N > 0:
		for i in range(1,N+1):
			if(i % 3 == 0 and i % 5 == 0):
				yield "Bada Boom!!"
			elif(i % 3 == 0):
				yield "Bada"
			elif(i % 5 == 0):
				yield "Boom!!"
			else:
				yield i
			
a = genBadaBoom(10)
z = [e for e in a]
print(z)

"""


Combinaciones <Comprensión de listas> 30pts

	Una tienda de ropa quiere saber cuantos conjuntos se pueden crear 
	a partir de un grupo de 5 camisas (roja,negra,azul,morada y cafe),      
	4 pantalones (negro, azul, cafe obscuro y crema) y uno de 4 accesorios
	posibles (cinturon, tirantes, lentes, fedora)
	
	1) Obtenga una lista con todos los conjuntos posibles e imprimala en pantalla
	2) imprima un mensaje donde mencione la cantidad de conjuntos posibles
	
"""

camisas = ["roja","negra","azul","morada","cafe"]
pantalones = ["negro", "azul", "cafe obscuro", "crema"]
accesorios = ["cinturon", "tirantes", "lentes", "fedora"]
combinaciones = [(x, y, z) for y in camisas for x in pantalones for z in accesorios]
print(combinaciones)
print("El número de combinaciones es:",len(combinaciones))
"""
    
¿Fedora?  <Comprensión de listas >  15 pts

	Del problema anterior imprima una lista que tenga todos los conjuntos
	que incluyen un sombrero fedora y tambien despliegue su longitud
	
	
"""
combinacionesFedora = [(x, y, z) for (x,y,z) in combinaciones if z == 'fedora']
print(combinacionesFedora)
print("Número de combinaciones que incluyen sombrero fedora:",len(combinacionesFedora))
"""
<Monads>   30 pts

--Lacrimosa - Durch Nacht und Flut --   

Die Suche endet jetzt und hier
Gestein kalt und nass
Granit in Deiner Brust
Der Stein der Dich zerdrückt
Der Fels der Dich umgibt
Aus dem gehauen Du doch bist

Despiertate te busco
Mi corazon abreté te libro
Elevate mi luz y prende mi llama
Si a ti, yo se, te encontrare

El fragmento anterior es un canción del duo lacrimosa

Usando Monads obtenga la letra 
que menos se repite por cada linea y obtenga la probabilidad de sacar dicha
letra.

Nota: Pueden ayudarse de funciones recursivas y compresiones de lista. 

"""


"""
<Monads>

--Hole in my soul apocalyptica--  20 pts



El fragmento anterior es un canción del grupo apocalyptica

Usando Monads obtenga la letra 
que menos se repite de todo el fragmento y obtenga la probabilidad de sacar dicha
letra.

Nota: Pueden ayudarse de funciones recursivas y compresiones de lista. 

"""
cancion = """There's a hole in my heart, in my life, in my way
And it's filled with regret and all I did, to push you away
If there's still a place in your life, in your heart for me
I would do anything, so don't ask me to leave

I've got a hole in my soul where you use to be
You're the thorn in my heart and you're killing me
I wish I could go back and do it all differently
I wish that I'd treated you differently
'Cause now there's a hole in my soul where you use to be"""
cancion = list(cancion)#Lo hacemos una lista
frecuenciaPalab = [cancion.count(w.casefold()) for w in cancion] #contamos la frecuencia de cada letra sin importarnos si la letra se repite
letra = filter(lambda a: cancion.count(a) == min(frecuenciaPalab),cancion) #aplicamos un filtro a esa lista que nos devuela las letras que coinciden con el numero minimo en la frecuencia de letras que ya habiamos calculado
Y = list(letra)#Lo hacemos lista
Y = dict.fromkeys(Y).keys()#Para evitar valores duplicados que en un diccionario no se pueden duplicar los valores
print(Y)

