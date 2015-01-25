---
title: "Codebook - Coursera - Getting and Cleaning Data  - Course Project"
author: "AMG"
date: "Sunday, January 25, 2015"
output: html_document
---

Course Project Code Book
========================

Source of the original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Original description of the data: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The dataset includes the following files:

    'README.txt'

    'features_info.txt': Shows information about the variables used on the feature vector.

    'features.txt': List of all features.

    'activity_labels.txt': Links the class labels with their activity name.

    'train/X_train.txt': Training set.

    'train/y_train.txt': Training labels.

    'test/X_test.txt': Test set.

    'test/y_test.txt': Test labels.


The R script "run_analysis.R" cleans up the data as described below.

* Merges the training sets and test sets to create one data set.

* Reads features.txt and extracts only the measurements on the mean and standard deviation for each measurement.

* Reads activity_labels.txt and applies descriptive activity names to name the activities in the data set: walking, walkingupstairs, walkingdownstairs, sitting, standing and laying.

* The data set is being labelled with descriptive names: all feature names (attributes) and activity names are converted to lower case, underscores and brackets () are removed. Then it merges the data frame containing features with the ones containing activity labels and subject IDs. The result is saved is a txt file. The data frame is structured with the subject ID in the first column, the activity name in the second column followed by the columns with all the various measurements.
such that the first column contains subject IDs, the second column activity names, and the last 66 columns are measurements. 

* The script creates an independent tidy data set with the average of each measurement for each activity and each subject (total of 180 rows, 30 subjects involved in 6 activities). The result is saved as txt file "tidy_data_set_with_averages.txt"", a 180x68 data frame, where as before, the first column contains subject IDs, the second column contains activity names (see below), and then the averages for each of the 66 attributes are in columns 3...68. There are 30 subjects and 6 activities, thus 180 rows in this data set with averages.

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

