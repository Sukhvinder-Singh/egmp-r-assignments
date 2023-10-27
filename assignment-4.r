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

# In this example, we are trying to model data from file:
# "placement.csv" in assignment-4-data folder. It has several columns such as
# scores obtained in high school, college, placement marks, MBA score etc,
# and we are trying to model and test the data to find out the relationship
# between them and the salary of the individual using linear regression.
# This will give us insights about whether marks in MBA/College or the
# pattern of scores obtained during schooling along with college/MBA/placement
# test marks, will have effect on # the salary/package/CTC of the individual

# All steps we followed for this assignment are also included as comments below,

# Set terminal width
options("width" = 500)

# Standardizing values function
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

# Reading the data file
placement_data <- read.csv(
  paste(working_dir_path, "assignment-4-data/placement.csv", sep = "/"),
  header = TRUE
)

# We found some of the salary cells were empty/not available
# Thus, we have removed those rows in which salary was not present.
# This was the first step in cleansing the data for further analysis.
placement_data <- placement_data[!is.na(placement_data$salary), ]

# We also removed unnecessary variables that were
# not required for linear regression
placement_data <- placement_data[
  ,
  names(placement_data) %in%
    c("ssc_p", "hsc_p", "degree_p", "etest_p", "mba_p", "salary")
]

# Normalizing the placement data
placement_data_norm <- data.frame(lapply(placement_data, custom_std))

# Getting a sample of the placement data
index <- sample(
  seq_len(nrow(placement_data_norm)),
  round(0.7 * nrow(placement_data_norm))
)

# Training set of placement data
placement_train <- placement_data_norm[index, ]

# Testing set of placement data
placement_test <- placement_data_norm[-index, ]

nrow(placement_train)
nrow(placement_test)

# Modeling the placement data. Here salary is the
# dependent variable, and we model the
# data with various predictor variables
model_a <- lm(salary ~ mba_p, data = placement_train)
model_b <- lm(salary ~ mba_p + degree_p + hsc_p, data = placement_train)

# We get the summary of both models and check
# various coefficients to check if everything is
# correct till now
summary(model_a)
summary(model_b)

# This is for prediction with both models we
# have made above with placement test dataset
pred_a <- predict(model_a, placement_test)
pred_b <- predict(model_b, placement_test)

# We check the mean square error to find out
# which model may be better than others
mse_a <- sum((pred_a - placement_test$salary)^2) / nrow(placement_test)
mse_b <- sum((pred_b - placement_test$salary)^2) / nrow(placement_test)

mse_a
mse_b

# Lower the value, better the fit, and vice-versa
AIC(model_a, model_b)
BIC(model_a, model_b)

# As per our results, model A is better, hence we
# plot various graphs for interpretation.
plot(model_a, 1)
plot(model_a, 2)
plot(model_a, 3)
plot(model_a, 4)
plot(model_a, 5)
plot(model_a, 6)
