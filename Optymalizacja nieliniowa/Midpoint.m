function [x, val] = Midpoint(f, grad, a, b, eps)

d = b - a;
mid = (a + b) / 2;

while d > eps
    if grad(mid) > 0
        b = mid;
    else 
        a = mid;
    end
    mid = (a+b)/2;
    d = b - a;
end

x = (a+b)/2;
val = f(x);
end