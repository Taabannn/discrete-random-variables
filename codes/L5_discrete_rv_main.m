clc
clear
close all

% Lecture 5 (discrete random variables)
% Author: Taban Soleymani

%% slide 2 & 3 & 4
% slide2
% firstly in probability_generating_func G(z) is calculated
% then based on G(1), it's been reported whether p represents probability
% distribution or not. 

p_1 = [0 0.5 0.25 1];
p_2 = [0.25 0 0.25 0 0.25 0 0.25];

[G_1, ~, status1] = L5_1_S2_probability_generating_func( p_1 );
sprintf('Generating function of p_1 vector is %s and based on G(1) %s', G_1, status1)

[G_2, ~, status2] = L5_1_S2_probability_generating_func( p_2 );
sprintf('Generating function of p_2 vector is %s and based on G(1) %s', G_2, status2)


% in order to show the fact that G'(1) = E[X] for a probability distribution like p_2,
% we run probability_generating_func_derivation1, firstly in 
% probability_generating_func_drivation1 G' is calculated then the fact that
% G'(1) = E[X] (for a given probability distribution) or not is checked

[ G2_diff_1, ~, status ] = L5_1_S2_probability_generating_func_derivation1(G_2, p_2);
sprintf('For probability distribution p_2, the derivation1 is %s and based on the value of it in point 1 we have: %s', G2_diff_1, status)

% in order to show the fact that the value of i-th drivation of G in 1 
% is equal to E[X(X-1)...(X-i+1)] (in other words, factorial moment) 
% we run factorial_moment function. 
% firstly in factorial moment F_i is calculated, and then we show above fact.

index = 4;
[F_i, ~, status] = L5_1_S3_factorial_moment(index, p_2, G_2);
sprintf('For probability distribution p_2, the factorial moment for i = %d is %d and based on the value of i-th derivation of G in point 1 we have: %s', index, F_i, status)

% slide3
% now we are going to show the relation between (some) factorial and ordinary
% moments, firstly we calculate factorial and ordinary moments for i = 1,
% 2, 3. Then, we checked mentioned relations:
% F1 = M1
% F2 = M2 - M1
% F3 = M3 - 3 M2 + 2 M1

F3 = L5_1_S3_factorial_moment(3, p_2, G_2);
F2 = L5_1_S3_factorial_moment(2, p_2, G_2);
F1 = L5_1_S3_factorial_moment(1, p_2, G_2);

[M3, status3] = L5_1_S3_ordinary_moment(3, p_2, G_2);
[M2, status2] = L5_1_S3_ordinary_moment(2, p_2, G_2);
[M1, status1] = L5_1_S3_ordinary_moment(1, p_2, G_2);

if(F1 == M1)
    sprintf('F1 = M1')
else
    sprintf('contradiction')
end

if(F2 == M2 - M1)
    sprintf('F2 = M2 - M1')
else
    sprintf('contradiction')
end

if(F3 == M3 - 3 * M2 + 2 * M1)
    sprintf('F3 = M3 - 3M2 + 2M1')
else
    sprintf('contradiction')
end

% slide4
% in order to check the relation between derivations of G and ordinary
% moments, we print the status(the output of ordinary moment which has been
% initialized above)

sprintf('for M1 we have: %s', status1)
sprintf('for M2 we have: %s', status2)
sprintf('for M3 we have: %s', status3)

%% slide 5
% generating function of the sum of independent random variables X, Y is 
% equal to G_X(z)*G_Y(Z), and the pmf of Z = X + Y is equal to convolution
% of P(X) and P(Y)
% firstly we defined two probability mass function p1 and p2, then we
% obtain the conv of these to p. in second step we obtain the generating
% function of p1, p2 and p and then we checked wether G = G1 * G2 or not.

p1 = [0.05 0.1 0 0 0 0.25 0.1 0.3 0.05 0.15];
p2 = [0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1];

p = conv(p1, p2);
G1 = L5_1_S2_probability_generating_func(p1);
G2 = L5_1_S2_probability_generating_func(p2);
G = L5_1_S2_probability_generating_func(p);

