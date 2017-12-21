function [x, val, it] = GaussSeidel(f, x0, eps, kMax)
    addpath('..\Kierunkowa');
    
    x=x0;
    x=x';
    a=0;
    it=1;
    e_zp = 0.0001;
    d=[1;0;0];
    
    while norm(d)>eps && it < kMax
        
        xOld = x;
        
        d=[1;0;0];
        F = @(alfa) f(x+alfa*d);
        [~,~,b] = GetRange(F, a, 0.1);
        [alfa,~] = GoldenRatio(F,a,b,e_zp);
        x = x+alfa*d;
        
        d=[0;1;0];
        F = @(alfa) f(x+alfa*d);
        [~,~,b] = GetRange(F, a, 0.1);
        [alfa,~] = GoldenRatio(F,a,b,e_zp);
        x = x+alfa*d;
        
        d=[0;0;1];
        F = @(alfa) f(x+alfa*d);
        [~,~,b] = GetRange(F, a, 0.1);
        [alfa,~] = GoldenRatio(F,a,b,e_zp);
        x = x+alfa*d;
        
        if norm(x-xOld)<eps
            break;
        end;
        it = it+1;
    end
    val = f(x);
    rmpath('..\Kierunkowa');
end