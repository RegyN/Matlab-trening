function [L, U, exitflag] = faktoryzacjaDolittle(A)

if size(A,1) ~= size(A,2)
    exitflag = -1;
    disp('ERROR: Macierz nie jest kwadratowa')
    return;
end

L = eye(size(A));
U = zeros(size(A));
% G��wna p�tla faktoryzacji
for i = 1:size(A)
    
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