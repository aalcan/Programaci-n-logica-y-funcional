"""
# Programación  Lógica



# Modus ponendo ponens

"el modo que, al afirmar, afirma"

P → Q. P ∴ Q


Se puede encadenar usando algunas variables

P → Q. 
Q → S. 
S → T. P ∴ T

Ejercicio 
Defina una funcion que resuelva con verdadero o falso segun corresponada

Laura esta en Queretaro
Alena esta en Paris
Claudia esta en San Francisco
Queretaro esta en Mexico
Paris esta en Francia
San Francisco esta en EUA
Mexico esta en America
Francia esta en Europa
EUA esta en America

def esta(E1,E2):
	pass


print(esta("Alena","Europa"))
# true

print(esta("Laura","America"))
# true

print(esta("Laura","Europa"))
# false



"""

Base = [
	["Laura","Queretaro"],
	["Alena","Paris"],
	["Claudia","San Francisco"],
	["Queretaro","Mexico"],
	["Paris","Francia"],
	["San Francisco","EUA"],
	["Mexico","America"],
	["Francia","Europa"],
	["EUA","America"]
]

def esta(E1,E2):
	R =[ Base[x][1] for x in range(0,len(Base)) if E1 == Base[x][0] ]
	if len(R)>0:
		R2 =[ Base[x][1] for x in range(0,len(Base)) if R[0] == Base[x][0] ]
		if len(R2)>0:
			R3 =[ Base[x][1] for x in range(0,len(Base)) if R2[0] == Base[x][0] ]
			print(R3[0]==E2)

esta("Alena","Europa")


def esta2(E1,E2,B=False):
	R =[ Base[x][1] for x in range(0,len(Base)) if E1 == Base[x][0] ]
	if len(R)>0:
		if R[0]==E2:
			print(R[0]==E2)
		else:
			return esta2(R[0],E2)
	else:
		print(B)

esta2("Francia","America")