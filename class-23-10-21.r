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

plot(model_tree_a, 1)
plot(model_tree_a, 2)
