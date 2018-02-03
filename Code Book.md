# Code Book
## Requirement
Set the directory to where the files are located


## Analysis
#### The script would perform

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Use descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.



## Variables

### Merge the train and test sets into one data set
__tr.subjs__ - dataset for subject_train.txt

__tr.X__ - dataset for X_train.txt

__tr.Y__ - dataset for Y_train.txt

__ts.subjs__ - dataset for subject_test.txt

__ts.X__ - dataset for X_test.txt

__ts.Y__ - dataset for Y_test.txt

__merge.X__ - dataset for row binded test and train X

__merge.Y__ - dataset for row binded test and train Y

__merge.subjs__ - dataset for row binded test and train subject



### Extracts mean and standard deviation for each measurements
__feat__ - dataset for features.txt
__mean.X__ - result dataset for mean of merged.X

__std.X__ - result dataset for standard deviation of merged.X



### Use descriptively activity names
__actnames__ - dataset for activity_labels.txt

__Activity__ - column name



### Appropriate labels
__merge.all__ - column binded dataset for merge.subjs, merge.Y and merge.X

__names__ - label for merge.all



### Create a second dataset and write tidy dataset
__merged.meanstd__- dataset for column binded mean.X and std.X

__'Subject'__ - id for name for merge.subjs

__'Activity'__ - id for name for actnames

__bind.all__ - dataset for column binded merge.subjs, merge.Y and merged.meanstd

__base__ - base dataset which uses melt per ids ("Subject" and "Activity")

__dataset.second__ - second dataset which contains the tidy dataset



## Library used
__reshape2__ - should be installed to be able to use melt or cast

