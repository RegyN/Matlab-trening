function C = eliminacjaGaussaFull(A)

for i = 1:size(A,1)
    
    % Najpierw zrób pivoting wierszami
    [~, index] = max( abs( A( i:size(A,1), i)));
    A([index+i-1,i],:) = A([i,index+i-1],:);
    
    % Potem pivoting kolumnami
    [~, index] = max( abs( A( i, i:size(A,1))));
    A(:,[index+i-1,i]) = A(:,[i,index+i-1]);
    
    % A teraz zrób eliminacjê
    mul = A(:,i)/A(i,i);
    mul(1:i) = 0;
    dif = mul*A(i,:);
    A = A-dif;
end
C = A;
end