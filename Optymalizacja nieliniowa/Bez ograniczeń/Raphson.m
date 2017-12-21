function [x, val, it] = Raphson(f, x0, eps)
    addpath('..\Kierunkowa');
    x = x0';
    it=1;
    [val, grad, hes] = f(x);
    d = -inv(hes)*grad;
    e_zp = 0.0001;
    while norm(grad)>eps
        F = @(alfa) f(x+alfa*d);
        [~,~,b] = GetRange(F, 0, 0.1);
        [krok,~] = GoldenRatio(F,0,b,e_zp);
        x = x+krok*d;
        [val, grad, hes] = f(x);
        d = -inv(hes)*grad;
        
        it = it + 1;
    end
    rmpath('..\Kierunkowa');
end