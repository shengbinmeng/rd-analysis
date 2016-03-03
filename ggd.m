function [y] = ggd(x, alpha, beta)
%GGD Generalized Gaussian distribution probability density function
%   alpha   shape parameter
%   beta    scale parameter

%% definition
% 
% $$p(x) = \frac{\alpha\eta(\alpha,\beta)}{2\Gamma(1/\alpha)}
% \exp(-(\eta(\alpha,\beta)|x|)^\alpha)$$
%
% with
% $\eta(\alpha, \beta) = \beta^{-1}
% \left(\frac{\Gamma(3/\alpha)}{\Gamma(1/\alpha)}\right)^{\frac{1}{2}}$
% and
% $\Gamma(z) = \int_{0}^{\infty} t^{z-1} \exp(-t) dt$

eta = (1/beta) * (gamma(3/alpha)/gamma(1/alpha))^(1/2);
y = (alpha*eta / (2*gamma(1/alpha))) * exp(-(eta*abs(x)).^alpha);

%% usage
% 
%     % plots for selected parameter values
%     x = -2:.01:2;
%     hold off;
%     plot(x, ggd(x, .7, 1));
%     hold all;
%     plot(x, ggd(x, 1, 1));
%     plot(x, ggd(x, 1.5, 1));
%     plot(x, ggd(x, 2, 1));
%     plot(x, ggd(x, 4, 1));
%     plot(x, ggd(x, 99999, 1));
%     saveas(gcf, 'ggd', 'png');
% 
%     % print pretty formula
%     syms x;
%     syms alpha;
%     syms beta;
%     pretty(ggd(x, alpha, beta))
%
end

