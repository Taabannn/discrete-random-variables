function [  ] = L5_1_S19_Binomial_to_Poisson( N, p )
%   showing the fact that when N -> infty and p -> 0 => Binomial -> Poisson
%   with mu = N*p
%   compute the pmf of the corresponding Binomial distribution.
    
    x = 0:N;
    y1 = binopdf(x,N,p);

%   compute the pdf of the corresponding Poisson distribution.

    mu = N*p;
    y2 = poisspdf(x,mu);
    
%   plot the pdfs on the same axis.
    y = zeros(N+1, 2);
    for i = 1:N+1
        y(i, 1) = y1(i);
        y(i, 2) = y2(i);
    end

    figure
    bar(y)
    xlabel('Observation')
    ylabel('Probability')
    title('Binomial and Poisson pdfs')
    legend('Binomial Distribution','Poisson Distribution','location','northeast')
end

