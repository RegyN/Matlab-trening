function NWD = algEuklidesa( a, b)

while a~=b
    if a>b
        a=a-b;
    elseif b>a
        b=b-a;
    end
end
NWD = a;
end