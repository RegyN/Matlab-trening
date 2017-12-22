function [x, val] = Armijo(f, a, ro, k, eps, kier)
% Wersja alg. Armijo u¿ywaj¹ca kontrakcji i ekspansji
    [f0, g0] = f(0);
    g0 = dot(g0, kier);
    amax = 10;
    i = 1;
    alfa = a;
    while 1
        fa = f(alfa);
        if fa>f0+ro*alfa*g0    % kontrakcja
            if((alfa - alfa/k) < eps)
                break;
            end
            alfa = alfa/k;
            if f(a)<=f0+ro*alfa*g0
                break;
            end
        else                % ekspansja
            if alfa*k>amax ||(alfa - alfa/k) < eps
                break;
            end
            alfa = alfa*k;
            if f(alfa)>f0+ro*alfa*g0
                break;
            end
        end
        i = i+1;
    end
    x = alfa;
    val = f(alfa);
end