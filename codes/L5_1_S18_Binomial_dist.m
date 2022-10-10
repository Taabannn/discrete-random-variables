function [ x, y_pmf, mean, variance ] = L5_1_S18_Binomial_dist( num_of_trials, p )
%   computing binomial pmf 

    x = 0:num_of_trials;
    y_pmf = binopdf(x, num_of_trials, p);
    
%   plot the pmf with bars of width 1.

    figure
    bar(x,y_pmf,1)
    xlabel('Observation')
    ylabel('Probability')
    title('pmf of Binomial Distribution')

%   computing binomial cdf 
    
    y_cdf = binocdf(x, num_of_trials, p);
    
%   plot the cdf.

    figure
    stairs(x,y_cdf)
    xlabel('Observation')
    ylabel('Cumulative Probability')
    title('cdf of Binomial Distribution')
    
    str = 'for Binomial Distribution with N = %d and p = %d:\n';
    
    mean = expected_value(y_pmf);
    if(mean == num_of_trials*p)
        str = strcat(str, 'E[X] = np => E[X] = %d\n');
    else
        sprintf('contradiction')
        return;
    end
    
    variance = (x.^2) * y_pmf.' - mean^2;
    if(variance == num_of_trials*p*(1-p))
        str = strcat(str, 'V[X] = np(1-p) => V[X] = %d');
    else
        sprintf('contradiction')
        return;
    end
    sprintf(str, num_of_trials, p, mean, variance)
end

