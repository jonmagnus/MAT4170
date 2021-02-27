addpath("src");
knots = [
    -1,-1,-1,-1,...
    0,1,2,3,4,...
    5,5,5,5
];
coefficients = [
    %-1,-1,-1,-1,...
    -1,...
    1,-1,1,-1,1,...
    -1,-1,-1,-1
];

n = 101;
xList = linspace(-1,4.9,n);
degree = 3;
c = zeros(n,1);
intervalIndex = 1;

for i=1:n
    x = xList(i);
    intervalIndex = findKnotInterval(x, intervalIndex, knots)
    c(i) = computeSplinePoint(x, coefficients, knots, intervalIndex, degree);
end

% Plotting stuff
f = figure("visible", "off");
plot(xList, c);
hold on;
%plot(knots(4:), coefficients);
set(gcf, "PaperPosition", [0,0,6,4]);
set(gcf, "PaperSize", [6,4]);
print -dpdf "figures/plotSplineCurve.pdf";
