
## Merges the training and the test sets to create one data set

tr.subjs<-read.table("train/subject_train.txt")
tr.X<-read.table("train/X_train.txt")
tr.Y<-read.table("train/Y_train.txt")

ts.subjs<-read.table("test/subject_test.txt")
ts.X<-read.table("test/X_test.txt")
ts.Y<-read.table("test/Y_test.txt")

merge.X<-rbind(tr.X,ts.X)
merge.Y<-rbind(tr.Y,ts.Y)
merge.subjs<-rbind(tr.subjs,ts.subjs)

##Extracts only the measurements on the mean and standard deviation for each measurement
feat<-read.table("features.txt")

colnames(merge.X)<-feat[,2]
colmean<-grepl("mean",colnames(merge.X))
colstd<-grepl("std",colnames(merge.X))

mean.X<-merge.X[,colmean]
std.X<-merge.X[,colstd]

##Uses descriptive activity names to name the activities in the data set

actnames<-read.table("activity_labels.txt")
merge.Y[,1]<-actnames[merge.Y[,1],2]
colnames(merge.Y)<-"Activity"

##Appropriately labels the data set with descriptive variable names
merge.all<-cbind(merge.X,merge.Y,merge.subjs)
names<-colnames(merge.all)

##From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library("reshape2")
merged.meanstd<-cbind(mean.X,std.X)
names(merge.subjs) <- 'Subject'
names(actnames) <- 'Activity'
bind.all<-cbind(merge.subjs,merge.Y,merged.meanstd)
base<-melt(bind.all,(id.vars=c("Subject","Activity"))) 
dataset.second<- dcast(base,Subject + Activity ~variable,mean)
names(dataset.second)[-c(1:2)]<-paste(names(dataset.second)[-c(1:2)])
write.table(dataset.second, file = "./tidy_data.txt")

