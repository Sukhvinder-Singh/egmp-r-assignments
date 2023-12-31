# R assignment submitted by group members:
# 1. Sukhvinder Singh (kpmg03_sukhvinder_s@mdi.ac.in)
# 2. Kritika Seth (kpmg03_kritika_s@mdi.ac.in)
# 3. Vikram Singh (kpmg03_vikram_s@mdi.ac.in)
# 4. Parul Gupta (kpmg03_parul_g@mdi.ac.in)
# 5. Kanchan Nanda (kpmg03_kanchan_n@mdi.ac.in)
# 6. Ankit Bhatia (kpmg03_ankit_b@mdi.ac.in)

# Notes: We've used the latest R version 4.3.1.
# We've also commented the file for line-by-line explanation.

# Set terminal width
options("width" = 500)

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

# Task 3: Use dplyr to give a tibble to give a comparison of gears
# with both max mileage and max hp for each gear type
mt_cars_data %>%
  group_by(gear) %>%
  summarize(max(mpg), max(hp))

# Task 4: Use dplyr to give a tibble to present a display of gear type,
# carb type together with max mileage, min mileage, max hp, min hp
mt_cars_data %>%
  group_by(gear, carb) %>%
  summarize(max(mpg), min(mpg), max(hp), min(hp))

# Task 5: Use dplyr to give a tibble to present a display of gear type,
# with a mean for ratio of hp/cyl for each type
mt_cars_data %>%
  group_by(gear) %>%
  summarize(mean(hp / cyl))
