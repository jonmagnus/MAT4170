addpath("src");
knots = [
    -1,-1,-1,-1,...
    0,1,2,3,4,...
    5,5,5,5
];

n = 101;
xList = linspace(-1,4.99,n);
degree = 3;
B = zeros(degree + 1, n)';
intervalIndex = 1;

for i=1:n
    intervalIndex = findKnotInterval(xList(i), intervalIndex, knots);
    B(i,:) = evaluateSpline(xList(i), intervalIndex, knots, degree);
end

quadric = zeros(n,1);
intervalIndex = 1;
for i=1:n
    x = xList(i);
    intervalIndex = findKnotInterval(xList(i), intervalIndex, knots);
    splineIndex = 9 - intervalIndex;
    if (splineIndex < 1 || splineIndex > 4)
        quadric(i) = 0;
    else
        quadric(i) = evaluateSpline(x, intervalIndex, knots, degree)(splineIndex);
    end
end

f = figure("visible", "off");
subplot(211);
plot(xList, B);
subplot(212);
plot(xList, quadric);
set(gcf, "PaperPosition", [0,0,6,4]);
set(gcf, "PaperSize", [6,4]);
print -dpdf "figures/plotWholeCubic.pdf";
