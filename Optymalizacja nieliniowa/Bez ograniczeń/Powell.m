function[x,fval,it]= Powell(f,x0,e)
addpath('..\Kierunkowa');
n=length(x0);
U=eye(n);
a0=0;
delta=1e-5;
e_ZP=1e-5;
it=1;
x0 = x0';
Nmax=100;
while it<=Nmax
    x=x0;
    for k=1:n
        dk=-U(:,k);
        F=@(alfa)f(x+alfa*dk);
        amax=alfa_max(F,a0,delta);
        alfa_gold=gold(F,a0,amax,e_ZP);
        
        if alfa_gold < 1e-5 || norm(f(x + alfa_gold * dk) - f(x))<e
            dk=-dk;
            F=@(alfa)f(x+alfa*dk);
            amax=alfa_max(F,a0,delta);
            [alfa_gold,~] = gold(F,a0,amax,e_ZP);          
        end
        
        xprev=x;
        x=xprev+alfa_gold*dk;
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
    amax=alfa_max(F,a0,delta);
    alfa_gold=gold(F,a0,amax,e_ZP);
    
    if alfa_gold < 1e-5 || norm(f(x + alfa_gold * dk) - f(x))<e
        dn=-dn;
        F=@(alfa)f(x+alfa*dn);
        amax=alfa_max(F,a0,delta);
        alfa_gold=gold(F,a0,amax,e_ZP);          
    end
        
    xprev=x;
    x=xprev+alfa_gold*dn;
    x0=x;
    it=it+1;
end

fval=f(x);
rmpath('..\Kierunkowa');
end