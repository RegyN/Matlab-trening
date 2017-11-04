function I = prostokatySrodek( f, a, b, n )
% Przyk³ad z którego sobie korzysta³em
%
    x=linspace(a,b,n);
    xx=1:length(x)-1;
    yy=1:length(x)-1;
    z=1:length(x)-1;
    k=1;
    I=0;
    for i = 2:length(x) 
    	xx(k)=x(i-1);
        xx(k+1)=(x(i)+x(i-1))/2;
        xx(k+2)=x(i);
        xx(k+3)=x(i);
        yy(k)=f(xx(k+1));
        yy(k+1)=f(xx(k+1));
        yy(k+2)=f(xx(k+1));
        yy(k+3)=0;
        k=k+4; 
        z(i)=(x(i)+x(i-1))/2;
        I = I + (x(i)-x(i-1)).*f(z(i));
    end
    disp(I);
    xxx=linspace(a, b,1000);
    yyy=f(xxx);
    figure;
    plot( xx, yy,'r-', z, f(z), 'r*', x,x.*0,'g*', xxx,yyy,'b-');
    
end
