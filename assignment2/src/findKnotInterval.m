function [intervalIndex] = findKnotInterval(x, intervalIndex, knots)
    % Assuming the most common use case is evaluating an 
    % increasing sequence of points, so we settle for a simple
    % linear search instead of the more natural binary search.
    while (
        intervalIndex < length(knots) 
        && x >= knots(intervalIndex + 1)
    )
        intervalIndex = intervalIndex + 1;
    end
endfunction
