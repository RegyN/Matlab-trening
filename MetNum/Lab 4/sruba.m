function [  ] = sruba( k )
% SRUBA Funkcja rysuj�ca wykres funkcji �rubowej oraz jego rzut
% k - skalar okre�laj�cy liczb� skr�t�w �ruby

r = 3;
m = 2;
t = linspace(0, 2*pi*k, 100*k);
z = m*t;
x = r*cos(t);
y = r*sin(t);

figure, 
subplot(2,1,1); plot3(x, y, z, 'r-');
title('Wykres 3D �ruby');
xlabel('X');
ylabel('Y');
zlabel('Z');
axis([-r-1, r+1, -r-1, r+1, -1, 2*m*pi*k+1]);
grid on;

subplot(2,1,2); plot(y, z, 'g--');
title('Rzut �ruby na p�aszczyzn� YZ');
grid on;

        



end

