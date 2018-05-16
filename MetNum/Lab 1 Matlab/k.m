x = [0, pi/2. pi, 3/2*pi, 2*pi];
for i = 1:5
    kY(i) = 2*x(i)*sin(1+x(i)^2);
end
clear x;