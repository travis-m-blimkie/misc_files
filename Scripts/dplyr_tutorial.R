#' Intro to manipulating data with dplyr!
#' We will cover some of the most commonly used functions, using one of dplyr's
#' practice datasets. Specifically, we will be looking at five functions:

#' 1. select() - extract columns
#' 2. filter() - extract rows
#' 3. mutate() - add new columns based on existing ones
#' 4. group_by() - group rows (observations) by value in a given column
#' 5. summarize() - perform action/function on groups

#' We will also cover the use of the pipe ( %>% ) function.


# Load the data -----------------------------------------------------------

#' The dataset is starwars, from dplyr, and can be loaded as follows
library(dplyr)

starwars <- starwars

#' There are 13 columns (attributes, or variables) and 87 rows (characters, or observations)


# select() ----------------------------------------------------------------

#' Now, let's use select() to extract a few columns from the overall dataset
#' The way we do this with select is as follows: new_df <- select(my_df, col1, col2, col4, ...)

starwars_2 <- select(.data = starwars, name, height, homeworld, species)

#' We can rewrite the same command, this time making use of the %>% function
#' This function pushes or "pipes" the desired object into the following function
#' new_df <- my_df %>% select(.data = ., col1, col2, col4, ...)
#' The "." is simply a placeholder for the object being piped (my_df in this case)

starwars_2 <- starwars %>% select(.data = ., name, height, mass, homeworld, species)


# filter() ----------------------------------------------------------------

#' This function allows us to extract rows from a dataframe, using some sort of logical criteria
#' So you could extract rows for which the value of a particular column is negative (< 0)
#' Or extract rows which contain a certain (non-numerical) value, such as a place or name
#' Filter works as follows: new_df <- my_df %>% filter(col1 < 0)
#' Or, for strings: new_df <- my_df %>% filter(col2 == "blue")
#' Equality in R is done using "==", while "=" is for assignment of aguments

#' Let's use filte to pick certain rows from the starwars data
starwars_3 <- starwars %>% filter(species == "Human")

#' Another example, this time using a numeric column:
starwars_4 <- starwars %>% filter(height >= 100)


# mutate() ----------------------------------------------------------------

#' mutate() allows us to create new columns, based on existing columns
#' Operations can be mathematical, or string-related (i.e. combine strings)
#' It works as follows: new_df <- my_df %>% mutate(new_col = col1 * 2)
#' Let's use mutate() to convert the mass column from kg to lbs
starwars_5 <- starwars %>% mutate(mass_lbs = mass * 2.2)


# Combining functions with pipes ------------------------------------------

#' Now is where we will see the real usefulness of pipes: they allow us
#' to chain together multiple steps into a single command. The output of one
#' function (e.g. select()) can be piped into another function (e.g. filter())

starwars_new <- starwars %>%
  select(name, height, mass, homeworld, species) %>%
  filter(species == "Human") %>%
  mutate(mass_lbs = mass * 2.2)


# group_by() and summarise() ----------------------------------------------

#' These functions allow us to perform operations on subsets of data.
#' group_by() "groups" rows based on a column/value, e.g. all rows for which
#' "species" is equal to human. Then, summarize() performs some operation on
#' each group as a whole.
#' So, let's use these functions to calculate the average height for each species
#' in the starwars dataset.

starwars_grp <- starwars %>%
  group_by(species) %>%
  summarise(mean(height))

#' Another example, this time getting two different summaries
starwars_grp2 <- starwars %>%
  group_by(homeworld) %>%
  summarise(avg_height = mean(height), avg_mass = mean(mass))


# Tying it all together ---------------------------------------------------

#' Now let's use all of the functions we've learned thus far together in a single
#' command, tied together via pipes. Let's say we want to calculate the average mass,
#' in pounds, for each species, but only for characters above a certain height. We could
#' do this as follows:

starwars_final <- starwars %>%
  select(name, height, mass, species) %>%
  filter(height >= 100) %>%
  mutate(mass_lbs = mass * 2.2) %>%
  group_by(species) %>%
  summarise(mean(mass_lbs))
