Getting and Cleaning Data Project
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive activity names.
Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 




How run_analysis.R works:
It does't check existing of dataset. Assumed that data for the project downladed and extraxted to working directory. Also data.table package is needed.

1. Merge test and train sets
	Script loads train and test sets to different variablies
	Merging altogether via rbind() function
2. Extracts only the measurements on the mean and standard deviation for each measurement.  
	Script reads features names from features.txt and extracts mean and strandart deviation for them from merged dataset.
3. Uses descriptive activity names to name the activities in the data set
	it sets names for columns
	Via cbind() function it gets all sets in one
4. Appropriately labels the data set with descriptive variable names. 
	It reads activity_labels.txt and replace Activity ID (1-5) to Activity Name (WALKING WALKING_UPSTAIRS WALKING_DOWNSTAIRS SITTING STANDING LAYING) in dataset
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
	It uses data.table for making tidy dataset, and after it groups by Activity, Subject, other columns it takes avarege.
	It writes final tidy dataset to file tidy.txt