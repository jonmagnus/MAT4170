addpath("src");
knots = [
    -1,-1,-1,-1,...
    0,1,2,3,4,...
    5,5,5,5
];

n = 101;
xList = linspace(-1,0,n);
degree = 3;
B = zeros(degree + 1, n)';
intervalIndex = 1;

for i=1:n
    intervalIndex = findKnotInterval(xList(i), intervalIndex, knots);
    B(i,:) = evaluateSpline(xList(i), intervalIndex, knots, degree);
end

f = figure("visible", "off");
plot(xList, B);
set(gcf, "PaperPosition", [0,0,6,4]);
set(gcf, "PaperSize", [6,4]);
print -dpdf "figures/plotSplines.pdf";
