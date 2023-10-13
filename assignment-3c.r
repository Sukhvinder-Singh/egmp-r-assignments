# R assignment submitted by group members:
# 1. Sukhvinder Singh (kpmg03_sukhvinder_s@mdi.ac.in)
# 2. Kritika Seth (kpmg03_kritika_s@mdi.ac.in)
# 3. Vikram Singh (kpmg03_vikram_s@mdi.ac.in)
# 4. Parul Gupta (kpmg03_parul_g@mdi.ac.in)
# 5. Kanchan Nanda (kpmg03_kanchan_n@mdi.ac.in)
# 6. Ankit Bhatia (kpmg03_ankit_b@mdi.ac.in)

# Notes: We've used the latest R version 4.3.1.
# We've also commented the file for line-by-line explanation.
# Also need to set the working directory so that the files are all in a
# single folder, and can be read with the code below, as we are dynamically
# getting the working directory using R code.

# Set terminal width
options("width" = 500)

# Source of the sample DB is here:
# https://learnsql.com/blog/sql-join-examples-with-explanations/

# Uncomment below line to install dyplr package
# install.packages("dplyr")
library("dplyr")

# This gets the working directory or set it as required path
working_dir <- getwd()
# This line replaces windows forward slash with backslash
working_dir_path <- gsub("\\", "/", working_dir, fixed = TRUE)

# We set the working directory to read the files conveniently
setwd(working_dir_path)

# Read books DB
books_db <- read.csv(
  paste(working_dir_path, "assignment-3c-data/books.csv", sep = "/"),
  header = TRUE
)

# Read authors DB
authors_db <- read.csv(
  paste(working_dir_path, "assignment-3c-data/authors.csv", sep = "/"),
  header = TRUE
)

authors_db_2 <- read.csv(
  paste(working_dir_path, "assignment-3c-data/authors-2.csv", sep = "/"),
  header = TRUE
)

# Read editors DB
editors_db <- read.csv(
  paste(working_dir_path, "assignment-3c-data/editors.csv", sep = "/"),
  header = TRUE
)

editors_db_2 <- read.csv(
  paste(working_dir_path, "assignment-3c-data/editors-2.csv", sep = "/"),
  header = TRUE
)

# Read translators DB
translators_db <- read.csv(
  paste(working_dir_path, "assignment-3c-data/translators.csv", sep = "/"),
  header = TRUE
)

# Task 1: Create using any relevant data left join using dplyr?
# We joined author first and last name from authors_db to books_db
books_db %>% left_join(authors_db)

# We joined editor first and last name from editors_db to books_db
books_db %>% left_join(editors_db)

# Task 2: Create using any relevant data right join using dplyr?
# Right join authors and books db
authors_books_join <- authors_db %>% right_join(books_db)
authors_books_join

# Right join authors + books with editors
editors_db %>% right_join(authors_books_join)

# Right join translators_db with books_db
translators_db %>% right_join(books_db)

# Task 3: Create semi join using dplyr?
books_db %>% semi_join(authors_db_2)
books_db %>% semi_join(editors_db_2)

# Task 4: Create anti join using dplyr?
books_db %>% anti_join(authors_db_2)
books_db %>% anti_join(editors_db_2)
