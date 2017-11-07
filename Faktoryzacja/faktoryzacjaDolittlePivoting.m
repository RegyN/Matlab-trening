function [L, U, exitflag] = faktoryzacjaDolittle(A)

if size(A,1) ~= size(A,2)
    exitflag = -1;
    disp('ERROR: Macierz nie jest kwadratowa')
    return;
end

L = eye(size(A));
U = zeros(size(A));
% G³ówna pêtla faktoryzacji
for i = 1:size(A)
    
    % Pivoting wierszami
    [val, index] = max(abs( A(i:size(A,1),i) ))
    A([index+i-1, i],:) = A([i, index+i-1],:);
    
    for j = i:size(A)
       
        U(i,j) = A(i,j) - dot(L(i,:),U(:,j));
    end
    
    for j = i:size(A)
       
        L(j,i) = (A(j,i) - dot(L(j,:),U(:,i))) / U(i,i);
    end
end
L=L+eye(size(L));
exitflag = 1
end