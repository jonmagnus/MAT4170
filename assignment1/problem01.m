c = [
    0,0;
    1,2;
    2,2;
    3,0
    ];

m = length(c);
n = 100;
points = zeros(n,2);
for i = 1:n
    t = i/n;
    points(i,:) = computebezier(c,t)(m,m,:);
end

x = points(:,1);
y = points(:,2);
plot(x,y,"DisplayName","curve");
hold on;
A = computebezier(c,.3);
for i = 1:m
    x = A(i,i:m,1);
    y = A(i,i:m,2);
    plot(x,y,"DisplayName", sprintf("$p_%d$", i), "-o");
end
legend
print -dtikz problem01
