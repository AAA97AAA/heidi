
% On défini les ordres

order(deponer).
order(dretg).
order(sanester).
order(davent).
order(davos).
order(plaun).
order(returnar).
order(safermar).
% On teste en affichant toutes les combinaisons que prolog trouve:
% order(X).

% On définit les coups de sifflets
whistle(hee).
whistle(wheet).
whistle(wheeo).



% On teste en affichant toutes les combinaisons que prolog trouve:
% whistle(X).

% Définissons maintenant la traduction d'un ordre

htoT_oneorder(deponer, [wheeo, hee, wheet]).
htoT_oneorder(dretg, [hee, wheet]).
htoT_oneorder(sanester, [wheet, wheeo]).
htoT_oneorder(davent, [wheet, hee, wheet]).
htoT_oneorder(davos, [wheet, wheeo, wheet]).
htoT_oneorder(plaun, [wheet, wheeo, wheeo]).
htoT_oneorder(returnar, [wheeo, wheet]).
htoT_oneorder(safermar, [wheeo, wheeo]).

% On teste en affichant toutes les combinaisons que prolog trouve:
% htoT_oneorder(X, Y).



% Notre application qui nous donne la traduction dans le langage de Tita:
	% cas de base où l'on a zéro élément (on ne peut le traduire
	htoT([], []).

	% cas de base, ou il y a uniquement un élémént
	htoT(X, Y):- X = [L],
    			 htoT_oneorder(L, Y).

	% si on a plus d'un élément
	htoT([H | T], Y):- htoT_oneorder(H, H_translated), % on traduit le premier element
   					   htoT(T, T_translated), % on traduit le reste de la liste en appelant récursivement
    				   append(H_translated, T_translated, Y).

	ttoH([], []).
	% deux sifflets orders
	ttoH(X, Y):- X = [A | B],
    			B =  [C | D],
    			ttoH(D, Restesol),
    			htoT_oneorder(Sol, [A , C]), % il s'agit d'une ordre avec deux sifflets
    			Y = [Sol | Restesol].

	% trois sifflets orders
	ttoH(X, Y):- X = [A | B],
    			B =  [C | D],
    			D =  [E | F],
    			ttoH(F, Restesol),
      			htoT_oneorder(Sol, [A , C, E]), % il s'agit d'une ordre avec trois sifflets
    			Y = [Sol | Restesol].



%
% espace de test
%
 /* tests */
/*
 les tests sont identiques au premier fichier et on ajoute les tests pour ttoH.
  ttoH(X, Y). %% will find out all the solutions
  % true
  ttoH( [wheeo, hee, wheet, wheeo, wheeo], [deponer,  safermar]).
  ttoH( [wheeo, hee, wheet, wheeo, wheeo, wheet, hee, wheet], [deponer,  safermar, davent]).
  ttoH( [wheet, hee, wheet, wheeo, hee, wheet, wheeo, wheeo], [ davent,  deponer,  safermar]).
  % ...
  %
  % false
    ttoH( [wheeo, wheeo, wheeo], [deponer,  safermar]).
  ttoH(  [wheeo, wheeo, wheet, hee, wheet, wheeo, hee, wheet], [  safermar, deponer, davent]).
  ttoH( [wheet, hee, wheet, hee, wheet, wheeo, wheeo], [ davent,  safermar]).
	% ...
	%  j'ai fait plusieurs tests supplémentaires mais cela ne sert à rien de les énumérer
 */
/*********************************************
/* ACCELERATION */
% traduction
htoT([plaun, dretg, plaun, deponer, safermar], X).
% traduction2
ttoH([wheet, wheeo, wheeo, hee, wheet, wheet, wheeo, wheeo, wheeo, hee, wheet, wheeo, wheeo], X).
% résultat obtenu:
% X = [sanester, deponer, sanester, safermar, dretg, safermar]
% X = [sanester, deponer, plaun, deponer, safermar]
% X = [plaun, dretg, sanester, safermar, dretg, safermar]
% X = [plaun, dretg, plaun, deponer, safermar] % interprétation de départ

%
%
%
*/
