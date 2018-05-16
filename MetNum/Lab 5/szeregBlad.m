function [ error, yreal, yaprox ] = szeregBlad( x, N )
% SZEREGBLAD Por�wnuje b��d przybli�enia funkcji sin szeregiem
% N - wektor warto�ci liczby wyraz�w w szeregu
% x - warto�� argumentu dla kt�rego wyznaczamy szereg b��d�w
% yreal - warto�� rzeczywista sin(x)
% yaprox - wektor warto�ci przybli�e� sin(x) dla r�nych N
% error - bektor b��d�w bezwzgl�dnych przybli�enia
format long;

yreal = func(x);
yaprox = szeregSin(x, N);
error = - yreal + yaprox;

end

