# loading dplyr library
library(dplyr) 

# the current working directory should be one level 
#above the "UCI HAR Dataset" folder


# Reading Data for Train and for Test
Xtrain<-read.table("UCI HAR Dataset/train/X_train.txt")
Ytrain<-read.table("UCI HAR Dataset/train/y_train.txt",col.names="Activity") 
PersonTrain<-read.table("UCI HAR Dataset/train/subject_train.txt",col.names = "PersonCode")

Xtest<-read.table("UCI HAR Dataset/test/X_test.txt")
Ytest<-read.table("UCI HAR Dataset/test/y_test.txt",col.names="Activity") 
PersonTest<-read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "PersonCode")

# Reading Features and Activity descriptions
features<-read.table("UCI HAR Dataset/features.txt") 
activityLabels<-read.table("UCI HAR Dataset/activity_labels.txt") 

# Binding training and test sets
X<-rbind(Xtrain,Xtest)
Y<-rbind(Ytrain,Ytest) 
PersonData<-rbind(PersonTrain,PersonTest) 

# Subsetting only measurements for mean and standard deviation 
MEANandSTDcols<-grep("Mean|mean|std",features[,2],ignore.case = FALSE)
X<-X[,MEANandSTDcols]

# Changing column names
colnames(X)<-features[MEANandSTDcols,2]

# combining total dataset
AllData<-cbind(PersonData,Y,X)

# Making Activity & PersonCode as factors for the grouping
AllData$Activity<-factor(AllData$Activity, levels = activityLabels[,1], labels = activityLabels[,2]) 

#Summarizing each varable as mean of the values
#grouped by factors Activity and PersonCode 

newset <- summarize_all(group_by(AllData,Activity,PersonCode),mean) 

write.table(newset, file = "tidyData.txt", row.name=FALSE, col.names = TRUE)