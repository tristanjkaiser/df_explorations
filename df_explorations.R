# df_explorations
# By: Tristan Kaiser & Antonio Skilton
# Last edited: 2/7/2017

#### Tristan's problem ####
# Take an original column (letter) and extrapolate it into an existing set of columns
# that reflect the possible values of the original column
# ie.:
# letter a b c d e
#   a    1 0 0 0 0
#   c    0 0 1 0 0
#   e    0 0 0 0 1
#   d    0 0 0 1 0
#   b    0 1 0 0 0

# This solution works, but goal is to turn it into a function so
# it can be applied to other columns

# Create data frame
df <- data.frame(matrix(0, nrow = 100, ncol = 6))
names(df) <- c("letter", "a", "b", "c", "d", "e")
df$letter <- sample(letters[1:5], 100, TRUE)

# This works to apply a 1 in the appropriate column given the value of df$letter
for(i in seq_along(df$letter)){
  df[i, df$letter[[i]]] <- 1
}

#### Antonio's Solution ####
# Takes a list and extrapolates it into a data frame reflecting
# appearance of 1's & 0's
# problem that remains, is that it will leave out any values that 
# never appear in the original column

# start with categorical variable
df <- data.frame(letter = sample(letters[1:5], 100, TRUE))

fill_function <- function(df, column_name){
  
  unique_values <- unique(df[, column_name])[order(unique(df[, column_name]))]
  
  mx <- matrix(nrow = nrow(df), ncol = length(unique_values))
  
  for(i in 1:length(unique_values)){
    mx[,i] <- ifelse(df[, "letter"] == unique_values[i], 1, 0)
  }
  
  colnames(mx) <- unique_values
  final_df <- cbind(df, mx)
  return(final_df)
}

df2 <- fill_function(df, "letter")