function qp = qstep2qp(qstep)
%QSTEP2QP The mapping from non-linear quantization step to H.264/AVC or
%H.265/HEVC linear quantization parameter
%Input: qstep array
%Output: qp array with value range 0 - 51
%Note: The mapping from qstep to qp is lossy, since the sample density of
%qp is sparse which means the qstep between two qp samples will be mapped
%to the same qp value

qcount = numel(qstep);
assert(qcount > 0);
%logical operations on array to avoid iteration
mask = qstep < 0.625;
qstep(mask) = 0.625;
mask = qstep > 224;
qstep(mask) = 224;
qp = round (6 * log2(qstep) + 4);

% for idx = 1:qcount
%     qstep_tmp = qstep(idx);
%     if qstep_tmp < 0.625
%         qp(idx) = 0;
%     elseif qstep_tmp > 224
%         qp(idx) = 0;
%     else
%         qp(idx) = round( 6 * log2(qstep_tmp) + 4);

%     q_per=0;
%     q_rem=0;
%     while x>1.125
%         x=x/2;
%         q_per=q_per+1;
%     end
%     if x<=(0.625+0.6875)/2
%         x=0.625;
%         q_rem=0;
%     elseif x<=(0.6875+0.8125)/2
%         x=0.6875;
%         q_rem=1;
%     elseif x<=(0.8125+0.875)/2
%         x=0.8125;
%         q_rem=2;
%     elseif x<=(0.875+1)/2
%         x=0.875;
%         q_rem=3;
%     elseif x<=(1+1.125)/2
%         x=1;
%         q_rem=4;
%     else
%         x=1.125;
%         q_rem=5;
%     end
%     y=q_per*6+q_rem;
% end

end
    