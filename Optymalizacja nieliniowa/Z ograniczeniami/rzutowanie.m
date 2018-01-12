function [x, val, exitflag] = rzutowanie(D, c, A, b, Aeq, beq, x0, eps)
    neq = length(beq);
    n = length(b);
    m = length(x0);
   
    x = x0;
    it = 0;

    while true
        A1 = [];
        A2 = [];
        % step 1
        Uk = Aeq';
        % evaluate conditons and append to Uk
        p = 0;
        m2 = size(Aeq, 1);
        for i= 1:n
            if(A(i, :) * x - b(i) < eps)
                Uk = [A(i, :)' Uk];
                p = p+1;
                % append condition to equality matrix
                A1 = [A1; A(i, :)];
            else
                % append condition to le matrix
                A2 = [A2; A(i, :)];
            end
        end
        r = p + m2;
        % step 2 - get Pk matrix
        if(abs(r) < eps)
            Pk = eye(m);
        else
            Pk = eye(m) - Uk*(inv(Uk'*Uk))*Uk';
        end

        grad = D * x + c;
        % step 3 - get direction vector
        dk = -Pk * grad;

        if(norm(dk) < eps)
            % step 4 - check exit condition
            if(abs(r) < eps)
                val = 0.5*x'*D*x+c'*x;
                exitflag=1;
                it
                return;
            else
                lambdas = -inv(Uk' * Uk) * Uk' * grad;
                lambdap = lambdas(1:p);
                lambdam2 = lambdas(p+1:m2);
                % check another exit condition
                % step 5
                if(norm(lambdap))
                    val = 0.5*x'*D*x+c'*x;
                    exitflag=1;
                    it
                    return;
                end
                % step 6
                [min, index] = min(lambdap);
                p = p - 1;
                r = r - 1;
                Uk(:, index) = [];
            end
        else
            % step 7
            % get step 
            alfa = (-grad'*dk)/(dk'*D*dk);  
            alfa_max=Inf;
            
            Ad = [];
            if norm(size(A2)) > 0
                Ad=A2*dk;
            end
            % calculate max step
            for i=1:length(Ad)
                if Ad(i)>0
                    alfa_tmp=(b(i)-A(i,:)*x)/Ad(i);
                    if alfa_tmp<alfa_max
                       alfa_max=alfa_tmp; 
                    end 
                end
            end
            % saturate step
            if alfa>alfa_max
               alfa=alfa_max;
            end
            
            x = x + dk * alfa;
            it = it + 1;
            if(it>1000)
                val=0.5*x'*D*x+c'*x;
            end
        end
    end
end