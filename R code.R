# Bayesian Proportion Test Function

bayes.prop.test = function(x, n, a, b, seed = 1, iter = 10000) {
  set.seed(seed)
  K <- length(x)
  p_prior <- matrix(rbeta(iter*K, a, b), nrow = iter, ncol = K)
  p_posterior <- matrix(NA, nrow = iter, ncol = K)
  for (k in 1:K) {
    p_posterior[, k] <- rbeta(iter, a + x[k], b + n[k] - x[k])
  }
  BF <- data.frame("alternative" = rep(NA, choose(K, 2)), "BF" = rep(NA, choose(K, 2)), "Probability"=rep(NA,choose(K,2)), "mean" = rep(NA, choose(K, 2)), "lwr" = rep(NA, choose(K, 2)), "upp" = rep(NA, choose(K, 2)))
  count <- 1
  for (k in 1:(K - 1)) {
    for (kk in (k + 1):K) {
      pr_a <- sum(p_prior[, kk] > p_prior[, k])/iter
      pr_ax <- sum(p_posterior[, kk] > p_posterior[, k])/iter
      BF[count, "alternative"] <- paste0(kk, " > ", k) 
      BF[count, "BF"] <- c(pr_ax/(1 - pr_ax))/(pr_a/(1 - pr_a))
      BF[count, "Probability"] <- pr_ax
      BF[count, "mean"] <- mean(p_posterior[, kk] - p_posterior[, k])
      BF[count, c("lwr", "upp")] <- quantile(p_posterior[, kk] - p_posterior[, k], probs = c(0.025, 0.975))
      BF[count + 1, "alternative"] <- paste0(kk, " <= ", k) 
      BF[count + 1, "BF"] <- 1/BF[count, "BF"]
      BF[count + 1, "Probability"] <- 1 - pr_ax
      BF[count + 1, "mean"] <- -BF[count, "mean"]
      BF[count + 1, c("lwr", "upp")] <- -BF[count, c("upp", "lwr")]
      count <- count + 2
    }
  }
  return(BF)
}

