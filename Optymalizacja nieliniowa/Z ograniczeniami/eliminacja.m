function [x_opt, f_opt, exitflag] = eliminacja(D, c, A, b)

    % I - faktoryzacja QR macierzy A
    
    [Q, R] = qr(A');
    n = length(Q);
    m = length(b);
    
    R = R(1:m,:);    
    Q1 = Q(:, 1:m);
    Q2 = Q(:, m+1:n);
    
    % II - macierze S i Z
    
    S = Q1*((R')^(-1));
    Z = Q2;
    
    % III - x0
    
    x0 = S*b;
       
    % IV rozwiazanie
    
    y = -((Z'*D*Z)^(-1))*Z'*(c+D*x0);    
    x_opt = x0 + Z*y;
    
    f_opt=0.5*(x_opt')*D*x_opt+(c')*x_opt;
    exitflag=1;
    
    
    [~,exit]=chol(Z'*D*Z);
    
    if exit~=0
       disp('macierz nie jest dodatnio określona!'); 
       exitflag=0;
    end
     
end