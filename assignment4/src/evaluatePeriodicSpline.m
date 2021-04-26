function B = evaluatePeriodicSpline(point, knots, d)
    B = zeros(d + 1, 1);
    B(d + 1) = 1;
    for i = 1:d
        for j = (d + 1 - i):(d + 1)
            firstTerm = (
                B(j)*(point - knots(j))
                /(knots(j + i) - knots(j))
            );
            secondTerm = 0;
            if (j != d + 1)
                % Avoid special case when dealing with last term
                secondTerm = (
                    B(j + 1)*(knots(j + i + 1) - point)
                    /(knots(j + i + 1) - knots(j + 1))
                );
            end
            B(j) = firstTerm + secondTerm;
        end
    end
endfunction
