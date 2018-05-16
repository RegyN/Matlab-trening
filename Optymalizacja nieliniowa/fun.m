function [y, grad] = fun(x)
    y = (x(1) - x(2))^4 + (x(2) - 2*x(3))^2 + (x(3) - x(1))^2;
    grad1 = 4*(x(1)-x(2))^3 - 2*(x(3)-x(1));
    grad2 = -4*(x(1)-x(2))^3 +(x(2)-2*x(3));
    grad3 = -4*(x(2)-2*x(3)) + (x(3) - x(1));
    grad = [grad1, grad2, grad3];
end