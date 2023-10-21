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

model_tree_a <- lm(Volume ~ Girth, data = tree_train)
summary(model_tree_a)
