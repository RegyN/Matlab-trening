% ca³kowanie metod¹ prostok¹tów
% f - funkcja, a, b - granice ca³kowania, n - liczba próbek

function c = prostokaty(f, a, b, n) 
    
format long;
% Wyliczam ca³kê
d=(b-a)/n;
x = a:d:b;      % Punkty w których bêdê wyznacza³ wartoœæ pasków
x = x(1:end-1);
y = f(x);
c=sum(y*d)

% Robiê szpanerski wykres
for i = 1:n
    xRys(4*i-3) = x(i);
    xRys(4*i-2) = x(i);
    xRys(4*i-1) = x(i)+d;
    xRys(4*i) = x(i)+d;
    
    yRys(4*i-3) = 0;
    yRys(4*i-2) = f(x(i));
    yRys(4*i-1) = f(x(i));
    yRys(4*i-0) = 0;
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