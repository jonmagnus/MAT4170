function b = oslo(c, tau, t, d)
    m = length(t) - d - 1;
    b = zeros([m,1]);
    mu = 1;
    for i = 1:m
        while tau(mu + 1) <= t(i)
            mu = mu + 1;
        end
        c_ = c(mu - d:mu);
        for k = d:-1:1
            R = computeR(tau(mu + 1 - k:mu + k),k,t(i + k));
            c_ = R*c_;
        end
        if length(c_) != 1 
            error("c is not of length 1");
        end
        b(i) = c_(1);
    end
endfunction
