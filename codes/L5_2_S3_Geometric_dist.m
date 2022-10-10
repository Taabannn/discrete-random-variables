function [ y_pmf, mean, variance ] = L5_2_S3_Geometric_dist( p )
%   computing geometric pmf 

    x = 0:100;
    y_pmf = geopdf(x, p);
    
%   plot the pmf with bars of width 1.

    figure
    bar(x,y_pmf,1)
    xlabel('Observation')
    ylabel('Probability')
    title('pmf of Geometric Distribution')
    
%   computing geometric cdf 

    y_cdf = geocdf(x,p);
    
%   Plot the cdf.

    figure
    stairs(x,y_cdf)
    xlabel('Observation')
    ylabel('Cumulative Probability')
    title('cdf of Geometric Distribution')
    
    str = 'for Geometric Distribution with p = %d:\n';
    
    [mean , variance] = geostat(p);
    if(mean == (1-p)/p)
        str = strcat(str, 'E[X] = (1-p)/p => E[X] = %d\n');
    else
        sprintf('contradiction')
        return;
    end
    
    v_th = (1-p)/(p^2);
    if(variance == v_th)
        str = strcat(str, 'V[X] = (1-p)/p^2 => V[X] = %d');
    else
        sprintf('contradiction')
        return;
    end
    sprintf(str, p, mean, variance)
end

