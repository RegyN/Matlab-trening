% Eliminacja Gaussa z czêœciowym pivotingiem
% A - macierz do wykonania eliminacji

function [C, exitval] = eliminacjaGaussaPartial(A)

for i = 1: size(A,1)
    % Robie pivot
    [~,index] = max(abs(A(i:size(A,1),i)));
    A([index+i-1, i],:) = A([i, index+i-1],:);
    
    % A potem Gauss jak zwykle
    mul = A(:,i)/A(i,i);
    mul(1:i) = 0;
    dif = mul*A(i,:);
    A = A-dif;
end
C = A;
exitval = 1;
end