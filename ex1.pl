
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

whistle(court).
whistle(whee).
whistle(who).
whistle(wheet).
whistle(wheeo).
whistle(hee).
whistle(long).
% On teste en affichant toutes les combinaisons que prolog trouve:
% whistle(X).

% Définissons maintenant la traduction d'un ordre

htoT_oneorder(deponer, [court, court]).
htoT_oneorder(dretg, [whee, who ]).
htoT_oneorder(sanester, [wheet, wheeo]).
htoT_oneorder(davent, [wheet, wheeo, wheet, wheet]).
htoT_oneorder(davos, [who, hee, who]).
htoT_oneorder(plaun, [hee, hee, hee, hee]).
htoT_oneorder(returnar, [whee, whee, wheet]).
htoT_oneorder(safermar, [long]).

% On teste en affichant toutes les combinaisons que prolog trouve:
% htoT_oneorder(X, Y).

pause(pause).
% J'ai choisi que Mon programme fonctionne uniquement si on donne une liste en argument.
%  Si l'on veut que l'on peut donner uniquement un argument (au lieu de [argument]), alors
%  il faudrait rajouter la ligne ci-dessus:
	%	htoT(X, Y):- htoT_oneorder(X,Y).

% Notre application qui nous donne la traduction dans le langage de Tita:
	% cas de base où l'on a zéro élément (on ne peut le traduire
	htoT([], []).

	% si on a plus d'un élément
	htoT([H | T], Y):- htoT_oneorder(H, H_translated), % on traduit le premier element
   					   htoT(T, T_translated), % on traduit le reste de la liste en appelant récursivement
    				   T_var = [Pause | T_translated], % entre chaque ordre,
    				   % il y a pause et on termine toujours par une pause
    				   pause(Pause), % le programme le remplacera par pause, seul élément de pause(X)
    				   append(H_translated, T_var, Y). % on l'ajoute dans le résultat, le premier element
					   % que l'on a traduit, puis tout le reste des élements que l'on traduit récursivement

%
% espace de test
% htoT([A], X).
%  traduit chaque commande de heidi (A) à Tita (X).
%  Si l'on veut que cela soit une succession de commande (ci-dessous pour 3 commandes successives):
%  htoT([A, B, C], X).


% Il nous ai uniquement demandé de traduire les ordres que Heidi veut donner en coups de sifflets qu'elles doit exécuter.
% Mais cela sera fait pour la deuxième partie du TP ou on doit l'implémenter (cf. ex2.pl)
%
%
 /* tests */
/*
  order(X).
  whistle(X).
  htoT_oneorder(X, Y).
  htoT([A], X). % pour A composé d'une commande
  htoT(A, X). % A peut comporter plusieurs commandes
 	*/
/* plusieurs tests à true pour htoT */
/*
  htoT([deponer, sanester], [court, court, pause, wheet, wheeo, pause]).
  htoT([safermar, plaun, davent], [long, pause, hee, hee, hee, hee, pause, wheet, wheeo, wheet, wheet, pause]).
  */

/* plusieurs tests à false pour htoT */
/*

  htoT([deponer], [court, court,  wheeo, pause]).
  htoT([plaun, davent, safermar], [long, pause, hee, hee, hee, hee, pause, wheet, wheeo, wheet, wheet, pause]).

 */
% J'ai pas impolémenté plus de tests car les premiers tests permettaient de voir directement les couples d'éléments possibles.
