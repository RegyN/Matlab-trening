function [x, val] = NewtonNoGrad(f, a, eps)

sigma = 0.01;
gA = (f(a+sigma)-f(a-sigma))/sigma;
hA = (f(a+sigma)-2*f(a)+f(a-sigma))/(sigma^2);
ak = a - (gA/hA);
d = abs(ak-a);
while d > eps && abs(gA)>eps
    a = ak;
    gA = (f(a+sigma)-f(a-sigma))/sigma;
    hA = (f(a+sigma)-2*f(a)+f(a-sigma))/(sigma^2);
    ak = a - (gA/hA);
    d = abs(ak-a);
end
x = a;
val = f(x);
end