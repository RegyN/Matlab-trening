function [minors] = tridiagonalMinorCalculator(A)
%TRIDIAGONALMINORCALCULATOR Calculates minors of tridiagonal matrix in O(n)

n = size(A,1);
minors = zeros(1, n);
minors(1) = A(1,1);
minors(2) = minors(1)*A(2,2) - A(1,2)*A(2,1);
for i=3:n
    minors(i) = minors(i-1)*A(i,i) - minors(i-2)*A(i, i-1)*A(i-1,i);
end
end

