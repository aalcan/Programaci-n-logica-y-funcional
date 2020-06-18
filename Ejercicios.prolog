% Desarrolle un predicado que permita validar un NIP de una banco que 
% Responde a la siguiente gramatica
% Nip ::= <Digito> ' ' <Digito> ' ' <Digito> ' ' <Digito>
% Digito ::= 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9
%nip("1235").
%true.
%
%nip("123").
%false.
digito('0').
digito('1').
digito('2').
digito('3').
digito('4').
digito('5').
digito('6').
digito('7').
digito('8').
digito('9').

suma_lista([]).
suma_lista([S|L]) :-
	digito(S),
	suma_lista(L).
%
nip(F) :- 
	string_chars(F,R),
	suma_lista(R),
    length(R,T),
    T==4.
%
% Desarrolle un predicado que permita validar un octeto de una ip
% Responde a la siguiente gramatica
% Octeto ::= '2'<R5><R5> | '1'<Digito><Digito> | <Digito><Digito> | <Digito>
% R5 ::= 0 | 1 | 2 | 3 | 4 | 5
% Digito ::= 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9
%
%nip("255").
%true.
%nip("256").
%false
r5('0').
r5('1').
r5('2').
r5('3').
r5('4').
r5('5').

lista_f([F|_],R) :- F=='2', lista_octeto(R); F=='1',suma_lista(R).

lista_octeto([]).
lista_octeto([G|V]) :- r5(G), lista_octeto(V).
%
octeto(F) :- 
	string_chars(F,R),
	length(R,T), 
	T==3, 
	lista_f(R,R); 
	string_chars(F,R),
	length(R,T), 
	T<3, 
	suma_lista(R).