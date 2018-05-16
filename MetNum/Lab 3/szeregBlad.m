function [ yreal, yaprox ] = szeregBlad( x, N )
% SZEREGBLAD Porównuje b³¹d przybli¿enia funkcji sin szeregiem
% N - wektor wartoœci liczby wyrazów w szeregu
% x - wartoœæ argumentu dla którego wyznaczamy szereg b³êdów
% yreal - wartoœæ rzeczywista sin(x)
% yaprox - wektor wartoœci przybli¿eñ sin(x) dla ró¿nych N
format long;
x1 = [pi/6:pi/12:3*pi/2];
yreal = func(x1);

x2 = x1;
yaprox = szeregSin(x2, 6);

figure, subplot(2,2,1);
plot(x1, yreal, 'r');
title('Wykres sinusa', 'FontSize', 14);
xlabel('x'); ylabel('sin(x)');

subplot(2,2,2);
plot(x2, yaprox, 'g')
title('Wykres przyblizony N=3', 'FontSize', 14);
xlabel('x'); ylabel('przybli¿ony sin(x)');

blad = [];
for i = [1:size(N,2)]
    n = N(i);
    blad = [blad, abs(szeregSin(x, n) - sin(x))];
end
subplot(2,2,[3,4]);
plot(N, blad, 'b')
title('Zaleznosc bledu od N', 'FontSize', 14);
xlabel('N')
ylabel('blad')
end

