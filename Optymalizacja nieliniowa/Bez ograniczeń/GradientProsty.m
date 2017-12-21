function [x, val] = GradientProsty(f, g, x0, a, eps)

    d=g;
    x=x0;
    i=1;
    dk=-d(x);
    while norm(dk)>eps && norm(a*dk)>eps
        x = x + a*dk;
        dk=-d(x);
        i = i+1;
    end
    val = f(x);
end