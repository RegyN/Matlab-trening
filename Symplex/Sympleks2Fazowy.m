function [x, exitflag, val] = Sympleks2Fazowy(f,A,b)

n = size(A,1);
m = size(A,2);
A=[A, -eye(n), eye(3)];
bf=b';
ftemp = [zeros(1,n+m), ones(1, n)];
ftemp = -ftemp;
baza = m+n+1:m+n+n;
cb = ftemp(baza)';
c=ftemp;

for i = 1:size(A,2)
    z(i) = dot(cb,A(:,i));
end
zc = z-c;

% Robiê pierwsz¹ faze - znajdowanie dobrej bazy
[A,bf,baza] = ZrobFaze(ftemp, A, bf, baza, cb, c, z, zc);

A = A(:,1:n+m);
z = zeros(m+n);
zc = zeros(m+n);
f= [f, zeros(1,n)];
f=-f;
c=f
cb = f(baza)';

% Robiê drug¹ fazê
[A,bf,baza] = ZrobFaze(f, A, bf, baza, cb, c, z, zc);

x = zeros(1,size(A,2));
x(baza) = bf;
val = dot(x,f);
exitflag = 1;

end

function [A,bf,baza] = ZrobFaze(f, A, bf, baza, cb, c, z, zc)
while any(zc<0)
    % znajdujê zmienn¹ do usuniêcia i do dodania
    [~, col] = min(zc);             % index to kolumna zmiennej do dodania
    for i = 1:size(zc)
        if all(A(:,i)<0)
            disp('Zadanie nie ma skoñczonego rozwi¹zania optymalnego')
            return;
        end
    end
    
    % Pomijam elementy ujemne z kolumny w A
    AColTemp = A(:,col);
    for i=1:size(AColTemp)
        if AColTemp(i)<0
            AColTemp(i) = 0;
        end
    end
    [~, row] = min(bf./AColTemp);   % row to wiersz zmiennej do usuniêcia
    baza(row) = col;                % aktualizujê bazê
    cb = f(baza)';                  % oraz inne istotne macierze
    bf(row) = bf(row)/A(row,col);
    A(row,:) = A(row,:)/A(row,col);
    mul = A(:,col)/A(row,col);
    mul(row)=0;
    dif = mul*A(row,:);
    A = A - dif;                    % przerabiam kolumne z now¹ zmienn¹ bazow¹ na [0;(0;)1]
    bf = bf - mul*bf(row);
    
    for i = 1:size(A,2)
        z(i) = dot(cb,A(:,i));
    end
    zc = z-c;
end
end