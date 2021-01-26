function [A] = computebezier(points, t)
    [n,m] = size(points);
    A = zeros(n,n,m);
    A(1,:,:) = points;
    for i = 2:n
        for j = i:n
            A(i,j,:) = (1 - t)*A(i - 1,j - 1,:) + t*A(i - 1, j,:);
        end
    end
end
