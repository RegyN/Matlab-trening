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
        x = ZrobKierunek(f,d,x,e_zp);
        
        d=[0;1;0];
        x = ZrobKierunek(f,d,x,e_zp);
        
        d=[0;0;1];
        x = ZrobKierunek(f,d,x,e_zp);
        
        d=[-1;0;0];
        x = ZrobKierunek(f,d,x,e_zp);
        
        d=[0;-1;0];
        x = ZrobKierunek(f,d,x,e_zp);
        
        d=[0;0;-1];
        x = ZrobKierunek(f,d,x,e_zp);
        
        if norm(x-xOld)<eps
            break;
        end
        it = it+1;
    end
    val = f(x);
    rmpath('..\Kierunkowa');
end

function [x] = ZrobKierunek(f, d, x, e_zp)
    F = @(alfa) f(x+alfa*d);
    [~,~,b] = GetRange(F, 0, 0.1);
    [alfa,~] = GoldenRatio(F,0,b,e_zp);
    x = x+alfa*d;
end