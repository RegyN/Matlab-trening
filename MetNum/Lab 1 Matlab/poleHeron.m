function res = poleHeron(a, b, c)
% Obliczam pole tr�jk�ta
% a, b, c - d�ugo�ci bok�w

p = (a + b + c) / 2;
res = (p * (p - a) * (p - b) * (p - c))^(0.5);
end