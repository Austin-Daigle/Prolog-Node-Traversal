%close single declared var warnings (used for debugging)
:-style_check(-singleton).

%represent each of the city as a edge node, the first coordinate
%if the current city and the second coordinate is the next connection and the 
%last coordinate is the cost between both points
edge(0, 1, 87).
edge(1, 0, 87).
edge(1, 2, 92).
edge(2, 1, 92).
edge(2, 3, 142).
edge(3, 2, 142).
edge(3, 4, 85).
edge(3, 5, 98).
edge(4, 3, 85).
edge(4, 6, 90).
edge(6, 4, 90).
edge(5, 3, 98).
edge(5, 7, 86).
edge(7, 5, 86).


%Check if there is a path between two defined nodes
pathCheck([B | Rest], B, [B | Rest], Length, Length).
pathCheck([A | Rest], B, Path, CurrentLength, Length) :-
    edge(A, C, X),\+member(C, [A | Rest]),
    NewLength is CurrentLength + X,
    pathCheck([C, A | Rest], B, Path, NewLength, Length).

%Call this function to determine to return a boolean value of
%If two paths have a route together.
hasPath(A, B) :-
    pathCheck([A], B, Path, 0, Length),
    reverse(Path, DirectPath),
	%print true for the function if the false has not been found
    true;

%if the input is empty return a null
findPath([]).
%if the input is a single point return the single point
findPath([X]) :-
    !, write(X).
%find the defined path between two points and printout the route.
findPath([X|T]) :-
    write(X),
    write(', '),
    findPath(T).

%Find the shortest Path
%Input queries as such path(node1#,node#2,N,T) (N and T are left as N and T)
path(X, X, 0, []).
%path(X, Y, N, [Y]) :- edge(X, Y, N).

path(X, Y, N, [X-Y]) :- edge(X, Y, N).
path(X, Z, N, [X-Y|T]) :-
    edge(X, Y, N0),
    path(Y, Z, N1, T),
    N is N0 + N1.