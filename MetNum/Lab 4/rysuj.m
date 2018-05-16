function [ ] = rysuj( f1, f2, f3 )
% RYSUJ funkcja rysuj¹ca wykres 3 funkcji
% f1, f2, f3 - wskaŸniki na funkcje R->R

n = 150;
min = 1;
max = 10
x = linspace(min, max, n);
z1 = f1(x);
z2 = f2(x);
z3 = f3(x);
y1 = repmat(1, n);
y2 = repmat(3, n);
y3 = repmat(5, n);


figure, plot3(x, y1, z1, 'r', x, y2, z2, 'g', x, y3, z3, 'b')
grid on;
text(x(n/2), y1(n/2), z1(n/2), 'cos(x+pi/4)')
text(x(n/2), y2(n/2), z2(n/2), 'cos(2x)')
text(x(n/2), y3(n/2), z3(n/2), 'cos(3x+pi/3)')
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Wykres 3 funkcji');
axis([min-1, max+1, 0, 6, -1, 1]);
end

