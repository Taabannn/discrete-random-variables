function [ G_diff_1, G_diff_1_value_in1, status ] = L5_1_S2_probability_generating_func_derivation1( G, p )
%   based on slide2 lect05-1-discrete
%   Output of this function is G'(z)
%   and the inputs of this function are G(z) and p

    G_diff_1 = diff(G);
    
%   calculating G'(1) in order to show the fact that G'(1) = E[X]

    G_diff_1_value_in1 = limit(G_diff_1, 1);
    expected_val = expected_value(p);
    if expected_val == G_diff_1_value_in1
        status = 'dG/dz|z=1  = E[X]';
    else
        status = 'contradiction';
    end
end

