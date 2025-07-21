
% TP Codages JPEG et MPEG-2 - 3SN-M - 2022
                                                 
%--------------------------------------------------------------------------
% Fonction de decompression/reconstruction JPEG d'une image
%--------------------------------------------------------------------------
% I_Decodee = DecompressionJPEG(I_Quant,canal,F_Qualite,methode)
%
% sorties : I_Decodee = image reconstruite par quantification et DCT inverses
% 
% entrees : I_Codee = image de DCT quantifiee
%           canal = canal pour le choix de la table de quantification :
%                   'Luminance', 'Chrominance' ou 'Residu'
%           methode = methode de calcul de la IDCT : 'Matlab' ou 'Rapide'
%           F_Qualite = facteur de qualite pour la compression
%--------------------------------------------------------------------------
% Fonctions a coder/utiliser : QuantificationDCT.m
%                              DCT2DParBlocs.m
%--------------------------------------------------------------------------

function I_Decodee = DecompressionJPEG(I_Codee, canal, methode, F_Qualite)
    % Taille des blocs pour la DCT
    taille_bloc = 8;

    % 1. Déquantification des coefficients DCT
    % Appel à QuantificationDCT avec le paramètre 'Inverse' pour la déquantification
    I_Dequant = QuantificationDCT('Inverse', I_Codee, canal, F_Qualite, taille_bloc);

    % 2. Transformation IDCT par blocs
    % Appel à DCT2DParBlocs avec le paramètre 'Inverse' pour effectuer la IDCT
    I_Decodee = DCT2DParBlocs('Inverse', I_Dequant, methode, taille_bloc);
end
