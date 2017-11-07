function det = wyznacznikDolittle(A)

[~,U, exitflag] = faktoryzacjaDolittle(A);

if exitflag ~=1
    disp('ERROR: B³¹d faktoryzacji')
    return;
end

det = 1;
for i = 1:size(U)
    det = det * U(i,i);
end

end