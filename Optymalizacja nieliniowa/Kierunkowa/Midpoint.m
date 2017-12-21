function [x, val] = Midpoint(f, a, b, eps, kier)

d = b - a;
mid = (a + b) / 2;
it=1;
while d > eps
    [~,grad] = f(mid);
    pochKier = dot(grad, kier);
    if abs(pochKier) < eps
        break;
    end
    if pochKier > 0
        b = mid;
    else 
        a = mid;
    end
    mid = (a+b)/2;
    d = b - a;
    it=it+1;
end

x = mid;
val = f(x);
end