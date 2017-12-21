function [x, val] = MidpointNoGrad(f, a, b, eps)

d = b - a;
mid = (a + b) / 2;
midRight = mid+eps;

while d > eps
    if f(midRight) - f(mid) > 0
        b = mid;
    elseif f(midRight) - f(mid) < 0
        a = mid;
    else
        break;   
    end
    mid = (a+b)/2;
    midRight = mid + eps;
    d = b - a;
end
x = (a+b)/2;
val = f(x);
end