%% Parameters
set(0,'DefaultAxesColorOrder',[0,0,0]);
s = 0.5;
i_ = 1:4;
i = 1:(numel(i_)-1);
mu = 0.5;

%% Cauchy pdf plot
dx = -(max(i)+1)*s:.01:(max(i)+1)*s;
dy = cauchy(dx, mu);
hd = plot(dx, dy);
hold on;

%% quantization steps plot
ixpos = i_*s;
ix = [fliplr(-ixpos), 0, ixpos];
iy = ix*0;
plot(ix, iy);
plot(ix, iy, '+');

%% quantization levels
qxpos = (i_-1/2)*s;
qx = [fliplr(-qxpos), qxpos];
qy = [max(dy)*.5, 0];
qidxneg = size(qxpos, 2);
qidxpos = qidxneg + 1;
for qi = 1:numel(qx)
    hq = plot([qx(qi) qx(qi)], qy, '--');
    % mark text
    if qi < qidxneg
        qtext = [num2str(qidxneg-qi+1, 'T_{-%d}='), num2str(qx(qi)/s, '%gs')];
        text(qx(qi)-.2, qy(1)+.02, qtext);
    elseif qi == qidxneg
        qtext = 'T_{-1}=-s';
        text(qx(qi)-.15, qy(1)+.02, qtext);
    elseif qi == qidxpos
        qtext = 'T_1=s';
        text(qx(qi)-.1, qy(1)+.02, qtext);
    else
        qtext = [num2str(qi-qidxpos+1, 'T_%d='), num2str(qx(qi)/s, '%gs')];
        text(qx(qi)-.2, qy(1)+.02, qtext);
    end
end

%% reconstruction levels
rxpos = i*s;
rx = [fliplr(-rxpos), 0, rxpos];
ry = rx*0;
hr = plot(rx, ry, 'ko', 'MarkerFaceColor', 'k');
% mark text
rtextpos = [num2str(i', 'R_%d='), num2str(i', '%ds')];
rtextneg = [num2str(fliplr(i)', 'R_{-%d}='), num2str(fliplr(i)', '-%ds')];
ridxzero = size(rtextneg, 1) + 1;
text(rx(1:(ridxzero-2))-.15, ry(1:(ridxzero-2))-.05, rtextneg(1:(ridxzero-2),:));
text(rx(ridxzero-1)-.15, ry(ridxzero-1)-.05, 'R_{-1}=-s');
text(rx(ridxzero)-.1, ry(ridxzero)-.05, 'R_0=0');
text(rx(ridxzero+1)-.1, ry(ridxzero+1)-.05, 'R_1=s');
text(rx((ridxzero+2):size(rx,2))-.1, ry((ridxzero+2):size(rx,2))-.05, rtextpos(2:(ridxzero-1),:));

%% legends
legend([hd; hq; hr], 'cauchy PDF', 'Quantization thresholds', 'Reconstruction values');
axis off;