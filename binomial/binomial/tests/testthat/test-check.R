library(testthat)


context("test for valid input values of private checker functions")



# test check_prob()

test_that("checks input probability as expected", {
  valid_prob <- 0.5
  too_small <- -0.1
  too_big <- 5
  too_long <- c(0.5, 0.6)

  expect_true(check_prob(valid_prob))
  expect_error(check_prob(too_small), "prob has to be a number between 0 and 1")
  expect_error(check_prob(too_big), "prob has to be a number between 0 and 1")
  expect_error(check_prob(too_long), "prob cannot have length greater than 1")

})







# test check_trials()

test_that("checks input trials as expected", {
  valid <- 500
  too_small <- -1
  too_long <- c(2, 78)

  expect_true(check_trials(valid))
  expect_error(check_trials(too_small), "trials value must be positive")
  expect_error(check_trials(too_long), "trials cannot have length greater than 1")
})



# test check_success

test_that("checks input success as expected", {
  trials_good <- 10
  trials_bad <- -10
  success_vect <- c(4, 5, 6)

  expect_true(check_success(trials_good, 5))
  expect_true(check_success(trials_good, success_vect))
  expect_error(check_success(trials_good, -1), "success cannot be greater than trials or less than 0")
  expect_error(check_success(trials_good, 20), "success cannot be greater than trials or less than 0")
  expect_error(check_success(trials_bad, 5), "success cannot be greater than trials or less than 0")

})









































