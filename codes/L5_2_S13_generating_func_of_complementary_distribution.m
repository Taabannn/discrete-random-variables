function [ Q ] = L5_2_S13_generating_func_of_complementary_distribution( p ) %#ok<*FNDEF>
%   First of all we calculate the value of q or complementary distribution,
%   then we obtain the generating function of this distribution and compare
%   it with (1-P(z))/(1-z)

    q = zeros(1, length(p));
    for i = 1:length(p)-1
        q(i) = sum(p(i+1: end));
    end
    syms z
    Q = L5_1_S2_probability_generating_func(q);
    G1 = 1 - L5_1_S2_probability_generating_func(p);
    G2 = expand(Q * (1 - z));
    if(G1 == G2)
        sprintf('Q(z) = (1-P(z))/(1-z)')
    else
        sprintf('contradiction')
    end
end

