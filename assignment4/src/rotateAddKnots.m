function rotatedKnots = rotateAddKnots(r, knots)
    % Knots are assumed to be periodic, so knot n coincides with knot 1.
    n = length(knots);
    if (r > 0)
        rotatedKnots = [knots(n - r:n - 1) - knots(n) + knots(1); knots(1:n - r)];
    elseif (r < 0)
        rotatedKnots = [knots(1 - r:n - 1); knots(1:1 - r) + knots(n) - knots(1)];
    else
        rotatedKnots = knots;
    end
endfunction
