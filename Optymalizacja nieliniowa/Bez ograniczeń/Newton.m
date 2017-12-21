function [x, val, it] = Newton(f, x0, eps)

    x = x0';
    it=1;
    [val, grad, hes] = f(x);
    d = -inv(hes)*grad;
    while norm(grad)>eps
        x = x + d;
        [val, grad, hes] = f(x);
        d = -inv(hes)*grad;
        it = it + 1;
    end
end