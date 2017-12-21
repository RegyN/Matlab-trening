function [x, val] = Armijo(f, a, ro, k, eps, kier)
% Wersja alg. Armijo u¿ywaj¹ca kontrakcji i ekspansji
    [f0, g0] = f(0);
    g0 = dot(g0, kier);
    amax = 100;
    i = 1;
    fa = f(a);
    while 1
        if fa>f0+ro*a*g0    % kontrakcja
            if((a - a/k) < eps)
                break;
            end
            a = a/k;
            if f(a)<=f0+ro*a*g0
                break;
            end
        else                % ekspansja
            if a*k>amax
                break;
            end
            a = a/k;
            if f(a)>f0+ro*a*g0
                break;
            end
        end
        i = i+1;
    end
    x = a;
    val = f(a);
end