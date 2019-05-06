library(devtools)
library(usethis)


# 1.1) Private Checker Functions

# title: check_prob function
# description: private function to check if an input
# probability value is between 0 and 1 (inclusive)
# input: prob; a numeric value describing probability
# output: logical value TRUE if input valid, error message if not

check_prob <- function(prob){
  if(length(prob) > 1){
    stop("prob cannot have length greater than 1")
  }

  if(prob >= 0 & prob <= 1){
    return(TRUE)
  }

  else if (prob < 0|prob > 1){
    stop("prob has to be a number between 0 and 1")
  }
}


# title: check_trials function
# description: private function to check if an input trial value is nonnegative
# and of length 1 (i.e. not a vector)
# input: trials; a numeric value describing number of trials
# output: logical value TRUE if input valid, error message if not

check_trials <- function(trials){
  if(length(trials) > 1){
    stop("trials cannot have length greater than 1")
  }
  if(trials >= 0){
    return(TRUE)
  }
  else if(trials < 0){
    stop("trials value must be positive")
  }
}



# title: check_success function
# description: private function to check the validity of input success value(i.e. 0 <= success <= trials)
# input: success; a vector describing desired number of successes less than or equal to trials
# input: trials; a numeric value describing number of trials
# output: logical value TRUE if input valid, error message if not

check_success <- function(trials, success){
  logsuc <- success >= 0 & success <= trials

  if(all(logsuc) == TRUE){
    return(TRUE)
  }
  else{
    stop("success cannot be greater than trials or less than 0")
  }
}




# 1.2) Private Auxiliary Functions


# title: aux_mean function
# description: computes the mean/expected value of a binomial distribution
# input: trials; a positive numeric value describing number of trials
# input: prob; a numeric value describing probability
# output: the mean of the distribution

aux_mean <- function(trials, prob){
  return(trials*prob)
}




# title: aux_variance function
# description: computes the variance of a binomial distribution
# input: trials; a positive numeric value describing number of trials
# input: prob; a numeric value describing probability
# output: the variance of the distribution

aux_variance <- function(trials, prob){
  return((trials*prob)*(1 - prob))
}



# Two functions to compute aux_mode

# title: check_integer function
# description: checks whether given value is an integer/whole number(mathematic)
# input: x; some number
# output: logical value TRUE if number is an integer, FALSE if not

aux_check_integer <- function(x){
  x == round(x)
}


# title: aux_mode function
# description: computes the mode of a binomial distribution
# input: trials; a positive numeric value describing number of trials
# input: prob; a numeric value describing probability
# output: the mode of the distribution


aux_mode <- function(trials, prob){
  m <- (trials + 1)*prob
  if (aux_check_integer(m) == FALSE){
    return(floor(m))
  }
  else if (aux_check_integer(m) == TRUE){
    return(c(floor(m), (floor(m) - 1)))
  }
}




# title: aux_skewness function
# description: computes the skewness of a binomial distribution
# input: trials; a positive numeric value describing number of trials
# input: prob; a numeric value describing probability
# output: the skewness of the distribution

aux_skewness <- function(trials, prob){
  top <- 1 - (2*prob)
  bottom <- sqrt(trials*prob*(1 - prob))

  if((bottom > 0) == TRUE){
    return(top/bottom)
  }
  else if(bottom == 0){
    return("Undefined")
  }
}




# title: aux_kurtosis function
# description: computes the kurtosis of a binomial distribution
# input: trials; a positive numeric value describing number of trials
# input: prob; a numeric value describing probability
# output: the kurtosis of the distribution

aux_kurtosis <- function(trials, prob){
  top <- 1 - ((6*prob)*(1 - prob))
  bottom <- (trials*prob)*(1 - prob)

  if(bottom != 0){
    return(top/bottom)
  }

  else if(bottom == 0){
    return("Undefined")
  }
}



# 1.3) Function bin_choose()

#' @title bin_choose function
#' @description calculates the number of combinations in which
#' k successes can occur in n trials
#' @param n number of trials
#' @param k desired number of successes
#' @return one numeric value describing number of combinations
#' @export bin_choose



bin_choose <- function(n, k){
  logicalbin <- k <= n
  if(all(logicalbin) == TRUE){
    top <- factorial(n)
    bottom <- (factorial(k))*(factorial(n - k))
    return(top/bottom)
  }
  else{
    stop("k cannot be greater than n")
  }
}



# 1.4) Function bin_probability()

#' @title bin_probability function
#' @description calculates binomial probability of
#' success with probability and number of trials
#' @param trials number of trials
#' @param success desired number of successes
#' @param prob probability of success on each trial
#' @return numeric value(s) describing binomial probability for each success
#' @export bin_probability


bin_probability <- function(success, trials, prob){
  test_tri <- try(check_trials(trials), silent = TRUE)
  test_prob <- try(check_prob(prob), silent = TRUE)
  test_succ <- try(check_success(trials = trials, success = success), silent = TRUE)

  if (test_tri != TRUE){
    stop("invalid trials value")
  }
  if (test_prob != TRUE){
    stop("invalid probability value")
  }
  if (test_succ != TRUE){
    stop("invalid success value")
  }
  else if (test_tri == TRUE & test_prob == TRUE & test_succ == TRUE){
    return((bin_choose(n = trials, k = success))*((prob^success)*(1 - prob)^(trials - success)))
  }

}





