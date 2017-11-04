function [ C, error ] = prostokaty( f,a,b,n )

h=(b-a)/n;
x=@(i)(a+(i-1)*h);
C=0;
fun=@(x)(eval(f));
for i=1:n
   C=C+h*fun(x(i)+h/2);
end
wektor = linspace (a, b, n);
error = (b-a)*h*max(abs(diff(fun(wektor))/h))/2;
end