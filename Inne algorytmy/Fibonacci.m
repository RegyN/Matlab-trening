function [F, exitflag]  = Fibonacci(n)

if n<=0
    disp('ERROR: Liczba n musi byæ wiêksza od 0')
    exitflag = -1;
    return;
end

F = [1,1];
if n==1
    F = F(1);
elseif n==2
    F = F(1:2);
else
    for i = 3:n
        F(i) = F(i-1)+F(i-2);
    end
end
end