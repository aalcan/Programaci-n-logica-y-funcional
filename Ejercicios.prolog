% Desarrolle un predicado que permita validar un NIP de una banco que 
% Responde a la siguiente gramatica
% Nip ::= <Digito> ' ' <Digito> ' ' <Digito> ' ' <Digito>
% Digito ::= 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9
%nip("1235").
%true.
%
%nip("123").
%false.
digito(0).
digito(1).
digito(2).
digito(3).
digito(4).
digito(5).
digito(6).
digito(7).
digito(8).
digito(9).
%
nip(A) :- false.
nip(A,B) :- false.
nip(A,B,C) :- false.
nip(A,B,C,D) :- digito(A), digito(B), digito(C), digito(D).
ascii(48).
ascii(49).
ascii(50).
ascii(51).
ascii(52).
ascii(53).
ascii(54).
ascii(55).
ascii(56).
ascii(57).
suma_lista([]).
suma_lista([S|L]) :-
	ascii(S),
	suma_lista(L).
%
nip_a(F) :- 
	suma_lista(F),
    length(F,T),
    T>3.
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
r5(0).
r5(1).
r5(2).
r5(3).
r5(4).
r5(5).
octeto(A) :- digito(A).
octeto(A,B) :- digito(A),digito(B).
octeto(A,B,C) :- A==2, r5(B),r5(C).
octeto(A,B,C) :- A==1, digito(B),digito(C).



ascii_r5(48).
ascii_r5(49).
ascii_r5(50).
ascii_r5(51).
ascii_r5(52).
ascii_r5(53).


lista_r5([N|K],B) :- N==B.
lista_f(F) :- lista_r5(F,50), lista_octeto(F) ; lista_r5(F,49), suma_lista(F).

lista_octeto([]).
lista_octeto([G|V]) :- ascii_r5(G), lista_octeto(V).
%
octeto_a(F) :- length(F,T), T==3, lista_f(F);  suma_lista(F).