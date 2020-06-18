%
%	Gramatica
%
%	<expr> ::= <op> <numero> <numero>
%	<op> ::= '-' | '+' | '/' | '*'
%	<numero> ::= 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9
%
%
%	ejemplo
%	+ 1 2
%
%	Defina en prolog un predicado que permita validar la gramatica
%	Anterior
%
%	expr("+",1,2).
%	true.
%
%	expr("+",11,2). % falso por que esta limitado a un solo numero
%	false.
%
%	expr("/",10,5).
%	true.
%
%	expr("+","*",2).
%	false.
%
%	Hay un predicado en prolog que te verifica si un atomo es un numero
%	number(2).
%	true.
%
%	number('+').
%	false
%
%
opr("+").
opr("-").
opr("*").
opr("/").
numero(0).
numero(1).
numero(2).
numero(3).
numero(4).
numero(5).
numero(6).
numero(7).
numero(8).
numero(9).

expr(A,B,C) :- opr(A),numero(B),numero(C).
is_number(N) :- atom(N).
num(Z) :-  not(is_number(Z)).