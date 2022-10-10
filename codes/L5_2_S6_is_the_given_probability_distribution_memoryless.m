function [ ] = L5_2_S6_is_the_given_probability_distribution_memoryless( p, i, j )
    % this function shows us that given probability distribution is
    % memoryless or not, based on the defination of being memoryless
    
    p_i = 1 - sum(p(1:i));
    p_j = 1 - sum(p(1:j));
    p_iPlusj = 1 - sum(p(1:i+j));
    p_conditional = p_iPlusj / p_i;
    if(p_conditional - p_j < 0.001)
        sprintf('given distribution is memoryless')
    else
        sprintf('given distribution is not memoryless')
    end
    
end

