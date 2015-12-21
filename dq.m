function D = dq(z, s, p, mu)
%DQ Theoretical Cauchy-based distortion estimation on NUSQ
%   Computation is truncated at x=+/-x_range, regardless of s.

x_range = 10000;
Dzero = (2*mu/pi)*(z*s - mu*atan(z .* s/mu));

ncase = numel(s);
Dpos(1, ncase) = 0;
for c = 1:ncase
    if s(c) == 0
        Dpos(c) = 0;
        continue;
    end
    ninterval = x_range/s(c);
    for i = 1:ninterval
        tmp1 = mu*s(c);
        tmp2 = mu*(i+p)*s(c) * log((mu^2+(i+z)^2*s(c)^2) / (mu^2+(i-1+z)^2*s(c)^2));
        tmp3 = ((i+p)^2*s(c)^2-mu^2) * atan(mu*s(c) / (mu^2+(i+z)*(i-1+z)*s(c)^2));
        Dpos(c) = Dpos(c) + (tmp1 - tmp2 + tmp3) / pi;
    end
end

D = Dzero + Dpos * 2;

end

