function [C, exitflag] = macOdwrotna(A)

addpath ../Faktoryzacja
[n,m] = size(A);
if n~=m
    disp('ERROR: Macierz nie jest kwadratowa')
    return;
end

det = wyznacznikDolittle(A);
if det == 0
    disp('ERROR: Wyznacznik macierzy równy 0')
    return;
end

dopA = zeros(size(A));
for i = 1:size(A)
    for j = 1:size(A)
        tempA = A([1:i-1,i+1:size(A)],[1:j-1,j+1:size(A)]);
        dopA(i,j) = wyznacznikDolittle(tempA)*(-1)^(i+j);
    end
end

C = 1/det*dopA';

rmpath ../Faktoryzacja
end