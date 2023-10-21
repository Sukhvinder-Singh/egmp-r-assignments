# Set terminal width
options("width" = 500)

# Boxplot
dt1 <- trees
str(dt1)
boxplot(dt1$Volume)
dt1[dt1$Volume > 70, ]

dt1 <- dt1[1:30, ]
str(dt1)

boxplot(dt1$Girth)
boxplot(dt1$Height)

# Standardizing values
standardize <- function(x) {
  x <- (x - mean(x)) / sd(x)
  return(x)
}

dt2 <- data.frame(lapply(dt1, standardize))
str(dt2)

index <- sample(1:nrow(dt2), round(0.7 * nrow(dt2)))
tree_train <- dt2[index, ]
tree_test <- dt2[-index, ]
nrow(tree_train)
nrow(tree_test)

# Model
model_tree_a <- lm(Volume ~ Girth, data = tree_train)
summary(model_tree_a)

model_tree_b <- lm(Volume ~ Girth + Height, data = tree_train)
summary(model_tree_b)

# Prediction
pred_tree_a <- predict(model_tree_a, tree_test)
pred_tree_b <- predict(model_tree_b, tree_test)

mse_a <- sum((pred_tree_a - tree_test$Volume)^2) / nrow(tree_test)
mse_b <- sum((pred_tree_b - tree_test$Volume)^2) / nrow(tree_test)

mse_a
mse_b

# Lower the value, better the fit, and vice-versa
AIC(model_tree_a, model_tree_b)
BIC(model_tree_a, model_tree_b)

# Plots
plot(model_tree_a, 1)
plot(model_tree_a, 2)
plot(model_tree_a, 3)
plot(model_tree_a, 4)
plot(model_tree_a, 5)
plot(model_tree_a, 6)

library("MASS")
df1 <- Boston
str(df1)

# Correlation between variables
cor(df1)

df2 <- df1[, c("crim", "zn", "chas", "medv")]
str(df2)
boxplot(df2$medv)
summary(df2)
boxplot(df2)

df2n <- df2[, c("crim", "zn", "medv")]
df2c <- as.factor(df2$chas)
str(df2c)

df2n <- data.frame(lapply(df2n, standardize))
str(df2n)

df3 <- data.frame(
  crim = df2n$crim,
  zn = df2n$zn,
  chas = df2$chas,
  medv = df2n$medv
)
str(df3)

df3$chas <- as.factor(df3$chas)
str(df3)

index2 <- sample(1:nrow(df3), round(0.7 * nrow(df3)))
boston_train <- df3[index2, ]
boston_test <- df3[-index2, ]

nrow(boston_train)
nrow(boston_test)

model_boston_a <- lm(medv ~ crim + zn + chas, data = boston_train)
summary(model_boston_a)

model_boston_b <- lm(medv ~ crim * chas + zn, data = boston_train)
summary(model_boston_b)

ypred_boston_a <- predict(model_boston_a, boston_test)
ypred_boston_b <- predict(model_boston_b, boston_test)

mse_boston_a <- sum((ypred_boston_a - boston_test$medv)^2) / nrow(boston_test)
mse_boston_b <- sum((ypred_boston_b - boston_test$medv)^2) / nrow(boston_test)

mse_boston_a
mse_boston_b

plot(model_boston_a, 1)
plot(model_boston_b, 1)

# This gets the working directory
working_dir <- getwd()
# This line replaces windows forward slash with backslash
working_dir_path <- gsub("\\", "/", working_dir, fixed = TRUE)

# We set the working directory to read the files conveniently
setwd(working_dir_path)

fd1 <- read.csv(
  paste(working_dir_path, "SAHeart.csv", sep = "/"),
  header = TRUE
)

str(fd1)
