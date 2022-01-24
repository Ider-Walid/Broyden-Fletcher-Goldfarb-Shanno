% ┌────────────────────────────────────────────────────────────────────────────────────────────┐
% │                                 Première fonction de test                                  │
% ├────────────────────────────────────────────────────────────────────────────────────────────┤
% │ Créé par : Corcos Ludovic et Ider Walid                                                    │
% │                                                                                            │
% │ Evaluation de la fonction et du gradient par rapport à x pour la deuxième fonction de test │
% └────────────────────────────────────────────────────────────────────────────────────────────┘

function [f, g] = Fct_test_2(x)

g = zeros(2, 1); % Initialisation du gradient

% Calcul la fct 2 pour x de taille 2
f = (x(1) + x(2)) ^ 2 + (2 * (x(1) ^ 2 + x(2) ^ 2 - 1) - 1 / 3) ^ 2;

% Calcul du gradient:
g(1) = 2 * (x(1) + x(2)) + 2 * 2 * 2 * x(1) * (2 * (x(1) ^ 2 + x(2) ^ 2 - 1) - 1 / 3);
g(2) = 2 * (x(1) + x(2)) + 2 * 2 * 2 * x(2) * (2 * (x(1) ^ 2 + x(2) ^ 2 - 1) - 1 / 3);