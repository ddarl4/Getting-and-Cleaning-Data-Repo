# Getting-and-Cleaning-Data-Repo
Course Project
The r script run_analysis.R does the following

1. Downloads necessary files, creates directories and reads files into R
2. Merges datasets into one complete set
3. Extracts just data pertaining to standard deviation and the mean of each subject, activity pair for every variable
4. Adds labels from the activity_labels.txt to the full_data dataset
5. Renames variables in the full_data set into easier to understand variable names
6. creates a second, independent, tidy dataset that can be read back into R with: data <- read.table(file_path, header = TRUE)
 