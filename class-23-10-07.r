# Sum of rows
m1 <- matrix(1:20, ncol = 4)
m1
apply(m1, 1, sum)
apply(m1, 2, sum)

s1 <- function(v1) {
  p1 <- vector(mode = "numeric", length(v1))
  for (i in 1:length(v1)) {
    if (v1[i] %% 2 == 0) {
      p1[i] <- v1[i]
    }
  }
  return(p1)
}

apply(m1, 1, s1)
s1(m1[, 1])
s1(m1[, 2])
s1(m1[1, 1])

d1 <- mtcars
md <- function(x) {
  c(mean(x), sd(x))
}
apply(d1, 2, md)

list1 <- list(m1 = m1, n1 = c(1, 3, 5, 7))
list1
lapply(list1, sum)
sapply(list1, sum)
vapply(list1, sum, numeric(1))
vapply(d1, md, numeric(2))
rowSums(m1)
colSums(m1)

list2 <- list(
  b1 = c(1, 2, 3), b2 = 1:10
)

mapply(identical, list1, list2)
mapply(sum, list1, list2)
mapply(function(x, y) {
  x^y
}, x = c(2, 3, 4), y = c(1, 2, 3))

tapply(d1$mpg, d1$cyl, mean)

# install.packages("dplyr")

library("dplyr")