if(G == expand(G1*G2))
    sprintf('Generating function of Z = X+Y is equal to Gx*Gy and Distribution of Z is obtained from conv of X, Y Distribution')
else
    sprintf('contradiction')
end

%% slide 6 & 7 & 8
% We are going to show that the expectation of sum of i.i.d rvs Xi is equal
% to E[N]*E[X], in which N is given distribution and represents the number
% of rvs

p_N = [0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1];
p_X = [0.2 0.2 0.2 0.2 0.2];
[ E_Y, status ] = L5_1_S6_compound_distribution_expected_value( p_N, p_X );
sprintf('for given p_N and p_X the value of E[Y] = %d and we show the fact that %s', E_Y, status)

%% slide 9
% we plot the CDF of max/min(X1, X2, ..., Xn) in which Xi are independent
% rvs

P = [0.1 0 0.9 0;
     0.5 0.2 0.1 0.2;
     0.4 0.3 0.2 0.1];
F_max = L5_1_S9_distribution_of_maximum(P);
figure
stairs(-1:length(F_max), [0 F_max 1])
xlabel('x')
ylabel('Cumulative Probability')
title('cdf of Maximum Distribution')

[F_min, f_min] = L5_1_S9_distribution_of_minimum(P);
figure
stairs(-1:length(F_min), [0 F_min 1])
xlabel('x')
ylabel('Cumulative Probability')
title('cdf of Minimum Distribution')

%% slide 10 & 11 & 12 & 13
% Let X1, X2, . . . , Xn be mutually iid continuous RVs, each having 
% the distribution function F and density f and Y1, Y2, . . . , Yn be a 
% permutation of the set X1, X2, . . . , Xn so as to be in increasing order.
% F_Y_matrix represents CDF of each Yi or i-th order statistic.

p = [0.1 0.1 0.2 0.3 0.2 0.1];
n = 6;
F_Y_matrix = L5_1_S10_order_statistics(p, n);

%% slide 15 & 16 & 17
% Bernoulli Distribution
p = 0.75;
% in order to plot the cdf and pmf and also showing the mean and variance
[x_bernoulli, y_bernoulli, mean, variance] = L5_1_S15_Bernoulli_dist( p );

% Example 1
% firstly probability generating function of Bernoulli pmf will be
% calculated, then we compare the first derivation of G with E[X] or mean
G = L5_1_S2_probability_generating_func(y_bernoulli);
sprintf('and also generating function of this bernoulli distribution is %s ', G)
% we also compare the value of variance with the obtained formula by values
% of G_diff2 and G_diff1
Variance_by_G = diff(diff(G)) + diff(G) * (1 - diff(G));
if (Variance_by_G == variance)
    sprintf('and also we checked the fact that variance = limit(diff(diff(G)) + diff(G) * (1 - diff(G)), 1) for this distribution')
else
    sprintf('contradiction')
end

%% slide 18 & 19
% Binomial Distribution
% in order to plot the cdf and pmf and also showing the mean and variance
num_of_trials = 10;
p = 0.5;
[x_binomial, y_binomial, mean, variance] = L5_1_S18_Binomial_dist( num_of_trials, p );

% firstly probability generating function of Binomial pmf will be
% calculated, then we compare the first derivation of G with E[X] or mean
G = L5_1_S2_probability_generating_func(y_binomial);
sprintf('and also generating function of this binomial distribution is %s ', G)
% we also compare the value of variance with the obtained formula by values
% of G_diff2 and G_diff1
Variance_by_G = limit(diff(diff(G)) + diff(G) * (1 - diff(G)), 1);
if (Variance_by_G == variance)
    sprintf('and also we checked the fact that variance = limit(diff(diff(G)) + diff(G) * (1 - diff(G)), 1) for Binomial distribution')
else
    sprintf('contradiction')
end

% showing the fact that when N -> infty and p -> 0 => Binomial -> Poisson 
% with mu = N*p
N = 50;
p = 0.01;
% in this function we plot both binomial pmf and corresponding poisson pmf
L5_1_S19_Binomial_to_Poisson( N, p );

