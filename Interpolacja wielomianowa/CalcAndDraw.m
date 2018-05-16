function [] = CalcAndDraw(f, a, b, n, rw)
%CALCANDDRAW Summary of this function goes here
%   Detailed explanation goes here
if nargin == 4
    rw = 0;
end
if rw == 1
    x = Czebyszew(a, b, n);
else
    x = linspace(a, b, n);
end
y = f(x);
wspol = NewtonInterpolation(x, y);
xi = linspace(a, b, 100);
yi = Horner(wspol, x, xi);
yreal = f(xi);

hold on;
plot(xi, yi, 'r-', xi, yreal, 'g-')
scatter(x, y)
axis([a, b, -inf, inf])
hold off;

end

