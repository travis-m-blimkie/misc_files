
# Load the tidyverse, which includes purrr
library(tidyverse)


# Basic list to show some simple examples
practice_list <- list(a = 9,
                      b = 16,
                      c = 25)


# Load in gene data
treatment1 <- read.csv(
  "https://raw.githubusercontent.com/travis-m-blimkie/misc_files/master/MyData/genes_treatment1_vs_ctrl.csv")

treatment2 <- read.csv(
  "https://raw.githubusercontent.com/travis-m-blimkie/misc_files/master/MyData/genes_treatment2_vs_ctrl.csv")


# Using map() to do string replacement in all columns of a data frame
# Set up dummy data frame
ex_df_1 <- tibble(
  colA = paste0("=", sample(50, size = 20)),
  colB = paste0(sample(letters, size = 20), "=", sample(50, size = 20))
)

ex_df_2 <- tibble(
  colA = paste0("=", sample(50, size = 20)),
  colB = paste0(sample(letters, size = 20), "=", sample(50, size = 20))
)

ex_df_list <- list(ex1 = ex_df_1, ex2 = ex_df_2)
