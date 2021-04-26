function intervalIndex = findKnotInterval(point, prevIntervalIndex, knots)
    intervalIndex = prevIntervalIndex;
    while (intervalIndex < length(knots)
        && point >= knots(intervalIndex + 1))
        intervalIndex = intervalIndex + 1;
    end
endfunction
