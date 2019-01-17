#' Intro to manipulating data with dplyr!
#' We will cover some of the most commonly used functions, using one of dplyr's
#' practice datasets. Specifically, we will be looking at five functions:
#'
#' 1. select() - extract columns
#' 2. filter() - extract rows
#' 3. mutate() - add new columns based on existing ones
#' 4. group_by() - group rows (observations) by value in a given column
#' 5. summarize() - perform action/function on groups
#'
#' We will also cover the use of the pipe ( %>% ) function.


# The dataset is starwars, from dplyr, and can be loaded as follows
library(dplyr)

starwars <- starwars

# There are 13 columns (attributes, or variables) and 87 rows (characters, or observations)

# Now, let's use select() to extract a few columns from the overall dataset
starwars_2 <- select(starwars, name, height, homeworld, species)

# We can rewrite the same command, this time making use of the %>% function
starwars_2 <- starwars %>% select(name, height, homeworld, species)
