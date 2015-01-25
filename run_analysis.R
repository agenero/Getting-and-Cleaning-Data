# Coursera DSS - Getting and Cleaning Data - Project
# Project data source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# This R script does the following:

# 1 - Merges the training and the test sets to create one data set.
X1 <- read.table("train/X_train.txt")
X2 <- read.table("test/X_test.txt")
XData <- rbind(X1, X2)
Sub1 <- read.table("train/subject_train.txt")
Sub2 <- read.table("test/subject_test.txt")
SubData <- rbind(Sub1, Sub2)
Y1 <- read.table("train/y_train.txt")
Y2 <- read.table("test/y_test.txt")
YData <- rbind(Y1, Y2)

# 2 - Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("features.txt")
index_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
XData <- XData[, index_features]
names(XData) <- features[index_features, 2]
names(XData) <- gsub("\\(|\\)", "", names(XData))
names(XData) <- tolower(names(XData))

# 3 - Uses descriptive activity names to name the activities in the data set.
activities <- read.table("activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
YData[,1] = activities[YData[,1], 2]
names(YData) <- "activity"

# 4 - Appropriately labels the data set with descriptive variable names. 
names(SubData) <- "subject"
cleaned <- cbind(SubData, YData, XData)
write.table(cleaned, "merged_and_cleaned.txt")

# 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
uniqueSubjects = unique(SubData)[,1]
numSubjects = length(unique(SubData)[,1])
numActivities = length(activities[,1])
numCols = dim(cleaned)[2]
result = cleaned[1:(numSubjects*numActivities), ]
row = 1
for (x in 1:numSubjects) {
  for (y in 1:numActivities) {
    result[row, 1] = uniqueSubjects[x]
    result[row, 2] = activities[y, 2]
    tmp <- cleaned[cleaned$subject==x & cleaned$activity==activities[y, 2], ]
    result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
    row = row+1
  }
}
write.table(result, "tidy_data_set_with_averages.txt", row.name=FALSE)