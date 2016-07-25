
##1

## assign linked url to variable
cp_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
##create directory to store raw data if it does not already exist
if(!file.exists("./data")){dir.create("./data")}
## download the file to the directory just made
download.file(cp_url, destfile = "./data/courseproject.zip", method = "curl")
## unzip the file to the same directory
unzip(zipfile = "./data/courseproject.zip", exdir = "./data")
## store the path to the file in a variable 
uci_path <- file.path("./data", "UCI HAR Dataset")
## read the data into r from both test and train folders in the UCI HAR Dataset folder
s_train_data <- tbl_df(read.table(file.path(uci_path, "train", "subject_train.txt")))
s_test_data <- tbl_df(read.table(file.path(uci_path, "test", "subject_test.txt")))
a_train_data <- tbl_df(read.table(file.path(uci_path, "train", "Y_train.txt")))
a_test_data  <- tbl_df(read.table(file.path(uci_path, "test", "Y_test.txt")))
f_test_dat  <-  tbl_df(read.table(file.path(uci_path, "test", "X_test.txt")))
f_train_data  <- tbl_df(read.table(file.path(uci_path, "train", "X_train.txt")))

## bind similar data by rows with the rbind function
subject_data <- rbind(s_train_data, s_test_data)
activity_data <- rbind(a_train_data, a_test_data)
features_data <- rbind(f_train_data, f_test_dat)

## Both subject and activity data contain variable V1, we must rename V1 in each set: ("V1" to "subject" in subject_data)
setnames(subject_data, "V1", "subject")
setnames(activity_data, "V1", "Activity_Number")

## Read in features data
f_data <- tbl_df(read.table(file.path(uci_path, "features.txt")))

# Rename variables in features.txt
setnames(f_data, names(f_data), c("Feature_Number", "Feature_Name"))
colnames(features_data) <- f_data$Feature_Name


## Read in activity labels
activity_labels <- tbl_df(read.table(file.path(uci_path, "activity_labels.txt")))
setnames(activity_labels, names(activity_labels), c("Activity_Number", "Activity_Name"))

## Combine all of the data into one set: full_data
S_A_combine <- cbind(subject_data, activity_data)
full_data <- cbind(S_A_combine, features_data)

##2 extract std and mean
filtered_meanstd <- grep("mean\\(\\)|std\\(\\)", f_data$Feature_Name,value=TRUE)
filtered_meanstd <- union(c("subject","Activity_Number"), filtered_meanstd)

full_data <- subset(full_data ,select = filtered_meanstd)

##3 use descriptive names to rename activities in the dataset
full_data <- merge(activity_labels, full_data, by = "Activity_Number", all.x=TRUE)
full_data$Activity_Name <- as.character(full_data$Activity_Name)

aggregate_data <- aggregate(. ~ subject - Activity_Name, data = full_data, mean)
full_data <- tbl_df(arrange(aggregate_data, subject, Activity_Name))

##4 Rename variable names
names(full_data)<-gsub("std()", "SD", names(full_data))
names(full_data)<-gsub("mean()", "Mean", names(full_data))
names(full_data)<-gsub("^t", "Time", names(full_data))
names(full_data)<-gsub("^f", "Frequency", names(full_data))
names(full_data)<-gsub("Acc", "Accelerometer", names(full_data))
names(full_data)<-gsub("Gyro", "Gyroscope", names(full_data))
names(full_data)<-gsub("Magn", "Magnitude", names(full_data))
names(full_data)<-gsub("BodyBody", "Body", names(full_data))


## create second tidy data set
write.table(full_data, "TidyData.txt", row.name=FALSE)

