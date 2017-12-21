function [a, mid, b] = GetRange(f, a, delta)

delta0 = delta;
aProb = a+delta;

if f(aProb) >= f(a)
    b = aProb;
    mid = (a+b)/2;
    while (f(a)<f(mid))||(f(mid)>f(b))
        mid = (a+mid)/2;
    end
    b = a+(mid-a);
else
    mid = aProb;
    b = aProb + delta;
    while (f(a)<f(mid))||(f(mid)>f(b))
        delta = 2* delta;
        b= mid + delta;
    end
    while (f(mid)<f(b-delta0))
       b = b - delta0;
       delta0 = 2*delta0;
    end
end


end