function [y] = gcd(x, sigma, p)
%GCD Generalized Cauchy distribution probability density function
%   sigma   scale parameter
%   p       tail constant

a = p * gamma(2/p) / (2 * gamma(1/p)^2);
y = a * sigma * (sigma^p + abs(x).^p).^(-2/p);

end

