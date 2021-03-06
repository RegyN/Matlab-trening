% Metoda M jest stosowana do rozwi�zywania uk�ad�w z ograniczeniami typu >=
% i ==. Wej�ciami tej funkcji beda macierze jak w zwyklym sympleksie, tyle
% ze z r�wno�ciami a nie <= jak w sympleksie.

function [x, val, exitflag] = SympleksM(f,A,b)

% Sprawdzanie wymiar�w macierzy
if size(f,2)~=size(A,2) || size(b,2)~=size(A,1)
    disp('ERROR: Nieprawid�owe wymiary macierzy')
    exitflag = -1;
    return;
end

M=1000; % warto�� wsp�czynnika M, mo�na zmieni� jak co�.

% Dodaje zmienne dope�niaj�ce, ustalam warto�ci tablic wymagane przez
% algorytm.
n = size(A,1);  % liczba r�wna�
m = size(A,2);  % liczba zmiennych pocz�tkowych
bf=b';
A = [A, eye(n)];
f= [f, repelem(-M,n)];
f=f;
baza = m+1:m+n;
cb = f(baza)';
c=f;

for i = 1:size(A,2)
    z(i) = dot(cb,A(:,i));
end
zc = z-c;

while any(zc<0)
    % znajduj� zmienn� do usuni�cia i do dodania
    [~, col] = min(zc);             % index to kolumna zmiennej do dodania
    for i = 1:size(zc)
        if all(A(:,i)<0)
            disp('Zadanie nie ma sko�czonego rozwi�zania optymalnego')
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
    [~, row] = min(bf./AColTemp);   % row to wiersz zmiennej do usuni�cia
    baza(row) = col;                % aktualizuj� baz�
    cb = f(baza)';                  % oraz inne istotne macierze
    bf(row) = bf(row)/A(row,col);
    A(row,:) = A(row,:)/A(row,col);
    mul = A(:,col)/A(row,col);
    mul(row)=0;
    dif = mul*A(row,:);
    A = A - dif;                    % przerabiam kolumne z now� zmienn� bazow� na [0;(0;)1]
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