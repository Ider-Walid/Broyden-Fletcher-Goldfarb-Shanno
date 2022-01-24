% ┌────────────────────────────────────────────────────────────────────────────────────────────┐
% │                         Algorithme de recherche linéaire de Wolfe                          │
% ├────────────────────────────────────────────────────────────────────────────────────────────┤
% │ Créé par : Corcos Ludovic et Ider Walid                                                    │
% │                                                                                            │
% │ Cet algorithme de recherche linéaire est optimisé via l'utilisation des critères de Wolfe, │
% │ ensemble d'inégalités permettant de sélectionner le pas adéquat.                           │
% └────────────────────────────────────────────────────────────────────────────────────────────┘

function [tr, x, iter] = wolfe(fun, x0, g, d, f)

% ┌───────────────────────────────┐
% │ Initialisation des paramètres │
% └───────────────────────────────┘

t = 1;
Beta1 = 10 ^ -4;
Beta2 = 0.99;
Lambda = 2.5;
tl = 0;
T = 10;
tr = T;
x = x0 + t * d;
iter = 0;
[f1, g1] = feval(fun, x);
b = Beta1 * g'*d;
c = - Beta2 * g'*d;

% ┌───────────────────────────────┐
% │ Début de la boucle principale │
% └───────────────────────────────┘

while (iter < 500 && (tr - tl > Beta1) && tl <= T)
 
    iter = iter + 1;
    k = g1'*d;
    m = f1 - f;
 
    % Les conditions (2) et (3) font références aux propriétés citées dans l'énoncé du TP
    % !(k) fait référence à la négation de la propriété (k)
 
    if ((m <= (t * b)) && (k <= c)) % Vérification propriétés (2)-(3)
        tr = t;
        break;
    elseif (m > (t * b)) % Vérification propriété !(2)
        tr = t;
        t = (tl + tr) / 2;
    elseif ((m <= (t * b)) && (k > c)) % Vérification propriété (2) et !(3)
        tl = t;
        if (tr < 10 ^ 6)
            t = (tl + tr) / 2;
        else
            t = Lambda * t;
        end
    end
    x = x0 + t * d;
    [f1, g1] = feval(fun, x);
 
end

% Fin de la recherche

