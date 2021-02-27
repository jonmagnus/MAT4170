function B = evaluateSpline(x, intervalIndex, knots, d) 
    B = zeros(d + 1, 1);
    B(d + 1) = 1;
    for k = 1:d
        for j = (d + 1 - k):(d + 1)
            baseIndex = intervalIndex + j - d - 1;
            firstTerm = 0;
            secondTerm = 0;
            if j != (d + 1 - k)
                firstTerm = (
                    B(j)*(x - knots(baseIndex))
                    /(knots(baseIndex + k) - knots(baseIndex))
                );
            end
            if j != (d + 1)
                secondTerm = (
                    B(j + 1)*(knots(baseIndex + 1 + k) - x)
                    /(knots(baseIndex + 1 + k) - knots(baseIndex + 1))
                );
            end
            B(j) = firstTerm + secondTerm;
        end
    end
endfunction
