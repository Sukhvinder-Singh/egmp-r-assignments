# R assignment submitted by group members:
# 1. Sukhvinder Singh (kpmg03_sukhvinder_s@mdi.ac.in)
# 2. Kritika Seth (kpmg03_kritika_s@mdi.ac.in)
# 3. Vikram Singh (kpmg03_vikram_s@mdi.ac.in)
# 4. Parul Gupta (kpmg03_parul_g@mdi.ac.in)
# 5. Kanchan Nanda (kpmg03_kanchan_n@mdi.ac.in)
# 6. Ankit Bhatia (kpmg03_ankit_b@mdi.ac.in)

# Notes: We've used the latest R version 4.3.1.
# We've also commented the file for line-by-line explanation.

# Uncomment below line to install dyplr package
# install.packages("dplyr")
library("dplyr")

mt_cars_data <- mtcars

# Task 1: For mcars seek the data with 3 or 4 gears and 4 or 6 cylinders
mt_cars_data %>% filter(
  (gear == 3 | gear == 4) &
    (cyl == 4 | cyl == 6)
)

# Task 2: Use dplyr to give a tibble which compares number
# of gears and max mileage in mpg for each gear type
mt_cars_data %>%
  group_by(gear) %>%
  summarize(max(mpg))
