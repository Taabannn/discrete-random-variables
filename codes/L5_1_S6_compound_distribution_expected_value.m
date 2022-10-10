function [ E_Y, status ] = L5_1_S6_compound_distribution_expected_value( p_N, p_X )
%   based on slide6 lect05-1-discrete
%   Output of this function is E_Y (the expected value of Y = X1 + X2 + ... 
%   XN), in which Xi are i.i.d rvs and also pmfs of N, Xi are given
%   the inputs are p_N, p_X.

    p_Y = 1;
    E_Y = zeros(1, length(p_N));
    for i=1:length(p_N)
        E_Y(i) = expected_value(p_Y);
        p_Y = conv(p_Y, p_X);
    end 
    
    E_Y = mean(E_Y);
    E_N = expected_value(p_N);
    E_X = expected_value(p_X);
    expected = E_X * E_N;
    if(E_Y - expected < 0.001)
        status = 'E[X1 + X2 + ... + XN] = E[N]E[X]';
    else
        status = ('contradiction');
    end
end

