function plotrdq(rdq_mode, pair_mode, z, s, f, mu)
%PLOTRDQ Plot RDQ relationship figures for a series of quantizers
%   rdq_mode:   Choose figures to plot: 1-RD, 2-RQ, 3-DQ, 4-RD'
%   pair_mode:  Choose to plot based on z, f and mu:
%               1-varing z/f pairs and fixed mu, 
%               2-fixed z varing f and fixed mu, 
%               3-varying z fixed f and fixed mu, 
%               4-fixed z/f pair and varing mu
%               5-varying z-f=c linear patterns and fixed mu
%   z:          DZ+UTSQ/NURQ dead-zone ratio
%   s:          DZ+UTSQ/NURQ quantization step size
%   f:          DZ+UTSQ/NURQ reconstruction offset
%   mu:         Cauchy distribution shape parameter

%% usage
% 
%     plotrdq(1, 5, [2/3. 2/3, 5/6, 5/4], 0.625:224, [1/3, 1/9, 0, 0], 0.2);
%

%% extract z, p, mu and plot for each case

hold off;

assert(isnumeric(z), 'z array is not numeric!');
assert(isnumeric(f), 'f array is not numeric!');
assert(isnumeric(mu), 'mu array is not numeric!');

zsize = numel(z);
fsize = numel(f);
dg = [0 0.5 0];
plot_linestyle = char(':','--','-.','-');
plot_color = char('k','b','r','[0 0.5 0]');
plot_line_style = char('-r','--m','-.b','-k','-ks','-ko','-kx');% 7 styles for the plot

if pair_mode == 1 % varing z/f pairs and fixed mu
    assert(zsize == fsize, 'z and f are not in pairs!\n');
    assert(numel(mu) == 1, 'too many mu elements!');
    handle(zsize, 1) = 0;
    legend_str = cell(zsize, 1);% init legend_str array
    for idx = 1:zsize 
        [x, y] = rdq(rdq_mode, z(idx), s, f(idx), mu);
        style_idx = idx - floor((idx-1)/4)*4;
        %handle(idx) = plot(x, y, 'Color', plot_color(style_idx,:), 'LineStyle', plot_linestyle(style_idx, :));
        handle(idx) = plot(x, y, plot_line_style(idx,:));
        legend_str{idx} = strcat('z=',strtrim(rats(z(idx))), ', f=',strtrim(rats(f(idx))));% set the legend content of each plotted line
        hold all;
    end
    if(rdq_mode == 4)
        ylim([0 30]); % control the range of y-axis
        grid on;
    end
    xlim([0 1.5]); % control the range of x-axis
    set(gca, 'XTick', 0:0.3:1.5);% control the scale of x-axis
     %legend(handle, legend_str, 'Location', 'SouthEast');
elseif pair_mode == 2 % fixed z varing f and fixed mu
        assert(fsize > 0, 'too few f elements');
        assert(numel(mu) == 1, 'too many mu elements!');
        handle(fsize, 1) = 0;
        legend_str = cell(fsize, 1);% init legend_str array
        for idx = 1:fsize
            [x, y] = rdq(rdq_mode, z, s, f(idx), mu);
            handle(idx) = plot(x, y, plot_line_style(idx,:));
            legend_str{idx} = strcat('f=',strtrim(rats(f(idx))));% set the legend content of each plotted line
            hold all;
        end
        xlim([0 1]); % control the range of x-axis
elseif pair_mode == 3 % varying z fixed f and fixed mu
        assert(zsize > 0, 'too few z elements!');
        assert(numel(mu) == 1, 'too many mu elements!');
        handle(zsize, 1) = 0;
        legend_str = cell(zsize, 1);% init legend_str array
        for idx = 1:zsize
            [x, y] = rdq(rdq_mode, z(idx), s, f, mu);
            handle(idx) = plot(x, y, plot_line_style(idx,:));
            legend_str{idx} = strcat('z=',strtrim(rats(z(idx))));% set the legend content of each plotted line
            hold all;
        end
        xlim([0 1]); % control the range of x-axis
