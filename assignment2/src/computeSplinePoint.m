function c = computeSplinePoint(x, coefficients, knots, intervalIndex, degree)
    % Prune coefficient vector to remove irrelevnat coefficients.
    coeff = coefficients(intervalIndex - degree:intervalIndex)
    for k=degree:-1:1   % Distance between two knots considered
        for j=degree + 1:-1:degree + 2 - k
            coeff(j) = (
                coeff(j - 1)
                *(knots(intervalIndex + k + j - degree - 1) - x)
                +
                coeff(j)
                *(x - knots(intervalIndex + j - degree - 1))
            )/(knots(intervalIndex + k + j - degree - 1) - knots(intervalIndex + j - degree - 1));
        end
    end
    c = coeff(degree + 1);
endfunction
