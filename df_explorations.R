# df_explorations
# By: Tristan Kaiser
# Last edited: 2/7/2017

library(tidyverse)

# Create data frame
df <- data.frame(matrix(0, nrow = 100, ncol = 6))
names(df) <- c("letter", "a", "b", "c", "d", "e")
df$letter <- sample(letters[1:5], 100, TRUE)

# This works to apply a 1 in the appropriate column given the value of df$letter
for(i in seq_along(df$letter)){
  df[i, df$letter[[i]]] <- 1
}


#### Function attempt ####
# This doesn't work, but what I'm thinking about

fill_function <- function(df, variable){
    df[,variable] <- 1
}

df2 <- dmap(df, 1, fill_function(df, df$letter))

df3 <- lapply(df, fill_function(df, df$letter))
