function [output] = Czebyszew(a, b, n)
%CZEBYSZEW Summary of this function goes here
%   Detailed explanation goes here
if nargin == 2
    n=5;
end
output = zeros(1, n);
i=1:n;
output(i) = (cos( (2*i-1) / (2*n) * pi )) * (b-a)/2 + (b-a)/2;

end

