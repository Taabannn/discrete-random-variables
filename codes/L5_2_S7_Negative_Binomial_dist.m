function [ y_pdf ] = L5_2_S7_Negative_Binomial_dist( R, p )
%   computing the pmf of a negative binomial distribution with parameters R and p.

    x = (0:20);
    y_pdf = nbinpdf(x,R,p);
%   Plot the pdf.

    figure;
    plot(x,y_pdf,'+')
    xlim([-0.5,10.5])
    xlabel('Observation')
    ylabel('Probability')
    title('pmf of Negative Binomial Distribution')
    
%   computing negative binomial cdf 
    
    y_cdf = nbincdf(x, R, p);
    
%   plot the cdf.

    figure
    stairs(x,y_cdf)
    xlabel('Observation')
    ylabel('Cumulative Probability')
    title('cdf of Negative Binomial Distribution')
    
    str = 'for Negative Binomial Distribution with p = %d:\n';
    
    [mean , variance] = nbinstat(R, p);
    if(double(mean) == R)
        str = strcat(str, 'E[X] = R/p => E[X] = %d\n');
    else
        sprintf('contradiction')
        return;
    end
    
    v_th = R * ((1-p)/(p^2));
    if(double(variance) == v_th)
        str = strcat(str, 'V[X] = R (1-p)/p^2 => V[X] = %d');
    else
        sprintf('contradiction')
        return;
    end
    sprintf(str, p, mean, variance)

end

