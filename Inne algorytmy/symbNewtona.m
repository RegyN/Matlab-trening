% Funkcja wyznaczaj¹ca waroœæ symbolu Newtona gdzie a to liczba na górze a
% b na dole symbolu.

function [c, exitflag] = symbNewtona(a,b)

if a<b
    exitflag = -1;
    disp('ERROR: a musi byæ wiêksze od b')
    return;
end
n=1;
m=1;
for i = (b+1):a
    n=n*i;
end
for i= 1:(a-b)
    m=m*i;
end
c=n/m;
end