%% slide 1 
% the Xi (i = 1, . . . , k) are binomially distributed rvs with the 
% same parameter p . the distribution of their sum is 
% X1 + ···+ Xk ? Bin(n1 + ···+ nk ,p)
% because the sum represents the number of successes in a 
% sequence of n1 + · · · + nk identical Bernoulli trials

L5_2_S1_sum_of_binomially_distributd_rv(2, [3, 4], 0.5)

%% slide 2
% in this part we plot the pmf function of Trinomial Distribution

p = [1/2 1/3 1/6];
n = 10;
L5_2_S2_Multinomial_dist( p, n );

%% slide 3 & 4 & 5 & 6
% Geometric Distribution
% in order to plot the cdf and pmf and also showing the mean and variance
p = 0.5;
[y_geometric, mean, variance] = L5_2_S3_Geometric_dist(p);

% firstly probability generating function of Geometric pmf will be
% calculated, then we compare the first derivation of G with E[X] or mean
G = L5_1_S2_probability_generating_func(y_geometric);
sprintf('and also generating function of this geometric distribution is %s ', G)
[ G_diff_1, ~, status ] = L5_2_S5_probability_generating_func_derivation1_with_input_mean(G, mean);
sprintf('For geometric distribution, the derivation1 is %s and based on the value of it in point 1 we have: %s', G_diff_1, status)
% we also compare the value of variance with the obtained formula by values
% of G_diff2 and G_diff1
Variance_by_G = limit(diff(diff(G)) + diff(G) * (1 - diff(G)), 1);
if (double(Variance_by_G) == variance)
    sprintf('and also we checked the fact that variance = limit(diff(diff(G)) + diff(G) * (1 - diff(G)), 1) for Geometric distribution')
else
    sprintf('contradiction')
end

% slide 6
% in order to show that geometric distribution is memoryless

i = 7;
j = 4;
L5_2_S6_is_the_given_probability_distribution_memoryless( y_geometric, i, j );

%% slide 7
% Negative Binomial Distribution
% in order to plot the cdf and pmf and also showing the mean and variance

R = 3;
y_NBin = L5_2_S7_Negative_Binomial_dist(R, p);
% firstly probability generating function of Negative Binomial pmf will be
G_NBin = L5_1_S2_probability_generating_func(y_NBin);
sprintf('and also generating function of this Negative Binomial distribution is %s ', G_NBin)

%% slide 8 & 9 & 10
% Poisson Distribution
% in order to plot the cdf and pmf and also showing the mean and variance
lambda = 5;
[y_poisson, mean, variance] = L5_2_S8_Poisson_dist(lambda);

% firstly probability generating function of Poisson pmf will be
% calculated, then we compare the first derivation of G with E[X] or mean
G = L5_1_S2_probability_generating_func(y_poisson);
sprintf('and also generating function of this poisson distribution is %s ', G)
[ G_diff_1, ~, status ] = L5_1_S2_probability_generating_func_derivation1(G_2, p_2);
sprintf('For poisson distribution, the derivation1 is %s and based on the value of it in point 1 we have: %s', G2_diff_1, status)
Variance_by_G = limit(diff(diff(G)) + diff(G) * (1 - diff(G)), 1);
if (double(Variance_by_G) == variance)
    sprintf('and also we checked the fact that variance = limit(diff(diff(G)) + diff(G) * (1 - diff(G)), 1) for Poisson distribution')
else
    sprintf('contradiction')
end

%% slide 11
%in order to show that sum of two independent poisson rvs with parameter 
% lambda1 and lambda2 is distributed as poisson with parameter
% lambda1 + lambda2

lambda1 = 12;
lambda2 = 7;
L5_2_S11_sum_of_piossons(lambda1, lambda2);

%% slide 12
% example

p1 = 0.8;
p2 = 1 - p1;
lambda = 10;
lambda1 = p1 * lambda;
lambda2 = p2 * lambda;
L5_2_S11_sum_of_piossons(lambda1, lambda2);

%% slide 13
% in order to show that Q(z) = (1-P(z))/(1-z)

p = [0.1 0.2 0 0.1 0 0.3 0.2 0 0 0.1];
Q = L5_2_S13_generating_func_of_complementary_distribution(p);
sprintf('generating function of of complementary distribution of p is %s ', Q)

%% The End
