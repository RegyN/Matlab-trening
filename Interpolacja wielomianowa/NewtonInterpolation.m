function [a] = NewtonInterpolation(x, y)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
n = max(size(x));
for i=2:n
    for j=n:-1:i
        y(j) = (y(j)-y(j-1)) / (x(j)-x(j-i+1));
    end
end
a = y;

end

