# 3project
##This is for the course project for the coursera Getting and Cleaning Data course.

The R code is run_analysis.R
All of the input data files must be in the working directory for the code to run.
###data is from UCI HAR Dataset, files needed are
* features.txt
* X_test.txt
* X_train.txt
* subject_train.txt
* subject_tesst.txt
* Y_test.txt
* Y_train.txt
* actitivty_labels.txt
The code uses the packages dplyr and reshape2
It will insall the packages and load them
the output of the code is a file called "tidy.txt"
The file has only 4 variables 
*subject-- the subject code
*activity-- the description of the activity, for example LAYING 
*mesurement_type which is from the xtest or xtrain data, for example tBodyAccmeanX
* mean of that measurement

###Steps

*The data is merged, only measurements with  “mean” or “std” are used
* mean of each measurement type by subject and activity is calculated
* results are written to tidy.txt

### comments
The file is very long since there are 30 subjects, 6 activities and 79 variables for 14220 rows.
