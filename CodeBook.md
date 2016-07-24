Files from the UCI HAR Dataset to be used

SUBJECT FILES
test/subject_test.txt
train/subject_train.txt
ACTIVITY FILES
test/X_test.txt
train/X_train.txt
DATA FILES
test/y_test.txt
train/y_train.txt
features.txt - Names of column variables in the dataTable

activity_labels.txt - Links the class labels with their activity name

required packages for r script run_analysis.R

library(dplyr)
library(tidyr)
library(data.table)

The TidyData.txt is a tidy data set because it meets these three criteria:
1. Each variable forms a column
2. Each observation forms a row
3. Each type of observational unit forms a table

