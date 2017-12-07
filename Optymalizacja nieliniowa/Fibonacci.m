function [x, val] = Fibonacci(f, a, b, n, eps)
fib = zeros(1,n);
fib(1) = 1;
fib(2) = 1;
for i = 3:n
    fib(i) = fib(i-1)+fib(i-2);
end

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