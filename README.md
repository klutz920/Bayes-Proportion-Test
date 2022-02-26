# Bayes-Proportion-Test
## Description
The function in code.R performs a Bayesian proportion test between multiple groups.  The user must supply the number of successes (x) as a vector, the sample sizes (n) as a vector, and the prior setting.  For a uniform prior, let a=b=1. For the Jeffreys' prior, let a=b=0.5. The function will return the Bayes Factor, posterior probability, 95% credible interval, and posterior mean for the proportional difference of any two groups.

## Demonstration

Suppose we want to compare the proportions of three groups using Jeffreys' prior.  In this example, we will generate three groups arbitrarily where the third group is the discriminating group.  Sample size are 25 in this example; however, sample sizes need not be equal. Because we are comparing three groups, the output will show results for 6 paired comparisons: Groups 1 vs 2, 2 vs 1, 1 vs 3, 3 vs 1, 2 vs 3, and 3 vs 2.

```
x_1 = sum(rbinom(n = 25, size = 1, prob = 0.3))
x_2 = sum(rbinom(n = 25, size = 1, prob = 0.3))
x_3 = sum(rbinom(n = 25, size = 1, prob = 0.7))

bayes.prop.test(x = c(x_1, x_2, x_3),
                n = c(25, 25, 25),
                a = 0.5,
                b = 0.5)
```
