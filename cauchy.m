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
%     plot(x, cauchy(x, 0.1));
%     hold all;
%     plot(x, cauchy(x, 0.2));
%     plot(x, cauchy(x, 0.5));
%     plot(x, cauchy(x, 1));
%     plot(x, cauchy(x, 2));
%     plot(x, cauchy(x, 99999));
%     saveas(gcf, 'cauchy', 'png');
% 
%     % meaning of scale parameter
%     xdata = -5:.1:5;
%     hold off;
%     plot(xdata, cauchy(xdata, .5));
%     hold all;
%     plot(xdata, cauchy(xdata, 1));
%     plot(xdata, cauchy(xdata, 1)*2);
%     plot(xdata, cauchy(xdata*2, 1)*2);
% 
%     % print pretty formula
%     syms x;
%     syms mu;
%     pretty(cauchy(x, mu))
end

