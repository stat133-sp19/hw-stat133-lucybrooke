library(testthat)

context("test for valid input and output of main binomial functions")


# test bin_choose()

test_that("calculates possible combinations given success/trial as expected", {
  expect_error(bin_choose(n = 5, k = 6), "k cannot be greater than n")
  expect_equal(bin_choose(n = 5, k = 2), 10)
  expect_length(bin_choose(n = 5, k = 1:4), 4)
})





# test bin_probability()

test_that("calculates binomial probability as expected", {
  expect_equal(bin_probability(success = 2, trials = 5, prob = 0.5), 0.3125)
  expect_equal(bin_probability(success = 0:2, trials = 5, prob = 0.5), c(0.03125,  0.15625, 0.31250))
  expect_error(bin_probability(2, -10, 0.5), "invalid trials value")
  expect_equal(bin_probability(success = 55, trials = 100, prob = 0.45),  0.01075277)
})








# test bin_distribution()

test_that("calculates binomial distribution as expected", {
  expect_is(bin_distribution(trials = 5, prob = 0.5), "bindis")
  expect_is(bin_distribution(trials = 5, prob = 0.5), "data.frame")
  expect_equal((bin_distribution(trials = 7, prob = 0.3))$success, c(0:7))

})






# test bin_cumulative()

test_that("calculates probability distribution and cumlative probabilities as expected", {
  expect_is(bin_cumulative(trials = 5, prob = 0.5), "bincum")
  expect_is(bin_cumulative(trials = 5, prob = 0.5), "data.frame")
  expect_equal(ncol(bin_cumulative(trials = 10, prob = 0.7)), 3)

})





