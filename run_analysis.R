#You should create one R script called run_analysis.R that does the following. 
#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names. 
#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#6. Please upload the tidy data set created in step 5 of the instructions. Please upload your data set as a txt file created with write.table() using row.name=FALSE 
## (do not cut and paste a dataset directly into the text box, as this may cause errors saving your submission).

library(data.table)
library(dplyr)
activity <- read.csv("activity_labels.txt", sep="", header=FALSE)
features <- read.csv("features.txt", sep="", header=FALSE)
features <- features[,-1]

x_train <- read.csv("X_train.txt", sep="", header=FALSE)
x_test <- read.csv("X_test.txt", sep="", header=FALSE)

y_test <- read.csv("Y_test.txt", header=FALSE)
for (i in 1:max(y_test)) {
	y_test[y_test == i] <- as.character(activity[i,2]) }

y_train <- read.csv("Y_train.txt", header=FALSE)
for (i in 1:max(y_train)) {
	y_train[y_train == i] <- as.character(activity[i,2]) }

subject_train <- read.csv("subject_train.txt", header=FALSE)

subject_test <- read.csv("subject_test.txt", header=FALSE)

train <- cbind(subject_train, y_train, x_train)
test <- cbind(subject_test, y_test, x_test)
all <- rbind(train, test)
colnames(all) <- c("Subject", "Training", as.character(features))

std_mean_col <- grepl("mean()", features, fixed=TRUE) | grepl("std()", features, fixed=TRUE)
column_select <- c("Subject", "Training", as.character(droplevels(features[std_mean_col])))
clean <- all[,column_select]
tidy_data <- aggregate(clean[,3:68], clean[,1:2], mean)

write.table(tidy_data, "output.txt", sep="\t", row.names=FALSE)