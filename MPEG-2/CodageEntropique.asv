
% TP Codages JPEG et MPEG-2 - 3SN-M - 2022
                                                                                      
%--------------------------------------------------------------------------
% Fonction de calcul d'entropie binaire
%--------------------------------------------------------------------------
% [poids, H] = CodageEntropique(V_coeff)
%
% sorties : poids = poids du vecteur de donnees encode (en ko)
%           H = entropie de la matrice (en bits/pixel)
% 
% entree  : V_coeff = vecteur contenant les symboles dont on souhaite 
%                     calculer l'entropie (ex : l'image vectorisee)
%--------------------------------------------------------------------------

function [poids, H] = CodageEntropique(V_coeff)

    % Calcul de l'histogramme des valeurs dans V_coeff
    num_bins = round(max(V_coeff) - min(V_coeff) + 1);  % Assurer un entier positif
    h = histogram(V_coeff, num_bins);  % Histogramme avec un nombre de bins entier
    
    % Fréquences d'apparition de chaque valeur (probabilités)
    f = h.Values;                 % Nombre d'occurrences pour chaque symbole
    f = f ./ length(V_coeff);      % Division par le nombre total de valeurs pour obtenir les probabilités
    f = f(f > 0);                  % Filtrer les probabilités nulles pour éviter les erreurs de log

    % Calcul de l'entropie en bits/pixel
    H = -sum(f .* log2(f));

    % Calcul du poids en ko
    symbole_number = length(h.Data);
    poids = symbole_number * H / (8 * 1024);  % Conversion en ko
end

    
    