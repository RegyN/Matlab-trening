function [x, val] = Armijo(f, g, a, ro, k, eps)
% Wersja alg. Armijo u¿ywaj¹ca kontrakcji i ekspansji
    f0 = f(0);  % wartoœæ f w 0
    g0 = g(0);  % pochodna w 0
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