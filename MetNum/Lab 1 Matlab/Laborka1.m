clear;
%a
a = 4*10^2;

%b
b = linspace(-2,2,21);

%c
A=[-4, 6, 0; 1, -2 6; 5, 9, 1];
f=[3;0;8];
c1 = size(A);
c2 = size(f);

%d
load('lab1.mat');
d = wyr1(A, B);

%e
e = (A+B')/2;

%f
A = A(1:3,1:3);
B = B(1:3,1:3);
f1 = A.^2;
f2 = A*B;

%g
g = [1 4]*[4 1;7 2];

%h
A=rand(3,5);
B=rand(5,4);

tic;
C=A*B;
hVect = toc;

tic;
for i=1:size(A,1)
    for j=1:size(B,2)
        C(i,j) = A(i,:)*B(:,j);
    end
end
hLoop = toc;

%i
A = magic(4);
iDetA = det(A);
iRank = rank(A);
iWlas = eig(A);
iPoly = poly(A);

%j
w = rand(1,12);
j = reshape(w,3,4);

%k
run('k');

%l
l = poleHeron(3,4,5);

%m
mPotegi = [0,1,2,3,4,5,6,7];
mA = 7/3;
mB = 2.33;
for i=1:size(mPotegi,2)
    
    mDif(i) = mA^i - mB^i;
    
end

%n
nSin = sin(pi/4)^5;
nLn = log(sqrt(5));
nCom = abs(3-2i);

clearvars A B C w;

