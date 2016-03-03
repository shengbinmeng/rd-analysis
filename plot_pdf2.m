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
lw = 1.5;
plot(x - 2*dis, stblpdf(x, 0.75, beta, gam, delta, 'quick'), 'k', 'LineWidth',lw);
plot(x - dis, stblpdf(x, 1, beta, gam, delta, 'quick'), 'r', 'LineWidth',lw); % Cauchy
plot(x, stblpdf(x, 1.5, beta, gam, delta, 'quick'), 'k', 'LineWidth',lw);
plot(x + dis, stblpdf(x, 2, beta, 1/(2^0.5), delta, 'quick'), 'r', 'LineWidth',lw); % Gaussian

plot(x - dis, gcd(x, 1.5, s) - offset, 'k', 'LineWidth',lw);
plot(x - dis, gcd(x, 2, s), 'r', 'LineWidth',lw); % Cauchy
plot(x - dis, gcd(x, 3, s) + offset, 'k', 'LineWidth',lw);
plot(x - dis, gcd(x, 8, s) + 2*offset, 'k', 'LineWidth',lw);

plot(x + dis, ggd(x, 1.5, s) - offset, 'k', 'LineWidth',lw);
plot(x + dis, ggd(x, 2, s), 'r'); % Gaussian
plot(x + dis, ggd(x, 3, s) + offset, 'k', 'LineWidth',lw);
plot(x + dis, ggd(x, 8, s) + 2*offset, 'k', 'LineWidth',lw);

ax = gca;
set(ax,'XTick',[-2*dis, -dis, 0, dis]);
set(ax,'XTickLabel',{'0.75','1','1.5','2'});
XLabel('Stability Parameter','fontsize',12);
set(ax,'YTick',[-offset+0.2 0+0.2 offset+0.15 2*offset+0.15]);
set(ax,'YTickLabel',{'1.5','2','3','8'});
YLabel('Shaple Paremeter','fontsize',12);
set(ax,'LineWidth', lw);
set(ax,'FontSize', 12);