% ┌────────────────────────────────────────────────────────────────────────────────────────────┐
% │                                 Première fonction de test                                  │
% ├────────────────────────────────────────────────────────────────────────────────────────────┤
% │ Créé par : Corcos Ludovic et Ider Walid                                                    │
% │                                                                                            │
% │ Evaluation de la fonction et du gradient par rapport à x pour la première fonction de test │
% └────────────────────────────────────────────────────────────────────────────────────────────┘

function [f, g] = Fct_test_1(x)

g = zeros(2, 1); % Initialisation du gradient

% Calcul de la fct 1 pour x de taille 2
f = 100 * ((x(2) - x(1) ^ 2) ^ 2) + (1 - x(1)) ^ 2;

% Calcul du gradient:
g(1) = - 4 * 100 * x(1) * (x(2) - x(1) ^ 2) - 2 * (1 - x(1));
g(2) = 2 * 100 * (x(2) - x(1) ^ 2);

end
