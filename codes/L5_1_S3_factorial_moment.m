function [ F_i, G_diff_index_value_in1, status ] = L5_1_S3_factorial_moment( index, p, G )
%   based on slide2 lect05-1-discrete
%   Output of this function is F_i (factorial moment)
%   and the inputs are index, p(pmf), G(in order to check the given fact in slide 2)

    F_i = 0;
    for i = 1:length(p)
        mul = 1;
        for j = 1:index
            mul = mul * (i - j);
        end
        F_i = F_i + mul * p(i);
    end
    
%   calculating i-th drivation of G in order to show the fact the value of 
%   it in 1 is equal to E[X(X-1)...(X-i+1)]

    temp = G;
    for i = 1:index
        G_diff_index = diff(temp);
        temp = G_diff_index;
    end
    G_diff_index_value_in1 = limit(G_diff_index, 1);
    
    if G_diff_index_value_in1 == F_i
        status = 'the value of i-th drivation of G in 1 is equal to E[X(X-1)...(X-i+1)]';
    else
        status = 'contradiction';
    end
end

