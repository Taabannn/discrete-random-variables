function [ expected_value ] = expected_value( p )
%   Output of this function is E[X]
%   and the input of is p(it's the random variable's pmf)

    expected_value = 0;
    for i = 1:length(p)
        expected_value = expected_value + (i - 1) * p(i);
    end
end

