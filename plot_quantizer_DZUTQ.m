%% Parameters
set(0,'DefaultAxesColorOrder',[0,0,0]);
z = 5/6;
p = 1/6;
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
% mark text
iidxzero = size(ixpos, 2) + 1;
text(ix(1:(iidxzero-2))-.08, iy(1:(iidxzero-2))+.05, num2str(ix(1:(iidxzero-2))'/s, '%ds'));
text(ix(iidxzero-1)-.03, iy(iidxzero-1)+.05, '-s');
text(ix(iidxzero), iy(iidxzero)+.05, '0');
text(ix(iidxzero+1), iy(iidxzero+1)+.05, 's');
text(ix((iidxzero+2):size(ix,2))-.05, iy((iidxzero+2):size(iy,2))+.05, num2str(ix((iidxzero+2):size(ix,2))'/s, '%ds'));


%% quantization thresholds
qxpos = (i_-1+z)*s;
qx = [fliplr(-qxpos), qxpos];
qy = [max(dy)*.5, 0];
qidxneg = size(qxpos, 2);
qidxpos = qidxneg + 1;
for qi = 1:numel(qx)
    hq = plot([qx(qi) qx(qi)], qy, '--');
    % mark text
    if qi < qidxneg
        qtext = [num2str(qidxneg-qi+1, 'T_{-%d}='), num2str(qidxneg-qi, '-(%d+z)s')];
        text(qx(qi)-.2, qy(1)+.02, qtext);
    elseif qi == qidxneg
        qtext = 'T_{-1}=-zs';
        text(qx(qi)-.15, qy(1)+.02, qtext);
    elseif qi == qidxpos
        qtext = 'T_1=zs';
        text(qx(qi)-.1, qy(1)+.02, qtext);
    else
        qtext = [num2str(qi-qidxpos+1, 'T_%d='), num2str(qi-qidxpos, '(%d+z)s')];
        text(qx(qi)-.2, qy(1)+.02, qtext);
    end
end

%% reconstruction values
rxpos = (i+p)*s;
rx = [fliplr(-rxpos), 0, rxpos];
ry = rx*0;
hr = plot(rx, ry, 'ko', 'MarkerFaceColor', 'k');
% mark text
rtextpos = [num2str(i', 'R_%d='), num2str(i', '(%d+f)s')];
rtextneg = [num2str(fliplr(i)', 'R_{-%d}='), num2str(fliplr(i)', '-(%d+f)s')];
ridxzero = size(rtextneg, 1) + 1;
text(rx(1:(ridxzero-1))-.28, ry(1:(ridxzero-1))-.07, rtextneg);
text(rx(ridxzero)-.08, ry(ridxzero)-.07, 'R_0=0');
text(rx((ridxzero+1):size(rx,2))-.08, ry((ridxzero+1):size(rx,2))-.07, rtextpos);

%% legends
legend([hd; hq; hr], 'Source PDF', 'Quantization thresholds', 'Reconstruction values');
legend('boxoff');
axis off;
set(gca,'FontSize', 12);
set (gcf,'windowstyle','normal');
set (gcf,'Position',[500,300,832,240]);