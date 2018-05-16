function [output] = Horner(b,x,t)
%HORNER Summary of this function goes here
%   Detailed explanation goes here
n = max(size(t));
m = max(size(b));
output = zeros(n, 0);
for i = 1:n
    output(i) = b(m);
    for j = m-1:-1:1
        output(i) = b(j) + output(i)*(t(i) - x(j));
    end
end
end

