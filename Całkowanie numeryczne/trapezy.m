% ca³kowanie metod¹ trapezów
% f - funkcja, a, b - granice ca³kowania, n - liczba próbek

function c = trapezy(f,a,b,n)

format long;
d=(b-a)/n;
x=a:d:b;
y = f(x);
podst1 = y(1:end-1);
podst2 = y(2:end);
poleTrap = d * (podst1 + podst2)/2;
c= sum(poleTrap);

% Rysujê wykres
for i = 1:n
    
   xRys(4*i-3) = x(i);
   xRys(4*i-2) = x(i);
   xRys(4*i-1) = x(i)+d;
   xRys(4*i) = x(i)+d;
   
   yRys(4*i-3) = 0;
   yRys(4*i-2) = f(x(i));
   yRys(4*i-1) = f(x(i)+d);
   yRys(4*i) = 0;
    
end

% wykres funkcji
xWyk=a:d/3:b;
yWyk = f(xWyk);
% oœ pozioma
xAxis=[a,b];
yAxis = [0,0];
figure;
plot(xRys, yRys, 'r-', xWyk, yWyk, 'b:', xAxis, yAxis, 'k-');
end