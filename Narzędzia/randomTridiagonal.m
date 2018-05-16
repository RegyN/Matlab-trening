function [A] = randomTridiagonal(n, seed)
%RANDOMTRIDIAGONAL Creates a random tridiagonal matrix
%   n - size of output matrix

if nargin == 2
    rng(seed);
end
A=rand(n);
LD=tril(A,-1)-tril(A,-2);
UD=triu(A,1)-triu(A,2);
D=triu(A)-triu(A,1);
A=LD+UD+D;
end

