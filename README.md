# Getting-and-Cleaning-Data
Peer-graded Assignment: Getting and Cleaning Data Course Project

This repository is created to store the Coursera Project named Peer-graded Assignment of the course Getting and Cleaning Data.

DOWNLOAD THE DATA SET:
Download the dataset through the link below, then unzip the file. Then execute the script run_analysis.R on them to generate a tidy data set.

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

CODE RULES: The code I've written in run_analysis.R follow these Project's steps:

You should create one R script called run_analysis.R that does the following.

    1) Merges the training and the test sets to create one data set.
    2) Extracts only the measurements on the mean and standard deviation for each measurement.
    3) Uses descriptive activity names to name the activities in the data set
    4) Appropriately labels the data set with descriptive variable names.
    5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for 
       each activity and each subject.
    
CODE DESCRIPTION: The code merged training and test data set, and extracted partial variables to create a new data set with the averages of each variable for each activity and each subject. The variables of this new data set are calculated with the mean and standard deviation.

DATA VARIABLES: The variables in the data X are sensor signals measured with waist-mounted smartphone from 30 subjects and the variable in the data Y indicates activity type the subjects performed during recording.

