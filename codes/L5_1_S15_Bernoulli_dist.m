function [ x, y_pmf, mean, variance ] = L5_1_S15_Bernoulli_dist( p )
%   computing bernoulli pmf 

    x = 0:1;
    y_pmf = [1-p, p];
    
%   plot the pmf with bars of width 1.

    figure
    bar(x,y_pmf,1)
    xlabel('Observation')
    ylabel('Probability')
    title('pmf of Bernoulli Distribution')
    
%   computing bernoulli cdf 
    
    y_cdf = [1-p, 1];
    
%   plot the cdf

    figure
    stairs([-0.5 x 1.5],[0 y_cdf 1])
    xlabel('Observation')
    ylabel('Cumulative Probability')
    title('cdf of Bernoulli Distribution')
    
%   calculating mean and variance
    mean = x * y_pmf.';
    variance = (x.^2) * y_pmf.' - mean^2;
    
    str = 'for Bernoulli Distribution with p = %d:\n';
    
    if(mean == p)
        str = strcat(str, 'E[X] = p => E[X] = %d\n');
    else
        sprintf('contradiction')
        return;
    end
    
    if(variance == p*(1-p))
        str = strcat(str, 'and V[X] = p(1-p) => V[X] = %d');
    else
        sprintf('contradiction')
        return
    end
    sprintf(str, p, mean, variance)
end

