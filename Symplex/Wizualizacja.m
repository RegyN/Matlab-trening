% Funkcja wy�wietla na wykresie uk�ad r�wna�.
function [] = Wizualizacja(f,A,b)

if size(f,2)>2 || size(A,2)>2
   disp("Nieprawid�owa liczba zmiennych w uk�adzie") 
   disp("Oczekiwana liczba zmiennych: 2")
end


b = b';
% Przekszta�cam macierze, �eby mie� r�wnanie typu x2=ax1+b
for i=1:size(A,1)
    if A(i,2) ~=0
        A(i,:) = A(i,:)/A(i,2);
        b(i) = b(i)/A(i,2);
    end
end
% Wyznaczam warto�ci X i Y na liniach
x = 0:0.5:5;
X = repmat(x,size(A,1),1);
Y = zeros(size(A,1),size(x,2));

% Robie warto�ci X i Y dla pionowych linii
for i=1:size(A,1)
    if A(i,2)==0
        X(i,:) = b(i)/A(i,1);
        Y(i) = -5:1:5;
    else
        Y(i,:) = b(i) - A(i,1)*X(i,:);
    end
end

% Rysuj� osie OX i OY
hold on;
xAxis = plot([0,0],[-1,5], 'k-')
xAxis.LineWidth = 2;
axis([-1,5,-1,5]);
yAxis = plot([-1,5],[0,0], 'k-')
yAxis.LineWidth = 2;

% Rysuj� funkcje
for i=1:size(A,1)
    plot(X(i,:),Y(i,:),'b-')
end
end