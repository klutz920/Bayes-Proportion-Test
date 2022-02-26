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

## More Information

In our study, the vector x contained the sum of zeros and ones for a gene from all samples for each group separately.
