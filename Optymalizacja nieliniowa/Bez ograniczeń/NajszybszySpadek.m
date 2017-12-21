function [x, val, it] = NajszybszySpadek(f, x0, eps)
    addpath('..\Kierunkowa');
    
    x=x0;
    x=x';
    [~,d] = f(x);
    d=-d;
    a=0;
    it=1;
    e_zp = 0.0001;
    while norm(d)>eps
        F = @(alfa) f(x+alfa*d);
        [~,~,b] = GetRange(F, a, 0.1);
        [alfa,~] = GoldenRatio(F,a,b,e_zp);
        xOld = x;
        x = x+alfa*d;
        [~,d] = f(x);
        d=-d;
        if norm(x-xOld)<eps
            break;
        end;
        it = it+1;
    end
    val = f(x);
    rmpath('..\Kierunkowa');
end

