```r
# Robust subsetting function that checks for missing columns and throws an informative error
robustSubset <- function(df, cols) {
  missingCols <- setdiff(cols, names(df))
  if (length(missingCols) > 0) {
    stop(paste("Error: Columns", paste(missingCols, collapse = ", "), "not found in data frame."))
  }
  df[, cols]
}

df <- data.frame(A = 1:3, B = 4:6, C = 7:9)
cols <- c("A", "B", "D")

# Attempting to subset with the robust function will throw an error
tryCatch({
  subset <- robustSubset(df, cols)
}, error = function(e) {
  print(e$message)
})
```