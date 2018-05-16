function [ yaprox ] = szeregSin( x, N )
% SZEREGSIN Wyznacza przybli�on� warto�� sin(x)
% x - wektor warto�ci argument�w funkcji sin(x)
% N - maksymalna liczba wyraz�w rozwini�cia w szereg
% yaprox - wektor przybli�e� warto�ci sin(x) przez rozwini�cia

if N == 0
    yaprox = x;
    return;
end

n = 2 * N + 1;
yaprox = szeregSin(x, N - 1) +((-1)^N) * (x .^ n) ./ factorial(n);
end

