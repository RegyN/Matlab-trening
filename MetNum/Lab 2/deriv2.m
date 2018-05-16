function [wy] = deriv2(x, g, ga, n)
% DERIV2 wyznaczanie b��du pochodnej z ilorazu r�nicowego
% x - jedna warto��
% n - wektor kolumnowy
% g - wska�nik na badan� funkcje
% ga - wska�nik na pochodn� analityczn� funkcji g
% wy - wyj�ci funkcji, w formie macierzy o 4 kolumnach
    h = 2.^n;
    pDokl = repmat(ga(x), size(h, 1), 1);
    pPrzyb = deriv1(x, g, h);
    blad = blad_wzg(pPrzyb, pDokl);
    
    wy=[h, pDokl, pPrzyb,  blad];
end

