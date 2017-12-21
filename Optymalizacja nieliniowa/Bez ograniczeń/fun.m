function [f,grad, hes] = fun(x)
    f=(x(1)-x(2))^4+(x(2)-2*x(3))^2+(x(3)-x(1))^2;
    x1=x(1);
    x2=x(2);
    x3=x(3);
    
    grad1= 4 *(x1-x2)^3 -2*(x3-x1);
    grad2= -4 *(x1-x2)^3 + 2 *(x2 - 2 *x3);
    grad3= -4 *(x2 - 2*x3) + 2 * (x3 - x1);
    grad = [grad1; grad2; grad3];
    
    hes11 = 12 * (x1-x2)^2 +2;
    hes22 = 12 * (x1-x2)^2 +2;
    hes33 = 10;
    hes12 = -12 * (x1-x2)^2;
    hes13 = -2;
    hes23 = -4;
    hes =  [hes11, hes12, hes13;
            hes12, hes22, hes23;
            hes13, hes23, hes33];
end