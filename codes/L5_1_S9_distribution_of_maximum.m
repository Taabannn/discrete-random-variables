function [ CDF_max ] = L5_1_S9_distribution_of_maximum( P )
%   based on slide9 lect05-1-discrete
%   Output of this function is CDF_max (the cdf of max(X1, X2, ..., Xn)), 
%   in which Xi are independent rvs and and matrix of P is concatinated
%   pmf of each rv. the inputs are p_N, p_X.

    [m, n] = size(P);
    CDF = zeros(m, n);
    for i = 1:m
        for j = 1:n
            CDF(i, j) = sum(P(i, 1:j));
        end
    end
    CDF_max = zeros(1, n);
    for i = 1:n
        mul = 1;
        for j = 1:m
            mul = mul * CDF(j, i);
        end
        CDF_max(i) = mul;
    end
end

