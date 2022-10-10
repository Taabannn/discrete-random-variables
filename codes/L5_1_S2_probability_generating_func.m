function [ G, G_value_in1, is_probab_dist ] = L5_1_S2_probability_generating_func( p )
%   based on slide2 lect05-1-discrete
%   Output of this function is G(z)
%   and the input of it is p_i and i = 0:n & n -> infty

    syms z
    G = 0;
    for i = 1:length(p)
        G = G + (z^(i - 1)) * p(i);
    end

%   calculating G(1) in order to find out whether p represents probability
%   distribution or not. 
%   G(1) = 1 <=> it's probability distribution

    G_value_in1 = limit(G,z,1);
    
    if G_value_in1 == 1
        is_probab_dist = 'given vector is a probability distribution';
    else
        is_probab_dist = 'given vector is not a probability distribution';
    end
end

