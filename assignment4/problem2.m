addpath("src");
layers = {};
degree = 3;
samplesPerLayer = 20;
numLayers = 9;
%A = computeRegulatedEvaluationMatrix([1:numLayers]',regulateKnots(linspace(0,numLayers,5)',degree), degree);
A = computeEvaluationMatrix([1:numLayers]',[1:numLayers + 1]', degree);
B = computeEvaluationMatrix([1:samplesPerLayer]',[1:samplesPerLayer + 1]', degree);
for i=1:numLayers
    filename = sprintf("input/hj%d.dat", i);
    points = dlmread(filename, " ");
    layers{i} = points;
end
griddedPoints = obtainGriddedPoints(layers, samplesPerLayer, degree, .2);
C = {};
for i=1:3
    G = griddedPoints(:,:,i);
    D = A'*A\A'*G;
    C{i} = (B'*B\B'*D')';
end
A = computeEvaluationMatrix(linspace(1,numLayers,30)',[1:numLayers + 1]', degree);
B = computeEvaluationMatrix(linspace(1,samplesPerLayer,30)',[1:samplesPerLayer + 1]', degree);
A*C*B'
