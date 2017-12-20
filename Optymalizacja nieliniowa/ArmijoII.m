function [x, val] = ArmijoII(f, g, a, ro, k, eps)
% Wersja algorytmu Armijo u¿ywaj¹ca tylko kontrakcji
    f0 = f(0);  % wartoœæ f w 0
    g0 = g(0);  % pochodna w 0
    i = 1;
    while 1
        fa = f(a);
        if fa>f0+ro*a*g0    % kontrakcja
            if((a - a/k) < eps)
                break
            end
            a=a/k;
        else 
            break;
        end
        i = i+1;
    end
    x = a;
    val = f(a);
end

