function regularKnots = regulateKnots(knots, d)
    regularKnots = [knots(1)*ones(d,1);knots;knots(length(knots))*ones(d,1)];
endfunction
