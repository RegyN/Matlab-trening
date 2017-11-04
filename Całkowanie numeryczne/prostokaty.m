% ca�kowanie metod� prostok�t�w
% f - funkcja, a, b - granice ca�kowania, n - liczba pr�bek

function c = prostokaty(f, a, b, n) 
    
format long;
% Wyliczam ca�k�
d=(b-a)/n;
x = a:d:b;      % Punkty w kt�rych b�d� wyznacza� warto�� pask�w
x = x(1:end-1);
y = f(x);
c=sum(y*d)

% Robi� szpanerski wykres
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
% o� pozioma
xAxis=[a,b];
yAxis = [0,0];
figure;
plot(xRys, yRys, 'r-', xWyk, yWyk, 'b:', xAxis, yAxis, 'k-');
end