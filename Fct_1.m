% ┌───────────────────────────────────────────────────────────────────────────────────────────────┐
% │                                   Première fonction de test                                   │
% ├───────────────────────────────────────────────────────────────────────────────────────────────┤
% │ Créé par : Corcos Ludovic et Ider Walid                                                       │
% │                                                                                               │
% │ Evaluation de la fonction et du gradient par rapport à x pour la première fonction "inconnue" │
% └───────────────────────────────────────────────────────────────────────────────────────────────┘

function [f1, g1] = Fct_1(x)

% Initialisations
p = size(x, 1);
f1 = 0;
g1 = zeros(p, 1);

for i = 2:p
    % Calcul de f1
    f1 = f1 + i * (2 * x(i) - x(i - 1)) ^ 2;

    % Calcul du gradient
    g1(i) = g1(i) + i * 2 * 2 * (2 * x(i) - x(i - 1));
    g1(i - 1) = g1(i - 1) - i * 2 * (2 * x(i) - x(i - 1));
end
end