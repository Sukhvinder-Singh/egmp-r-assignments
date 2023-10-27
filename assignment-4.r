# R assignment submitted by group members:
# 1. Sukhvinder Singh (kpmg03_sukhvinder_s@mdi.ac.in)
# 2. Kritika Seth (kpmg03_kritika_s@mdi.ac.in)
# 3. Vikram Singh (kpmg03_vikram_s@mdi.ac.in)
# 4. Parul Gupta (kpmg03_parul_g@mdi.ac.in)
# 5. Kanchan Nanda (kpmg03_kanchan_n@mdi.ac.in)
# 6. Ankit Bhatia (kpmg03_ankit_b@mdi.ac.in)

# Notes: We've used the latest R version 4.3.1.
# We've also commented the file for line-by-line explanation.
# Also need to set the working directory so that the files are all in a
# single folder, and can be read with the code below, as we are dynamically
# getting the working directory using R code.

# Set terminal width
options("width" = 500)

# Standardizing values
custom_std <- function(x) {
  x <- (x - mean(x)) / sd(x)
  return(x)
}

# This gets the working directory
working_dir <- getwd()
# This line replaces windows forward slash with backslash
working_dir_path <- gsub("\\", "/", working_dir, fixed = TRUE)

# We set the working directory to read the files conveniently
setwd(working_dir_path)

placement_data <- read.csv(
  paste(working_dir_path, "assignment-4-data/placement.csv", sep = "/"),
  header = TRUE
)

placement_data <- placement_data[!is.na(placement_data$salary), ]
placement_data <- placement_data[
  ,
  names(placement_data) %in%
    c("ssc_p", "hsc_p", "degree_p", "etest_p", "mba_p", "salary")
]

placement_data

placement_data_norm <- data.frame(lapply(placement_data, custom_std))
placement_data_norm

index <- sample(
  seq_len(nrow(placement_data_norm)),
  round(0.7 * nrow(placement_data_norm))
)

placement_train <- placement_data_norm[index, ]
placement_test <- placement_data_norm[-index, ]

nrow(placement_train)
nrow(placement_test)

# Model
model_a <- lm(salary ~ mba_p, data = placement_train)
model_b <- lm(salary ~ mba_p + degree_p + hsc_p, data = placement_train)

summary(model_a)
summary(model_b)

pred_a <- predict(model_a, placement_test)
pred_b <- predict(model_b, placement_test)

mse_a <- sum((pred_a - placement_test$salary)^2) / nrow(placement_test)
mse_b <- sum((pred_b - placement_test$salary)^2) / nrow(placement_test)

mse_a
mse_b

# Lower the value, better the fit, and vice-versa
AIC(model_a, model_b)
BIC(model_a, model_b)

# Various plots of model A
plot(model_a, 1)
plot(model_a, 2)
plot(model_a, 3)
plot(model_a, 4)
plot(model_a, 5)
plot(model_a, 6)
