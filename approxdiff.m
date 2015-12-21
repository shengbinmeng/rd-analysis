function [x, d] = approxdiff(xdata, ydata)
%APPROXDIFF Approximate differentiation with given data point pairs
%   Approximate the Three Point Formula, but the data points may not be
%   equally spaced.

size = numel(xdata);
assert(size == numel(ydata));
assert(size >= 3);

x = xdata(2:size-1);
d(1,1:size-2) = 0;

for i = 1:size-2
    d(i) = (ydata(i+2) - ydata(i)) / (xdata(i+2) - xdata(i));
end

end
