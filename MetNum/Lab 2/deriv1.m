function [g] = deriv1(x, f, h)
% DERIV1 pierwsza pochodna
% Funkcja obliczaj�ca pierwsz� pochodn� na podstawie ilorazu r�nicowego
% x - wektor kolumnowy
% f - wska�nik na badan� funkcj�
% h - sta�a
    if nargin < 2 || nargin > 3
        disp('B��D: Nieprawid�owa liczba argument�w')
        return;
    elseif nargin == 2
        h = h * ones(1, size(x, 2));
    end
    
    g = (f(x + h) - f(x - h)) ./ (2 * h);
    
end