elseif pair_mode == 4 % fixed z/f pair and varing mu
    musize = numel(mu);
    assert(musize > 0, 'too few mu elements!\n');
    assert(zsize == 1, 'too many z elements!');
    assert(fsize == 1, 'too many f elements!');
    handle(musize, 1) = 0;
    legend_str = cell(musize, 1);% init legend_str array
    for idx = 1:musize
        [x, y] = rdq(rdq_mode, z, s, f, mu(idx));
        handle(idx) = plot(x, y, plot_line_style(idx,:));
        legend_str{idx} = strcat('mu=',num2str(mu(idx)));% set the legend content of each plotted line
        hold all;
%         disp(x);
%         disp(y);
    end
    if(rdq_mode == 4)
        ylim([3 18]); % control the range of y-axis
        set(gca, 'YTick', 0:3:18);% control the scale of y-axis
        grid on;
    end
    xlim([0 4.8]); % control the range of x-axis
    set(gca, 'XTick', 0:0.8:4.8);% control the scale of x-axis
    %set(gca, 'GridLineStyle', ':');
else % varing z-f=c linear patterns and fixed mu
    assert(zsize == fsize, 'z and f are not in pairs!\n');
    assert(numel(mu) == 1, 'too many mu elements!');
    handle(zsize, 1) = 0;
    legend_str = cell(zsize, 1);% init legend_str array
    for idx = 1:zsize
        [x, y] = rdq(rdq_mode, z(idx), s, f(idx), mu);
        style_idx = idx - floor((idx-1)/4)*4;
        %handle(idx) = plot(x, y, 'Color', plot_color(style_idx,:), 'LineStyle', plot_linestyle(style_idx, :));
        handle(idx) = plot(x, y, plot_line_style(idx,:));
        legend_str{idx} = strcat('z-f=',strtrim(rats(z(idx) - f(idx))));% set the legend content of each plotted line
        hold all;
    end
    if(rdq_mode == 4)
        ylim([0 30]); % control the range of y-axis
        grid on;
    end
    xlim([0 1.5]); % control the range of x-axis
    set(gca, 'XTick', 0:0.3:1.5);% control the scale of x-axis
end
grid on
set(findobj('type','line'), 'LineWidth', 2.5);
set(handle(4), 'LineWidth', 1.0);
set(gca, 'FontSize', 14);
set(get(gca,'XLabel'),'FontSize',18);
set(get(gca,'YLabel'),'FontSize',18);
putlegend(rdq_mode, handle, legend_str);
set (gcf,'windowstyle','normal');
set (gcf,'Position',[500,300,640,360]);
end

function putlegend(rdq_mode, handle, legend_str)
switch(rdq_mode)
    case 1 % RD
        h = legend(handle, legend_str, 'Location', 'SouthEast');
    case 2 % RQ
        h = legend(handle, legend_str, 'Location', 'NorthEast');
    case 3 % DQ
        h = legend(handle, legend_str, 'Location', 'NorthWest');
    case 4 % RD derivative
        h = legend(handle, legend_str, 'Location', 'NorthEast');
end
set(h, 'FontSize', 16);    
end

function [x, y] = rdq(rdq_mode, z, s, f, mu)
switch (rdq_mode)
    case 1 % RD
        [x, y] = rd(z, s, f, mu);
        xlabel('Rate (bits/sample)');
        ylabel('PSNR');
    case 2 % RQ
        x = s;
        y = rq(z, s, mu);
        xlabel('Quantization Step');
        ylabel('Rate (bits/sample)');
    case 3 % DQ
        x = s;
        y = dq(z, s, f, mu);
        xlabel('Quantization Step');
        ylabel('MSE');
    case 4 % RD derivative
        [r, d] = rd(z, s, f, mu);
        [x, y] = approxdiff(r, d);
        xlabel('Rate (bits/sample)');
        ylabel('PSNR Derivative');
    otherwise % unexpected
        x = 0;
        y = 0;
end
end