#' @title binomial distribution
#' @description creates a data frame with the probability distribution
#' of successes and respective probability
#' @param trials number of trials
#' @param prob probability of success on each trial
#' @return data frame of class "bindis" and "data.frame" with first
#' column successes and second column probability
#' @export bin_distribution


bin_distribution <- function(trials, prob){
  prob_vect <- bin_probability(success = 0:trials, trials = trials, prob = prob)
  succ_vect <- 0:trials
  prob_dist_df <- data.frame(success = succ_vect, probability = prob_vect)
  class(prob_dist_df) <- c("bindis", "data.frame")
  return(prob_dist_df)
}




#' @export plot.bindis

plot.bindis <- function(x){
  barplot(x$probability, names.arg = c(as.character(x$success)), xlab = "Successes", ylab = "Probability", col = "dark green")
}




#' @title binomial cumulative distribution
#' @description computes a data frame with columns listing values for success,
#' probability, and cumulative distribution
#' @param trials number of trials
#' @param prob probability of success on each trial
#' @return data frame of class "bincum" and "data.frame" with columns success,
#' probability, and cumulative
#' @export bin_cumulative

bin_cumulative <- function(trials, prob){
  cumul <- c()
  succ_prob <- bin_distribution(trials = trials, prob = prob)

  for (i in 1:(trials + 1)){
    cumul[i] <- sum(succ_prob$probability[1:i])
  }

  spc_df <- data.frame(success = succ_prob$success, probability = succ_prob$probability, cumulative = cumul)

  class(spc_df) <- c("bincum", "data.frame")
  return(spc_df)
}



#' @export plot.bincum

plot.bincum <- function(x){
  plot(x$success, x$cumulative,
       xlab = "Successes", ylab = "Cumulative Probability", type = "b")
}




#' @title binomial variable
#' @description creates a binomial random variable list of the elements
#' trials and probability
#' @param trials number of trials
#' @param prob probability of success on each trial
#' @return list with named elements "trials" and "prob" of class "binvar"
#' @export bin_variable


bin_variable <- function(trials = c(trials), prob = c(prob)){
  check_trials(trials)
  check_prob(prob)
  list <- list(trials = trials, prob = prob)
  class(list) <- "binvar"
  return(list)
}






#' @export print.binvar

print.binvar <- function(x){
  cat('"Binomial Variable"\n\n')
  cat('Parameters \n')
  cat(sprintf('- number of trials: %i', x$trials), "\n")
  cat(sprintf("- probability of success: %0.3f", x$prob))
  invisible(x)

}





#' @export summary.binvar

summary.binvar <- function(list){
  bv_mean <- aux_mean(list$trials, list$prob)
  bv_variance <- aux_variance(list$trials, list$prob)
  bv_mode <- aux_mode(list$trials, list$prob)
  bv_skew <- aux_skewness(list$trials, list$prob)
  bv_kurt <- aux_kurtosis(list$trials, list$prob)
  bv_list <- list(trials = list$trials, prob = list$prob, bv_mean = bv_mean, bv_variance = bv_variance, bv_mode = bv_mode, bv_skew = bv_skew, bv_kurt = bv_kurt)
  class(bv_list) <- "summary.binvar"
  return(bv_list)

}






#' @export print.summary.binvar

print.summary.binvar <- function(x = bv_list){
  bin_one <- bin_variable(x$trials, x$prob)
  print(bin_one)
  cat('\n\nMeasures\n')
  cat(sprintf('- mean: %0.1f', x$bv_mean), "\n")
  cat(sprintf('- variance: %0.1f', x$bv_variance), "\n")
  cat(sprintf('- mode: %0.1f', x$bv_mode), "\n")
  cat(sprintf('- skewness: %0.7f', x$bv_skew), "\n")
  cat(sprintf('- kurtosis: %0.7f', x$bv_kurt), "\n")
  invisible(x)

}




#' @title binomial mean
#' @description main function for summary measure "mean"
#' @param trials number of trials
#' @param prob probability of success on each trial
#' @return mean of the binomial distribution
#' @export bin_mean


bin_mean <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_mean(trials, prob))
}






#' @title binomial variance
#' @description main function for summary measure "variance"
#' @param trials number of trials
#' @param prob probability of success on each trial
#' @return variance of the binomial distribution
#' @export bin_variance


bin_variance <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_variance(trials, prob))
}





#' @title binomial mode
#' @description main function for summary measure "mode"
#' @param trials number of trials
#' @param prob probability of success on each trial
#' @return mode of the binomial distribution
#' @export bin_mode


bin_mode <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_mode(trials, prob))
}





#' @title binomial skewness
#' @description main function for summary measure "skewness"
#' @param trials number of trials
#' @param prob probability of success on each trial
#' @return skewness of the binomial distribution
#' @export bin_skewness


bin_skewness <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_skewness(trials, prob))
}




#' @title binomial kurtosis
#' @description main function for summary measure "kurtosis"
#' @param trials number of trials
#' @param prob probability of success on each trial
#' @return kurtosis of the binomial distribution
#' @export bin_kurtosis


bin_kurtosis <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_kurtosis(trials, prob))
}































































