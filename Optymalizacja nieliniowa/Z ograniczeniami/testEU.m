
% minR=-5;
% maxR=5;
% rangeR = [minR maxR];
% n=3;
% m=2;
% D=randi(rangeR, n, n);
% %symetryczna, dodatnio okreœlona
% D=D*D';
% c=randi(rangeR,n,1);
% A=randi(rangeR,m,n);
% b=randi(rangeR,m,1);
x0=zeros(n,1);
eps=0.000001;

% D = [4,-2;-2,4];
% c = [-6;0];
% A = [1,1;-1,0;0,-1];
% b = [2;0;0];
% x0 = [0;0];
% eps = 0.001;

disp(sprintf('Quadprog\n'))
[x,f,~] = quadprog(D,c,[],[],A,b);
disp(x')
disp(f)

% disp(sprintf('Aktywne 1\n'))
% [x,f,~] = ogr_akt(D, c, A, b, x0, eps);
% disp(x')
% disp(f)

disp(sprintf('EliminacjaQR\n'))
[x,f,~] = EliminacjaUogolnionaQR(D, c, A, b);
disp(x')
disp(f)

disp(sprintf('Eliminacja\n'))
[x,f,~] = EliminacjaUogolniona(D, c, A, b);
disp(x')
disp(f)

% disp(sprintf('Eliminacja T\n'))
% [x,f,~] = eliminacja(D, c, A, b);
% disp(x')
% disp(f)

% disp(sprintf('Aktywne\n'))
% [x,f,~] = OgraniczeniaAktywne(D, c, A, b, x0, eps);
% disp(x')
% disp(f)

% disp(sprintf('RzutowanieT\n'))
% [x,f,~] = rzutowanie(D, c, A, b, [], [], x0, eps);
% disp(x')
% disp(f)

% disp(sprintf('Rzutowanie\n'))
% [x,f,~] = RzutowanieGradientu(D, c, A, b, [], [], x0, eps);
% disp(x')
% disp(f)

%disp(sprintf('Zadanie 3\n'))
%[x,f,exitflag]  = eliminacja_BFGS(D, c, A, b)
