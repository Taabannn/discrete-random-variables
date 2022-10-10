function [ y_pdf, mean, variance ] = L5_2_S8_Poisson_dist( lambda )
%   computing the pmf of a Poisson distribution with parameters lambda.

    x = (0:50);
    y_pdf = poisspdf(x,lambda);
    
%   Plot the pdf.

    figure;
    plot(x,y_pdf,'+')
    xlim([-0.5,10.5])
    xlabel('Observation')
    ylabel('Probability')
    title('pmf of Poisson Distribution')
    
%   computing Poisson cdf 
    
    y_cdf = poisscdf(x,lambda);
    
%   plot the cdf.

    figure
    stairs(x,y_cdf)
    xlabel('Observation')
    ylabel('Cumulative Probability')
    title('cdf of Poisson Distribution')
    
    str = 'for Poisson Distribution with lambda = %d:\n';
    
    [mean , variance] = poisstat(lambda);
    if(double(mean) == lambda)
        str = strcat(str, 'E[X] = lambda => E[X] = %d\n');
    else
        sprintf('contradiction')
        return;
    end
    
    if(double(variance) == lambda)
        str = strcat(str, 'V[X] = lambda => V[X] = %d');
    else
        sprintf('contradiction')
        return;
    end
    sprintf(str, lambda, mean, variance)

end

