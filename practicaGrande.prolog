% Desarrollo una gramatica bnf (como la del video) para validar una 
% direccion ipv4 asi como una mascara de red.
% https://es.wikipedia.org/wiki/M%C3%A1scara_de_red#Tabla_de_m%C3%A1scaras_de_red
% Realice la implementacion de dicha gramatica en prolog donde
% se pueda validar la cadena donde esta esa ip o mascara ejemplo

ip("192.168.1.1").
true.
ip("256.168.1.1").
false.
maskR("255.255.255.0").
true.
maskR("255.255.255.1").
false.

mask_string([], []).
mask_string([F|C],R) :- mask_string(C,S), atom_string(F,SF), append([SF],S,R).
col_string(Oct, LS) :- atom(Oct), atom_string(Oct,Str), col_string(Str,LS).
col_string(Str,LS) :- string(Str), string_chars(Str,LAC), mask_string(LAC, LS).
oct(N) :- N ==  "128"; N == "192"; N == "224"; N == "240"; N == "248"; N == "252"; N == "254"; N == "255".
octC(N) :- N == "0".
dirip(N) :- N == "0"; N == "1"; N == "2"; N == "3"; N == "4"; N == "5"; N == "6"; N == "7"; N == "8"; N == "9".
sep_masc([F|C]) :- octC(F), sep_masc(C).
sep_masc([F|[]]) :- octC(F).
separar([F|[]]) :- string_length(F,R), R == 3, oct(F); string_length(F,R), R == 1, octC(F).
separar([F|C]) :- string_length(F,R), R == 3, oct(F), separar(C); string_length(F,R), R == 1, octC(F), sep_masc(C).
maskR(MASKR) :- split_string(MASKR, ".", ",", M), separar(M).
dir([B|[]]) :- dirip(B).
dir([B|C]) :- dirip(B), dir(C).
sep_dirip([F|[]]) :- number_codes(N, F), N < 256,col_string(F,RS), dir(RS).
sep_dirip([F|C]) :- number_codes(N, F), N < 256, col_string(F,RS),dir(RS), sep_dirip(C).
ip(IP) :- split_string(IP, ".", ",", D), sep_dirip(D).