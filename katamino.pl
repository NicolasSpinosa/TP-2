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
partes([], []).
partes([X|Xs], [X|Ys]) :- partes(Xs, Ys).
partes([_|Xs], Ys) :- partes(Xs, Ys).

kPiezas(K, PS) :-
    nombrePiezas(L),
    partes(L, PS),
    length(PS, K).

% EJ 6
% seccionTablero(+T, +ALTO, +ANCHO, +IJ, ?ST)
armarSeccion(Rs, _, _, []) :- is_list(Rs).
armarSeccion([R|Rs], ANCHO, J, [ST|STs]) :-
    Descartar is J - 1,
    sublista(Descartar, ANCHO, R, ST),
    armarSeccion(Rs, ANCHO, J, STs).

seccionTablero(T, ALTO, ANCHO, (I, J), ST) :-
    Descartar is I - 1,
    sublista(Descartar, ALTO, T, R),
    armarSeccion(R, ANCHO, J, ST),
    length(ST, ALTO).