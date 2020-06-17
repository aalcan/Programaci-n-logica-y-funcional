%Ejercicio String prolog

%Es simple realicen el analizador léxico que realice en los ultimos
%dos videos
latom_lstring([],[]).
latom_lstring([F|C],R) :- latom_lstring(C,S), atom_string(F,SF), append([SF],S,R).
preparar_string(Term,LS) :-
    atom(Term),
    atom_string(Term,Str),
    preparar_string(Str,LS).
preparar_string(Str,LS) :-
    string(Str),
    string_chars(Str,LAC),
    latom_lstring(LAC,LS).
digito(N) :-
    N == 0; N == 1; N == 2; N == 3; N == 4;
    N == 5; N == 6; N == 7; N == 8; N == 9.
digitos([F|[]]):- digito(F).
digitos([F|C]) :- digito(F),digitos(C).
signo("+").
signo("-").
operador("*").
operador("/").
operador(O) :- signo(O).
%numerosing(N) :- list(N),digitos(N).
%numerosing([F|C]) :- signo(F),digitos(c).

numerosigno([F|C]) :- signo(F), digitos(C).
numerosigno([F|C]) :- digitos([F|C]).

secnumeros([F|[]]):-  preparar_string(F,PS), numerosigno(PS).
secnumeros([F|C]):-  preparar_string(F,PS), numerosigno(PS), secnumeros(C).

operacion([F|C]) :- operador(F), secnumeros(C).
% +12 343 100
% expesion_c(["("|C]):-

abre_parentesis(["("|_]).
cierra_parentesis([_|C]) :- append(_,[")"],C).
% espre([F|C]) :- abre_parentesisi([F|C]), cierra_parentesis([F|C]),
% append(Op,[")"],C), operacion(op)
expre([F|C]) :-
    abre_parentesis([F|_]),
    cierra_parentesis([_|C]),
    append(OP,[_],C),
    operacion(OP).