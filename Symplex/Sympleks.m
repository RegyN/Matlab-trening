function [x, val, exitflag] = Sympleks(f,A,b)

% Sprawdzanie wymiarów macierzy
if size(f,2)~=size(A,2) || size(b,2)~=size(A,1)
    disp('ERROR: Nieprawid³owe wymiary macierzy')
    exitflag = -1;
    return;
end

% Dodaje zmienne dope³niaj¹ce, ustalam wartoœci tablic wymagane przez
% algorytm.
n = size(A,1);  % liczba równañ
m = size(A,2);  % liczba zmiennych pocz¹tkowych
bf=b';
A = [A, eye(n)];
f= [f, zeros(1,n)];
baza = m+1:m+n;
cb = f(baza)';
c=f;

for i = 1:size(A,2)
    z(i) = dot(cb,A(:,i));
end
zc = z-c;

while any(zc<0)
    % znajdujê zmienn¹ do usuniêcia i do dodania
    [~, col] = min(zc);             % index to kolumna zmiennej do dodania
    for i = 1:size(zc)
        if all(A(:,i)<0)
            disp('Zadanie nie ma skoñczonego rozwi¹zania optymalnego')
            exitflag = -1;
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
x = zeros(1,size(A,2));
x(baza) = bf;
val = dot(x,f);
exitflag = 1;

end