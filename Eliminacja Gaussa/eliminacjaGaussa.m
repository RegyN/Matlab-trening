% Prosta funkcja do eliminacji Gaussa bez pivotingu
% A - macierz

function [C, exitval] = eliminacjaGaussa(A)

for i = 1: size(A,1)
    if A(i,i) == 0
        disp('ERROR: Liczba na diagonali równa 0')
        exitval = -1;
        return;
    end
    mul = A(:,i)/A(i,i);
    mul(1:i) = 0;
    dif = mul*A(i,:);
    A = A-dif;
end
C = A;
exitval = 1;

end