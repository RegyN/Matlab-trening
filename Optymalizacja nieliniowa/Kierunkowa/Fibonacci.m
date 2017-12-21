function [x, val] = Fibonacci(f, a, b, n, eps)
d0 = b-a;
fib(1) = 1;
fib(2) = 1;
i = 2;
while (d0/eps > fib(i))
    i = i+1;
    fib(i) = fib(i-1) + fib(i-2);

bNew = a + fib(n-1)/fib(n)*(b-a);
aNew = b - fib(n-1)/fib(n)*(b-a);
fa = f(aNew);
fb = f(bNew);

for i = 2:n-1 
    if fb>fa
        b = bNew;
        d = b - a;
        bNew = aNew;
        aNew = b - (fib(n-i)/fib(n-i+1))*d;
        fb = fa;
        fa = f(aNew);
    else 
        a = aNew;
        d = b - a;
        aNew = bNew;
        bNew = a + (fib(n-i) / fib(n-i+1))*d;
        fa = fb;
        fb = f(bNew);
    end
end
x = (a+b)/2;
val = f(x);
end