# Getting-and-Cleaning-Data-Project
Project submission for the Coursera Getting and Cleaning Data Course Project

##The Samsung data used for this project can be downloaded here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

##Using the run_analysis.R script
Please set the working directory to the "\UCI HAR Dataset" folder after extracting the Samsung Data

##To read 'tidydata.txt' table, please use:
read.table("tidydata.txt",header = TRUE)

##This repo includes the following files:
- 'README.md'
- 'CodeBook.md': description of the variables in data set, data, and description of steps taken to clean up data
- 'run_analysis.R': R script used to combine data sets, perform analysis and create tidy data set
- 'tidydata.txt': the tidy data set created in step 5 of the project (result of 'run_analysis.R')

##Steps taken to clean data (what 'run_analysis.R' does):
1. Used cbind and rbind to combine different data tables together
	- included the Subject, X and Y .txt files in both the 'test' and 'train' folders of downloaded data
	- resulted in one data table of 10299 rows and 563 columns

2. Extracted the columns including the the measurements on the mean and standard deviation for each measurement
	- used 'features.txt' to return a vector of column numbers to subset the data table
	- included variables with mean or std - the mean and std for each of the 33 variables
	- and also included the SubjectId and Activity performed
	- resulted in data table of 10299 rows and 68 columns

3. Used descriptive activity names to name the activities in the data set
	- used 'activity_labels.txt' to replace numbers for the activities, with the descriptive names

4. Label data set with descriptive variable names
	- used 'features.txt' to rename variables in data set

5. Create new, independent tidy data set
	- grouped data by SubjectId and Activity
	- calculated mean for the result of each variable for each activity and subject
	- one row for each activity for each subject (6 activities * 30 subjects)
	- resulted in a wide data table of 180 rows and 68 columns
	- used write.table to create 'tidydata.txt'