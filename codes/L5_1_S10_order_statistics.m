function [ F_Y_matrix ] = L5_1_S10_order_statistics( p, n )
%   based on slide10 lect05-1-discrete
%   Output of this function is F_Y_matrix (which represents CDF of each Yi 
%   or i-th order statistic)
%   and the inputs are index, p (the pmf of rv X), n (num of Xi s)

    F_X = zeros(1, length(p));
    for i = 1:length(p)
        F_X(i) = sum(p(1:i));
    end
    F_Y_matrix = zeros(length(F_X), n);
    for i = 1:length(F_X)
        summation = 0;
        for j = 1:n
            summation = summation + nchoosek(n, j)*(F_X(i))^j*(1-F_X(i))^(n-j);
            F_Y_matrix(i, j) = summation;
        end
    end
end

