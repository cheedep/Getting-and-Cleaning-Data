## read the training data set
trainSet <- read.table("UCI HAR Dataset/train/X_train.txt")
## read the test data set
testSet <- read.table("UCI HAR Dataset/test/X_test.txt")

## 1. Merges the training and the test sets to create one data set
activityData <- rbind(trainSet, testSet)

## subjects for the training set
trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt")
## subjects for the training set
testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt")

##  Each row identifies the subject who performed the activity in the merged activityData dataset
subjects <- rbind(trainSubject, testSubject)

## activity label indices for the training set
trainLabels <- read.table("UCI HAR Dataset/train/y_train.txt")
## activity label indices for the test set
testLabels <- read.table("UCI HAR Dataset/test/y_test.txt")

## activity label indices for the merged activityData
labels <- rbind(trainLabels, testLabels)

## All the features
features <- read.table("UCI HAR Dataset/features.txt")

## filter the features to comprise of only mean and standard deviation
stdAndMeanFeatures <- features[grep("-std\\(\\)|-mean\\(\\)", features[, 2], perl=TRUE, value=FALSE), ]

## 2. Extracts only the measurements on the mean and standard deviation for each measurement
stdAndMeanActivityData <- activityData[, stdAndMeanFeatures[,1]]

## read the activity labels
activities <- read.table("UCI HAR Dataset/activity_labels.txt")

## 3. Uses descriptive activity names to name the activities in the data set
activityLabels <- gsub(pattern = "_", replacement = " ", x = activities[labels[,1], 2]) 

## 4. Appropriately labels the data set with descriptive variable names
names(stdAndMeanActivityData) <- gsub(pattern="\\(\\)", replacement = "", x = stdAndMeanFeatures[,2])

names(subjects) <- "subject";
names(activityLabels) <- "activity";
cleanData <- cbind(subject = subjects, activity = activityLabels, stdAndMeanActivityData) 

## write data set as a txt file created with write.table() using row.name=FALSE 
write.table(cleanData, "cleanData.txt", row.names=FALSE)

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
## ref: http://stats.stackexchange.com/a/8226 
summaryDataAg <- aggregate(cleanData[,-c(1,2)], by=list(cleanData$subject, cleanData$activity), FUN=mean)
names(summaryDataAg)[1:2] <- c("subject", "activity")
names(summaryDataAg)[-(1:2)] <- paste(names(summaryDataAg)[-(1:2)], "-avg", sep="")
write.table(summaryDataAg, "summaryDataAg.txt", row.names=FALSE)

## same step as above done with the summarise_each from the dplyr package
## ref: http://stackoverflow.com/a/21645021/333005
library(dplyr)
summaryData <- cleanData %>% group_by(subject, activity) %>% summarise_each(funs(mean))
names(summaryData)[-(1:2)] <- paste(names(summaryData)[-(1:2)], "-avg", sep="")
write.table(summaryData, "summaryData.txt", row.names=FALSE)
