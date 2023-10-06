# R assignment submitted by group members:
# 1. Sukhvinder Singh (kpmg03_sukhvinder_s@mdi.ac.in)
# 2. Kritika Seth (kpmg03_kritika_s@mdi.ac.in)
# 3. Vikram Singh (kpmg03_vikram_s@mdi.ac.in)
# 4. Parul Gupta (kpmg03_parul_g@mdi.ac.in)
# 5. Kanchan Nanda (kpmg03_kanchan_n@mdi.ac.in)
# 6. Ankit Bhatiya (kpmg03_ankit_b@mdi.ac.in)

# Notes: We've used the latest R version 4.3.1.
# We've also commented the file for line-by-line explanation.
# Also need to set the working directory so that the files are all in a
# single folder, and can be read with the code below, as we are dynamically
# getting the working directory using R code.

# This gets the working directory
working_dir <- getwd()
# This line replaces windows forward slash with backslash
working_dir_path <- gsub("\\", "/", working_dir, fixed = TRUE)

# We set the working directory to read the files conveniently
setwd(working_dir_path)

# ----------------------------------------
# Task 1: Read a text file with R and display it's content
text_data <- readLines(
  paste(working_dir_path, "sample-text.txt", sep = "/"),
  encoding = "UTF-8",
  warn = FALSE
)
print(text_data)

# ----------------------------------------
# Task 2: Read a .csv file with R and display it's content
# Source of the CSV file is:
# https://people.sc.fsu.edu/~jburkardt/data/csv/csv.html (grades.csv)
csv_data <- read.csv(
  paste(working_dir_path, "grades.csv", sep = "/"),
  header = TRUE
)
print(csv_data)

# ----------------------------------------
# Task 3: Read a JSON file with R and display it's content
# Install and use rjson library for reading JSON files
install.packages("rjson")
library("rjson")
# Source of JSON file is https://jsonplaceholder.typicode.com/users
json_data <- fromJSON(
  file = paste(working_dir_path, "users.json", sep = "/")
)
print(as.data.frame(json_data))

# ----------------------------------------
# Task 4: Read a XML file with R and display it's content
# Install and use XML library
install.packages("XML")
library("XML")
library("methods")
# Source of XML file is https://www.w3schools.com/xml/simple.xml
xml_data <- xmlParse(
  file = paste(working_dir_path, "sample-xml.xml", sep = "/")
)
print(xmlToDataFrame(xml_data))

# ----------------------------------------
# Task 5: Read a semicolon separated .csv file with R and display
# it's content. "read.csv2()" is for semicolon separated CSV file
# Source of the CSV file:
# https://people.sc.fsu.edu/~jburkardt/data/csv/csv.html (grades-2.csv)
csv_data2 <- read.csv2(
  paste(working_dir_path, "grades-2.csv", sep = "/"),
  header = TRUE
)
print(csv_data2)

# ----------------------------------------
# Task 6: Reading data using read.delim() for tab delimited file
delim_data <- read.delim(
  paste(working_dir_path, "delim-example.txt", sep = "/"),
  header = TRUE
)
print(delim_data)
