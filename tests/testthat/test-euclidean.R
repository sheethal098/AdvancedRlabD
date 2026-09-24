library(testthat)
test_that("euclidean calculates the greatest common divisor", {
  expect_equal(euclidean(48, 18), 6)
  expect_equal(euclidean(12, 8), 4)
  expect_equal(euclidean(17, 5), 1)
  expect_equal(euclidean(100, 25), 25)
})
test_that("euclidean rejects invalid inputs", {
  expect_error(euclidean(1.5, 2))
  expect_error(euclidean(c(1, 2), 2))
  expect_error(euclidean("10", 2))
  expect_error(euclidean(10, 2.5))
  expect_error(euclidean(10, c(2, 3)))
  expect_error(euclidean(10, "2"))
})
test_that("euclidean handles zero", {
  expect_equal(euclidean(10, 0), 10)
})
