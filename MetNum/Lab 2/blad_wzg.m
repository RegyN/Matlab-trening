function [blad] = blad_wzg( x, y )
% komentarz

blad = abs(x-y)./abs(y);
end