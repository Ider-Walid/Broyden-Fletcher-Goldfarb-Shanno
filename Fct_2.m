% ┌───────────────────────────────────────────────────────────────────────────────────────────────┐
% │                                   Première fonction de test                                   │
% ├───────────────────────────────────────────────────────────────────────────────────────────────┤
% │ Créé par : Corcos Ludovic et Ider Walid                                                       │
% │                                                                                               │
% │ Evaluation de la fonction et du gradient par rapport à x pour la deuxième fonction "inconnue" │
% └───────────────────────────────────────────────────────────────────────────────────────────────┘

function [f2, g2] = Fct_2(x)

% Initialisations
p = size(x, 1);
f2 = 0;
g2 = zeros(p, 1);

% Calcul de la fct et de son gradient
s = 0;
for i = 1:p
    f2 = f2 + 10 ^ (- 5) * (x(i) - 1) ^ 2;
    s = s + x(i) ^ 2 - 0.25;
    g2(i) = g2(i) + 10 ^ (- 5) * 2 * (x(i) - 1);
end

f2 = f2 + s ^ 2;
for i = 1:p
    g2(i) = g2(i) + 2 * s * 2 * x(i);
end

end