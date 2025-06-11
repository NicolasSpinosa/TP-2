:- use_module(piezas).

% EJ 1
% sublista(+Descartar, +Tomar, +L, -R)
sublista(Descartar, Tomar, L, R) :-
    length(R, Tomar),
    length(X, Descartar),
    append(X, Y, L),
    append(R, _, Y).

% EJ 2
% tablero(+K, -T)
tablero(K, T) :-
    K > 0,
    T = [R1, R2, R3, R4, R5],
    length(R1, K),
    length(R2, K),
    length(R3, K),
    length(R4, K),
    length(R5, K).

% EJ 3 (La ñ rompe todo, asi que el predicado se llamara tamanio)
% tamanio(+M, -F, -C).
tamanio([], 0, 0).
tamanio(M, F, C) :-
    length(M, F),
    nth0(0, M, R),
    length(R, C).

% EJ 4
% coordenadas(+T, -IJ)
coordenadas(T, (I, J)) :-
    tamanio(T, F, C),
    between(1, F, I),
    between(1, C, J).

% EJ 5

% EJ 6
% seccionTablero(+T, +ALTO, +ANCHO, +IJ, ?ST)
seccionTablero(T, ALTO, ANCHO, (I, J), ST) :-
    length(ST, ALTO),
    between(1, ALTO, FId),
    nth1(FId, ST, R),
    FIdT is FId + I - 1,
    nth1(FIdT, T, F),
    Descarte is J - 1,
    sublista(Descarte, ANCHO, F, R).