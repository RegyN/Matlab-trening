function [x, val, it] = NajszybszySpadek(f, x0, eps)
    addpath('..\Kierunkowa');
    
    x=x0';
    [~,d] = f(x);
    d=-d;
    a=0;
    it=1;
    e_zp = 0.0001;
    while norm(d)>eps
        F = @(alfa) f(x+alfa*d);
        [~,~,b] = GetRange(F, a, 0.1);
        [krok,~] = Armijo(F, 0.01, 0.2, 2, e_zp, d);
        % [krok,~] = Dichotomy(F,a,b,e_zp);
        xOld = x;
        x = x+krok*d;
        [~,d] = f(x);
        d=-d;
        if norm(x-xOld)<eps
            break;
        end
        it = it+1;
    end
    val = f(x);
    rmpath('..\Kierunkowa');
end

