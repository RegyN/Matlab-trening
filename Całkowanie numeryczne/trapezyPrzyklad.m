function I = trapezyPrzyklad( f, a, b, n )
%CALKOWANIE_F_TRAPEZOW
%
    x=linspace(a,b,n);
    xx=1:length(x)-1;
    yy=1:length(x)-1;
    k=1;
    I=0;
    for i = 2:length(x) 
    	xx(k)=x(i-1);
        xx(k+1)=x(i);
        xx(k+2)=x(i);
        yy(k)=f(xx(k));
        yy(k+1)=f(xx(k+1));
        yy(k+2)=0;
        k=k+3;       
        I = I + (f(x(i))+ f(x(i-1))).*(x(i)-x(i-1))./2;
    end
    disp(I);
    xxx=linspace(a,b,1000);
    yyy=f(xxx);
    figure;
    plot(xx, yy,'r--', x,x.*0,'g*', xxx,yyy,'b-');
end