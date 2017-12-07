function [a, mid, b] = GetRange(f, a, delta)

aProb = a+delta;
if f(aProb) >= f(a)
    b = aProb;
    mid = (a+b)/2;
    while f(a)<f(mid)||f(mid)>f(b)
        mid = (a+b)/2;
    end
else
    mid = aProb;
    b = aProb + delta;
    while f(a)<f(mid)||f(mid)>f(b)
        delta = 2* delta;
        b= mid + delta;
    end
end


end