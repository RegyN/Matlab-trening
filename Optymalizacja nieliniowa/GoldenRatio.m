function [x, val] = GoldenRatio(f, a, b, eps)

d = b - a;
c = 0.61804;
bNew = a + c * d;
aNew = b - c * d;
fa = f(aNew);
fb = f(bNew);

while d > eps
    if fb > fa
        b = bNew;
        d = b - a;
        bNew = aNew;
        aNew = b - c * d;
        fb = fa;
        fa = f(aNew);
    else 
        a = aNew;
        d = b - a;
        aNew = bNew;
        bNew = a + c * d;
        fa = fb;
        fb = f(bNew);
    end
end

x = (a+b)/2;
val = f(x);
end