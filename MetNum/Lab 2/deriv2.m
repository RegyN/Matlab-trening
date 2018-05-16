function [wy] = deriv2(x, g, ga, n)
% DERIV2 wyznaczanie b³êdu pochodnej z ilorazu ró¿nicowego
% x - jedna wartoœæ
% n - wektor kolumnowy
% g - wskaŸnik na badan¹ funkcje
% ga - wskaŸnik na pochodn¹ analityczn¹ funkcji g
% wy - wyjœci funkcji, w formie macierzy o 4 kolumnach
    h = 2.^n;
    pDokl = repmat(ga(x), size(h, 1), 1);
    pPrzyb = deriv1(x, g, h);
    blad = blad_wzg(pPrzyb, pDokl);
    
    wy=[h, pDokl, pPrzyb,  blad];
end

