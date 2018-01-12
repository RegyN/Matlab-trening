function [x, val, exitflag] = RzutowanieGradientu(D, c, A, b, Aeq, beq, x0, eps)
    
    k=0;
    n = size(A,2);      % liczba nierównoœci
    neq = length(beq);  % liczba równañ
    m = size(A,1);      % liczba ograniczeñ
    akt = zeros(1, m);  % ograniczenia aktywne
    x=x0;
    p = m;
    
    while true
        for i=1:m
            if abs(A(i,:)*x - b(i)) <= eps
                akt(i) = 1;
            else
                akt(i) = 0;
            end
        end
        Uk = A(find(akt),:);
        if sum(akt)==0
            P = eye(n);
        else
            P = eye(n) - Uk*(Uk'*Uk)^(-1)*Uk';
        end
        grad = D*x+c;
        d=-P*grad;

        if norm(d) <= eps
            if sum(akt)==0
                val = 0.5*x'*D*x+c'*x;
                exitflag=1;
                return;
            end
            
            lambdak=-(Uk'*Uk)^(-1)*Uk'*grad;
            lambda1=lambdak(1:p);
            lambda2=lambdak(p+1:n)
            [lMin, ind]=min(lambda1)
            if lMin >= 0
                val = 0.5*x'*D*x+c'*x;
                exitflag=1;
                return;
            end
            Uk(:,index)=[];
            akt(index)=0;
            p=p-1;
            
        end
        nieaktA=[];
        czyJest = 0;
        for i=1:m
            if akt(i)~=1
                nieaktA=[nieaktA;A(i,:)];
                if A(i,:)*d>0
                    czyJest = 1;
                end
            end
        end
        if czyJest>0
            for i=1:m
                if (A(i,:)*d)>0
                    alfy(i) = (b(i,:)-A(i,:)*x)/(A(i,:)*d);
                else
                    alfy(i)=100;
                end
            end
            alfaMax = abs(min(alfy));
        else
            alfaMax = Inf;
        end
        krok = (-grad'*d)/(d'*D*d);
        if krok>alfaMax
            krok = alfaMax;
        end
        x = x+krok*d;
    end
end

