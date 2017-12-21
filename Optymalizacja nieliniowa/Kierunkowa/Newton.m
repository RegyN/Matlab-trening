function [x, val] = Newton(f, g, h, a, eps)

gA = g(a);
hA = h(a);
ak = a - (gA/hA);
d = abs(ak-a);
while d > eps && abs(gA)>eps
    a = ak;
    gA = g(a);
    hA = h(a);
    ak = a - (gA/hA);
    d = abs(ak-a);
end
x = a;
val = f(x);
end

