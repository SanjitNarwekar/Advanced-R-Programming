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

# load functions from github ---------------------------------------------------

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




# Test functions --------------------------------------------------------------

input <- c(0, 1, 4, 5)

# Check if all functions produce the same results. R's built-in function
# factorial() is used to compare the results
factorial(input)
map_dbl(input, factorial_loop)
map_dbl(input, factorial_reduce)
map_dbl(input, factorial_func)
map_dbl(input, factorial_mem)



