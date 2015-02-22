## Course Project
This repository contains the script(run_analysis.R) for preparing tidy data that can later be used for analysis.

The Data that is being prepared is data that was collected from accelerometers from the Samsung Galaxy S smartphone.
The original Data can be downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
The full description of the data can be seen at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The Data is located in the folder "UCI HAR Dataset" in this repository.
To learn more about this data, see the README.txt file in the "UCI HAR Dataset" folder.

The Dataset contains two sets of data train and test.
The purpose of this script is to 

* merge the train and test datasets 
* extract a subset of the measurements (std and mean).
* give desriptive variable names

The resultant clean dataset is written out to the file [cleanData.txt](cleanData.txt)

The script also creates a second independent tidy dataset with the average of each activity and each student.
The result of this operation is written out to the file [summaryData.txt](summaryData.txt) 

For a complete description of the variables, data etc can be found in the [CodeBook.md](CodeBook.md) file.

Functions used in the script

* read.table - to read the data
* rbind - for merging the rows from train and test data
* grep - for using regex to find the variables of interest (std and mean)
* gsub - for pattern matching and replacing strings to create descriptive variable names
* cbind - for adding the subject and activity columns to the data
* aggregate - for creating dataset with average of each activity and each student
* summarise_each(package: dplyr) - for creating dataset with average of each activity and each student (alternative for aggregate)   	