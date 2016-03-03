% plots for selected parameter values
x = -5:.01:5;
beta = 0;
gam = 1;
delta = 0;
s = 1;
dis = 12;
offset = 0.5;

figure;
hold all;
plot(x - 2*dis, stblpdf(x, 0.75, beta, gam, delta, 'quick'), 'r');
plot(x - dis, stblpdf(x, 1, beta, gam, delta, 'quick'), 'r'); % Cauchy
plot(x, stblpdf(x, 1.5, beta, gam, delta, 'quick'), 'r');
plot(x + dis, stblpdf(x, 2, beta, 1/(2^0.5), delta, 'quick'), 'r'); % Gaussian

plot(x - dis, gcd(x, 1.5, s) - offset, 'g');
plot(x - dis, gcd(x, 2, s), 'r'); % Cauchy
plot(x - dis, gcd(x, 2.5, s) + offset, 'b');
plot(x - dis, gcd(x, 3.5, s) + 2*offset, 'c');

plot(x + dis, ggd(x, 1.5, s) - offset, 'g');
plot(x + dis, ggd(x, 2, s), 'r'); % Gaussian
plot(x + dis, ggd(x, 2.5, s) + offset, 'b');
plot(x + dis, gcd(x, 3.5, s) + 2*offset, 'c');