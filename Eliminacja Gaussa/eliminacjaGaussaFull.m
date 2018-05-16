function C = eliminacjaGaussaFull(A)

n=size(A,1);
for i = 1:size(A,1)
    
    [maxes, rows] = max( abs( A( i:n, i:n)));
    [~, col] = max( abs(maxes));
    row = rows(col);
    A(:,[col+i-1,i]) = A(:,[i,col+i-1]);
    A([row+i-1,i],:) = A([i,row+i-1],:);
    
    % A teraz zrób eliminacjê
    mul = A(:,i)/A(i,i);
    mul(1:i) = 0;
    dif = mul*A(i,:);
    A = A-dif;
end
C = A;
end