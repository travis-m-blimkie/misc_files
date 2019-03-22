
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
class(practice_list[1])

practice_list[[1]]
class(practice_list[[1]])

practice_list$a


# for loop method to apply some function to each item in the list
for (i in 1:length(practice_list)) {

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

# Include use of pipes
new_list <- practice_list %>% map(~sqrt(.))


# Load in gene data
treatment1 <- read.csv(
  "https://raw.githubusercontent.com/travis-m-blimkie/misc_files/master/MyData/genes_treatment1_vs_ctrl.csv")

treatment2 <- read.csv(
  "https://raw.githubusercontent.com/travis-m-blimkie/misc_files/master/MyData/genes_treatment2_vs_ctrl.csv")

# Take a quick look at the data frame
glimpse(treatment1)

# Put both data frames into a list
treatment_list <- list(treat1 = treatment1,
                       treat2 = treatment2)

# To access one of the data frames (by name)
glimpse(treatment_list$treat1)

# Applying a function to one of these data frames
nrow(treatment_list$treat1)


# How to get the number of rows (genes) in each data frame?


# for loop method
for (i in 1:length(treatment_list)) {
  print(nrow(treatment_list[[i]]))
}


# Using map to do the same function to both data frames
map(treatment_list, function(x) {
  nrow(x)
})


treatment_list %>% map(~nrow(.))


# Can use function like select()
select_df <- treatment_list %>% map(~select(., locus_tag, padj, FC))

glimpse(select_df$treat1)
glimpse(select_df$treat2)


# Demonstration:
# Example of file reading with map() and list.files()
my_treatments <- list("treatment1", "treatment2")

my_files <- my_treatments %>%
  map(~list.files(path = "/cygwin64/home/Laptop/mybin/misc_files/MyData",
                  pattern = .,
                  full.names = T))

my_dfs <- my_files %>%
  map(~read_csv(file = .)
      ) %>% set_names(my_treatments)


# Map in parallel with map2()
# Filter each of our data frames on different values (SAME COLUMN)
filter_vals <- c(5, 2)

filtered_dfs <- map2(treatment_list, filter_vals, function(df, val)
  filter(df, ABSLFC >= val)
  )


# Saving specifically named files with map2()
map2(filtered_dfs, names(filtered_dfs), function(df, nm)
  write_csv(df, path = paste0("new_df_", nm, ".csv"))
  )
