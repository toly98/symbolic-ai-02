:-retractall(robot(_)).
:-dynamic robot/1.

%The location of robot and goal
robot(5).
goal(5).
goal(7).
%The first link of the predicate
link(1,2).
link(2,3).

link(3,4).
link(3,6).

link(6,7).
link(6,5).

adjacent(L) :- robot(R), link(R,L).
suggest(L) :- adjacent(L), goal(L).
%suggest(L) :- adjacent(L), \+robot(L), goal(L).
move(L) :- adjacent(L), retract(robot(_)), assert(robot(L)).

tp(L) :- retract(robot(_)), assert(robot(L)).


% 14. check if there is a path from the current location to the goal (if robot at 4 or 7 it does not exists)
%path() :- robot(R), goal(G), \+ (R = G) ; link(R,NEW)-> move(NEW), path().
path :- robot(R), goal(G), \+ (R = G) ; link(R,NEW) ; link(NEW,_)-> move(NEW), path().

path(P) :- robot(R), goal(G), \+ (R = G) ; link(R,NEW) ; link(NEW,_)-> move(NEW), path(P).

append ( [ X | Y ] , Z, [X | W] ) :- append (Y , Z, W) .
