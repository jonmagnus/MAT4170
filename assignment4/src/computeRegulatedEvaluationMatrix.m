function evaluationMatrix = computeRegulatedEvaluationMatrix(points, knots, d)
    n = length(points);
    m = length(knots) - d - 1;
    evaluationMatrix = zeros(n,m);
    intervalIndex = 1;
    for i=1:n
        t = points(i);
        intervalIndex = min(findKnotInterval(t, intervalIndex, knots), m);
        prunedKnots = knots(intervalIndex - d:intervalIndex + d);
        B = evaluateSpline(t, prunedKnots, d);
        evaluationMatrix(i,:) = circshift([B; zeros(m - d - 1,1)], intervalIndex - d - 1)';
    end
endfunction
