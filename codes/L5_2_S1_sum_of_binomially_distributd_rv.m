function [ ] = L5_2_S1_sum_of_binomially_distributd_rv( k, N_vector, p )
%   Detailed explanation goes here

    N = sum(N_vector);
    G_by_calclating_multiplication = 1;
    for i = 1:k
        n = N_vector(i);
        x = 0:n;
        y = binopdf(x, n, p);
        G_by_calclating_multiplication = expand(G_by_calclating_multiplication * L5_1_S2_probability_generating_func(y));
    end
    Y = binopdf(0:N, N, p);
    G = L5_1_S2_probability_generating_func(Y);
    if(G_by_calclating_multiplication == G)
        sprintf('G_by_calclating_multiplication of n bernoullis generating funcs is equal to gen func of corresponding binomially distributed rv')
    else
        sprintf('contradiction')
    end
    
end

