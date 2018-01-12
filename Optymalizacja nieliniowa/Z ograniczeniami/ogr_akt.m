function [ x_opt, f_opt, lambda ] = ogr_akt(D, c, A, b, x0, eps)
    x = x0;
    n = length(b);
    k = 0;
    active = zeros(1,n);
    for i=1:n
       if abs( A(i,:)*x - b(i) ) < eps
          active(i) = true;
       end
    end
    
    while true
        %
        gradient = D * x + c;
        active;
        % krok 2 - zadanie pomocnicze
        Azp = [];
        for i = 1:n
           if active(i) == true
              Azp = [ Azp; A(i,:) ];
           end
        end

        %WKT
        [d1,~] = size(Azp);
        [~,d2] = size(D);
        wktA = [ D Azp'; Azp zeros(d1) ];
        wktB = [ -gradient; zeros(d1,1) ];
        wktX = wktA \ wktB;
        
        direction = wktX(1:d2);
        lambda = wktX(d2 + 1 : end);
        
        % dk = 0 - krok 6 - sprawdzenie optymalnoœci
        if norm(direction) < eps
            if any(active) == 0
                x_opt = x;
                f_opt = 0.5 * x' * D * x + c' * x;
                %disp('Iteracje: ');
                %disp(k);
                return;
            end
            %
           [ m, index ] = min(lambda);
           if m >= 0
               x_opt = x;
               f_opt = 0.5 * x' * D * x + c' * x;
               disp('Iteracje: ');
               disp(k);
               return;
           else
               %
                activeCount = 0;
                for i = 1:n
                   if active(i) == true
                      activeCount = activeCount + 1;
                      if activeCount == index
                          active(i) = false;
                      end
                   end
                end
           end
        % krok 4: 
        else
            Ad = A * direction;
            alfa = 1;
            for i = 1:n
                if Ad(i) > eps && active(i) == 0 
                    alfa_tmp = (b(i) - A(i, :) * x) / Ad(i);
                    if alfa_tmp < alfa
                       alfa = alfa_tmp; 
                    end
                end
            end
            
            % krok 5 - aktualizacja x
            x = x + alfa * direction;

            active = zeros(1, n);   
            for i = 1:n
               if abs( A(i,:)*x - b(i) ) < eps
                  active(i) = true; 
               end
            end
            k = k + 1;
            active;
        end
    end
end