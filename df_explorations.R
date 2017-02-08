# df_explorations
# By: Tristan Kaiser & Antonio Skilton
# Last edited: 2/7/2017

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

fill_function(df, "letter")
