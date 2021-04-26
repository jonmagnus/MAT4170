function B = evaluatePeriodicSpline(point, knots, d)
    B = zeros(d + 1, 1);
    B(d + 1) = 1;
    for i = 1:d
        for j = (d + 1 - i):(d + 1)
            if (j == d + 1 - i || knots(j) == knots(j + i))
                firstTerm = 0;
            else
                firstTerm = (
                    B(j)*(point - knots(j))
                    /(knots(j + i) - knots(j))
                );
            end
            if (j == d + 1 || knots(j + 1) == knots(j + i + 1))
                secondTerm = 0;
            else
                secondTerm = (
                    B(j + 1)*(knots(j + i + 1) - point)
                    /(knots(j + i + 1) - knots(j + 1))
                );
            end
            B(j) = firstTerm + secondTerm;
        end
    end
endfunction
