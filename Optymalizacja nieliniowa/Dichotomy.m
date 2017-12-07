function [x, val] = Dichotomy(f, a, b, eps)

d = b - a;
mid = (a + b) / 2;
left = (a+mid)/2;
right = (b+mid)/2;
fLeft = f(left);
fRight = f(right);

while d > eps
    if fLeft > fRight
        a = mid;
        mid = right;
    else 
        b = mid;
        mid = left;
    end
    left = (a+mid)/2;
    right = (b+mid)/2;
    d = b - a;
    fLeft = f(left);
    fRight = f(right);
end

x = (a+b)/2;
val = f(x);
end