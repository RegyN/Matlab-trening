x0 = [4, 4,-4];
[~,d0] = fun(x0);
d0=-d0;
f = @(alfa) fun(x0+alfa*d0);
f(0)
f(2)
[a,mid,b] = GetRange(f,0,1);