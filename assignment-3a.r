# R assignment submitted by group members:
# 1. Sukhvinder Singh (kpmg03_sukhvinder_s@mdi.ac.in)
# 2. Kritika Seth (kpmg03_kritika_s@mdi.ac.in)
# 3. Vikram Singh (kpmg03_vikram_s@mdi.ac.in)
# 4. Parul Gupta (kpmg03_parul_g@mdi.ac.in)
# 5. Kanchan Nanda (kpmg03_kanchan_n@mdi.ac.in)
# 6. Ankit Bhatia (kpmg03_ankit_b@mdi.ac.in)

# Notes: We've used the latest R version 4.3.1.
# We've also commented the file for line-by-line explanation.

mt_cars_data <- mtcars

# Task 1: Use aggregate function to express the mean mileage
# in mpg as a function of no. of gears and no of cylinders?
aggregate(mpg ~ gear + cyl, mt_cars_data, mean)

# Task 2: Install library "MASS" and read in the dataset titled "Boston",
# understand the data elements. Subsequently use aggregate to express the
# median value of various relevant variables as a function of the integer
# or factor variables chas and rad.

# Note: Please uncomment below line to install package
# install.packages("MASS")
library("MASS")

# Details of the DB here:
# https://www.cs.toronto.edu/~delve/data/boston/bostonDetail.html

# Per capita crime rate by town with weighted
# distances to five Boston employment centres
aggregate(crim ~ dis, Boston, median)

# Per capita crime rate by town with weighted
# distances to five Boston employment centres, and
# pupil-teacher ratio by town
aggregate(crim ~ dis + ptratio, Boston, median)

# Max Proportion of residential land zoned for lots
# over 25,000 sq.ft. with Charles River dummy variable
aggregate(zn ~ chas, Boston, max)

# Task 3:  Use aggregate function to express the mean mileage in mpg and
# mean horsepower in hp as a function of no. of gears and no of cylinders?
mean_mileage <- aggregate(mpg ~ gear + cyl, mt_cars_data, mean)
mean_hp <- aggregate(hp ~ gear + cyl, mt_cars_data, mean)
cbind(mean_hp, mean_mileage)
