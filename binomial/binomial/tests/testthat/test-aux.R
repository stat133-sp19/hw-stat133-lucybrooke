library(testthat)

context("test for valid input and output of private summary functions")


# test aux_mean()

test_that("calculates mean as expected", {

  expect_length(aux_mean(trials = 10, prob = 0.3), 1)
  expect_equal(aux_mean(10, 0.3), 10*0.3)
  expect_lte(aux_mean(10, 1), 10)
  expect_gte(aux_mean(10, 0), 0)
})







# test aux_variance()

test_that("calculates variance as expected", {
  expect_equal(aux_variance(10, 0.3), 2.1)
  expect_length(aux_variance(15, 0.5), 1)
  expect_equal(aux_variance(20, 0), 0)
  expect_equal(aux_variance(0, 0.025), 0)
})






# test aux_mode()

# first, test aux_check_integer()

test_that("successfully checks whether input is mathematical integer", {
  expect_true(aux_check_integer(78))
  expect_false(aux_check_integer(78.000001))
  expect_true(aux_check_integer(0))
  expect_true(aux_check_integer(-33))
})

# test aux_mode

test_that("calculates mode as expected", {
  expect_length(aux_mode(7, 0.5), 2)
  expect_equal(aux_mode(7, 0.5), c(4, 3))
  expect_length(aux_mode(10, 0.3), 1)
  expect_equal(aux_mode(10, 0.3), 3)
})






# test aux_skewness()

test_that("calculates skewness as expected", {
  expect_lt(aux_skewness(10, 0.75), 0)
  expect_gt(aux_skewness(10, 0.3), 0)
  expect_equal(aux_skewness(10, 1), "Undefined")
})







# test aux_kurtosis()

test_that("calculates kurtosis as expected",{
  expect_equal(aux_kurtosis(10, 1), "Undefined")
  expect_lt(aux_kurtosis(10, 0.3), 0)
  expect_gt(aux_kurtosis(10, .025), 0)
})








