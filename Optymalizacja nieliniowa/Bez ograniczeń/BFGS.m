function[x,fval,it]= BFGS(f,x0,eps)
    addpath('..\Kierunkowa');
    n = length(x0);
    H = eye(n);
    x = x0;
    x = x';
    [fval,grad] = f(x0);
    d = -H*grad;
    a0 = 0;
    e_zp = 1e-4;
    it = 1;
    while norm(grad)>eps   
        F=@(alfa)f(x+alfa*d);
        [~,~,b]=GetRange(F, a0, 0.1);
        krok=GoldenRatio(F, a0, b, e_zp);

        xOld = x;
        x = x + krok*d;

        gradOld=grad;
        [fval,grad]=f(x);

        r = grad - gradOld;
        s = x - xOld;

        if norm(s)<eps  || norm(f(x)-f(xOld))<eps
           break; 
        end
        dH = (r'*(s+H*r)/(r'*s)^2)*(s*s')-(s*r'*H+H*r*s')/(r'*s);
        H = H + dH;
        d = -H * grad;
        it = it + 1;
    end
    rmpath('..\Kierunkowa');
end