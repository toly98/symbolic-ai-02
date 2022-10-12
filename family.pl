%A typical family database.
male(joost).
male(sacha).
male(leon).
male(merlijn).
male(peter).
female(sofie).
female(sandrine).
parent(joost,sacha).
parent(joost,leon).
parent(sandrine,sacha).
parent(sandrine,leon).
parent(fien,sofie).
parent(fien,merlijn).
parent(peter,fien).
parent(peter,joost).
isChild(X) :- parent(Y,X).
