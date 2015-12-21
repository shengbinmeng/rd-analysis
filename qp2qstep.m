function qstep = qp2qstep(qp)
%QP2QSTEP: The Mapping from H.264/AVC or H.265/HEVC linear quantization
%parameter to non-linear quantization step
%Input: qp array with value range 0 - 51
%Output: qstep array with value range 0.625 - 224
%Note: the sample density of QP is not uniform corrsponding to qstep

qstep_table = [0.625 0.6875 0.8125 0.875 1 1.125];
qcount = numel(qp);
assert(qcount > 0);
qstep = zeros(qcount, 1);
qp = floor(qp);
mask = qp < 0;
qp(mask) = 0;
mask = qp > 51;
qp(mask) = 51;

for idx = 1:qcount
    qp_tmp = qp(idx);
    qstep_tmp = qstep_table(mod(qp_tmp, 6) + 1);
    for iter = 1:floor(qp_tmp / 6)
        qstep_tmp = qstep_tmp * 2;
    end
    qstep(idx) = qstep_tmp;
end

end
