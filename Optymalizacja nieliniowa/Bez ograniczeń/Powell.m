function[x,fval,it]= Powell(f,x0,e)
addpath('..\Kierunkowa');
n=length(x0);
U=eye(n);
a0=0;
e_zp=1e-5;
it=1;
x0 = x0';
delta = 0.01;
Nmax=100;
while it<=Nmax
    x=x0;
    for k=1:n
        dk = -U(:,k);
        F=@(alfa)f(x+alfa*dk);
        [~,~,b] = GetRange(F,a0,delta);
        [krok,~] = GoldenRatio(F,a0,b,e_zp);
        
        if krok < 1e-5 || norm(f(x + krok * dk) - f(x))<e
            dk = -dk;
            F = @(alfa)f(x+alfa*dk);
            [~,~,b] = GetRange(F,a0,delta);
            [krok,~] = GoldenRatio(F,a0,b,e_zp);          
        end
        
        xOld = x;
        x = xOld+krok*dk;
    end
    s = x - x0;
    if norm(s)<e  || norm(f(x)-f(x0))<e
           break; 
    end
    
    U(:,1)=U(:,2);
    U(:,2)=U(:,3);
    U(:,3)=s/norm(s);
    
    dn=-U(:,3);
    F=@(alfa)f(x+alfa*dn);
    [~,~,b] = GetRange(F,a0,0.01);
    [krok,~] = GoldenRatio(F,a0,b,e_zp);
    
    if krok < 1e-5 || norm(f(x + krok * dk) - f(x))<e
        dn=-dn;
        F=@(alfa)f(x+alfa*dn);
        [~,~,b] = GetRange(F,a0,0.01);
        [krok,~] = GoldenRatio(F,a0,b,e_zp);          
    end
        
    xOld=x;
    x=xOld+krok*dn;
    x0=x;
    it=it+1;
end

fval=f(x);
rmpath('..\Kierunkowa');
end