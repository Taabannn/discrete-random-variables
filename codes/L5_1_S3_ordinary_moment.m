function [ M_i, status ] = L5_1_S3_ordinary_moment( index, p, G )
%   based on slide3 lect05-1-discrete
%   Output of this function is M_i (ordinary moment)
%   and the inputs are index, p(pmf), G(Generaing function of probability 
%   distribution p)

    M_i = 0;
    for i = 1:length(p)
        M_i = M_i + (i - 1)^index * p(i);
    end

%   calculating i-th drivation of G in order to show the fact the value of 
%   d/dz(z d/dz)^(i-1) in 1 is equal to E[X^i]

    syms z
    temp = G;
    if index == 1
        G_diff_index = diff(temp);
    else
        for i = 1:index-1
            G_diff_index = expand(z * diff(temp));
            temp = G_diff_index;
        end
        G_diff_index = diff(temp);
    end
    
    G_diff_index_value_in1 = limit(G_diff_index, 1);
        
    if G_diff_index_value_in1 == M_i
        status = 'the value of d/dz(z d/dz)^(i-1) in 1 is equal to E[X^i]';
    else
        status = 'contradiction';
    end
end

