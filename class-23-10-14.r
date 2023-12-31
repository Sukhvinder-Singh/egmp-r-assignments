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

# Define bar plot with letters and numbers
v1 <- 1:20
y1 <- LETTERS[1:20]
barplot(v1, xlab = "letters", ylab = "value", main = "Chart", names.arg = y1)

# Adding horizontal line
abline(h = mean(v1))

# Adding vertical line
abline(v = mean(v1))

# Histogram
hist(b1, col = rainbow(5))

# Density plot
plot(density(b1))

# Saving file
png(file = "files/sample-histogram.png")
hist(b1, col = rainbow(5))
dev.off()

# Scatter plot
plot(1:10, 11:20, pch = "x")

# Get coordinates on click
locator(1)
text(2, 16, "Sukhvinder")

# Pie chart
pie_data <- c(2, 4, 5, 7, 12, 14, 16)
pie(pie_data)

# Defining labels for pie chart
k1 <- pie_data * 100 / sum(pie_data)
pie(pie_data, labels = paste(round(k1, 2), "%"))

# Making box plot
d1 <- trees
boxplot(d1)

d1 <- trees

# Strip chart
stripchart(d1$Height, method = "overplot")
stripchart(d1$Height, method = "jitter")

# Curves
curve(sin, -2 * pi, 2 * pi, col = "red")
curve(cos, -2 * pi, 2 * pi, col = "blue", add = TRUE)

# Curves with different functions
curve(x^3, -2, 2, col = "red")
curve(x^2, -2, 2, col = "blue", add = TRUE)

# Creating grid
par(mfrow = c(2, 2))
plot(d1$Height, d1$Girth, type = "b")
boxplot(d1$Girth)
stripchart(d1$Height, method = "jitter")
plot(d1$Height, d1$Volume, pch = "v")

# Creating polygons
plot(1:8, 1:8, type = "n")
polygon(c(2, 6, 6, 2), c(3, 3, 6, 7), col = "blue")

x <- matrix(rep(1:10, 10), byrow = TRUE, ncol = 10)
y <- matrix(rep(1:10, 10), ncol = 10)
z <- x^2 + y^2

# Creating perspective
persp(volcano, col = "green")
