%A typical family database.
male(joost).
male(sacha).
male(leon).
male(merlijn).
male(peter).
female(sofie).
female(sandrine).
female(fien). % toegevoegd
parent(joost,sacha).
parent(joost,leon).
parent(sandrine,sacha).
parent(sandrine,leon).
parent(fien,sofie).
parent(fien,merlijn).
parent(peter,fien).
parent(peter,joost).


isChild(X) :- parent(Y,X).
sibling(X, Y) :-
      parent(Z, X),
      parent(Z, Y),
      X \= Y.


% stap 3
brother(X, Y) :-
      sibling(X, Y),
      X\=Y,
      male(X).

% stap 3 extra
sister(X, Y) :-
      sibling(X, Y),
      X\=Y,
      female(X).


father(X,Y) :-
    male(X),
    parent(X,Y).

mother(X,Y) :-
    female(X),
    parent(X,Y).

% stap 5
cousin(X,Y) :-
    parent(Z,X),
    parent(W,Y),
    sibling(Z,W).

% stap 6
ancestor(X,Y) :-
    parent(X,Y).
% recursive predicate 
ancestor(X,Y) :-
    parent(X,Z),ancestor(Z,Y).

family(X,Y) :-
    ancestor(X,Y) ; sibling(X,Y) ; cousin(X,Y) ; grandchild(X,Y) ; wife(X,Y) ; grandparent(X,Y); husband(X,Y); uncle(X,Y); aunt(X,Y) ; nephew(X,Y) ; niece(X,Y).
%    X\=Y.

grandparent(X,Y):- 
    parent(X,Z),parent(Z,Y).
grandchild(X,Y):-
    grandparent(Y,X).


wife(X,Y):-
    parent(X,Z),
    parent(Y,Z),
    female(X),
    male(Y).

husband(X,Y):-
    parent(X,Z),
    parent(Y,Z),
    male(X),
    female(Y).


uncle(X, Y) :- brother(X, Z), parent(Z,Y).

aunt(X, Y) :- sister(X, Z), parent(Z,Y).

nephew(X, Y) :- uncle(Y, X).

niece(X, Y) :- aunt(Y, X).



