function evaluationMatrix = computeEvaluationMatrix(points, knots, d)
    n = length(points);
    m = length(knots) - 1;  % Do not count the last knot
    evaluationMatrix = zeros(n,m);
    intervalIndex = 1;
    for i=1:n
        t = points(i);
        intervalIndex = findKnotInterval(t, intervalIndex, knots);
        shift = d + 1 - intervalIndex;
        periodicKnots = rotateAddKnots(shift, knots);
        B = evaluateSpline(t, periodicKnots, d);
        evaluationMatrix(i,:) = circshift([B; zeros(m - d - 1,1)], -shift)';
    end
endfunction 
