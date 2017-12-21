function [x, val, it] = Hooke(f, x0, eps)

    x=x0';
    krok = 1;
    B = 0.5;
    xOld = x;
    it = 1;
    
    while krok>eps
        % ETAP PRÓBNY %
        while krok>eps
            if f(x)>f(x+krok*[1;0;0])
                x = x + krok*[1;0;0];
            elseif f(x)>f(x+krok*[-1;0;0])
                x = x + krok*[-1;0;0];
            end

            if f(x)>f(x+krok*[0;1;0])
                x = x + krok*[0;1;0];
            elseif f(x)>f(x+krok*[0;-1;0])
                x = x + krok*[0;-1;0];
            end

            if f(x)>f(x+krok*[0;0;1])
                x = x + krok*[0;0;1];
            elseif f(x)>f(x+krok*[0;0;-1])
                x = x + krok*[0;0;-1];
            end
            
            if x == xOld
                krok = krok*B;
            else
                if f(x)>=f(xOld)
                    x = xOld;
                    krok = krok*B;
                else
                    break;
                end
            end
        end
        % ETAP ROBOCZY %
        xVeryOld = xOld;
        xOld = x;
        x = 2*xOld - xVeryOld;
        it = it+1;
    end
    val = f(x);
end