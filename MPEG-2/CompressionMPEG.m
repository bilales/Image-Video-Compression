
% TP Codages JPEG et MPEG-2 - 3SN-M - 2022

%--------------------------------------------------------------------------
% Fonction d'encodage MPEG d'une image (+ reference en JPEG)
%--------------------------------------------------------------------------
% [IRes_Codee,MVdr,Ir_Codee,Poids,Compression] = ...
%        CompressionMPEG(Ic_Originale,Ir_Originale,canal,methode,F_Qualite)
%
% sorties : IRes_Codee = image residuelle (DCT quantifiee)
%           MVdr = matrice des vecteurs de deplacements relatifs
%           Ir_Codee = image de reference (DCT quantifiee)
%           Poids = poids de l'image en ko pour les differentes etapes de 
%                   la compression (inclure les mouvements pour MPEG)
%           Compression = taux de compression final
% 
% entrees : Ic_Originale = image courante originale
%           Ir_Originale = image de reference originale
%           canal = canal pour le choix de la table de quantification :
%                   'Luminance', 'Chrominance' ou 'Residu'
%           methode = methode de calcul de la DCT : 'Matlab' ou 'Rapide'
%           F_Qualite = facteur de qualite pour la compression
%--------------------------------------------------------------------------
% Fonctions a coder/utiliser : EstimationMouvement.m
%                              PredictionImage.m
%                              CompressionJPEG.m
%--------------------------------------------------------------------------

function [IRes_Codee, MVdr, Ir_Codee, Poids, Compression] = ...
         CompressionMPEG(Ic_Originale, Ir_Originale, canal, methode, F_Qualite)

    % Étape 1 : Estimation des mouvements
    MVdr = EstimationMouvement(Ic_Originale, Ir_Originale);

    % Étape 2 : Prédiction de l'image courante
    Ip = PredictionImage(Ir_Originale, MVdr);

    % Étape 3 : Calcul de l'image résiduelle
    IRes = Ic_Originale - Ip;

    % Étape 4 : Compression JPEG de l'image de référence
    [Ir_Codee, poids_Ir_Codee, Compression_Ir_Codee, ~, ~] = ...
        CompressionJPEG(Ir_Originale, 'Luminance', methode, F_Qualite);

    % Étape 5 : Compression JPEG de l'image résiduelle
    [IRes_Codee, poids_IRes_Codee, Compression_IRes_Codee, ~, ~] = ...
        CompressionJPEG(IRes, 'Residu', methode, F_Qualite);

    % Étape 6 : Codage entropique des vecteurs de mouvement
    [poids_mv, ~] = CodageEntropique(MVdr(:));

    % Calcul du poids total et de la compression globale
    Poids.Origine = poids_Ir_Codee.Origine;
    Poids.H_MPEG = poids_IRes_Codee.H_JPEG + poids_mv;
    Poids.MVdr = poids_mv;

    Compression = Compression_Ir_Codee + Compression_IRes_Codee;

end

