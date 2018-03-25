# Author: Sanjt Narwekar
# Repo: https://github.com/SanjitNarwekar/Advanced-R-Programming


# test and measure factorial functions -----------------------------------------------------
#
# This script calls 4 factorial functions written by me to compare with the built in 
# factorial function in R.
#
#------------------------------------------------------------------------------


# load libraries --------------------------------------------------------------

library(purrr)
library(microbenchmark)
library(installr)
library(RCurl)
library(ggplot2)

# load functions and scripts from github ---------------------------------------------------

fn1 <- getURL("https://raw.githubusercontent.com/SanjitNarwekar/Advanced-R-Programming/master/fn_factorial_loop.R", ssl.verifypeer = FALSE)

eval(parse(text = fn1))

rm(fn1)

fn2 <- getURL("https://raw.githubusercontent.com/SanjitNarwekar/Advanced-R-Programming/master/fn_factorial_reduce.R", ssl.verifypeer = FALSE)

eval(parse(text = fn2))

rm(fn2)

fn3 <- getURL("https://raw.githubusercontent.com/SanjitNarwekar/Advanced-R-Programming/master/fn_factorial_recursion.R", ssl.verifypeer = FALSE)

eval(parse(text = fn3))

rm(fn3)

fn4 <- getURL("https://raw.githubusercontent.com/SanjitNarwekar/Advanced-R-Programming/master/fn_factorial_memoisation.R", ssl.verifypeer = FALSE)

eval(parse(text = fn4))

rm(fn4)

# Create lookup table for memoization with 0 and 1 as  the 1st 2 values and 65 NA's
# This should give fast calculation of values of 0 and 1 and 65 other numbers sfter 
# they have been calculated atleast once.


fact_tbl <- c(rep(NA, 65))
input <- c(0, 1, 4, 5)




# Measure performance and create output ----------------------------------------

# Use microbenchmark and purrr package to calculate performance for different 
# input values and for ranges of input values

sink("factorial_output.txt")

cat("====== PART 1: Performance and comparison of individual input values ======\n")
cat("======================== across factorial functions ======================= \n\n")

# Calculate and compare perforamnce of individual input values
individual_results <- map(input, ~ microbenchmark(
  factorial_loop(.),
  factorial_reduce(.),
  factorial_func(.),
  factorial_mem(.)
))

names(individual_results) <- as.character(input)
individual_results

# Calculate and compare performance of ranges of input values

cat("====== PART 2: Performance and comparison of ranges of input values =======\n")
cat("======================== across factorial functions ======================= \n\n")

get_benchmark <- function(x) {
  fact_tbl <<- c(rep(NA, 100))
  microbenchmark(map_dbl(x, factorial_loop),
                 map_dbl(x, factorial_reduce),
                 map_dbl(x, factorial_func),
                 map_dbl(x, factorial_mem))
}

ranges <- list(`range 1:10` = 1:10,
               `range 1:24` = 1:25,
               `range 1:65` = 1:65)

range_results <- map(ranges, get_benchmark)
range_results
sink()


