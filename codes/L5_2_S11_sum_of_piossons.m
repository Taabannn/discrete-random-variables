function [  ] = L5_2_S11_sum_of_piossons( lambda1, lambda2 )
%   with the given lambdas, we calculate corresponding poisspdfs,
%   we also calculate the poisspdf with lambda1+lambda2 parameter 
%   and then we are going to compare the conv of two piosson dist with
%   lambda1, 2 with this pdf. if they are equal then we can say that sum of
%   independent poisson rvs is distributed as poisson with parameter
%   lambda1 + lambda2

    N = 10;
    lambda = lambda1 + lambda2;
    x = 0:N;
    y1 = poisspdf(x, lambda1);
    y2 = poisspdf(x, lambda2);
    convolution = conv(y1, y2);
    y = poisspdf(0:N, lambda);
    if(norm(convolution(1:N+1) - y) < 0.001)
        sprintf('sum of two independent poisson with parameters lambda1 = %d and lambda2 = %d is a poisson with parameter lambda = %d', lambda1, lambda2, lambda)
    else
        sprintf('contradiction')
    end
end

