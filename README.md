# Bayes-Proportion-Test
## Description
The function in code.R performs a Bayesian proportion test between multiple groups.  A Beta-Bernoulli posterior distribution is implemented to model the uncertainty in the group proportions. The user must supply the number of successes (x) as a vector, the sample sizes (n) as a vector, and constants for a and b for the Beta prior setting. For a uniform prior, let a=b=1. For the Jeffreys' prior, let a=b=0.5. The function will return an organized table with the Bayes Factor, posterior probability, 95% credible interval, and posterior mean for the proportional difference of all paired comparisons.  The function will run 10,000 Monte Carlo iterations (the posterior is in closed form, so MCMC is not necessary) with seed = 1 for reproducibility.  

## Demonstration

Suppose we want to compare the proportions of three groups using Jeffreys' prior.  In this example, we will generate three groups arbitrarily where the third group is the discriminating group.  Sample sizes are 25 in this example; however, sample sizes need not be equal. Because we are comparing three groups, the output will show results for 6 paired comparisons of group proportions: Groups 1 > 2, 2 <= 1, 1 > 3, 3 <= 1, 2 > 3, and 3 <= 2.

```
x_1 = sum(rbinom(n = 25, size = 1, prob = 0.3))
x_2 = sum(rbinom(n = 25, size = 1, prob = 0.3))
x_3 = sum(rbinom(n = 25, size = 1, prob = 0.8))

bayes.prop.test(x = c(x_1, x_2, x_3),
                n = c(25, 25, 25),
                a = 0.5,
                b = 0.5)
```

Results:
```
  alternative          BF Probability       mean         lwr         upp
1       2 > 1  0.08905464      0.0799 -0.1533907 -0.36749985  0.06884772
2      2 <= 1 11.22906126      0.9201  0.1533907 -0.06884772  0.36749985
3       3 > 1         Inf      1.0000  0.5769251  0.34403396  0.77184085
4      3 <= 1  0.00000000      0.0000 -0.5769251 -0.77184085 -0.34403396
5       3 > 2         Inf      1.0000  0.7303158  0.52719511  0.88637342
6      3 <= 2  0.00000000      0.0000 -0.7303158 -0.88637342 -0.52719511
```

Alternatives 3 and 5 are significant in all aspects: the Bayes Factor (BF) is infinity, posterior probability is 1, and zero is not contained between the lower and upper bounds of the 95% credible interval.  Thus, 3 > 1 and 3 > 2 are the only two significant constrasts which indicates that the proportion of group 3 is significantly greater than groups 1 and 2.  The mean proportion difference between groups 3 and 1 is 0.5769251; the mean proportion difference betweeen groups 3 and 2 is 0.7303158.  

While the BF is moderately significant for 2 <= 1, zero is contained between the lower and upper bounds of the 95% credible interval suggesting that the difference between the proportions of these two groups is insignficant.  


## More Information

In our study, the vector x contained the sum of zeros and ones for a gene from all samples for each group separately.

## Data

The data analyzed for enrichment of antimicrobial resistant genes (ARGs) in the paper "Recurrent urinary tract infection and estrogen shape the taxonomic ecology and functional potential of the postmenopausal urobiome" by Michael L. Neugent, et. al. is contained in the data folder. 
