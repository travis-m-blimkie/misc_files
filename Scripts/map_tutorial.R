
# Loops, apply(), and purrr::map()

practice_list <- list(a = 9,
                      b = 16,
                      c = 25)

names(practice_list)


# for loop method
for (i in practice_list) {
  print(i * 2)
}


# for loop, saving the result
output_list <- list()
for (i in practice_list) {
  output_list[i] = sqrt(i)
}

# Names are not carried over from the original list, but can be added
names(output_list)


# apply() method
lapply(X = practice_list, sqrt(x))


# map method
map(.x = practice_list, function(x) x * 2)

# More concise map method
map(practice_list, ~sqrt(.))

# Include use of pipes
new_list <- practice_list %>% map(~sqrt(.))
