function c = computeSplinePoint(x, coefficients, knots, intervalIndex, degree)
    % Prune coefficient vector to remove irrelevnat coefficients.
    coeff = coefficients(intervalIndex - degree:intervalIndex);
    for k=degree:-1:1   % Distance between two knots considered
        for j=degree + 1:-1:degree + 2 - k
            baseIndex = intervalIndex + j - degree - 1;
            coeff(j) = (
                coeff(j - 1)*(knots(baseIndex + k) - x)
                + coeff(j)*(x - knots(baseIndex))
            )/(knots(baseIndex + k) - knots(baseIndex));
        end
    end
    c = coeff(degree + 1);
endfunction
