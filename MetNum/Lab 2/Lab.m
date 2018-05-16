format long;
x = pi/3;
fun = @log;
d = @(x) 1/x;
n = -20:4:-2;
n = n';

deriv2(x, fun, d, n)