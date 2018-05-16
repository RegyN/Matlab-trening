function res = poleHeron(a, b, c)
% Obliczam pole trójk¹ta
% a, b, c - d³ugoœci boków

p = (a + b + c) / 2;
res = (p * (p - a) * (p - b) * (p - c))^(0.5);
end