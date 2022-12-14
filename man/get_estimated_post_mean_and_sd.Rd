% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/print_and_plot_results.R
\name{get_estimated_post_mean_and_sd}
\alias{get_estimated_post_mean_and_sd}
\title{Transition Probabilities: Posterior Mean and Standard Deviation}
\usage{
get_estimated_post_mean_and_sd(
  results,
  cov_labels = NULL,
  state_labels = 1:results$Num_States,
  cov_levels = NULL,
  decimal_pts = 2,
  include_plot = TRUE
)
}
\arguments{
\item{results}{results of transition probabilities, i.e., results$results_trans}

\item{cov_labels}{a matrix such that row i represents the labels for covariate i; default labels for covariate i is 1:i}

\item{state_labels}{a vector of strings that represent the state labels; default is 1:Num_States}

\item{cov_levels}{a matrix such that each row is a combination of covariate levels; default is all possible combinations of covariates}

\item{decimal_pts}{specify the number of decimal points of the results; default is 2}

\item{include_plot}{display plot if TRUE; default is TRUE}
}
\value{
No return value, called for printing and plotting posterior distribution of transition probabilities.
}
\description{
Print and plot the posterior mean and standard deviation for
transition probabilities from MCMC samples under given different
combinations of covariate levels.
}
\details{
For each row of 'cov_levels', the function returns two matrices of size d0xd0 where d0 is the number of states:
(1) the posterior mean and (2) the posterior standard deviation
of transition probabilities, computed from MCMC samples after burn-ins and thinning.
The default for 'cov_levels' is all possible combinations of covariate levels.
}
\examples{

# Examples using the shortened version of the simulated Foxp2 data set, foxp2_sm

# get results for all combinations of covariate levels
results <- BMRMM(foxp2_sm,num_cov=2,duration_type='None',simsize=50)
get_estimated_post_mean_and_sd(results$results_trans)

# get results for covariate levels ("HET","U") and ("WT","U")
cov_labels <- matrix(c("HET","WT","","U","L","A"),nrow=2,byrow=TRUE)
cov_levels <- matrix(c(1,1,2,1),nrow=2,byrow=TRUE)
get_estimated_post_mean_and_sd(results$results_trans,cov_labels,cov_levels=cov_levels)

}
