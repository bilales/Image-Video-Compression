
% TP Codages JPEG et MPEG-2 - 3SN-M - 2022

%--------------------------------------------------------------------------
% Prediction de l'image courante avec l'image de reference et le mouvement
%--------------------------------------------------------------------------
% Ip = PredictionImage(Ir,MVr)
%
% sortie  : Ip = image predictive
%           
% entrees : Ir = image de reference
%           MVr = matrice des vecteurs de déplacements relatifs
%--------------------------------------------------------------------------

function Ip = PredictionImage(Ir, MVr)
    % Taille du macro-bloc
    taille_bloc = 16;
    [h, w] = size(Ir);
    
    % Initialisation de l'image prédictive avec les mêmes dimensions que Ir
    Ip = zeros(h, w);

    % Parcours de chaque macro-bloc
    for i = 1:taille_bloc:h
        for j = 1:taille_bloc:w
            % Calculer l'indice de bloc dans MVr
            bloc_x = (i - 1) / taille_bloc + 1;
            bloc_y = (j - 1) / taille_bloc + 1;
            
            % Vecteur de déplacement pour le bloc courant
            dx = MVr(bloc_x, bloc_y, 1);
            dy = MVr(bloc_x, bloc_y, 2);

            % Position de départ du macro-bloc dans Ir en utilisant le déplacement
            ref_i = i + dx;
            ref_j = j + dy;

            % Vérifier que le bloc déplacé reste dans les limites de l'image de référence
            if ref_i > 0 && ref_i + taille_bloc - 1 <= h && ref_j > 0 && ref_j + taille_bloc - 1 <= w
                % Copier le macro-bloc de Ir vers la position dans Ip
                Ip(i:i+taille_bloc-1, j:j+taille_bloc-1) = Ir(ref_i:ref_i+taille_bloc-1, ref_j:ref_j+taille_bloc-1);
            else
                Ip(i:i+taille_bloc-1, j:j+taille_bloc-1) = 0;  % Noir si le bloc dépasse
            end
        end
    end
end

