function A = computeRightMatrix(griddedPoints, degree)
    %{
    We assume uniform knots in both directions.
    %}
    [n,m,] = size(griddedPoints);
    A = zeros(n, m + degree + 1);
    knots = [ones(d,1);1:m;m*ones(d,1)]
    for i=1:n
        B = evaluatePeriodicSpline(i,
    end
endfunction
