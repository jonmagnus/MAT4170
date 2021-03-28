function R = computeR(u,k,x)
    % u contains a subset of knots spanning the indices mu + 1 - k to mu + k.
    R = zeros([k,k + 1]);
    for i = 1:k
        R(i,i:i+1) = [u(i + k) - x, x - u(i)]/(u(i + k) - u(i));
    end
endfunction
