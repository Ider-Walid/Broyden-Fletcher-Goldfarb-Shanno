% ┌───────────────────────────────────────────────────────────────────────────────────────────────┐
% │                          Méthode de Broyden-Fletcher-Goldfarb-Shanno                          │
% ├───────────────────────────────────────────────────────────────────────────────────────────────┤
% │ Créé par : Corcos Ludovic et Ider Walid                                                       │
% │                                                                                               │
% │ Pour résoudre les problèmes de divergence des méthodes de Newton on s'intéresse à             │
% │ une approximation du Hessien dans le cadre de la Méthode de Broyden-Fletcher-Goldfarb-Shanno. │
% │                                                                                               │
% │ Le fichier notebook "Script.mlx" permet de fournir un test complet et détaillé de             │
% │ l'exécution de notre algorithme d'optimisation.                                               │
% └───────────────────────────────────────────────────────────────────────────────────────────────┘

function [iteration_x, iteration_F, x, F, k] = BFGS_main(fonction, rlin, x_0, epsilon, iter_max)

% ┌───────────────────────────────┐
% │ Initialisation des paramètres │
% └───────────────────────────────┘

if (length(x_0) == 2)
    iteration_x = zeros(iter_max, 2);
    iteration_F = zeros(iter_max, 1);
else
    iteration_x = [];
    iteration_F = [];
end

i = 0;
lg = length(x_0); % Longeur du vecteur x_0
G = zeros(lg, 1); % Initialisation du Grad
H = diag(ones(1, lg)); % Notre approximation du Hessien
x = x_0; % Notre vecteur de base
[F, G] = feval(fonction, x); % F : Evaluation de la Fct /// G : Gradient
k = 0; % Nombre d'itérations: on le renvoie également en sortie!

% ┌───────────────────────────────┐
% │ Début de la boucle principale │
% └───────────────────────────────┘

while (k <= iter_max && norm(G) > epsilon) % Entrée de la boucle While
    d = - H * G;
    [F, G] = feval(fonction, x);
    [t, y, i] = rlin(fonction, x, G, d, F); % On effectue la recherche linéaire
    [F, g] = feval(fonction, y);
    delta_k = t * d; % Calcul de delta au rang k
    gamma_k = g - G; % Calcul de gamma au rang k

    % Formule de mise à jour de l'itération k de la matrice Hk:
    H = H - (1 / (delta_k'*gamma_k))*(delta_k*gamma_k' * H + H * gamma_k * delta_k') + (1+(gamma_k' * H * gamma_k) / (delta_k'*gamma_k))*((delta_k*delta_k') / (delta_k'*gamma_k));

    if (mod(i, lg) == 0)
        H = eye(lg);
    end

    % Formules pour l'évolution du pas
    k = k + 1;
    i = i + 1;
    x = y;
    G = g;
    % Suivi de l'évolution de l'algorithme
    fprintf('Itération numéro %5d -> F = %15.8e avec x = %5.10f, %5.10f \n', k, F, x(1), x(2));

    if (length(x_0) == 2)
        iteration_x(k,:) = x;
        iteration_F(k) = F;
    end
end

end

% Fin du programme