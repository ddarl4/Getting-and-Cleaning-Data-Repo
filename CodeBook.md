The source of the original data was obtained through this link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

and a full description of the study can be obtained here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Process:

run_analysis.R performs the following process in order to clean and write a tidy set:
	1. Downloads data from source, unzips file, and reads data into R
	2. Binds together both pieces of subject data, both pieces of activity data and both pieces of features using rbind
	3. Renames similar variables into proper and distinct variables	
	4. extracts only the data where mean and standard deviation are contained
	5. Uses descriptive names to rename activities in dataset
	6. creates a second, independent dataset
	
Variables:

	1. cp_url
	2. uci_path
	3. s_train_data <- contents of training data for subjects: "train", "subject_train.txt"
	4. s_test_data <- contents of test data for subjects: "test", "subject_test.txt"
	5. a_train_data <- contents of training data for subjects: "train", "y_train.txt"
	6. a_test_data  <- test labels content: "test", "y_test.txt"
	7. f_test_dat  <-  test set content: "test", "X_test.txt"
	8. f_train_data  <- training set content: "train", "X_train.txt"
	
	9. subject_data <- rowbound subject data
	10. activity_data <- rowbound activity data
	11. features_data <- rowbound feature data
	12. f_data <- table containing data from "features.txt"
	13. activity_labels <- table containing data from "activity_labels.txt"
	14. S_A_combine <- column bound subject and activity data: "subject_data", "activity_data"
	15. full_data <- column bound subject, activity, and features data: "S_A_combine", "features_data"
	16. filtered_meanstd <- filtered data from the f_data table, grabbing only observations containing mean or std data
	17. aggregate_data <- splits full_data into subsets, computes mean

Tidy Data Output:

	TidyData.txt
		1. 180 rows x 69 column dataframe
		2. column one contains subject numbers
		3. column two is the activity name
		4. the rest of the columns contain mean/standard deviation data