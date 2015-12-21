function [bps, psnr] = rd(z, s, p, mu)
%RD Theoretical Cauchy-based RD pairs on NUSQ

bps = rq(z, s, mu);
mse = dq(z, s, p, mu);
psnr = 10 * log10(255^2 ./ mse);

end
