# GettingAndCleaningDataAssignment
Coursera Programming Assignment

The script in the run_analysis.R uses data from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


Original Data is removed from the archive and sould be stored in the current
working directory in "UCI HAR Dataset" folder.

the script run_analysis.R

reads data from X_train.txt, y_train.txt, subject_train.txt from the folder "train" and X_test.txt, y_test.txt, subject_test.txt from the folder "test".

into Xtrain,Ytrain,PersonTrain and Xtest,Ytest,PersonTest respectively

then the script reads activity labeles from activity_labels.txt and stores it in activityLabels.

and variablel names corresponding to the measured values in X_test (or X_train)
i.e. column names from features.txt and stores it in the fetaures variable.

the script binds Xtrain and Xtest in X, Ytrain and Ytest in Y, and PersonTrain and PersonTest in PersonData using rbind() function.

with grep() function from dplyr() package the script finds column numbers with names containing "Mean","mean", or "std"

then the script leaves X data only with chosen colunms and changes column names

X with PersonData and Activity are then bound to get a new dataset, called AllData 

then the columns PersonCode and Activity used as factors to perform summarize_all() function with mean() to get the tidy Data file.

the file saved as tidyData.txt

see also original Readme.txt file in https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

