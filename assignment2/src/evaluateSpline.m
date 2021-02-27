function B = evaluateSpline(x, intervalIndex, knots, d) 
    B = zeros(d + 1, 1);
    B(d + 1) = 1;
    for k = 1:d
        for j = (d + 1 - k):d
            B(j) = (
                (
                    B(j)
                    *(x - knots(intervalIndex + j - d - 1))
                    /(knots(intervalIndex + j - d + k - 1) - knots(intervalIndex + j - d - 1))
                ) + (
                    B(j + 1)
                    *(knots(intervalIndex + j - d + k) - x)
                    /(knots(intervalIndex + j - d + k) - knots(intervalIndex + j - d))
            ));
        end
        B(d + 1) = (
            B(d + 1)
            *(x - knots(intervalIndex))
            /(knots(intervalIndex + k) - knots(intervalIndex))
        );
    end
endfunction
