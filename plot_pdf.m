% plots for selected parameter values
x = -2:.01:2;
s = 1;
figure;
hold all;
plot(x, ggd(x, 0.7, s));
plot(x, ggd(x, 1, s));
plot(x, ggd(x, 1.5, s));
plot(x, ggd(x, 2, s)); % Gaussion
plot(x, ggd(x, 4, s));
%plot(x, ggd(x, 99999, s));

s = 1;
figure;
hold all;
plot(x, gcd(x, 0.7, s));
plot(x, gcd(x, 1, s));
plot(x, gcd(x, 1.5, s));
plot(x, gcd(x, 2, s)); % Cauchy
plot(x, gcd(x, 4, s));