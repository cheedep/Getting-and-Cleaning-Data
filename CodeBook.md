The Data contains the data collected from experiments carried out with a group of 30 volunteers.
Each person performed six activities.

##cleanData
The [cleanData](cleanData.txt) set contains the following data

subject - the id of the subject, range is (1:30)

activity - 
* STANDING, 
* SITTING, 
* LAYING, 
* WALKING, 
* WALKING DOWNSTAIRS, 
* WALKING UPSTAIRS

The activity names have been processed to remove the underscores from the activity names in the original dataset

The clean dataset only contains the mean and standard deviation for each measurement from the original dataset.

Some of the names of these measurements are given below
* "tBodyAcc-mean-X"
* "tBodyAcc-mean-Y"
* "tBodyAcc-mean-Z"
* "tBodyAcc-std-X"
* "tBodyAcc-std-Y"    
* "tBodyAcc-std-Z"
* "tGravityAcc-mean-X"
* "tGravityAcc-mean-Y"
...
...
...

The braces have been removed from the measurement names in the original dataset to make the names more descriptive.
For example the name tBodyAcc-mean()-X has been edited to tBodyAcc-mean-X.

So each row of the cleanData dataset contains one reading of the measurements for a particular subject doing a particular activity.

##summaryData
The [summaryData](summaryData.txt) dataset contains the average of each variable across multiple readings for each activity and each subject.

Like cleanData, it contains the subject and the activity columns.

It also contains the average columns
* "tBodyAcc-mean-X-avg"
* "tBodyAcc-mean-Y-avg"
* "tBodyAcc-mean-Z-avg"
* "tBodyAcc-std-X-avg"    
* "tBodyAcc-std-Y-avg"
* "tBodyAcc-std-Z-avg"
* "tGravityAcc-mean-X-avg"
* "tGravityAcc-mean-Y-avg"
...
...
...

The column names have been appended with "-avg"
For example tBodyAcc-mean-X-avg is the average of tBodyAcc-mean-X measurement.
 
