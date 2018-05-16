function [ error, yreal, yaprox ] = szeregBlad( x, N )
% SZEREGBLAD Porównuje b³¹d przybli¿enia funkcji sin szeregiem
% N - wektor wartoœci liczby wyrazów w szeregu
% x - wartoœæ argumentu dla którego wyznaczamy szereg b³êdów
% yreal - wartoœæ rzeczywista sin(x)
% yaprox - wektor wartoœci przybli¿eñ sin(x) dla ró¿nych N
% error - bektor b³êdów bezwzglêdnych przybli¿enia
format long;

yreal = func(x);
yaprox = szeregSin(x, N);
error = - yreal + yaprox;

end

