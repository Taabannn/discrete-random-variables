function [ CDF_min, PDF_min ] = L5_1_S9_distribution_of_minimum( P )
%   based on slide9 lect05-1-discrete
%   Outputs of this function is CDF_min (the cdf of min(X1, X2, ..., Xn)), 
%   PDF_min in which Xi are independent rvs and and matrix of P is concatinated
%   pmf of each rv. the inputs are p_N, p_X.

    [m, n] = size(P);
    CDF = zeros(m, n);
    for i = 1:m
        for j = 1:n
            CDF(i, j) = sum(P(i, 1:j));
        end
    end
    CDF_min = zeros(1, n);
    for i = 1:n
        mul = 1;
        for j = 1:m
            mul = mul * (1 - CDF(j, i));
        end
        CDF_min(i) = 1 - mul;
        PDF_min(i) = mul;
    end

end

