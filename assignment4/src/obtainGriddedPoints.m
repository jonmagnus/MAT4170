function griddedPoints = obtainGriddedPoints(layers, samplesPerLayer, degree, interpolationKnotFraction)
    m = length(layers);
    griddedPoints = zeros(m,samplesPerLayer,3);
    for i=1:m
        points = layers{i};
        n = length(points);n = length(points);
        chordLengths = findChordLengths(points);
        knots = generateKnotVector(chordLengths(1), chordLengths(n), ceil(interpolationKnotFraction*n));
        A = computeEvaluationMatrix(chordLengths, knots, degree);
        coeff = A'*A\A'*points;
        %griddedLengths = linspace(chordLengths(1), chordLengths(n), samplesPerLayer + 1)(1:samplesPerLayer)';
        griddedLengths = linspace(chordLengths(1), chordLengths(n), samplesPerLayer)';
        griddedEvalMat = computeEvaluationMatrix(griddedLengths, knots, degree);
        griddedPoints(i,:,:) = griddedEvalMat*coeff;
    end
endfunction
