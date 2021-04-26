addpath("src")

degree = 3;
f = figure("visible", "off");
for i=1:9
    filename = sprintf("input/hj%d.dat", i);
    points = dlmread(filename, " ");
    n = length(points);
    chordLengths = findChordLengths(points);
    knots = generateKnotVector(chordLengths(1), chordLengths(n), ceil(.2*n));
    A = computeEvaluationMatrix(chordLengths, knots, degree);
    coeff = A'*A\A'*points;
    evalPoints = linspace(chordLengths(1), chordLengths(n), 200)';
    evalMat = computeEvaluationMatrix(evalPoints, knots, degree);
    splinePoints = evalMat*coeff;
    %splinePoints = A*coeff;
    plot3(splinePoints(:,1), splinePoints(:,2), splinePoints(:,3), "DisplayName", filename);
    hold on;
end
set(gcf, "PaperPosition", [0,0,6,4]);
set(gcf, "PaperSize", [6,4]);
xlabel("x");
ylabel("y");
zlabel("z");
print -dpdf "figures/hf1.pdf";
