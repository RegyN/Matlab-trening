function [g] = deriv1(x, f, h)
% DERIV1 pierwsza pochodna
% Funkcja obliczaj¹ca pierwsz¹ pochodn¹ na podstawie ilorazu ró¿nicowego
% x - wektor kolumnowy
% f - wskaŸnik na badan¹ funkcjê
% h - sta³a
    if nargin < 2 || nargin > 3
        disp('B£¥D: Nieprawid³owa liczba argumentów')
        return;
    elseif nargin == 2
        h = h * ones(1, size(x, 2));
    end
    
    g = (f(x + h) - f(x - h)) ./ (2 * h);
    
end

