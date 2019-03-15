
library(tidyverse)

# Loops, apply(), and purrr::map()

# Basic list to show some simple examples
practice_list <- list(a = 9,
                      b = 16,
                      c = 25)

# Getting the names given to items in the list
names(practice_list)

# Accessing specific items via name or index
practice_list[1]

practice_list[[1]]

practice_list$a


# for loop method to apply some function to each item in the list
for (i in 1:length(practice_list)) {

  print(practice_list[i])

  print(practice_list[[i]] * 2)

}


# Again using a for loop, this time saving the result to a new list

# List needs to be initialized outside the for loop
output_list <- list()

for (i in 1:length(practice_list)) {
  output_list[i] = sqrt(practice_list[[i]])
}

# Names are not carried over from the original list, but can be added
names(output_list)
names(output_list) <- names(practice_list)
names(output_list)


# apply() method
lapply(X = practice_list, FUN = sqrt)


# map method
map(.x = practice_list, sqrt)

# More concise map method
map(practice_list, ~sqrt(.))

# Include use of pipes
new_list <- practice_list %>% map(~sqrt(.))


# Load in gene data
treatment1 <- read.csv(
  "https://raw.githubusercontent.com/travis-m-blimkie/misc_files/master/MyData/genes_treatment1_vs_ctrl.csv")
treatment2 <- read.csv(
  "https://raw.githubusercontent.com/travis-m-blimkie/misc_files/master/MyData/genes_treatment2_vs_ctrl.csv")

# Put both data frames into a list
treatment_list <- list(treat1 = treatment1,
                       treat2 = treatment2)

# To access one of the data frames (by name)
glimpse(treatment_list$treat1)

# Applying a function to one of these data frames
nrow(treatment_list$treat1)

# for loop method
for (i in 1:length(treatment_list)) {
  print(nrow(treatment_list[[i]]))
}


# Using map to do the same function to both data frames
treatment_list %>% map(~nrow(.))
# Notice that names are maintained

