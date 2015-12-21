function [y] = cauchy(x, mu)
%CAUCHY Cauchy distribution probability density function.
%   mu      scale parameter.

%% definition
% 
% $$p(x) = \frac{1}{\pi} \frac{\mu}{\mu^2+x^2}$$
% 

y = mu ./ (pi * (mu^2 + x.^2));

%% usage
% 
%     % plots for selected parameter values
%     x = -2:.01:2;
%     hold off;
%     plot(x, Cauchy(x, 0.1));
%     hold all;
%     plot(x, Cauchy(x, 0.2));
%     plot(x, Cauchy(x, 0.5));
%     plot(x, Cauchy(x, 1));
%     plot(x, Cauchy(x, 2));
%     plot(x, Cauchy(x, 99999));
%     saveas(gcf, 'Cauchy', 'png');
% 
%     % meaning of scale parameter
%     xdata = -5:.1:5;
%     hold off;
%     plot(xdata, Cauchy(xdata, .5));
%     hold all;
%     plot(xdata, Cauchy(xdata, 1));
%     plot(xdata, Cauchy(xdata, 1)*2);
%     plot(xdata, Cauchy(xdata*2, 1)*2);
% 
%     % print pretty formula
%     syms x;
%     syms mu;
%     pretty(Cauchy(x, mu))
end

