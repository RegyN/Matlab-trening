function [x,exitflag] = mojaMetodaM(f,A,b)
M=1000;
% Pocz¹tkowe wartoœci zmiennych z tabelek
A = [A, eye( size(A, 1))];
f = [f, zeros( 1, repelem(-M, size(A,1)))];
f=-f; %chce liczyc min
c = f;
for i = 1:n
 z(i) = dot(base, A(:, i));
end
zc = z-c;
bf = b';
cb = repelem(-M, size(A, 1)); %zeros(size(A,1),1);

% Indeksy zmiennych bazowych (np. [3,4,5])
indices=size(A,2)-size(A,1)+1:size(A,2); 

while any(zc<0)     % Jeœli istnieje jakies z-c<0
 [~,in]=min(zc);    % Znajdujê indeks zmiennej do dodania do bazy
 if not( any( A( :, in) >0))
     exitflag = 0;
     return
 end
 kryt=bf./A(:,in);  % dzielê b/a ¿eby znaleŸæ któr¹ zmienn¹ wyj¹æ z bazy
 kryt( A( :, in) < 0)=inf;
 [ ~, out] = min( kryt); % out to indeks zmiennej do usuniecia
 
 bf( out) = bf( out)/A( out, in);
 cb( out) = c( in);
 A(out, :) = A(out, :)./A(out, in);
 Mul = A( :, in) ./ A( out, in);
 Mul(out) = 0;
 Dif = A( out, :) .* Mul;
 A = A - Dif;
 bf = bf-bf(out)*Mul;
 
 z=dot(A,cb*ones(1,size(A,2))); % aktualizuje z (dzia³a, sprawdzilem)
 zc=z-c;
 
 indices(out)=in;
 
 disp('aktualna tabelka sympleksowa:')
 disp(A)
 
 disp('aktualne indeksy bazowe:')
 disp(indices)
end

x1 = zeros(size(A,1),1);
x1(indices) = bf;
x=x1(1:(size(x1,1)-size(A,1)));
exitflag = 1;

end