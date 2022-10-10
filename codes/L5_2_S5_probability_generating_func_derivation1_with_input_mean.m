function [ G_diff_1, G_diff_1_value_in1, status ] = L5_2_S5_probability_generating_func_derivation1_with_input_mean( G, mean )
%   based on slide2 lect05-1-discrete
%   Output of this function is G'(z)
%   and the inputs of this function are G(z) and p

    G_diff_1 = diff(G);
    
%   calculating G'(1) in order to show the fact that G'(1) = E[X]

    G_diff_1_value_in1 = double(limit(G_diff_1, 1));
    if mean == G_diff_1_value_in1
        status = 'dG/dz|z=1  = E[X]';
    else
        status = 'contradiction';
    end
end


