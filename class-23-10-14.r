# Set terminal width
options("width" = 500)

# Random numbers
b1 <- runif(15, 1, 100)
m1 <- matrix(b1, ncol = 5)

rownames(m1) <- c("North", "South ", "East")
colnames(m1) <- c("May", "June", "July", "August", "September")

# Define colors
color <- c("red", "green", "blue")

# Define bar plot
barplot(m1, col = color, xlab = "Month", ylab = "Sales")
# Define legend
legend("topleft", fill = color, rownames(m1))

barplot(m1, col = rainbow(5), xlab = "Month", ylab = "Sales", horiz = TRUE)
legend("bottomright", fill = rainbow(5), rownames(m1))

v1 <- 1:20
y1 <- LETTERS[1:20]
barplot(v1, xlab = "letters", ylab = "value", main = "Chart")
