% Wyznaczanie rzêdu macierzy wykorzystuj¹c eliminacjê Gaussa
% A - macierz do wykonania eliminacji

function [rzad, exitval] = rzadMacierzy(A)

C = eliminacjaGaussaPartial(A);

k=1;
while (any( C(k,:)<-0.00001 ) || any( C(k,:)>0.00001 )) 
    k=k+1;
    if(k>size(C,1))
        break;
    end
end
rzad = k-1;
exitval = 1;
end