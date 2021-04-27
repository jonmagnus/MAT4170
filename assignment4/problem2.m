addpath("src");
layers = {};
degree = 3;
samplesPerLayer = 20;
numLayers = 9;
aKnots = regulateKnots(linspace(1, numLayers, 3)', degree);
bKnots = regulateKnots(linspace(1, samplesPerLayer, 7)', degree);
A = computeRegulatedEvaluationMatrix([1:numLayers]', aKnots, degree);
B = computeRegulatedEvaluationMatrix([1:samplesPerLayer]', bKnots, degree);
for i=1:numLayers
    filename = sprintf("input/hj%d.dat", i);
    points = dlmread(filename, " ");
    layers{i} = points;
end
griddedPoints = obtainGriddedPoints(layers, samplesPerLayer, degree, .05);
C = {};
for i=1:3
    G = griddedPoints(:,:,i);
    D = A'*A\A'*G;
    C{i} = (B'*B\B'*D')';
end
A = computeRegulatedEvaluationMatrix(linspace(1, numLayers, 30)', aKnots, degree);
B = computeRegulatedEvaluationMatrix(linspace(1, samplesPerLayer, 30)', bKnots, degree);
mesh = {};
mesh{1} = A*C{1}*B';
mesh{2} = A*C{2}*B';
mesh{3} = A*C{3}*B';
figure("visible", "off");
set(gcf, "PaperPosition", [0,0,6,4]);
set(gcf, "PaperSize", [6,4]);
surf(mesh{1}, mesh{2}, mesh{3});
xlabel("x");
ylabel("y");
zlabel("z");
print -dpdf "figures/problem2.pdf"
