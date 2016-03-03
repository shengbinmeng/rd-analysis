function [y] = gcd(x, k, h)
%GCD Generalized Cauchy distribution probability density function
%   k       tail constant
%   h       scale parameter

a = k * gamma(2/k) / (2 * gamma(1/k)^2);
y = a * h * (h^k + abs(x).^k).^(-2/k);

end

