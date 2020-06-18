
Requisitos = {
	"Oracle","SQL/PL","Linux","Unix","Shell","C++",
	"Proc*C","TuxedoV12", "VB6", "Java","WebServices","MicroServicios"
} 

Respuestas = set()

for req in Requisitos:
	print("Considera que tiene dominio de", req)
	r = input("1.- Si\n2.-No\n")
	if(r=="1"): Respuestas.add(req)


Cinterseccion = Requisitos & Respuestas
R = "Apto" if (len(Cinterseccion) == len(Requisitos)) else "No apto"
print(R)