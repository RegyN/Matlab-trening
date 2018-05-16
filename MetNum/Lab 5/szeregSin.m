function [ yaprox ] = szeregSin( x, N )
% SZEREGSIN Wyznacza przybli¿on¹ wartoœæ sin(x)
% x - wektor wartoœci argumentów funkcji sin(x)
% N - maksymalna liczba wyrazów rozwiniêcia w szereg
% yaprox - wektor przybli¿eñ wartoœci sin(x) przez rozwiniêcia

if N == 0
    yaprox = x;
    return;
end

n = 2 * N + 1;
yaprox = szeregSin(x, N - 1) +((-1)^N) * (x .^ n) ./ factorial(n);
end

