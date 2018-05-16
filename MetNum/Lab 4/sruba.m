function [  ] = sruba( k )
% SRUBA Funkcja rysuj¹ca wykres funkcji œrubowej oraz jego rzut
% k - skalar okreœlaj¹cy liczbê skrêtów œruby

r = 3;
m = 2;
t = linspace(0, 2*pi*k, 100*k);
z = m*t;
x = r*cos(t);
y = r*sin(t);

figure, 
subplot(2,1,1); plot3(x, y, z, 'r-');
title('Wykres 3D œruby');
xlabel('X');
ylabel('Y');
zlabel('Z');
axis([-r-1, r+1, -r-1, r+1, -1, 2*m*pi*k+1]);
grid on;

subplot(2,1,2); plot(y, z, 'g--');
title('Rzut œruby na p³aszczyznê YZ');
grid on;

        



end

