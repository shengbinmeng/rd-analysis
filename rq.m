function R = rq(z, s, mu)
%RQ Theoretical Cauchy-based rate estimation on NURQ
%   Computation is truncated at x=+/-x_range, regardless of s.

x_range = 10000; 
Pzero = (2/pi) * atan(z .* s/mu);
Rzero = - Pzero .* log2(Pzero);

ncase = numel(s);
Rpos(1, ncase) = 0;
for c = 1:ncase
    if s(c) == 0
        Rpos(c) = 0;
        continue;
    end
    ninterval = x_range/s(c);
    for i = 1:ninterval
        P = (1/pi) * atan(mu*s(c) / (mu^2 + (i+z)*(i-1+z)*s(c)^2));
        H = - P * log2(P);
        Rpos(c) = Rpos(c) + H;
    end
end

R = Rzero + Rpos * 2;

end

