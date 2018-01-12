function [x, val, exitflag] = OgraniczeniaAktywne(D, c, A, b, x0, eps)

    n = size(A,2);      % liczba równañ
    m = size(A,1);      % liczba ograniczeñ
    akt = zeros(1, m);  % ograniczenia aktywne
    for i=1:m
        if abs(A(i,:)*x0 - b(i)) <= eps
            akt(i) = 1;
        else
            akt(i) = 0;
        end
    end
    grad = D*x0+c;
    
    x = x0;
    it=0;
    
    while true
        aktA=[];
        for i=1:m
            if akt(i)==1
                aktA=[aktA;A(i,:)];
            end
        end
        E = [D, aktA';
             aktA, zeros(sum(akt))];
        F = [-grad;zeros(sum(akt),1)];
        delty = E^(-1)*F;
        d = delty(1:n,:);
        lambdy = zeros(m,1);
        lambdy(find(akt)) = delty(n+1:n+sum(akt),:);
        if norm(d) < eps   % kierunek przes. 0, wiêc trzeba sprawdziæ czy juz
            [minVal, index] = min(lambdy);
            if minVal <= eps
                val = 0.5*x'*D*x+c'*x;
                exitflag = 1;
                %disp(lambdy)
                return;
            end
            akt(index) = 0;
        else
            kroki = [];
            for i=1:m
                if akt(i) ~= 1
                    tmp1 = b(i,:)-A(i,:)*x;
                    tmp2 = (A(i,:)*d);
                    if tmp2>0
                        kroki(i) = tmp1/tmp2;
                    else
                        kroki(i) = 10;
                    end
                else
                    kroki(i)=10; % Jakaœ spora liczba, bo wyliczamy minimum
                end
            end
            krok = min([1, kroki]);
            
            x = x + krok*d;
            it = it+1;
            grad = D*x+c;
            
            for i=1:m                   %% Aktualizacja zb. ogr. akt.
                if abs(A(i,:)*x - b(i)) <= eps
                    akt(i) = 1;
                else
                    akt(i) = 0;
                end
            end
        end
    end
end

