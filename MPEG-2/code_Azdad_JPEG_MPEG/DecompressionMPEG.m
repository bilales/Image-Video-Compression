
% TP Codages JPEG et MPEG-2 - 3SN-M - 2022

%--------------------------------------------------------------------------
% Fonction d'encodage MPEG d'une image (+ reference en JPEG)
%--------------------------------------------------------------------------
% [Ic_Decodee,Ir_Decodee] = ...
%       DecompressionMPEG(IRes_Codee,Ir_Codee,MVdr,canal,methode,F_Qualite)
%
% sorties : Ic_Decodee = image courante reconstruite
%           Ir_Decodee = image de reference reconstruite
% 
% entrees : IRes_Codee = image residuelle de DCT quantifiee
%           Ir_Codee = image de reference de DCT quantifiee
%           MVdr = matrice des vecteurs de deplacements relatifs
%           canal = canal pour le choix de la table de quantification :
%                   'Luminance', 'Chrominance' ou 'Residu'
%           methode = methode de calcul de la DCT : 'Matlab' ou 'Rapide'
%           F_Qualite = facteur de qualite pour la compression
%--------------------------------------------------------------------------
% Fonctions a coder/utiliser : DecompressionJPEG.m
%                              PredictionImage.m
%--------------------------------------------------------------------------

function [Ic_Decodee, Ir_Decodee] = ...
        DecompressionMPEG(IRes_Codee, Ir_Codee, MVdr, canal, methode, F_Qualite)

    % Étape 1 : Décompression JPEG de l'image de référence
    Ir_Decodee = DecompressionJPEG(Ir_Codee, 'Luminance', methode, F_Qualite);

    % Étape 2 : Décompression JPEG de l'image résiduelle
    IRes_Decodee = DecompressionJPEG(IRes_Codee, 'Residu', methode, F_Qualite);

    % Étape 3 : Reconstruction de l'image prédite via les vecteurs de mouvement
    Ip = PredictionImage(Ir_Decodee, MVdr);

    % Étape 4 : Reconstruction de l'image courante
    Ic_Decodee = IRes_Decodee + Ip;
end

