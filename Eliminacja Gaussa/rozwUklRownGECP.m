function [x] = rozwUklRownGECP(A,b)
%ROZWUKLROWNGECP Rozwi¹¿ uk³ad równañ eliminacj¹ Gaussa z pe³nym
%wyborem elementu g³ównego

n=size(A,1);
labels=1:n;
% Najpierw eliminacja Gaussa
for i = 1:n
    
    [maxes, rows] = max( abs( A( i:n, i:n)));
    [~, col] = max( abs(maxes));
    row = rows(col);
    
    A(:,[col+i-1,i]) = A(:,[i,col+i-1]);
    labels(:,[col+i-1,i]) = labels(:,[i,col+i-1]);
    
    A([row+i-1,i],:) = A([i,row+i-1],:);
    b([row+i-1,i],:) = b([i,row+i-1],:);
    
    mul = A(:,i)/A(i,i);
    mul(1:i) = 0;
    dif = mul * A(i,:);
    difb = mul * b(i);
    A = A-dif;
    b = b-difb;
end

% Teraz na jej podstawie rozwi¹zywanie uk³adu
x=zeros(n,1);
for i = n:-1:1
    x(i) = b(i) / A(i,i);
    b = b - A(:,i) .* x(i);
    A(:,i) = 0;
end
x(1:n) = x(labels);
end

