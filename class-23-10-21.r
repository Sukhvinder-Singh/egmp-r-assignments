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
custom_std <- function(x) {
  x <- (x - mean(x)) / sd(x)
  return(x)
}

dt2 <- data.frame(lapply(dt1, custom_std))
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

df2n <- data.frame(lapply(df2n, custom_std))
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

fd1$chd <- ifelse(fd1$chd == "Si", 1, 0)
fd1$famhist <- ifelse(fd1$famhist == "Present", 1, 0)
str(fd1)

cor(fd1[, 1:9])

fdf <- fd1[, c(1:3, 5, 6, 8, 10)]
str(fdf)

fdfn <- fdf[, c(1, 2, 3, 5, 6)]
fdfn <- data.frame(lapply(fdfn, custom_std))
str(fdfn)

udf <- data.frame(fdfn, famhist = as.factor(fdf$famhist), chd = fdf$chd)
str(udf)

index3 <- sample(1:nrow(udf), round(0.7 * nrow(udf)))

h_train <- udf[index3, ]
h_test <- udf[-index3, ]

nrow(h_train)
nrow(h_test)

model_h_a <- glm(
  chd ~ sbp + tobacco + ldl + typea + alcohol + famhist,
  family = binomial(link = "logit"),
  data = h_train
)

summary(model_h_a)

model_h_b <- glm(
  chd ~ sbp + tobacco + ldl + typea + famhist,
  family = binomial(link = "logit"),
  data = h_train
)

summary(model_h_b)

ypred_h_a <- predict(model_h_a, h_test, type = "response")
head(ypred_h_a)

ypred_h_b <- predict(model_h_b, h_test, type = "response")

ypred_h_ma <- ifelse(ypred_h_a <= 0.5, 0, 1)
ypred_h_mb <- ifelse(ypred_h_b <= 0.3, 0, 1)

head(ypred_h_ma)

t1 <- table(actual = h_test$chd, predicted = ypred_h_ma)
t2 <- table(actual = h_test$chd, predicted = ypred_h_mb)
t1
t2

# Uncomment below line to install dyplr package
# install.packages("pROC")
library("pROC")

roc1 <- roc(h_test$chd, ypred_h_ma)
roc2 <- roc(h_test$chd, ypred_h_mb)

roc1
roc2

plot.roc(roc1)
plot.roc(roc2)

# Uncomment below line to install dyplr package
# install.packages("caret")
library("caret")

confusionMatrix(t1)
