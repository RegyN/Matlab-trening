function [x, val, exitflag] = EliminacjaUogolniona(D, c, A, b)
% min f(x)=0.5*x*D*xT+c*x   <--- Minimalizowana funkcja
% A*x = b                   <--- Ograniczenia
n = size(A,2);  %liczba równañ
m = size(A,1);  %liczba ograniczeñ
V = [eye(n-m); 
    zeros(1, n-m)];

AV = [A',V];
AV = inv(AV);

S = (AV(1:m,:))';
Z = (AV(m+1:n,:))';

x0 = S*b;
y = -(Z'*D*Z)^(-1)*Z'*(c+D*x0);

x = x0+Z*y;
val = 0.5*x'*D*x+c'*x;
exitflag = 1;
end

