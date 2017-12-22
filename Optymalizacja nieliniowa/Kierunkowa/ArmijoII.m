function [x, val] = ArmijoII(f, a, ro, k, eps, kier)
% Wersja algorytmu Armijo u¿ywaj¹ca tylko kontrakcji
    [f0, g0] = f(0);  % wartoœæ f w 0
    g0 = dot(g0, kier);
    i = 1;
    alfa=a;
    while 1
        fa = f(alfa);
        if fa>f0+ro*alfa*g0    % kontrakcja
            if((alfa - alfa/k) < eps)
                break
            end
            alfa=alfa/k;
        else 
            break;
        end
        i = i+1;
    end
    x = alfa;
    val = f(alfa);
end

